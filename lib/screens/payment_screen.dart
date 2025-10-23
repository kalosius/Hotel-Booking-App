// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String method = 'card';
  final _formKey = GlobalKey<FormState>();
  final _cardCtrl = TextEditingController();
  final _exp = TextEditingController();
  final _cvv = TextEditingController();
  final _address = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    final total = args?['total'] ?? 0.0;

    return Scaffold(
      appBar: AppBar(
          title: Text('Payment', style: TextStyle(color: Colors.black)),
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: BackButton(color: Colors.black)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('Payment method', style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 12),
          _methodTile('Credit Card', 'Visa ... 4567', 'card'),
          SizedBox(height: 8),
          _methodTile('PayPal', '', 'paypal'),
          SizedBox(height: 8),
          _methodTile('Apple Pay', '', 'apple'),
          SizedBox(height: 18),
          Text('Card details', style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          Form(
              key: _formKey,
              child: Column(children: [
                TextFormField(
                    controller: _cardCtrl,
                    decoration: InputDecoration(
                        hintText: 'Card number',
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide.none)),
                    validator: (v) {
                      if (v == null || v.isEmpty) return 'Enter card';
                      return null;
                    }),
                SizedBox(height: 8),
                Row(children: [
                  Expanded(
                      child: TextFormField(
                          controller: _exp,
                          decoration: InputDecoration(
                              hintText: 'Expiry date',
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide.none)),
                          validator: (v) {
                            if (v == null || v.isEmpty) return 'Enter expiry';
                            return null;
                          })),
                  SizedBox(width: 8),
                  Expanded(
                      child: TextFormField(
                          controller: _cvv,
                          decoration: InputDecoration(
                              hintText: 'CVV',
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide.none)),
                          validator: (v) {
                            if (v == null || v.isEmpty) return 'Enter CVV';
                            return null;
                          }))
                ]),
                SizedBox(height: 8),
                TextFormField(
                    controller: _address,
                    decoration: InputDecoration(
                        hintText: 'Billing address',
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide.none))),
              ])),
          SizedBox(height: 12),
          Row(children: [
            Checkbox(value: false, onChanged: (_) {}),
            Text('Save card details for future bookings')
          ]),
          SizedBox(height: 20),
          SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                                  title: Text('Payment Successful'),
                                  content: Text(
                                      'Your payment of \$${(total as num).toInt()} was processed.'),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.popUntil(context,
                                              ModalRoute.withName('/list'));
                                        },
                                        child: Text('Done'))
                                  ]));
                    }
                  },
                  child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Text('Confirm Payment')),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue[400],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))))),
        ]),
      ),
    );
  }

  Widget _methodTile(String title, String subtitle, String methodKey) {
    final active = method == methodKey;
    return GestureDetector(
      onTap: () => setState(() => method = methodKey),
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
                color: active ? Colors.blue.shade200 : Colors.transparent)),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Row(children: [
            Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                    color: Colors.blue[50],
                    borderRadius: BorderRadius.circular(8)),
                child: Icon(Icons.credit_card, color: Colors.blue)),
            SizedBox(width: 12),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
              if (subtitle.isNotEmpty)
                Text(subtitle, style: TextStyle(color: Colors.grey))
            ])
          ]),
          Switch(
              value: active,
              onChanged: (_) {
                setState(() => method = methodKey);
              })
        ]),
      ),
    );
  }
}
