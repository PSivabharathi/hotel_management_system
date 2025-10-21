import 'package:flutter/material.dart';
import 'package:hotel_management_system/providers/guest_provider.dart';
import 'package:hotel_management_system/screens/flash_screen.dart';
import 'package:hotel_management_system/screens/login_screen.dart';
import 'package:provider/provider.dart';
import 'theme.dart';
import 'providers/reservation_provider.dart';

void main() {
  runApp(const HMSApp());
}

class HMSApp extends StatelessWidget {
  const HMSApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ReservationProvider()),
        ChangeNotifierProvider(create: (_) => GuestProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'HMS - Reservations',
        theme: AppTheme.light(),
        home: const SplashScreen(),
      ),
    );
  }
}
