import 'package:flutter/material.dart';

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
          isCompleted: true, // Green check
        ),
        _buildItem(
          icon: Icons.description_outlined,
          text: 'Pengantar User Interface Design',
          isCompleted: false, // Grey check
        ),
        _buildItem(
          icon: Icons.description_outlined,
          text: 'Empat Teori Dasar Antarmuka Pengguna',
          isCompleted: false, // Grey check
        ),
        _buildItem(
          icon: Icons.description_outlined,
          text: 'Empat Teori Dasar Antarmuka Pengguna',
          isCompleted: true, // Green check
        ),
        _buildItem(
          icon: Icons.video_collection_outlined, // Video iconish
          text: 'User Interface Design for Beginner',
          isCompleted: true,
        ),
        _buildItem(
          icon: Icons.link,
          text: '20 Prinsip Desain',
          isCompleted: true,
        ),
        _buildItem(
          icon: Icons.link,
          text: 'Best Practice UI Design',
          isCompleted: true,
        ),
      ],
    );
  }

  Widget _buildTasksList() {
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
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30), // Rounded pill shape
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
          Icon(icon, color: Colors.black87, size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.black87,
              ),
            ),
          ),
          Icon(
            Icons.check_circle,
            color: isCompleted ? const Color(0xFF2ECC71) : Colors.grey[400],
            size: 24,
          ),
        ],
      ),
    );
  }
}
