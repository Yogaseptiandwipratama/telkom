import 'package:flutter/material.dart';
import 'home_page.dart';
import 'notification_page.dart';
import 'course_detail_page.dart';

class MyClassesPage extends StatefulWidget {
  const MyClassesPage({super.key});

  @override
  State<MyClassesPage> createState() => _MyClassesPageState();
}

class _MyClassesPageState extends State<MyClassesPage> {
  int _selectedIndex = 1; // Highlight 'Kelas Saya'

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
          'Kelas Saya',
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
              _buildClassItem(
                imageAsset: 'assets/images/uiux.png',
                year: '2021/2',
                title: 'DESAIN ANTARMUKA & PENGALAMAN PENGGUNA D4SM-42-03 [ADY]',
                progress: 89,
              ),
              _buildClassItem(
                imageAsset: 'assets/images/pkn.png',
                year: '2021/2',
                title: 'KEWARGANEGARAAN\nD4SM-41-GAB1 [BBO]. JUMAT 2',
                progress: 86,
              ),
              _buildClassItem(
                imageAsset: 'assets/images/os.png',
                year: '2021/2',
                title: 'SISTEM OPERASI\nD4SM-44-02 [DDS]',
                progress: 80,
              ),
              _buildClassItem(
                imageAsset: 'assets/images/a.png',
                year: '2021/2',
                title: 'PEMROGRAMAN PERANGKAT BERGERAK MULTIMEDIA\nD4SM-41-GAB1 [APJ]',
                progress: 90,
              ),
              _buildClassItem(
                imageAsset: 'assets/images/d.png',
                year: '2021/2',
                title: 'BAHASA INGGRIS: BUSINESS AND SCIENTIFIC\nD4SM-41-GAB1 [ARS]',
                progress: 80,
              ),
              _buildClassItem(
                imageAsset: 'assets/images/e.png',
                year: '2021/2',
                title: 'PEMROGRAMAN MULTIMEDIA INTERAKTIF\nD4SM-43-04 [TPR]',
                progress: 90,
              ),
              _buildClassItem(
                imageAsset: 'assets/images/f.png',
                year: '2021/2',
                title: 'OLAH RAGA\nD3TT-44-02 [EYR]',
                progress: 90,
              ),
              const SizedBox(height: 100),
            ],
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: _buildBottomNavigationBar(),
          ),
        ],
      ),
    );
  }

  Widget _buildClassItem({
    String? imageAsset,
    Color? color,
    required String year,
    required String title,
    required int progress,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CourseDetailPage(title: title),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 24),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image/Box
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: color ?? Colors.white,
                borderRadius: BorderRadius.circular(8),
                image: imageAsset != null
                    ? DecorationImage(
                        image: AssetImage(imageAsset),
                        fit: BoxFit.cover,
                        onError: (exception, stackTrace) {
                           //
                        })
                    : null,
              ),
               child: imageAsset == null && color != null ? null : (imageAsset == null ? const Icon(Icons.broken_image, color: Colors.grey) : null),
            ),
            const SizedBox(width: 16),
            // Content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    year,
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 12),
                  // Progress Bar
                  Stack(
                    children: [
                      Container(
                        height: 8,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      Container(
                        height: 8,
                        width: MediaQuery.of(context).size.width * 0.5 * (progress / 100),
                        decoration: BoxDecoration(
                          color: const Color(0xFFB44F4F),
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '$progress% Selesai',
                    style: const TextStyle(
                      fontSize: 10,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
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
          _buildNavItem(Icons.home, 'Home', 0),
          _buildNavItem(Icons.school, 'Kelas Saya', 1),
          _buildNavItem(Icons.notifications, 'Notifikasi', 2),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    bool isSelected = _selectedIndex == index;
    return GestureDetector(
      onTap: () {
        if (index == 0) {
           Navigator.of(context).popUntil((route) => route.isFirst);
        } else if (index == 2) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const NotificationPage()),
          );
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
          if (isSelected)
            Container(
              margin: const EdgeInsets.only(top: 4),
              width: 4,
              height: 4,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
            ),
        ],
      ),
    );
  }
}
