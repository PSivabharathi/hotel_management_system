import 'package:flutter/material.dart';
import 'package:hotel_management_system/screens/create_reservation_screen.dart';
import 'package:hotel_management_system/widgets/reservation_card.dart';
import 'package:provider/provider.dart';
import '../providers/reservation_provider.dart';
import 'reservation_form.dart';

class ReservationsList extends StatelessWidget {
  const ReservationsList({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ReservationProvider>(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Reservations')),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            ElevatedButton.icon(
              
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const CreateReservationScreen(),
                ),
              ),
              icon: const Icon(Icons.add),
              label: const Text(
                'Create Reservation',
                style: TextStyle(color: Colors.black),
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: provider.items.isEmpty
                  ? Center(
                      child: Text(
                        'No reservations yet',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    )
                  : ListView.separated(
                      itemCount: provider.items.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 10),
                      itemBuilder: (ctx, i) =>
                          ReservationCard(reservation: provider.items[i]),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
