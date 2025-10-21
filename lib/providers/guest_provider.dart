
import 'package:flutter/material.dart';

import '../models/guest_model.dart';

class GuestProvider extends ChangeNotifier {
  Guest? _guest;

  Guest? get guest => _guest;

  void login(Guest guest) {
    _guest = guest;
    notifyListeners();
  }

  void logout() {
    _guest = null;
    notifyListeners();
  }
}