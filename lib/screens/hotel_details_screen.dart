// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../sample_hotels.dart';

class HotelDetailsScreen extends StatelessWidget {
  const HotelDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Hotel hotel = ModalRoute.of(context)?.settings.arguments as Hotel? ??
        sampleHotels.first;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                Image.network(hotel.imageUrl,
                    width: double.infinity, height: 240, fit: BoxFit.cover),
                Positioned(
                    top: 8, left: 8, child: BackButton(color: Colors.white)),
                Positioned(
                    top: 8,
                    right: 8,
                    child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.share, color: Colors.white)))
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(hotel.name,
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold)),
                    SizedBox(height: 4),
                    Text(hotel.location,
                        style: TextStyle(color: Colors.blueGrey)),
                    SizedBox(height: 12),
                    Text('Amenities',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(height: 8),
                    Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: hotel.amenities
                            .map((a) => Chip(
                                label: Text(a),
                                backgroundColor: Colors.blue.shade50))
                            .toList()),
                    SizedBox(height: 12),
                    Text('About',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(height: 8),
                    Text(
                        'The ${hotel.name} offers luxurious accommodations in the heart of the city. Enjoy our world-class amenities, including a spa, fitness center, and gourmet dining.'),
                    SizedBox(height: 20),
                    Text('Reviews',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(height: 12),
                    Center(
                        child: Column(children: [
                      Text(hotel.rating.toString(),
                          style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue[400])),
                      Text('${hotel.reviews} reviews',
                          style: TextStyle(color: Colors.grey))
                    ])),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () => Navigator.pushNamed(context, '/rooms',
                          arguments: hotel),
                      child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 14.0, horizontal: 40),
                          child: Text('Select Rooms')),
                    ),
                    SizedBox(height: 40),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
