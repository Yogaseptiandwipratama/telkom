import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // 0: About Me, 1: Kelas, 2: Edit Profile
  int _currentTab = 2; // Defaulting to 2 to show the 'Edit Profile' tab as requested.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Red Header Background
          Container(
            height: 350,
            decoration: const BoxDecoration(
              color: Color(0xFFB44F4F),
            ),
          ),
          
          Column(
            children: [
              const SizedBox(height: 50),
              // AppBar-like Row
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.white, size: 28),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 10),
              
              // Profile Image
              Container(
                width: 100,
                height: 100,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey,
                  image: DecorationImage(
                      image: AssetImage('assets/images/foto.png'),
                      fit: BoxFit.cover
                  ),
                ),
              ),
              
              const SizedBox(height: 16),
              
              // Name
              const Text(
                'YOGA SEPTIAN DWI PRATAMA',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              
              const SizedBox(height: 30),
              
              // Floating Content Card
              Expanded(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 24),
                  padding: const EdgeInsets.only(top: 20, left: 24, right: 24),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                        offset: const Offset(0, -5),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      // Tabs
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildTabItem('About Me', 0),
                          _buildTabItem('Kelas', 1),
                          _buildTabItem('Edit Profile', 2),
                        ],
                      ),
                      const SizedBox(height: 30),
                      
                      // Content Area
                      Expanded(
                        child: SingleChildScrollView(
                          child: _buildContent(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
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

  Widget _buildTabItem(String title, int index) {
    bool isActive = _currentTab == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _currentTab = index;
        });
      },
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          const SizedBox(height: 4),
          if (isActive)
            Container(
              height: 3,
              width: 40,
              color: Colors.grey, // Design shows grey underline
            )
          else
            const SizedBox(height: 3),
        ],
      ),
    );
  }

  Widget _buildContent() {
    switch (_currentTab) {
      case 0:
        return _buildAboutMeContent();
      case 1:
        return _buildKelasContent();
      case 2:
        return _buildEditProfileContent();
      default:
        return Container();
    }
  }

  Widget _buildEditProfileContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTextFieldWithLabel('Nama Pertama'),
        const SizedBox(height: 16),
        _buildTextFieldWithLabel('Nama Terakhir'),
        const SizedBox(height: 16),
        _buildTextFieldWithLabel('E-mail Address'),
        const SizedBox(height: 16),
        _buildTextFieldWithLabel('Negara'),
        const SizedBox(height: 16),
        _buildTextFieldWithLabel('Deskripsi', maxLines: 5),
        const SizedBox(height: 24),
        
        // Simpan Button
        Align(
          alignment: Alignment.bottomRight,
          child: SizedBox(
            width: 120, // Approximate width
            child: ElevatedButton(
              onPressed: () {
                // Save logic
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFF5F5F5), // Light grey background
                foregroundColor: Colors.black, // Black text
                elevation: 0,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'Simpan',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 80), // Bottom padding
      ],
    );
  }

  Widget _buildTextFieldWithLabel(String label, {int maxLines = 1}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          maxLines: maxLines,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.grey),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey.shade400),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.black54),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAboutMeContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle('Informasi User'),
        const SizedBox(height: 16),
        _buildInfoItem('Email address', 'dandycandra@student.telkomuniversity.ac.id'),
        const SizedBox(height: 16),
        _buildInfoItem('Program Studi', 'D4 Teknologi Rekayasa Multimedia'),
        const SizedBox(height: 16),
        _buildInfoItem('Fakultas', 'FIT'),
        
        const SizedBox(height: 30),
        
        _buildSectionTitle('Aktivitas Login'),
        const SizedBox(height: 16),
        _buildInfoItem('First access to site', 'Monday, 7 September 2020, 9:27 AM  (288 days 12 hours)'),
        const SizedBox(height: 16),
        _buildInfoItem('Last access to site', 'Tuesday, 22 June 2021, 9:44 PM  (now)'),
        
        const SizedBox(height: 40),
        
        // Logout Button
        Align(
          alignment: Alignment.bottomRight,
          child: ElevatedButton.icon(
            onPressed: () {
              Navigator.of(context).popUntil((route) => route.isFirst);
            },
            icon: const Icon(Icons.exit_to_app, color: Colors.white),
            label: const Text('Log Out', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFB91C1C), // Dark red
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
        const SizedBox(height: 80),
      ],
    );
  }

  Widget _buildKelasContent() {
    final classes = [
      {
        'title': 'BAHASA INGGRIS: BUSINESS AND SCIENTIFIC\nD4SM-41-GAB1 [ARS]',
        'date': 'Tanggal Mulai Monday, 8 February 2021'
      },
      {
        'title': 'DESAIN ANTARMUKA & PENGALAMAN PENGGUNA\nD4SM-42-03 [ADY]',
        'date': 'Tanggal Mulai Monday, 8 February 2021'
      },
      {
        'title': 'KEWARGANEGARAAN\nD4SM-41-GAB1 [BBO]. JUMAT 2',
        'date': 'Tanggal Mulai Monday, 8 February 2021'
      },
      {
        'title': 'OLAH RAGA D3TT-44-02 [EYR]',
        'date': 'Tanggal Mulai Monday, 8 February 2021'
      },
      {
        'title': 'PEMROGRAMAN MULTIMEDIA INTERAKTIF\nD4SM-43-04 [TPR]',
        'date': 'Tanggal Mulai Monday, 8 February 2021'
      },
      {
        'title': 'PEMROGRAMAN PERANGKAT BERGERAK MULTIMEDIA\nD4SM-41-GAB1 [APJ]',
        'date': 'Tanggal Mulai Monday, 8 February 2021'
      },
      {
        'title': 'SISTEM OPERASI D4SM-44-02 [DDS]',
        'date': 'Tanggal Mulai Monday, 8 February 2021'
      },
    ];

    return Column(
      children: [
        ...classes.map((c) => Padding(
          padding: const EdgeInsets.only(bottom: 20.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Blue Icon Placeholder
              Container(
                width: 60,
                height: 40,
                decoration: BoxDecoration(
                  color: const Color(0xFF82B1D6), 
                  borderRadius: BorderRadius.circular(15), 
                ),
              ),
              const SizedBox(width: 16),
              // Text Content
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      c['title']!,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      c['date']!,
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )).toList(),
        const SizedBox(height: 80), 
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    );
  }

  Widget _buildInfoItem(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
        ),
      ],
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
    return GestureDetector(
      onTap: () {
         if (index == 0) {
             Navigator.pop(context);
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
        ],
      ),
    );
  }
}
