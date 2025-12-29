import 'package:flutter/material.dart';
import '../widgets/help_bottom_sheet.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Bottom Curve
          Align(
            alignment: Alignment.bottomCenter,
            child: ClipPath(
              clipper: BottomWaveClipper(),
              child: Container(
                height: 200,
                color: const Color(0xFFB44F4F),
              ),
            ),
          ),
          
          Column(
            children: [
              // Top Header with Image and Logo
              Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: [
                  // Building Image with Curve
                  ClipPath(
                    clipper: TopHeaderClipper(),
                    child: Container(
                      height: 300,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Colors.grey, // Fallback color
                      ),
                      child: Image.asset(
                        'assets/images/telkom.png',
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                           return Container(color: Colors.grey[300]);
                        },
                      ),
                    ),
                  ),

                  // Logo (University Logo)
                  Positioned(
                    bottom: -40, // Half of height to overlap
                    child: Container(
                      width: 80,
                      height: 80,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFFB44F4F), // Background for logo
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 10,
                            offset: Offset(0, 5),
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.all(16),
                      child: Image.asset(
                        'assets/images/logo.png',
                         color: Colors.white, // Assuming a white logo or transparent
                         errorBuilder: (context, error, stackTrace) {
                           return const Icon(Icons.school, color: Colors.white, size: 40);
                         },
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 60), // Spacing for logo overlap

              // Title
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 30),

              // Form
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  children: [
                    // Email Field
                    TextField(
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        labelStyle: TextStyle(color: Colors.grey),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFB44F4F)),
                        ),
                      ),
                    ),
                    
                    const SizedBox(height: 20),

                    // Password Field
                    TextField(
                      obscureText: _isObscure,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: const TextStyle(color: Colors.grey),
                         enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFB44F4F), width: 2), // Red bottom border as per design
                        ),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFB44F4F), width: 2),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                             _isObscure ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                             color: Colors.black,
                          ),
                          onPressed: () {
                            setState(() {
                              _isObscure = !_isObscure;
                            });
                          },
                        ),
                      ),
                    ),

                    const SizedBox(height: 40),

                    // Login Button
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => const HomePage()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFB44F4F), // Red button
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          elevation: 5,
                        ),
                        child: const Text(
                          'Log In',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Help Text
                    GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent, 
                          builder: (context) => const HelpBottomSheet(),
                        );
                      },
                      child: const Text(
                        'Bantuan ?',
                        style: TextStyle(
                          color: Color(0xFFB44F4F),
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Custom Clippers

class TopHeaderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 50); // Start at bottom left, slightly up
    path.lineTo(size.width, size.height - 100); // Go to bottom right, higher up (slanted)
    path.lineTo(size.width, 0); // Top right
    path.lineTo(0, 0); // Top left
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class BottomWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(0, size.height); 
    path.lineTo(0, 40); // Start at left, somewhat down

    var firstControlPoint = Offset(size.width / 4, -20);
    var firstEndPoint = Offset(size.width / 2.2, 50);

    var secondControlPoint = Offset(size.width - (size.width / 4), 120);
    var secondEndPoint = Offset(size.width, 80);

    path.quadraticBezierTo(
        firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    path.quadraticBezierTo(
        secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);
    
    path.lineTo(size.width, size.height);
    path.close();
    return path;
    
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
