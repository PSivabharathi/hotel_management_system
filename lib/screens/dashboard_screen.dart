// // import 'package:flutter/material.dart';
// // import 'package:hotel_management_system/screens/create_reservation_screen.dart';
// // import 'reservations_list.dart';

// // class DashboardScreen extends StatelessWidget {
// //   const DashboardScreen({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: Container(
// //         decoration: const BoxDecoration(
// //           gradient: LinearGradient(
// //             begin: Alignment.topLeft,
// //             end: Alignment.bottomRight,
// //             colors: [Color(0xFF6C63FF), Color(0xFF00C9A7)],
// //           ),
// //         ),
// //         child: SafeArea(
// //           child: Padding(
// //             padding: const EdgeInsets.all(20.0),
// //             child: Column(
// //               crossAxisAlignment: CrossAxisAlignment.start,
// //               children: [
// //                 Row(
// //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                   children: [
// //                     const Text(
// //                       'HMS Dashboard',
// //                       style: TextStyle(
// //                         color: Colors.white,
// //                         fontSize: 26,
// //                         fontWeight: FontWeight.bold,
// //                       ),
// //                     ),
// //                     IconButton(
// //                       onPressed: () {},
// //                       icon: const Icon(
// //                         Icons.notifications,
// //                         color: Colors.white,
// //                       ),
// //                     ),
// //                   ],
// //                 ),
// //                 const SizedBox(height: 20),
// //                 Expanded(
// //                   child: GridView.count(
// //                     crossAxisCount: 2,
// //                     childAspectRatio: 1.1,
// //                     mainAxisSpacing: 16,
// //                     crossAxisSpacing: 16,
// //                     children: [
// //                       _FeatureCard(
// //                         title: 'Reservations',
// //                         icon: Icons.event_note,
// //                         routeBuilder: () => const CreateReservationScreen(),
// //                       ),
// //                       _FeatureCard(
// //                         title: 'Reports',
// //                         icon: Icons.bar_chart,
// //                         routeBuilder: () => const ReservationsList(),
// //                       ),
// //                       _FeatureCard(
// //                         title: 'Guests',
// //                         icon: Icons.people,
// //                         routeBuilder: () => const ReservationsList(),
// //                       ),
// //                       _FeatureCard(
// //                         title: 'Settings',
// //                         icon: Icons.settings,
// //                         routeBuilder: () => const ReservationsList(),
// //                       ),
// //                     ],
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }

// // class _FeatureCard extends StatelessWidget {
// //   final String title;
// //   final IconData icon;
// //   final Widget Function() routeBuilder;
// //   const _FeatureCard({
// //     required this.title,
// //     required this.icon,
// //     required this.routeBuilder,
// //   });

// //   @override
// //   Widget build(BuildContext context) {
// //     return GestureDetector(
// //       onTap: () => Navigator.of(
// //         context,
// //       ).push(MaterialPageRoute(builder: (_) => routeBuilder())),
// //       child: Container(
// //         decoration: BoxDecoration(
// //           color: Colors.white.withOpacity(0.9),
// //           borderRadius: BorderRadius.circular(16),
// //           boxShadow: [
// //             BoxShadow(color: Colors.black.withOpacity(0.08), blurRadius: 8),
// //           ],
// //         ),
// //         padding: const EdgeInsets.all(16),
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             CircleAvatar(
// //               child: Icon(
// //                 icon,
// //                 size: 28,
// //                 color: Theme.of(context).colorScheme.primary,
// //               ),
// //               backgroundColor: Colors.white,
// //             ),
// //             const Spacer(),
// //             Text(
// //               title,
// //               style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
// //             ),
// //             const SizedBox(height: 6),
// //             const Text(
// //               'Tap to manage',
// //               style: TextStyle(fontSize: 12, color: Colors.black54),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';
// import 'package:hotel_management_system/screens/reports_screen.dart';
// import 'package:hotel_management_system/screens/reservations_list.dart';
// import 'package:hotel_management_system/screens/settings_screen.dart';

// class DashboardScreen extends StatelessWidget {
//   const DashboardScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         title: const Text('Dashboard'),
//         centerTitle: true,
//         flexibleSpace: Container(
//           decoration: const BoxDecoration(
//             gradient: LinearGradient(
//               colors: [Color(0xFF6A11CB), Color(0xFF2575FC)],
//               begin: Alignment.topLeft,
//               end: Alignment.bottomRight,
//             ),
//           ),
//         ),
//       ),
//       body: GridView.count(
//         crossAxisCount: 2,
//         padding: const EdgeInsets.all(16.0),
//         crossAxisSpacing: 16.0,
//         mainAxisSpacing: 16.0,
//         children: <Widget>[
//           _buildDashboardItem(
//             context,
//             iconPath: 'assets/booking.png',
//             label: 'Reservations',
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => const ReservationsList(),
//                 ),
//               );
//             },
//           ),
//           _buildDashboardItem(
//             context,
//             iconPath: 'assets/guests.png',
//             label: 'Guests',
//             onTap: () {
//               // You can create a guest list screen similar to the reservations list
//             },
//           ),
//           _buildDashboardItem(
//             context,
//             iconPath: 'assets/report.png',
//             label: 'Reports',
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => const ReportsScreen()),
//               );
//             },
//           ),
//           _buildDashboardItem(
//             context,
//             iconPath: 'assets/cogwheel.png',
//             label: 'Settings',
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => const SettingsScreen()),
//               );
//             },
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildDashboardItem(
//     BuildContext context, {
//     String? iconPath, // path to your asset image
//     required String label,
//     required VoidCallback onTap,
//   }) {
//     return InkWell(
//       onTap: onTap,
//       child: Card(
//         color: Colors.white,
//         elevation: 4,
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             if (iconPath != null)
//               Image.asset(iconPath, width: 50, height: 50, fit: BoxFit.contain),
//             const SizedBox(height: 10),
//             Text(
//               label,
//               textAlign: TextAlign.center,
//               style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:hotel_management_system/screens/reports_screen.dart';
import 'package:hotel_management_system/screens/reservations_list.dart';
import 'package:hotel_management_system/screens/settings_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  // List of images for the carousel
  static final List<String> imgList = [
    'assets/marten-bjork-n_IKQDCyrG0-unsplash.jpg',
    'assets/sara-dubler-Koei_7yYtIo-unsplash.jpg',
    'assets/vojtech-bruzek-Yrxr3bsPdS0-unsplash.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text('Dashboard'),
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
      drawer: _buildDrawer(context),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildImageCarousel(),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Our Services',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            _buildServicesGrid(),
            const Padding(
              padding: EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 8.0),
              child: Text(
                'Manage Hotel',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            _buildDashboardItem(
              context,
              iconPath: 'assets/booking.png',
              label: 'Reservations',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ReservationsList(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImageCarousel() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20.0),
      child: CarouselSlider(
        options: CarouselOptions(
          height: 200.0,
          autoPlay: true,
          enlargeCenterPage: true,
          aspectRatio: 16 / 9,
          autoPlayCurve: Curves.fastOutSlowIn,
          enableInfiniteScroll: true,
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          viewportFraction: 0.8,
        ),
        items: imgList
            .map(
              (item) => Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                  child: Image.asset(item, fit: BoxFit.cover, width: 1000.0),
                ),
              ),
            )
            .toList(),
      ),
    );
  }

  Widget _buildServicesGrid() {
    return GridView.count(
      crossAxisCount: 4,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      children: <Widget>[
        _buildServiceItem(icon: Icons.wifi, label: 'Free WiFi'),
        _buildServiceItem(icon: Icons.pool, label: 'Pool'),
        _buildServiceItem(icon: Icons.restaurant, label: 'Restaurant'),
        _buildServiceItem(icon: Icons.local_parking, label: 'Parking'),
      ],
    );
  }

  Widget _buildServiceItem({required IconData icon, required String label}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 30, color: const Color(0xFF6A11CB)),
        const SizedBox(height: 8),
        Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 12),
        ),
      ],
    );
  }

  Widget _buildDashboardItem(
    BuildContext context, {
    required String iconPath,
    required String label,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: InkWell(
        onTap: onTap,
        child: Card(
          color: Colors.white,
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: <Widget>[
                Image.asset(
                  iconPath,
                  width: 40,
                  height: 40,
                  fit: BoxFit.contain,
                ),
                const SizedBox(width: 20),
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Spacer(),
                const Icon(Icons.arrow_forward_ios, color: Colors.grey),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Drawer _buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF6A11CB), Color(0xFF2575FC)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Text(
              'Hotel Menu',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          ListTile(
            leading: Image.asset('assets/guests.png', width: 24, height: 24),
            title: const Text('Guests'),
            onTap: () {
              // Navigate to Guests screen
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Image.asset('assets/report.png', width: 24, height: 24),
            title: const Text('Reports'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ReportsScreen()),
              );
            },
          ),
          ListTile(
            leading: Image.asset('assets/cogwheel.png', width: 24, height: 24),
            title: const Text('Settings'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsScreen()),
              );
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: const Text('App Version'),
            onTap: () {
              Navigator.pop(context);
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('App Version'),
                  content: const Text('Version 1.0.0'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('OK'),
                    ),
                  ],
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.privacy_tip_outlined),
            title: const Text('Privacy Policy'),
            onTap: () {
              // Handle Privacy Policy
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
