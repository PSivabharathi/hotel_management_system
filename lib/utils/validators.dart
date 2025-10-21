class Validators {
static String? required(String? v) {
if (v == null || v.trim().isEmpty) return 'This field is required';
return null;
}


static String? positiveInt(String? v) {
if (v == null) return 'This field is required';
final n = int.tryParse(v);
if (n == null || n <= 0) return 'Enter a valid number';
return null;
}


static String? dateOrder(DateTime checkIn, DateTime checkOut) {
if (checkOut.isBefore(checkIn) || checkOut.isAtSameMomentAs(checkIn)) {
return 'Check-out must be after check-in';
}
return null;
}
}