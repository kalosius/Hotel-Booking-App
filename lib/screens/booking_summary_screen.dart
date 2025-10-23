// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_declarations

import 'package:flutter/material.dart';
import '../sample_hotels.dart';

class BookingSummaryScreen extends StatelessWidget {
  const BookingSummaryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Hotel hotel = ModalRoute.of(context)?.settings.arguments as Hotel? ??
        sampleHotels.first;
    final nights = 2;
    final perNight = hotel.rooms.first.price;
    final subtotal = perNight * nights;
    final taxes = subtotal * 0.1;
    final total = subtotal + taxes;

    return Scaffold(
      appBar: AppBar(
          title: Text('Booking Summary', style: TextStyle(color: Colors.black)),
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: BackButton(color: Colors.black)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(hotel.imageUrl,
                  height: 180, width: double.infinity, fit: BoxFit.cover)),
          SizedBox(height: 12),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(hotel.name,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              Text('Deluxe Room', style: TextStyle(color: Colors.grey))
            ]),
            Icon(Icons.bed, color: Colors.grey[600])
          ]),
          SizedBox(height: 16),
          Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(12)),
              child: Column(children: [
                ListTile(
                    title: Text('Check-in'),
                    subtitle: Text('Fri, Jul 12'),
                    trailing: Text('3:00 PM')),
                Divider(),
                ListTile(
                    title: Text('Check-out'),
                    subtitle: Text('Sun, Jul 14'),
                    trailing: Text('11:00 AM')),
                SizedBox(height: 8),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Guests', style: TextStyle(color: Colors.grey)),
                      Text('2 adults')
                    ]),
                SizedBox(height: 6),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Room', style: TextStyle(color: Colors.grey)),
                      Text('1')
                    ]),
              ])),
          SizedBox(height: 18),
          Text('Price Details', style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(12)),
              child: Column(children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('$nights nights',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Text('\$${perNight.toInt()}/night',
                                style: TextStyle(color: Colors.grey))
                          ]),
                      Text('\$${subtotal.toInt()}',
                          style: TextStyle(fontWeight: FontWeight.bold))
                    ]),
                SizedBox(height: 8),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Taxes & fees',
                          style: TextStyle(color: Colors.grey)),
                      Text('\$${taxes.toInt()}')
                    ]),
                Divider(),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Total',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text('\$${total.toInt()}',
                          style: TextStyle(fontWeight: FontWeight.bold))
                    ]),
              ])),
          SizedBox(height: 18),
          Text('Guest Information',
              style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(12)),
              child: Column(children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Name', style: TextStyle(color: Colors.grey)),
                      Text('Shatrah Eshaal')
                    ]),
                SizedBox(height: 8),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Email', style: TextStyle(color: Colors.grey)),
                      Text('eshaal@mubs.ac.ug')
                    ]),
              ])),
          SizedBox(height: 20),
          SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, '/payment',
                    arguments: {'hotel': hotel, 'total': total}),
                child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Text('Confirm Booking')),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[800],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
              )),
        ]),
      ),
    );
  }
}
