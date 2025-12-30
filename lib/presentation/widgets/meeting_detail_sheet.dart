import 'package:flutter/material.dart';
import '../pages/quiz_review_page.dart';
import '../pages/material_detail_page.dart';
import '../pages/assignment_detail_page.dart';

class MeetingDetailSheet extends StatefulWidget {
  final String title;

  const MeetingDetailSheet({super.key, required this.title});

  @override
  State<MeetingDetailSheet> createState() => _MeetingDetailSheetState();
}

class _MeetingDetailSheetState extends State<MeetingDetailSheet> {
  int _currentTab = 0; // 0: Lampiran Materi, 1: Tugas dan Kuis

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.9, // 90% height
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      padding: const EdgeInsets.only(top: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Handle Bar
          Center(
            child: Container(
              width: 50,
              height: 5,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          const SizedBox(height: 24),
          
          // Title
          Center(
            child: Text(
              widget.title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          
          const SizedBox(height: 16),
          
          // Description
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Deskripsi',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Antarmuka yang dibangun harus memperhatikan prinsip-prinsip desain yang ada. Hal ini diharapkan agar antarmuka yang dibangun bukan hanya menarik secara visual tetapi dengan memperhatikan kaidah-kaidah prinsip desain diharapkan akan mendukung pengguna dalam menggunakan produk secara baik. Pelajaran mengenai prinsip UID ini sudah pernah diajarkan dalam mata kuliah Implementasi Desain Antarmuka Pengguna tetap pada matakuliah ini akan direview kembali sehingga dapat menjadi bekal saat memasukki materi mengenai User Experience',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black87,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
          
          const SizedBox(height: 24),
          
          // Custom Tab Bar
          Container(
            color: const Color(0xFFF5F5F5), // Light grey background for tabs
            padding: const EdgeInsets.symmetric(vertical: 0),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() => _currentTab = 0),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: _currentTab == 0 ? Colors.black : Colors.transparent,
                            width: 2,
                          ),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Lampiran Materi',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: _currentTab == 0 ? Colors.black : Colors.black54,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() => _currentTab = 1),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: _currentTab == 1 ? Colors.black : Colors.transparent,
                            width: 2,
                          ),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Tugas dan Kuis',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: _currentTab == 1 ? Colors.black : Colors.black54,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          
          // Content List
          Expanded(
            child: _currentTab == 0 ? _buildMaterialList() : _buildTasksList(),
          ),
        ],
      ),
    );
  }

  Widget _buildMaterialList() {
    return ListView(
      padding: const EdgeInsets.all(24),
      children: [
        _buildItem(
          icon: Icons.link,
          text: 'Zoom Meeting Syncronous',
          isCompleted: true,
        ),
        _buildItem(
          icon: Icons.description_outlined,
          text: 'Elemen-elemen Antarmuka Pengguna',
          isCompleted: true,
        ),
        _buildItem(
          icon: Icons.description_outlined,
          text: 'UID Guidelines and Principles',
          isCompleted: true,
        ),
        _buildItem(
          icon: Icons.description_outlined,
          text: 'User Profile',
          isCompleted: true,
        ),
        _buildItem(
          icon: Icons.link,
          text: 'Principles of User Interface Design',
          isCompleted: true,
        ),
        _buildItem(
          icon: Icons.description_outlined,
          text: 'Pengantar User Interface Design',
          isCompleted: true,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MaterialDetailPage()),
            );
          },
        ),
      ],
    );
  }

  Widget _buildTasksList() {
    // Check if the title is strictly 'Pengantar User Interface Design' or contains it
    // Using loose matching to be safe, or exact if preferred. The user said "bagian pengantar user interface design"
    if (widget.title.contains('Pengantar User Interface Design')) {
      return _buildEmptyTasksList();
    }

    return ListView(
      padding: const EdgeInsets.all(24),
      children: [
        _buildTaskItem(
          title: 'Quiz Review 01',
          description:
              'Silahkan kerjakan kuis ini dalam waktu 15 menit sebagai nilai pertama komponen kuis. Jangan lupa klik tombol Submit Answer setelah menjawab seluruh pertanyaan.\nKerjakan sebelum hari Jum\'at, 26 Februari 2021 jam 23:59 WIB.',
          icon: Icons.quiz_outlined,
          isCompleted: true,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const QuizReviewPage()),
            );
          },
        ),
        _buildTaskItem(
          title: 'Tugas 01 - UID Android Mobile Game',
          description:
              '1. Buatlah desain tampilan (antarmuka) pada aplikasi mobile game FPS (First Person Shooter) yang akan menjadi tugas pada mata kuliah Pemrograman Aplikasi Permainan.\n2. Desain yang dibuat harus melingkupi seluruh tampilan pada aplikasi/game, dari pertama kali aplikasi ............',
          icon: Icons.assignment_outlined,
          isCompleted: false, // Grey check
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AssignmentDetailPage()),
            );
          },
        ),
      ],
    );
  }

  Widget _buildEmptyTasksList() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/karakter.png',
            height: 200,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 24),
          const Text(
            'Tidak Ada Tugas Dan Kuis Hari Ini',
            style: TextStyle(
              fontSize: 16,
              color: Colors.black87,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildItem({
    required IconData icon,
    required String text,
    required bool isCompleted,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: Colors.grey[200]!),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.02),
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.black87, size: 24),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                text,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black87,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(4),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFF2ECC71),
              ),
              child: const Icon(
                Icons.check,
                color: Colors.white,
                size: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTaskItem({
    required String title,
    required String description,
    required IconData icon,
    required bool isCompleted,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: Colors.grey[200]!),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.02),
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Icon Box
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Icon(icon, size: 32, color: Colors.black87),
            ),
            const SizedBox(width: 16),
            // Content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          title,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: isCompleted ? const Color(0xFF2ECC71) : Colors.grey[300],
                        ),
                        child: const Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 16,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Divider(height: 1, color: Colors.grey),
                  const SizedBox(height: 8),
                  Text(
                    description,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.black87,
                      height: 1.5,
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
}
