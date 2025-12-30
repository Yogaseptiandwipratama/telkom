import 'package:flutter/material.dart';
import 'take_quiz_page.dart';
import 'course_detail_page.dart';

class QuizReviewPage extends StatelessWidget {
  const QuizReviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header
            Container(
              height: 120, // Adjust height as needed
              width: double.infinity,
              color: const Color(0xFFB44F4F), // Red header
              alignment: Alignment.center,
              padding: const EdgeInsets.only(top: 40), // For status bar compensation if needed
              child: const Text(
                'Quiz Review 1',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            Padding(
               padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.center,
                 children: [
                   // Description Text
                   const Text(
                     'Silahkan kerjakan kuis ini dalam waktu 15 menit sebagai nilai pertama komponen kuis.\nJangan lupa klik tombol Submit Answer setelah menjawab seluruh pertanyaan.',
                     textAlign: TextAlign.center,
                     style: TextStyle(
                       fontSize: 14,
                       color: Colors.black,
                       height: 1.5,
                     ),
                   ),
                   const SizedBox(height: 16),
                   const Text(
                     'Kerjakan sebelum hari Jum\'at, 26 Februari 2021 jam 23:59 WIB.',
                     textAlign: TextAlign.center,
                     style: TextStyle(
                       fontSize: 14,
                       color: Colors.black,
                     ),
                   ),
                   
                   const SizedBox(height: 32),

                   // Info Box
                   Container(
                     padding: const EdgeInsets.all(24),
                     decoration: BoxDecoration(
                       color: const Color(0xFFF5F5F5), // Light grey background
                       borderRadius: BorderRadius.circular(16),
                     ),
                     child: Column(
                       children: const [
                         Text(
                           'Kuis Akan di tutup pada Jumat, 26 February 2021, 11:59 PM',
                           textAlign: TextAlign.center,
                           style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                         ),
                         SizedBox(height: 16),
                         Text(
                           'Batas Waktu: 15 menit',
                           style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                         ),
                         SizedBox(height: 16),
                         Text(
                           'Metode Penilaian: Nilai Tertinggi',
                           style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                         ),
                       ],
                     ),
                   ),

                   const SizedBox(height: 48),

                   // Percobaan Label
                   const Align(
                     alignment: Alignment.centerLeft,
                     child: Text(
                       'Percobaan Yang Sudah Di Lakukan',
                       style: TextStyle(
                         fontWeight: FontWeight.bold,
                         fontSize: 16,
                       ),
                     ),
                   ),
                   
                   const SizedBox(height: 16),

                   // Table-like structure
                   ClipRRect(
                     borderRadius: BorderRadius.circular(8), // Optional rounded corners
                     child: Column(
                       children: [
                         // Table Header
                         Container(
                           color: const Color(0xFFEB5757), // Lighter red/pinkish for header
                           padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                           child: Row(
                             children: const [
                               Text(
                                 'Status',
                                 style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                               ),
                               Spacer(),
                               Text(
                                 'Nilai / 100.00',
                                 style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                               ),
                               SizedBox(width: 32),
                               Text(
                                 'Tinjau Kembali',
                                 style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                               ),
                             ],
                           ),
                         ),
                         // Table Data Row
                         Container(
                           color: const Color(0xFFF5F5F5),
                           padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                           child: Row(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               Expanded(
                                 child: Column(
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                   children: [
                                     const Text(
                                       'Selesai',
                                       style: TextStyle(
                                         fontWeight: FontWeight.bold,
                                         fontSize: 16,
                                       ),
                                     ),
                                     const SizedBox(height: 4),
                                     Text(
                                       'Dikirim Pada Kamis, 25 Februari 2021, 10:40',
                                       style: TextStyle(
                                         fontSize: 12,
                                         color: Colors.black.withOpacity(0.7),
                                       ),
                                     ),
                                   ],
                                 ),
                               ),
                               // Score
                               const SizedBox(width: 16),
                               const Text(
                                 '85,0',
                                 style: TextStyle(
                                   fontSize: 14,
                                   color: Colors.black,
                                 ),
                               ),
                               const SizedBox(width: 64),
                               // Action
                               GestureDetector(
                                 onTap: () {},
                                 child: const Text(
                                   'Lihat',
                                   style: TextStyle(
                                     color: Color(0xFF5D9CEC), // Blue link color
                                     fontWeight: FontWeight.bold,
                                   ),
                                 ),
                               ),
                             ],
                           ),
                         ),
                       ],
                     ),
                   ),
                   
                   const SizedBox(height: 32),
                   
                   // Final Score Text
                   const Align(
                     alignment: Alignment.centerLeft,
                     child: Text(
                       'Nilai Akhir Anda Untuk Kuis Ini Adalah 85.0 / 100.00',
                       style: TextStyle(
                         fontWeight: FontWeight.bold,
                         fontSize: 14,
                       ),
                     ),
                   ),

                   const SizedBox(height: 48),

                   // Buttons
                   ElevatedButton(
                     onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const TakeQuizPage()),
                        );
                     },
                     style: ElevatedButton.styleFrom(
                       backgroundColor: const Color(0xFFF5F5F5),
                       foregroundColor: Colors.black,
                       elevation: 0,
                       minimumSize: const Size(200, 45),
                       shape: RoundedRectangleBorder(
                         borderRadius: BorderRadius.circular(12),
                       ),
                     ),
                     child: const Text('Ambil Kuis'),
                   ),
                   const SizedBox(height: 16),
                   ElevatedButton(
                     onPressed: () {
                       Navigator.push(
                         context,
                         MaterialPageRoute(
                           builder: (context) => const CourseDetailPage(title: 'Desain User Interface'),
                         ),
                       );
                     },
                     style: ElevatedButton.styleFrom(
                       backgroundColor: const Color(0xFFF5F5F5),
                       foregroundColor: Colors.black,
                       elevation: 0,
                       minimumSize: const Size(200, 45),
                       shape: RoundedRectangleBorder(
                         borderRadius: BorderRadius.circular(12),
                       ),
                     ),
                     child: const Text('Kembali Ke Kelas'),
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
