import 'package:flutter/material.dart';

class MaterialDetailPage extends StatelessWidget {
  const MaterialDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFB44F4F),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Pengantar User Interface Design',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 16, top: 10, bottom: 10),
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.grey[400],
              borderRadius: BorderRadius.circular(4),
              border: Border.all(color: Colors.black54),
            ),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Halaman',
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.black,
                    height: 1,
                  ),
                ),
                Text(
                  '1/26',
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.black,
                    height: 1,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: [
          Image.asset(
            'assets/images/ppt1.png',
            width: double.infinity,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 20),
          Image.asset(
            'assets/images/ppt2.png',
            width: double.infinity,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 20),
          Image.asset(
            'assets/images/ppt3.png',
            width: double.infinity,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 20),
          Image.asset(
            'assets/images/ppt4.png',
            width: double.infinity,
            fit: BoxFit.contain,
          ),
        ],
      ),
    );
  }
}
