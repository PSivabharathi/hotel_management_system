import 'package:flutter/material.dart';
import 'package:hotel_management_system/models/reservation.dart';
import 'package:hotel_management_system/providers/reservation_provider.dart';
import 'package:hotel_management_system/screens/reservation_form.dart';
import 'package:provider/provider.dart';

class ReservationCard extends StatelessWidget {
  final Reservation reservation;
  const ReservationCard({required this.reservation, super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ReservationProvider>(context, listen: false);
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  reservation.name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => ReservationForm(editing: reservation),
                        ),
                      ),
                      icon: const Icon(Icons.edit, color: Colors.blue),
                    ),
                    IconButton(
                      onPressed: () async {
                        final ok = await showDialog<bool>(
                          context: context,
                          builder: (ctx) => AlertDialog(
                            title: const Text('Delete reservation?'),
                            content: const Text(
                              'This action cannot be undone.',
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.of(ctx).pop(false),
                                child: const Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () => Navigator.of(ctx).pop(true),
                                child: const Text('Delete'),
                              ),
                            ],
                          ),
                        );
                        if (ok == true)
                          provider.deleteReservation(reservation.id);
                      },
                      icon: const Icon(Icons.delete, color: Colors.redAccent),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 6),
            Text('Room: ${reservation.roomType}'),
            const SizedBox(height: 4),
            Text('Guests: ${reservation.guests}'),
            const SizedBox(height: 4),
            Text(
              'Check-in: ${reservation.checkIn.year}-${reservation.checkIn.month.toString().padLeft(2, '0')}-${reservation.checkIn.day.toString().padLeft(2, '0')} '
              '– Check-out: ${reservation.checkOut.year}-${reservation.checkOut.month.toString().padLeft(2, '0')}-${reservation.checkOut.day.toString().padLeft(2, '0')}',
            ),
          ],
        ),
      ),
    );
  }

  String _format(DateTime d) {
    return "\${d.year}-\${d.month.toString().padLeft(2,'0')}-\${d.day.toString().padLeft(2,'0')}";
  }
}
