
class Reservation {
  final String id;
  final String name;
  final String roomType;
  final int guests;
  final DateTime checkIn;
  final DateTime checkOut;

  Reservation({
    required this.id,
    required this.name,
    required this.roomType,
    required this.guests,
    required this.checkIn,
    required this.checkOut,
  });

  Reservation copyWith({
    String? id,
    String? name,
    String? roomType,
    int? guests,
    DateTime? checkIn,
    DateTime? checkOut,
  }) {
    return Reservation(
      id: id ?? this.id,
      name: name ?? this.name,
      roomType: roomType ?? this.roomType,
      guests: guests ?? this.guests,
      checkIn: checkIn ?? this.checkIn,
      checkOut: checkOut ?? this.checkOut,
    );
  }
}
