// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import '../sample_hotels.dart';

class HotelListScreen extends StatelessWidget {
  const HotelListScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hotels', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: BackButton(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            SizedBox(height: 8),
            _SearchBar(),
            SizedBox(height: 12),
            _CategoryChips(),
            SizedBox(height: 12),
            Expanded(
              child: ListView.builder(
                itemCount: sampleHotels.length,
                itemBuilder: (context, index) {
                  final h = sampleHotels[index];
                  return GestureDetector(
                    onTap: () =>
                        Navigator.pushNamed(context, '/details', arguments: h),
                    child: Card(
                      margin: EdgeInsets.symmetric(vertical: 8),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.horizontal(
                                left: Radius.circular(12)),
                            child: Image.network(h.imageUrl,
                                width: 120, height: 100, fit: BoxFit.cover),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Flexible(
                                          child: Text(h.name,
                                              style: TextStyle(
                                                  fontWeight:
                                                      FontWeight.bold))),
                                      Row(children: [
                                        Icon(Icons.star,
                                            color: Colors.orange, size: 16),
                                        SizedBox(width: 4),
                                        Text(h.rating.toString())
                                      ])
                                    ],
                                  ),
                                  SizedBox(height: 6),
                                  Text(h.location,
                                      style:
                                          TextStyle(color: Colors.grey[600])),
                                  SizedBox(height: 8),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                          '\$${h.rooms.first.price.toInt()} /night',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.blue[400])),
                                      ElevatedButton(
                                          onPressed: () => Navigator.pushNamed(
                                              context, '/rooms', arguments: h),
                                          child: Text('Book Now'),
                                          style: ElevatedButton.styleFrom(
                                              shape: StadiumBorder(),
                                              backgroundColor:
                                                  Colors.blue[400]))
                                    ],
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        prefixIcon: Icon(Icons.search),
        hintText: 'Search for a hotel',
        contentPadding: EdgeInsets.symmetric(vertical: 14),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(28),
            borderSide: BorderSide.none),
      ),
    );
  }
}

class _CategoryChips extends StatelessWidget {
  final List<String> categories = ['All', 'Recommended', 'Popular', 'Trending'];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        separatorBuilder: (_, __) => SizedBox(width: 8),
        itemBuilder: (context, index) {
          final c = categories[index];
          final active = index == 0;
          return Chip(
              label: Text(c),
              backgroundColor: active ? Colors.blue[50] : Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18)));
        },
      ),
    );
  }
}
