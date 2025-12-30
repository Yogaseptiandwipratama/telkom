import 'package:flutter/material.dart';

class AssignmentDetailPage extends StatelessWidget {
  const AssignmentDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFFB44F4F),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Tugas 01 - UID Android Mobile Game',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '1. Buatlah desain tampilan (antarmuka) pada aplikasi mobile game FPS (First Person Shooter) yang akan menjadi tugas pada mata kuliah Pemrograman Aplikasi Permainan.\n\n'
              '2. Desain yang dibuat harus melingkupi seluruh tampilan pada aplikasi/game, dari pertama kali aplikasi dibuka sampai ditutup kembali, serta desain untuk tampilan-tampilan fungsi yang mendukung permainan seperti pop-up, alert, chat, dan lain-lain.\n\n'
              '3. Desain bisa dibuat menggunakan aplikasi khusus desain atau secara manual dengan tetap menjunjung kerapihan dan kejelasan setiap elemen dalam desain.\n\n'
              '4. Berikan identitas aplikasi game yang dibuat, seperti Nama Game, Genre, dan Platform. Serta berikan penjelasan pada setiap elemen pada desain, seperti gambar, teks, tombol, icon, dan lain-lain.\n\n'
              '5. File dikumpulkan dalam format .PDF dengan size maksimal 5MB.\n\n'
              '6. Tugas dikumpulkan paling lambat hari Jum\'at, 26 Februari 2021 jam 23:59 WIB (akan tertutup otomatis) dan akan dipresentasikan pada pertemuan selanjutnya via Zoom Meeting.',
              style: TextStyle(
                fontSize: 13,
                height: 1.5,
                color: Colors.black87,
              ),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 32),
            
            // Status Section Header
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              decoration: const BoxDecoration(
                color: Color(0xFFE56A6A), // Slightly lighter red for the header
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
              ),
              child: const Text(
                'Status Tugas',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
            
            // Status Table
            _buildStatusRow('Status', 'Sudah Mengirim untuk di nilai', isEven: true),
            _buildStatusRow('Status Nilai', 'Belum Di nilai', isEven: false),
            _buildStatusRow('Batas tanggal', 'Jumat, 26 Februari 2021, 23:59 WIB', isEven: true),
            _buildStatusRow('Sisa Waktu', 'Tugas sudah di kirim 4 Hari 6 Jam Sebelum nya', isEven: false),
            _buildFileRow('File Tugas', 'Dandy Candra Pratama_7708170114.pdf', isEven: true),
            
            const SizedBox(height: 40),
            
            // Button
            Center(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFF5F5F5),
                  foregroundColor: Colors.black87,
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Tambahkan Tugas',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusRow(String label, String value, {required bool isEven}) {
    return Container(
      color: isEven ? const Color(0xFFF9F9F9) : Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              label,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12,
                color: Colors.black87,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFileRow(String label, String fileName, {required bool isEven}) {
    return Container(
      color: isEven ? const Color(0xFFF9F9F9) : Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              label,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12,
                color: Colors.black87,
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                const Icon(Icons.description_outlined, size: 20, color: Colors.black54),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    fileName,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
