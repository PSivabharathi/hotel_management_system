import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import '../models/reservation.dart';


class ReservationProvider extends ChangeNotifier {
final List<Reservation> _items = [];
final _uuid = const Uuid();


List<Reservation> get items => List.unmodifiable(_items);


void addReservation(Reservation reservation) {
final newRes = reservation.copyWith(id: _uuid.v4());
_items.add(newRes);
notifyListeners();
}


void updateReservation(String id, Reservation updated) {
final idx = _items.indexWhere((r) => r.id == id);
if (idx >= 0) {
_items[idx] = updated.copyWith(id: id);
notifyListeners();
}
}


void deleteReservation(String id) {
_items.removeWhere((r) => r.id == id);
notifyListeners();
}


Reservation? getById(String id) {
return _items.firstWhere((r) => r.id == id, orElse: () => null as Reservation);
}
}
