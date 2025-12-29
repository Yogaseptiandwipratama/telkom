import 'package:flutter/material.dart';
import 'home_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int _selectedIndex = 2; // Notifikasi is index 2 in Home, but maybe Profile doesn't need nav bar highlighting? 
  // Wait, the design shows the same bottom nav. I'll just assume it's just visual for now or I should replicate it.
  // Actually, usually Profile is a separate page, but sometimes it replaces the body. 
  // Given the design has a back button, it seems to be pushed on top.
  // But it ALSO has a bottom nav. This is tricky. 
  // If it has a back button, it's likely a pushed route.
  // I will implement it as a Scaffold with the BottomNavBar for visual consistency, but the Back button goes back to Home.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Main background
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
                  color: Colors.grey, // Placeholder color
                  image: DecorationImage(
                      image: AssetImage('assets/images/foto.png'), // Fallback to logo or maybe I should try to find a face asset?
                      // I'll leave it as logo for now or just a color if it fails.
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
                          _buildTabItem('About Me', true),
                          _buildTabItem('Kelas', false),
                          _buildTabItem('Edit Profile', false),
                        ],
                      ),
                      const SizedBox(height: 30),
                      
                      // Content List
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildSectionTitle('Informasi User'),
                              const SizedBox(height: 16),
                              _buildInfoItem('Email address', 'yogaseptian@365.telkomuniversity.ac.id'),
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
                                    // Navigate back to Login or generic logout
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
                              const SizedBox(height: 30),
                            ],
                          ),
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

  Widget _buildTabItem(String title, bool isActive) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(
            color: isActive ? Colors.black : Colors.black54,
            fontSize: 14,
            fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        if (isActive)
          Container(
            margin: const EdgeInsets.only(top: 8),
            height: 3,
            width: 40,
            color: Colors.grey,
          ),
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
            fontWeight: FontWeight.w400, // Regular/light as per design
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
        color: Color(0xFFB44F4F), // Red
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
      // Just visual for now, doesn't actually navigate inside Profile page context
    return GestureDetector(
      onTap: () {
         if (index == 0) {
             Navigator.pop(context); // Go back to home
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
