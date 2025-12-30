import 'package:flutter/material.dart';

class AnnouncementPage extends StatelessWidget {
  const AnnouncementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black, size: 28),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: const Text(
          'Pengumuman',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: Stack(
        children: [
          ListView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            children: [
              _buildAnnouncementItem(
                title: 'Maintenance Pra UAS Semester Genap 2020/2021',
                subtitle: 'By Admin Celoe - Rabu, 2 Juni 2021, 10:45',
              ),
              const SizedBox(height: 24),
              _buildAnnouncementItem(
                title: 'Pengumuman Maintance',
                subtitle: 'By Admin Celoe - Senin, 11 Januari 2021, 7:52',
              ),
              const SizedBox(height: 24),
              _buildAnnouncementItem(
                title: 'Maintenance Pra UAS Semeter Ganjil 2020/2021',
                subtitle: 'By Admin Celoe - Minggu, 10 Januari 2021, 9:30',
              ),
              const SizedBox(height: 100), // Space for bottom nav
            ],
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: _buildBottomNavigationBar(context),
          ),
        ],
      ),
    );
  }

  Widget _buildAnnouncementItem({
    required String title,
    required String subtitle,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Icon
        Padding(
          padding: const EdgeInsets.only(top: 4.0, right: 16.0),
          child: const Icon(
            Icons.campaign, // Megaphone icon
            size: 32,
            color: Colors.black,
          ),
        ),
        // Text Content
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  height: 1.3,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 11,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildBottomNavigationBar(BuildContext context) {
    return Container(
      height: 80,
      decoration: const BoxDecoration(
        color: Color(0xFFB44F4F),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(context, Icons.home, 'Home', 0),
          _buildNavItem(context, Icons.school, 'Kelas Saya', 1),
          _buildNavItem(context, Icons.notifications, 'Notifikasi', 2),
        ],
      ),
    );
  }

  Widget _buildNavItem(BuildContext context, IconData icon, String label, int index) {
    return GestureDetector(
      onTap: () {
        if (index == 0) {
          Navigator.pop(context); // Assuming Home is back in stack or use named route
        }
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: 28,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 10,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
