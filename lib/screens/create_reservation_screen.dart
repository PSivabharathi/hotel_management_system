import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/reservation.dart';
import '../providers/reservation_provider.dart';

class CreateReservationScreen extends StatefulWidget {
  final String? reservationId;

  const CreateReservationScreen({super.key, this.reservationId});

  @override
  State<CreateReservationScreen> createState() => _CreateReservationScreenState();
}

class _CreateReservationScreenState extends State<CreateReservationScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _guestController = TextEditingController();
  DateTime? _checkInDate;
  DateTime? _checkOutDate;
  String? _selectedRoomType;

  final List<String> roomTypes = [
    'Standard Room',
    'Deluxe Room',
    'Superior Room',
    'Single Room',
    'Double Room',
    'Family Room',
    'Junior Suite',
    'Presidential Suite',
  ];

  @override
  void initState() {
    super.initState();
    if (widget.reservationId != null) {
      final existing = context
          .read<ReservationProvider>()
          .getById(widget.reservationId!);
      if (existing != null) {
        _nameController.text = existing.name;
        _guestController.text = existing.guests.toString();
        _checkInDate = existing.checkIn;
        _checkOutDate = existing.checkOut;
        _selectedRoomType = existing.roomType;
      }
    }
  }

  Future<void> _pickDate(BuildContext context, bool isCheckIn) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2024),
      lastDate: DateTime(2030),
    );
    if (picked != null) {
      setState(() {
        if (isCheckIn) {
          _checkInDate = picked;
        } else {
          _checkOutDate = picked;
        }
      });
    }
  }

  void _saveReservation() {
    if (!_formKey.currentState!.validate()) return;
    if (_checkInDate == null || _checkOutDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please select both dates")),
      );
      return;
    }

    final provider = context.read<ReservationProvider>();

    final reservation = Reservation(
      id: widget.reservationId ?? '',
      name: _nameController.text,
      roomType: _selectedRoomType!,
      guests: int.parse(_guestController.text),
      checkIn: _checkInDate!,
      checkOut: _checkOutDate!,
    );

    if (widget.reservationId == null) {
      provider.addReservation(reservation);
    } else {
      provider.updateReservation(widget.reservationId!, reservation);
    }

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.reservationId == null
            ? "Create Reservation"
            : "Edit Reservation"),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF6A11CB), Color(0xFF2575FC)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: "Guest Name",
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                    value == null || value.isEmpty ? "Enter guest name" : null,
              ),
              const SizedBox(height: 15),

              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: "Room Type",
                  border: OutlineInputBorder(),
                ),
                value: _selectedRoomType,
                items: roomTypes
                    .map((type) =>
                        DropdownMenuItem(value: type, child: Text(type)))
                    .toList(),
                onChanged: (value) => setState(() => _selectedRoomType = value),
                validator: (value) =>
                    value == null ? "Please select a room type" : null,
              ),
              const SizedBox(height: 15),

              TextFormField(
                controller: _guestController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Number of Guests",
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                    value == null || value.isEmpty ? "Enter guest count" : null,
              ),
              const SizedBox(height: 15),

              ListTile(
                title: Text(_checkInDate == null
                    ? "Select Check-in Date"
                    : "Check-in: ${_checkInDate!.year}-${_checkInDate!.month.toString().padLeft(2, '0')}-${_checkInDate!.day.toString().padLeft(2, '0')}"),
                trailing: const Icon(Icons.calendar_today),
                onTap: () => _pickDate(context, true),
              ),
              ListTile(
                title: Text(_checkOutDate == null
                    ? "Select Check-out Date"
                    : "Check-out: ${_checkOutDate!.year}-${_checkOutDate!.month.toString().padLeft(2, '0')}-${_checkOutDate!.day.toString().padLeft(2, '0')}"),
                trailing: const Icon(Icons.calendar_today),
                onTap: () => _pickDate(context, false),
              ),
              const SizedBox(height: 25),

              ElevatedButton(
                onPressed: _saveReservation,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF6A11CB),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(widget.reservationId == null
                    ? "Create Reservation"
                    : "Update Reservation"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
