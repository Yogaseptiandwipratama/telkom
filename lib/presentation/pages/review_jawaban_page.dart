import 'package:flutter/material.dart';
import 'package:simat_telkom/presentation/pages/quiz_detail_page.dart';
import 'package:simat_telkom/presentation/pages/quiz_review_page.dart';

class ReviewJawabanPage extends StatelessWidget {
  const ReviewJawabanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          _buildHeader(context),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(24.0),
              children: [
                 _buildSummaryCard(),
                 const SizedBox(height: 32),
                 ..._buildQuestionList(context),
                 const SizedBox(height: 32),
                 _buildBottomButton(context),
                 const SizedBox(height: 50),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      width: double.infinity,
      color: const Color(0xFFB44F4F),
      padding: const EdgeInsets.only(top: 50, bottom: 20),
      child: Center(
        child: const Text(
          'Review Jawaban',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildSummaryCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          _buildSummaryRow('Di Mulai Pada', 'Kamis 25 Februari 2021 10:25'),
          const SizedBox(height: 8),
          _buildSummaryRow('Status', 'Selesai'),
          const SizedBox(height: 8),
          _buildSummaryRow('Selesai Pada', 'Kamis 25 Februari 2021 10:40'),
          const SizedBox(height: 8),
          _buildSummaryRow('Waktu Penyelesaian', '13 Menit 22 Detik'),
          const SizedBox(height: 8),
          _buildSummaryRow('Nilai', '0 / 100'),
        ],
      ),
    );
  }

  Widget _buildSummaryRow(String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 140,
          child: Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12,
              color: Colors.black,
            ),
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }

  List<Widget> _buildQuestionList(BuildContext context) {
    // Dummy Data generated for 15 items to test scrolling
    final List<Map<String, dynamic>> reviewItems = List.generate(15, (index) {
      int itemNumber = index + 1;
      if (index % 2 == 0) {
        return {
          'number': itemNumber,
          'question': 'Radio button dapat digunakan untuk menentukan ?',
          'answer': 'A. Jenis Kelamin',
        };
      } else {
        return {
          'number': itemNumber,
          'question': 'Dalam perancangan web yang baik, untuk teks yang menyampaikan isi konten digunakan font yang sama di setiap halaman, ini merupakan salah satu tujuan yaitu ?',
          'answer': 'C. Konsistensi',
        };
      }
    });

    return reviewItems.map((item) => _buildReviewItem(context, item)).toList();
  }

  Widget _buildReviewItem(BuildContext context, Map<String, dynamic> item) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 80,
            child: Text(
              'Pertanyaan ${item['number']}',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12,
                color: Colors.black,
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: const Color(0xFFC4C4C4), // Gray background for question header/text area in image seems solid block
                   // Actually image shows a gray block behind the question text.
                   padding: const EdgeInsets.all(8),
                   width: double.infinity,
                   child: Text(
                     item['question'],
                     style: const TextStyle(fontSize: 12, color: Colors.black),
                   ),
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Jawaban Tersimpan',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: Colors.black
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          item['answer'],
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.black
                          ),
                        ),
                      ],
                    ),
                    TextButton(
                      onPressed: () {
                         // Parse the answer string "A. Jenis Kelamin" -> Label "A"
                         String rawAnswer = item['answer'] as String;
                         String selectedLabel = rawAnswer.split('.')[0]; 

                         Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => QuizDetailPage(
                              questionNumber: item['number'] as int,
                              questionText: item['question'] as String,
                              selectedAnswerLabel: selectedLabel,
                              // options are defaulted in the page for now as per design
                            ),
                          ),
                        );
                      },
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: Size.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        alignment: Alignment.centerRight,
                      ),
                      child: const Text(
                        'Lihat Soal',
                        style: TextStyle(
                          color: Color(0xFF2F80ED), // Blue link color
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomButton(BuildContext context) {
     return SizedBox(
       width: 200, // Approximate width
       child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const QuizReviewPage(),
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF2ECC71), // Green
          foregroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.symmetric(vertical: 16),
        ),
        child: const Text(
          'Kirim Jawaban',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
     );
  }
}
