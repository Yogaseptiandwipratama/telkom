import 'package:flutter/material.dart';

class TakeQuizPage extends StatefulWidget {
  const TakeQuizPage({super.key});

  @override
  State<TakeQuizPage> createState() => _TakeQuizPageState();
}

class _TakeQuizPageState extends State<TakeQuizPage> {
  int _currentQuestionIndex = 0;
  final int _totalQuestions = 15;
  
  // Track selected answers: index -> option label (e.g., 'A')
  final Map<int, String> _answers = {};

  final List<Map<String, dynamic>> _questions = [
    {
      'question': 'Radio button dapat digunakan untuk menentukan ?',
      'options': [
        {'label': 'A', 'text': 'Jenis Kelamin'},
        {'label': 'B', 'text': 'Alamat'},
        {'label': 'C', 'text': 'Hobby'},
        {'label': 'D', 'text': 'Riwayat Pendidikan'},
        {'label': 'E', 'text': 'Umur'},
      ],
    },
    {
      'question':
          'Dalam perancangan web yang baik, untuk teks yang menyampaikan isi konten digunakan font yang sama di setiap halaman, ini merupakan salah satu tujuan yaitu ?',
      'options': [
        {'label': 'A', 'text': 'Intergrasi'},
        {'label': 'B', 'text': 'Standarisasi'},
        {'label': 'C', 'text': 'Konsistensi'},
        {'label': 'D', 'text': 'Koefensi'},
        {'label': 'E', 'text': 'Koreksi'},
      ],
    },
    // Add placeholders for other questions if needed or just handle index check
  ];

  @override
  void initState() {
    super.initState();
  }

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
    return Center(
      child: Wrap(
        spacing: 8,
        runSpacing: 8,
        alignment: WrapAlignment.center,
        children: List.generate(_totalQuestions, (index) {
          int questionNumber = index + 1;
          bool isAnswered = _answers.containsKey(index);
          
          Color circleColor;
           if (index == _currentQuestionIndex) {
             circleColor = const Color(0xFF2ECC71); // Current question is green
           } else if (isAnswered) {
             circleColor = const Color(0xFF2ECC71); // Answered & not current
           } else {
             circleColor = Colors.white; // Default
           }

          return Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.black),
              color: circleColor,
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
    // If index out of bounds of our dummy data, show generic placeholder or repeat last
    final questionData = _currentQuestionIndex < _questions.length
        ? _questions[_currentQuestionIndex]
        : {
            'question': 'Contoh soal nomor ${_currentQuestionIndex + 1} ...',
            'options': [
               {'label': 'A', 'text': 'Pilihan A'},
               {'label': 'B', 'text': 'Pilihan B'},
            ]
          };

    final questionText = questionData['question'] as String;
    final options = questionData['options'] as List<Map<String, String>>;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Soal Nomor ${_currentQuestionIndex + 1} / 15',
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
        
        // Options
        ...options.map((opt) => _buildOption(opt['label']!, opt['text']!)).toList(),

        const SizedBox(height: 48),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Previous Button
            if (_currentQuestionIndex > 0)
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _currentQuestionIndex--;
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFF5F5F5),
                  foregroundColor: Colors.black,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
                child: const Text('Soal Sebelumnya'),
              )
            else
              const Spacer(), // Placeholder to keep Next button pushed to right if Prev is hidden

             // Next Button
             ElevatedButton(
              onPressed: () {
                setState(() {
                  if (_currentQuestionIndex < _totalQuestions - 1) {
                    _currentQuestionIndex++;
                    // For demo purposes, auto-select an answer if continuing to new dummy Q?
                    // Nah, let user select.
                  }
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFF5F5F5),
                foregroundColor: Colors.black,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
              child: const Text('Soal Selanjutnya'),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildOption(String label, String text) {
    bool isSelected = _answers[_currentQuestionIndex] == label;

    return GestureDetector(
      onTap: () {
        setState(() {
          _answers[_currentQuestionIndex] = label;
        });
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFEB5757) : const Color(0xFFF5F5F5),
          borderRadius: BorderRadius.circular(12),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  )
                ]
              : [],
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
      ),
    );
  }
}
