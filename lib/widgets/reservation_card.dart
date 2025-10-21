import 'package:flutter/material.dart';
import 'package:hotel_management_system/models/reservation.dart';
import 'package:hotel_management_system/providers/reservation_provider.dart';
import 'package:hotel_management_system/screens/reservation_form.dart';
import 'package:hotel_management_system/screens/reservation_details_screen.dart';
import 'package:provider/provider.dart';

class ReservationCard extends StatelessWidget {
  final Reservation reservation;
  const ReservationCard({required this.reservation, super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ReservationProvider>(context, listen: false);
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => ReservationDetailsScreen(reservation: reservation),
          ),
        );
      },
      borderRadius: BorderRadius.circular(12),
      child: Card(
        color: Colors.grey[100],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // --- Top Row ---
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
                            builder: (_) =>
                                ReservationForm(editing: reservation),
                          ),
                        ),
                        icon: const Icon(Icons.edit, color: Colors.blue),
                      ),
                      IconButton(
                        onPressed: () async {
                          final ok = await showDialog<bool>(
                            context: context,
                            builder: (ctx) => AlertDialog(
                              backgroundColor: Colors.white,
                              title: const Text('Delete reservation?'),
                              content: const Text(
                                'This action cannot be undone.',
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.of(ctx).pop(false),
                                  child: const Text(
                                    'Cancel  ',
                                    style: TextStyle(color: Colors.blue),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () => Navigator.of(ctx).pop(true),
                                  child: const Text(
                                    'Delete',
                                    style: TextStyle(color: Colors.red),
                                  ),
                                ),
                              ],
                            ),
                          );
                          if (ok == true) {
                            provider.deleteReservation(reservation.id);
                          }
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
                'Check-in: ${_format(reservation.checkIn)} – '
                'Check-out: ${_format(reservation.checkOut)}',
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _format(DateTime d) {
    return "${d.year}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}";
  }
}
