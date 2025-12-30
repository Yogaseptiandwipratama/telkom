import 'package:flutter/material.dart';

class AnnouncementDetailPage extends StatelessWidget {
  const AnnouncementDetailPage({super.key});

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
          SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(24, 10, 24, 100), // Bottom padding for nav bar
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Maintenance Pra UAS Semester Genap 2020/2021',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    const Icon(Icons.account_circle, color: Colors.grey, size: 24), // Placeholder for user avatar
                    const SizedBox(width: 8),
                    Text(
                      'By Admin Celoe - Rabu, 2 Juni 2021, 10:45',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                // Image
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    'assets/images/Pengumuman.png',
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                        Container(height: 200, color: Colors.grey[200], child: const Center(child: Text('Image Not Found'))),
                  ),
                ),
                const SizedBox(height: 24),
                
                const Center(
                  child: Text(
                    'Maintenance LMS',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                
                const Text(
                  'Diinformasikan kepada seluruh pengguna LMS, kami dari tim CeLOE akan melakukan maintenance pada tanggal 12 Juni 2021, untuk meningkatkan layanan server dalam menghadapi ujian akhir semester (UAS).',
                  style: TextStyle(fontSize: 14, height: 1.5, color: Colors.black87),
                  textAlign: TextAlign.justify,
                ),
                const SizedBox(height: 16),
                const Text(
                  'Dengan adanya kegiatan maintenance tersebut maka situs LMS (lms.telkomuniversity.ac.id) tidak dapat diakses mulai pukul 00.00 s/d 06.00 WIB.',
                  style: TextStyle(fontSize: 14, height: 1.5, color: Colors.black87),
                  textAlign: TextAlign.justify,
                ),
                const SizedBox(height: 16),
                const Text(
                  'Demikian informasi ini kami sampaikan, mohon maaf atas ketidaknyamanannya.',
                  style: TextStyle(fontSize: 14, height: 1.5, color: Colors.black87),
                  textAlign: TextAlign.justify,
                ),
                const SizedBox(height: 24),
                const Text(
                  'Hormat Kami,\nCeLOE Telkom University',
                  style: TextStyle(fontSize: 14, height: 1.5, color: Colors.black87),
                ),
              ],
            ),
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
             Navigator.of(context).popUntil((route) => route.isFirst);
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
