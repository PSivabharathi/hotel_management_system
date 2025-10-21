import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/reservation.dart';
import '../providers/reservation_provider.dart';
import '../utils/validators.dart';


class ReservationForm extends StatefulWidget {
final Reservation? editing;
const ReservationForm({this.editing, super.key});


@override
State<ReservationForm> createState() => _ReservationFormState();
}


class _ReservationFormState extends State<ReservationForm> {
final _formKey = GlobalKey<FormState>();
final _guestController = TextEditingController();
final _roomController = TextEditingController();
final _guestsController = TextEditingController();
DateTime _checkIn = DateTime.now();
DateTime _checkOut = DateTime.now().add(const Duration(days: 1));


@override
void initState() {
super.initState();
if (widget.editing != null) {
final e = widget.editing!;
_guestController.text = e.name;
_roomController.text = e.roomType;
_guestsController.text = e.guests.toString();
_checkIn = e.checkIn;
_checkOut = e.checkOut;
}
}
@override
void dispose() {
_guestController.dispose();
_roomController.dispose();
_guestsController.dispose();
super.dispose();
}


Future<void> _pickDate(BuildContext ctx, bool isCheckIn) async {
final initial = isCheckIn ? _checkIn : _checkOut;
final picked = await showDatePicker(
context: ctx,
initialDate: initial,
firstDate: DateTime(2020),
lastDate: DateTime(2100),
);
if (picked != null) {
setState(() {
if (isCheckIn) _checkIn = picked;
else _checkOut = picked;
});
}
}
void _submit() {
if (!_formKey.currentState!.validate()) return;
final dateErr = Validators.dateOrder(_checkIn, _checkOut);
if (dateErr != null) {
ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(dateErr)));
return;
}


final provider = Provider.of<ReservationProvider>(context, listen: false);
final res = Reservation(
id: widget.editing?.id ?? '',
name: _guestController.text.trim(),
roomType: _roomController.text.trim(),
checkIn: _checkIn,
checkOut: _checkOut,
guests: int.parse(_guestsController.text.trim()),
);


if (widget.editing == null) {
provider.addReservation(res);
} else {
provider.updateReservation(widget.editing!.id, res);
}


Navigator.of(context).pop();
}
@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(title: Text(widget.editing == null ? 'Create Reservation' : 'Edit Reservation')),
body: SingleChildScrollView(
padding: const EdgeInsets.all(16),
child: Form(
key: _formKey,
child: Column(
children: [
TextFormField(
controller: _guestController,
decoration: const InputDecoration(labelText: 'Guest name'),
validator: Validators.required,
),
const SizedBox(height: 12),
TextFormField(
controller: _roomController,
decoration: const InputDecoration(labelText: 'Room type'),
validator: Validators.required,
),
const SizedBox(height: 12),
TextFormField(
controller: _guestsController,
decoration: const InputDecoration(labelText: 'Number of guests'),
validator: Validators.positiveInt,
keyboardType: TextInputType.number,
),
const SizedBox(height: 12),
Row(
children: [
Expanded(
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
const Text('Check-in'),
TextButton(
onPressed: () => _pickDate(context, true),
child: Text('${_checkIn.year}-${_checkIn.month.toString().padLeft(2,'0')}-${_checkIn.day.toString().padLeft(2,'0')}'),
),
],
),
),
Expanded(
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
const Text('Check-out'),
TextButton(
onPressed: () => _pickDate(context, false),
child: Text('${_checkOut.year}-${_checkOut.month.toString().padLeft(2,'0')}-${_checkOut.day.toString().padLeft(2,'0')}'),
),
],
),
),
],
),
const SizedBox(height: 20),
Row(
children: [
Expanded(
child: OutlinedButton(
onPressed: () => Navigator.of(context).pop(),
child: const Text('Cancel'),
),
),
const SizedBox(width: 12),
Expanded(
child: ElevatedButton(
onPressed: _submit,
child: Text(widget.editing == null ? 'Create' : 'Update'),
),
),
],
)
],
),
),
),
);
}
}