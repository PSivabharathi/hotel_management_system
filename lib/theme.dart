import 'package:flutter/material.dart';


class AppTheme {
static ThemeData light() {
final base = ThemeData.light();
return base.copyWith(
primaryColor: const Color(0xFF6C63FF),
scaffoldBackgroundColor: const Color(0xFFF7F8FF),
appBarTheme: const AppBarTheme(
elevation: 0,
backgroundColor: Colors.transparent,
foregroundColor: Colors.black87,
centerTitle: true,
),
colorScheme: base.colorScheme.copyWith(
primary: const Color(0xFF6C63FF),
secondary: const Color(0xFF00C9A7),
),
elevatedButtonTheme: ElevatedButtonThemeData(
style: ElevatedButton.styleFrom(
padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
),
),
inputDecorationTheme: InputDecorationTheme(
border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
filled: true,
fillColor: Colors.white,
),
);
}
}