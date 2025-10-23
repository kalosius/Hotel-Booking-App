class Room {
  final String id;
  final String title;
  final String beds;
  final int guests;
  final double price;
  final bool available;

  Room(
      {required this.id,
      required this.title,
      required this.beds,
      required this.guests,
      required this.price,
      this.available = true});
}

class Hotel {
  final String id;
  final String name;
  final String location;
  final String imageUrl;
  final double rating;
  final int reviews;
  final List<String> amenities;
  final List<Room> rooms;

  Hotel(
      {required this.id,
      required this.name,
      required this.location,
      required this.imageUrl,
      required this.rating,
      required this.reviews,
      required this.amenities,
      required this.rooms});
}

final sampleHotels = [
  Hotel(
    id: 'h1',
    name: 'The Grand Majestic',
    location: 'Paris, France',
    imageUrl:
        'https://images.unsplash.com/photo-1542314831-068cd1dbfeeb?q=80&w=1400&auto=format&fit=crop&ixlib=rb-4.0.3&s=8b7f25f3b8e0b6b7b8d3c6f9b1e3c8ea',
    rating: 4.6,
    reviews: 234,
    amenities: ['Pool', 'Spa', 'Gym', 'Restaurant', 'Free Wifi'],
    rooms: [
      Room(
          id: 'r1',
          title: 'Standard Room',
          beds: '2 Beds',
          guests: 2,
          price: 120),
      Room(
          id: 'r2',
          title: 'Deluxe Room',
          beds: '1 King Bed',
          guests: 2,
          price: 180),
      Room(
          id: 'r3',
          title: 'Suite',
          beds: '1 King Bed',
          guests: 4,
          price: 250,
          available: false),
    ],
  ),
  Hotel(
    id: 'h2',
    name: 'Ocean View Resort',
    location: 'Malibu, California',
    imageUrl:
        'https://digital.ihg.com/is/image/ihg/ihgor-member-rate-web-offers-1440x720?fit=crop,1&wid=1440&hei=720',
    rating: 4.2,
    reviews: 98,
    amenities: ['Pool', 'Beach', 'Restaurant', 'Free Wifi'],
    rooms: [
      Room(
          id: 'r4',
          title: 'Ocean Standard',
          beds: '2 Beds',
          guests: 2,
          price: 180),
    ],
  ),
];
