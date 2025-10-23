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
                itemCount: sampleHotels.length + 3, // show more entries
                itemBuilder: (context, index) {
                  // either use existing sampleHotels or synthesize new ones
                  final Hotel h = index < sampleHotels.length
                      ? sampleHotels[index]
                      : Hotel(
                          id: 'extra_$index',
                          name: index == sampleHotels.length
                              ? 'Mountain Lodge Retreat'
                              : index == sampleHotels.length + 1
                                  ? 'City Center Inn'
                                  : 'Lakeside Escape',
                          location: index == sampleHotels.length
                              ? 'Aspen, Colorado'
                              : index == sampleHotels.length + 1
                                  ? 'New York, USA'
                                  : 'Lake Tahoe, USA',
                          imageUrl: index == sampleHotels.length
                              // Mountain Lodge Retreat -> use Unsplash provided by user
                              ? 'https://plus.unsplash.com/premium_photo-1661964071015-d97428970584?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8aG90ZWx8ZW58MHx8MHx8fDA%3D&fm=jpg&q=60&w=3000'
                              : index == sampleHotels.length + 1
                                  // City Center Inn -> use iStock pool image provided by user
                                  ? 'https://media.istockphoto.com/id/119926339/photo/resort-swimming-pool.jpg?s=612x612&w=0&k=20&c=9QtwJC2boq3GFHaeDsKytF4-CavYKQuy1jBD2IRfYKc='
                                  // Lakeside Escape -> use the same Unsplash link (user provided twice)
                                  : 'https://plus.unsplash.com/premium_photo-1661964071015-d97428970584?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8aG90ZWx8ZW58MHx8MHx8fDA%3D&fm=jpg&q=60&w=3000',
                          rating: index == sampleHotels.length ? 4.8 : 4.3,
                          reviews: 20,
                          amenities: ['Free Wifi'],
                          rooms: [
                            Room(
                                id: 're_$index',
                                title: 'Standard',
                                beds: '1 Bed',
                                guests: 2,
                                price: index == sampleHotels.length ? 300 : 150)
                          ],
                        );

                  return GestureDetector(
                    onTap: () =>
                        Navigator.pushNamed(context, '/details', arguments: h),
                    child: Card(
                      margin: EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          // image with heart badge
                          Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(12)),
                                child: Image.network(h.imageUrl,
                                    height: 160,
                                    width: double.infinity,
                                    fit: BoxFit.cover),
                              ),
                              Positioned(
                                right: 12,
                                top: 12,
                                child: Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white,
                                  ),
                                  padding: EdgeInsets.all(6),
                                  child: Icon(Icons.favorite_border,
                                      color: Colors.grey[800]),
                                ),
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Text(h.name,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16)),
                                    ),
                                    Row(
                                      children: [
                                        Icon(Icons.star,
                                            color: Colors.orange, size: 18),
                                        SizedBox(width: 6),
                                        Text(h.rating.toString(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold))
                                      ],
                                    )
                                  ],
                                ),
                                SizedBox(height: 6),
                                Text(h.location,
                                    style: TextStyle(color: Colors.grey[600])),
                                SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('\$${h.rooms.first.price.toInt()}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18)),
                                    ElevatedButton(
                                      onPressed: () => Navigator.pushNamed(
                                          context, '/rooms',
                                          arguments: h),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.blue[400],
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 18, vertical: 10),
                                      ),
                                      child: Text('Book Now',
                                          style:
                                              TextStyle(color: Colors.white)),
                                    )
                                  ],
                                )
                              ],
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
