import 'package:flutter/material.dart';

class TakeQuizPage extends StatefulWidget {
  const TakeQuizPage({super.key});

  @override
  State<TakeQuizPage> createState() => _TakeQuizPageState();
}

class _TakeQuizPageState extends State<TakeQuizPage> {
  int _currentQuestionIndex = 0;
  final int _totalQuestions = 15;
  String _selectedOption = 'A'; // Default selected for demo

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
                   _buildQuestionContent(),
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
    return Center( // Center the numbers slightly? Figma looks kinda centered or full width?
      // Figma shows them in two rows maybe? 1-10 then 11-15.
      child: Wrap(
        spacing: 8,
        runSpacing: 8,
        alignment: WrapAlignment.center,
        children: List.generate(_totalQuestions, (index) {
          int questionNumber = index + 1;
          bool isCurrent = index == 0; // Highlight first one for demo
           return Container(
            width: 32,
            height: 32, // Check circle size
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.black),
              color: isCurrent ? Colors.white : Colors.white, // In Figma all seem white with black border, active one maybe same? 
              // Wait, image shows all regular. Maybe none selected visually active in the navigator, 
              // or just regular list.
              // Let's stick to simple black border.
            ),
            child: Center(
              child: Text(
                '$questionNumber',
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

  Widget _buildQuestionContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Soal Nomor 1 / 15',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 48),
        const Text(
          'Radio button dapat digunakan untuk menentukan ?',
          style: TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 32),
        
        // Options
        _buildOption('A.', 'Jenis Kelamin', true),
        _buildOption('B.', 'Alamat', false),
        _buildOption('C.', 'Hobby', false),
        _buildOption('D.', 'Riwayat Pendidikan', false),
        _buildOption('E.', 'Umur', false),

        const SizedBox(height: 48),

        Align(
          alignment: Alignment.centerRight,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFF5F5F5), // Light grey
              foregroundColor: Colors.black,
              elevation: 0,
               shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            ),
            child: const Text('Soal Selanjut nya.'),
          ),
        ),
      ],
    );
  }

  Widget _buildOption(String label, String text, bool isSelected) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedOption = label.replaceAll('.', '');
        });
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFEB5757) : const Color(0xFFF5F5F5), // Red option if selected, Grey if not
          borderRadius: BorderRadius.circular(12),
          boxShadow: isSelected ? [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 4,
              offset: const Offset(0, 2),
            )
          ] : [],
        ),
        child: Row(
          children: [
            Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: isSelected ? Colors.black : Colors.black, // Figma shows black text on red?
                // Looking at image: "A. Jenis Kelamin" is on Red background. Text color seems black.
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                text,
                style: TextStyle(
                  color: isSelected ? Colors.black : Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
