import 'package:flutter/material.dart';

class QuizDetailPage extends StatelessWidget {
  final int questionNumber;
  final String questionText;
  final String selectedAnswerLabel; // e.g. 'A'
  final List<Map<String, String>> options;

  const QuizDetailPage({
    super.key,
    required this.questionNumber,
    required this.questionText,
    required this.selectedAnswerLabel,
    this.options = const [
      {'label': 'A', 'text': 'Jenis Kelamin'},
      {'label': 'B', 'text': 'Alamat'},
      {'label': 'C', 'text': 'Hobby'},
      {'label': 'D', 'text': 'Riwayat Pendidikan'},
      {'label': 'E', 'text': 'Umur'},
    ],
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildQuestionNavigator(),
                  const SizedBox(height: 32),
                  _buildQuestionContent(context),
                  const SizedBox(height: 48),
                   Center(
                    child: SizedBox(
                      width: 250,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFF5F5F5),
                          foregroundColor: Colors.black,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                        ),
                        child: const Text(
                          'Kembali Ke Halam Review',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                   const SizedBox(height: 32),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      height: 100,
      color: const Color(0xFFB44F4F),
      padding: const EdgeInsets.only(top: 40, left: 24, right: 24, bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Quiz Review 1',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            children: const [
              Icon(Icons.timer_outlined, color: Colors.white, size: 24),
              SizedBox(width: 8),
              Text(
                '15 : 00',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildQuestionNavigator() {
    // Show static green circles for demo as per image
    return Center(
      child: Wrap(
        spacing: 8,
        runSpacing: 8,
        alignment: WrapAlignment.center,
        children: List.generate(15, (index) {
          int qNum = index + 1;
          
          return Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.black),
              color: const Color(0xFF2ECC71), // All green as per review design image
            ),
            child: Center(
              child: Text(
                '$qNum',
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildQuestionContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Soal Nomor $questionNumber / 15',
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 48),
        Text(
          questionText,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black,
            height: 1.5,
          ),
        ),
        const SizedBox(height: 32),
        ...options.map((opt) => _buildOption(opt['label']!, opt['text']!)),
      ],
    );
  }

  Widget _buildOption(String label, String text) {
    // In Review Detail, we highlight the selected answer in Red
    bool isSelected = label == selectedAnswerLabel;
    
    // As per image: Selected is Red (0xFFEB5757), others Gray (0xFFF5F5F5)
    Color bgColor = isSelected ? const Color(0xFFEB5757) : const Color(0xFFF5F5F5);
    List<BoxShadow> shadows = isSelected
        ? [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 4,
              offset: const Offset(0, 2),
            )
          ]
        : [];

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: shadows,
      ),
      child: Row(
        children: [
          Text(
            '$label.',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
