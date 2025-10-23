// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors, prefer_interpolation_to_compose_strings, sort_child_properties_last

import 'package:flutter/material.dart';
import '../sample_hotels.dart';

class RoomSelectionScreen extends StatefulWidget {
  const RoomSelectionScreen({Key? key}) : super(key: key);

  @override
  _RoomSelectionScreenState createState() => _RoomSelectionScreenState();
}

class _RoomSelectionScreenState extends State<RoomSelectionScreen> {
  Map<String, int> counts = {};

  @override
  Widget build(BuildContext context) {
    final Hotel hotel = ModalRoute.of(context)?.settings.arguments as Hotel? ??
        sampleHotels.first;
    return Scaffold(
      appBar: AppBar(
          title: Text('Select a Room', style: TextStyle(color: Colors.black)),
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: BackButton(color: Colors.black)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Simple calendar placeholder
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(12)),
              child: Column(children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('October 2024',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Row(children: [
                        Icon(Icons.chevron_left),
                        Icon(Icons.chevron_right)
                      ])
                    ]),
                SizedBox(height: 8),
                Text('Calendar placeholder',
                    style: TextStyle(color: Colors.grey))
              ]),
            ),
            SizedBox(height: 12),
            Expanded(
              child: ListView.builder(
                itemCount: hotel.rooms.length,
                itemBuilder: (context, index) {
                  final r = hotel.rooms[index];
                  final cnt = counts[r.id] ?? 0;
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 8),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    child: ListTile(
                      leading: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(hotel.imageUrl,
                              width: 72, height: 72, fit: BoxFit.cover)),
                      title: Text(r.title,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: r.available ? Colors.black : Colors.grey)),
                      subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(r.beds +
                                '  •  ' +
                                r.guests.toString() +
                                ' Guests'),
                            SizedBox(height: 6),
                            Text('\$${r.price.toInt()}/night',
                                style: TextStyle(
                                    color: Colors.blue[400],
                                    fontWeight: FontWeight.bold))
                          ]),
                      trailing: r.available
                          ? Row(mainAxisSize: MainAxisSize.min, children: [
                              IconButton(
                                  icon: Icon(Icons.remove_circle_outline),
                                  onPressed: cnt > 0
                                      ? () {
                                          setState(
                                              () => counts[r.id] = cnt - 1);
                                        }
                                      : null),
                              Text(cnt.toString()),
                              IconButton(
                                  icon: Icon(Icons.add_circle,
                                      color: Colors.blue[400]),
                                  onPressed: () {
                                    setState(() => counts[r.id] = cnt + 1);
                                  })
                            ])
                          : Text('Not Available',
                              style: TextStyle(color: Colors.red)),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // pass selected rooms to summary; for simplicity pass hotel
                  Navigator.pushNamed(context, '/summary', arguments: hotel);
                },
                child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Text('Continue')),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[400],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            )
          ],
        ),
      ),
    );
  }
}
