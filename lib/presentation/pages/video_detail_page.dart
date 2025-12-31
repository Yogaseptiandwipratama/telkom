import 'package:flutter/material.dart';

class VideoDetailPage extends StatelessWidget {
  const VideoDetailPage({super.key});

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
          'Video - User Interface Design For Beginner',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Main Video Player Area
             Container(
              width: double.infinity,
              color: Colors.black,
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: Image.asset(
                  'assets/images/uidesign.png',
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: Colors.grey[300],
                      alignment: Alignment.center,
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.broken_image, color: Colors.grey, size: 50),
                          SizedBox(height: 8),
                          Text('Image not found', style: TextStyle(color: Colors.grey)),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
            
            const SizedBox(height: 24),
            
            // "Video Lain Nya" Section Title
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                'Video Lain Nya',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),
            
            const SizedBox(height: 16),
            
            // List of other videos
            _buildVideoItem(
              imagePath: 'assets/images/vid1.png',
              title: 'Interaction Design',
            ),
            _buildVideoItem(
              imagePath: 'assets/images/vid2.png',
              title: 'Pengantar Desain Antarmuka Pengguna',
            ),
            _buildVideoItem(
              imagePath: 'assets/images/vid3.png',
              title: '4 Teori Dasar Desain Antarmuka Pengguna',
            ),
            _buildVideoItem(
              imagePath: 'assets/images/vid4.png',
              title: 'Tutorial Dasar Figma - UI/UX Design Software',
            ),
            
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildVideoItem({
    required String imagePath,
    required String title,
  }) {
    return Container(
      color: const Color(0xFFF5F5F5), // Light grey background for each item row
      margin: const EdgeInsets.only(bottom: 2), // Tiny gap between items if needed, or just flat
      // Looking at the design, it looks like alternating or solid blocks. 
      // The design has a solid light grey block for each item content area? 
      // Actually, looking at the image provided by user, the items have a grey background.
      // Let's use a Container with color for the whole row.
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      width: double.infinity,
      child: Row(
        children: [
          // Thumbnail
          SizedBox(
            width: 120,
            height: 68, // Approx aspect ratio
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(color: Colors.grey[300], child: const Icon(Icons.broken_image, size: 20)),
            ),
          ),
          const SizedBox(width: 24),
          // Title
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500, // Semi-bold/Medium
                color: Colors.black87,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
