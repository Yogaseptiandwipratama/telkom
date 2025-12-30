import 'package:flutter/material.dart';
import '../widgets/meeting_detail_sheet.dart'; 
import 'quiz_review_page.dart'; 

class CourseDetailPage extends StatefulWidget {
  final String title;

  const CourseDetailPage({super.key, required this.title});

  @override
  State<CourseDetailPage> createState() => _CourseDetailPageState();
}

class _CourseDetailPageState extends State<CourseDetailPage> {
  int _currentTab = 0; // 0: Materi, 1: Tugas Dan Kuis

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5), // Light grey background like Figma
      body: Stack(
        children: [
          // Header Background (Red)
          Container(
            height: 180,
            padding: const EdgeInsets.only(top: 50, left: 24, right: 24),
            decoration: const BoxDecoration(
              color: Color(0xFFB44F4F),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 IconButton(
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  icon: const Icon(Icons.arrow_back, color: Colors.white, size: 28),
                  onPressed: () => Navigator.pop(context),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    widget.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      height: 1.3,
                    ),
                  ),
                ),
              ],
            ),
          ),
          
          // Content with Tab overlay
          Column(
            children: [
              const SizedBox(height: 120), // Offset for header overlap
              // Tab Bar Container
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 24),
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () => setState(() => _currentTab = 0),
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.transparent, // Hit test for full area
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Materi',
                                style: TextStyle(
                                  fontWeight: _currentTab == 0 ? FontWeight.bold : FontWeight.normal,
                                  color: _currentTab == 0 ? Colors.black : Colors.grey,
                                ),
                              ),
                              if (_currentTab == 0)
                                Container(
                                  margin: const EdgeInsets.only(top: 4),
                                  height: 3,
                                  width: 40,
                                  color: Colors.black,
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () => setState(() => _currentTab = 1),
                        child: Container(
                          color: Colors.transparent,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Tugas Dan Kuis',
                                style: TextStyle(
                                  fontWeight: _currentTab == 1 ? FontWeight.bold : FontWeight.normal,
                                  color: _currentTab == 1 ? Colors.black : Colors.grey,
                                ),
                              ),
                              if (_currentTab == 1)
                                Container(
                                  margin: const EdgeInsets.only(top: 4),
                                  height: 3,
                                  width: 40,
                                  color: Colors.black,
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 20),
              
              // List Content
              Expanded(
                child: _currentTab == 0 ? _buildMateriList() : _buildTugasList(),
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

  Widget _buildMateriList() {
    return ListView(
      padding: const EdgeInsets.fromLTRB(24, 0, 24, 100),
      children: [
        _buildMeetingCard(
          meeting: 'Pertemuan 1',
          title: '01 - Pengantar User Interface Design',
          desc: '3 URLs, 2 Files, 3 Interactive Content',
          isCompleted: false, // Grey check
        ),
        _buildMeetingCard(
          meeting: 'Pertemuan 2',
          title: '02 - Konsep User Interface Design',
          desc: '2 URLs, 1 Kuis, 3 Files, 1 Tugas',
          isCompleted: true,
        ),
        _buildMeetingCard(
          meeting: 'Pertemuan 3',
          title: '03 - Interaksi pada User Interface Design',
          desc: '3 URLs, 2 Files, 3 Interactive Content',
          isCompleted: true,
        ),
        _buildMeetingCard(
          meeting: 'Pertemuan 4',
          title: '04 - Ethnographic Observation',
          desc: '3 URLs, 2 Files, 3 Interactive Content',
          isCompleted: true,
        ),
        _buildMeetingCard(
          meeting: 'Pertemuan 5',
          title: '05 - UID Testing',
          desc: '3 URLs, 2 Files, 3 Interactive Content',
          isCompleted: true,
        ),
         _buildMeetingCard(
          meeting: 'Pertemuan 6',
          title: '06 - Assessment 1',
          desc: '3 URLs, 2 Files, 3 Interactive Content',
          isCompleted: true,
        ),
      ],
    );
  }

  Widget _buildTugasList() {
    return ListView(
      padding: const EdgeInsets.fromLTRB(24, 0, 24, 100),
      children: [
        _buildTaskItem(
          type: 'QUIZ',
          title: 'Quiz Review 01',
          deadline: '26 Februari 2021 23:59 WIB',
          isCompleted: true,
          icon: Icons.quiz_outlined,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const QuizReviewPage()),
            );
          },
        ),
        _buildTaskItem(
          type: 'Tugas',
          title: 'Tugas 01 - UID Android Mobile Game',
          deadline: '26 Februari 2021 23:59 WIB',
          isCompleted: false, // Grey check as per design
          icon: Icons.assignment_outlined,
        ),
        _buildTaskItem(
          type: 'Pertemuan 3',
          title: 'Kuis - Assessment 2',
          deadline: '26 Februari 2021 23:59 WIB',
          isCompleted: true,
          icon: Icons.quiz_outlined,
        ),
      ],
    );
  }

  Widget _buildTaskItem({
    required String type,
    required String title,
    required String deadline,
    required bool isCompleted,
    required IconData icon,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: const Color(0xFF5D9CEC), // Light Blue
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    type,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ),
                Icon(
                  Icons.check_circle,
                  color: isCompleted ? const Color(0xFF2ECC71) : Colors.grey[300],
                  size: 24,
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(icon, size: 40, color: Colors.black),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Tenggat Waktu : $deadline',
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.grey[400],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMeetingCard({
    required String meeting,
    required String title,
    required String desc,
    required bool isCompleted,
  }) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true, // Allow full height control
          backgroundColor: Colors.transparent, // Sheet handles its own styling
          builder: (context) => MeetingDetailSheet(title: title),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: const Color(0xFF5D9CEC), // Light Blue
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    meeting,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ),
                Icon(
                  Icons.check_circle,
                  color: isCompleted ? const Color(0xFF2ECC71) : Colors.grey[300], // Green or Grey
                  size: 24,
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              desc,
              style: TextStyle(
                fontSize: 10,
                color: Colors.grey[400],
              ),
            ),
          ],
        ),
      ),
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
          _buildNavItem(Icons.home, 'Home', 0), // Not actually tracking index here for visual only?
          // To be consistent with other pages, maybe highlight 'Kelas Saya'
          // Since we navigated from My Classes -> Course Detail.
          _buildNavItem(Icons.school, 'Kelas Saya', 1),
          _buildNavItem(Icons.notifications, 'Notifikasi', 2),
        ],
      ),
    );
  }

   Widget _buildNavItem(IconData icon, String label, int index) {
     // Highlighting index 1 as we are deeper in 'Kelas Saya' context
    bool isSelected = index == 1; 
    return GestureDetector(
      onTap: () {
        if (index == 0) {
            Navigator.of(context).popUntil((route) => route.isFirst);
        }
        // Other taps ignored or could pop back to lists.
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
          if (isSelected)
            Container(
              margin: const EdgeInsets.only(top: 4),
              width: 4,
              height: 4,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
            ),
        ],
      ),
    );
  }
}
