// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/welcome_screen.dart';
import 'screens/hotel_list_screen.dart';
import 'screens/hotel_details_screen.dart';
import 'screens/room_selection_screen.dart';
import 'screens/booking_summary_screen.dart';
import 'screens/payment_screen.dart';

void main() {
  runApp(HotelApp());
}

class HotelApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final base = ThemeData.light();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HotelApp',
      theme: base.copyWith(
        colorScheme: base.colorScheme.copyWith(primary: Colors.blue[400]),
        textTheme: GoogleFonts.poppinsTextTheme(base.textTheme),
        scaffoldBackgroundColor: Color(0xFFF7F8FA),
      ),
      initialRoute: '/',
      routes: {
        '/': (_) => WelcomeScreen(),
        '/list': (_) => HotelListScreen(),
        '/details': (_) => HotelDetailsScreen(),
        '/rooms': (_) => RoomSelectionScreen(),
        '/summary': (_) => BookingSummaryScreen(),
        '/payment': (_) => PaymentScreen(),
      },
    );
  }
}
