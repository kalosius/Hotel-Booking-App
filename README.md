Grandora frontend

This is a frontend-only Flutter app demonstrating the requested hotel booking screens: Welcome -> Hotel Listing -> Hotel Details -> Room Selection -> Booking Summary -> Payment.

How to run:
1. cd into `grandora_frontend`
2. run `flutter pub get`
3. run `flutter run` (choose a simulator or connected device)

Notes:
- The app uses network images (Unsplash) and the `google_fonts` package for typography.
- Payment is simulated and only shows a success dialog.
- If you want to integrate these screens into your existing project, copy the `lib/` folder files into your app and wire routes accordingly.
