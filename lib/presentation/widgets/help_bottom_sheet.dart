import 'package:flutter/material.dart';

class HelpBottomSheet extends StatefulWidget {
  const HelpBottomSheet({super.key});

  @override
  State<HelpBottomSheet> createState() => _HelpBottomSheetState();
}

class _HelpBottomSheetState extends State<HelpBottomSheet> {
  bool isIndonesian = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Drag Handle
          Center(
            child: Container(
              margin: const EdgeInsets.only(bottom: 24),
              width: 60,
              height: 6,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(3),
              ),
            ),
          ),
          // Language Toggle
          Center(
            child: Container(
              margin: const EdgeInsets.only(bottom: 24),
              child: Row(
                mainAxisSize: MainAxisSize.min, // Center the row
                children: [
                  _buildLanguageButton('ID', true),
                  const SizedBox(width: 40),
                  _buildLanguageButton('EN', false),
                ],
              ),
            ),
          ),
          
          Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                   Text(
                    isIndonesian
                        ? 'Akses hanya untuk Dosen dan Mahasiswa Telkom University.'
                        : 'Access restricted only for Lecturer and Student of Telkom University',
                    style: const TextStyle(fontSize: 14, color: Colors.black87),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    isIndonesian
                        ? 'Login menggunakan Akun Microsoft Office 365\ndengan mengikuti petunjuk berikut :'
                        : 'Login only using your Microsoft Office 365 Account\nby following these format :',
                    style: const TextStyle(fontSize: 14, color: Colors.black87),
                  ),
                  const SizedBox(height: 16),
                  _buildBulletPoint(
                    isIndonesian
                        ? 'Username (Akun iGracias) ditambahkan "@365.telkomuniversity.ac.id"'
                        : 'Username (iGracias Account) followed with "@365.telkomuniversity.ac.id"',
                  ),
                  _buildBulletPoint(
                    isIndonesian
                        ? 'Password (Akun iGracias) pada kolom Password.'
                        : 'Password (SSO / iGracias Account) on Password Field.',
                  ),
                  const SizedBox(height: 16),
                  Text(
                    isIndonesian
                        ? 'Kegagalan yang terjadi pada Autentikasi disebabkan oleh\nAnda belum mengubah Password Anda menjadi "Strong Password".\nPastikan Anda telah melakukan perubahan Password di iGracias.'
                        : 'Failure upon Authentication could be possibly you\nhave not yet change your password into "Strong Password".\nMake sure to change your Password only in iGracias.',
                    style: const TextStyle(fontSize: 14, color: Colors.black87),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    isIndonesian
                        ? 'Informasi lebih lanjut dapat menghubungi Layanan CeLOE Helpdesk di :'
                        : 'For further Information, please contact CeLOE Service Helpdesk :',
                    style: const TextStyle(fontSize: 14, color: Colors.black87),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Mail : infoceloe@telkomuniversity.ac.id',
                    style: TextStyle(fontSize: 14, color: Colors.black87, fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    'whatsapp : +62 821-1666-3563',
                    style: TextStyle(fontSize: 14, color: Colors.black87, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 24),
                  ],
                ),
              ),
          ),
        ],
      ),
    );
  }

  Widget _buildLanguageButton(String code, bool isForIndonesian) {
    bool isSelected = isIndonesian == isForIndonesian;
    return GestureDetector(
      onTap: () {
        setState(() {
          isIndonesian = isForIndonesian;
        });
      },
      child: Column(
        children: [
            // Flag placeholder (using color since no assets)
            Container(
                width: 40,
                height: 25,
                decoration: BoxDecoration(
                    color: isForIndonesian ? Colors.red : Colors.blue[900], // Simple flag representation
                    border: Border.all(color: Colors.grey[300]!),
                ),
                child: isForIndonesian ? 
                 // Simple ID flag (Red/White) already roughly red
                 Column(
                     children:[
                         Container(height: 12.5, color: Colors.red),
                         Container(height: 12.5, color: Colors.white),
                     ]
                 ) :
                 // Simple UK flag representation (Just Blue/Red/White mix or just use symbol)
                 Stack(
                     children: [
                        Container(color: Colors.blue[900]),
                        Center(child: Icon(Icons.add, color: Colors.red, size: 20)),
                        // This is very rough, maybe just use text if users hate it.
                     ],
                 )
            ),
            const SizedBox(height: 4),
          Text(
            code,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: isSelected ? Colors.black : Colors.grey,
            ),
          ),
          if (isSelected)
            Container(
              margin: const EdgeInsets.only(top: 4),
              height: 2,
              width: 20,
              color: Colors.grey,
            ),
        ],
      ),
    );
  }

  Widget _buildBulletPoint(String text) {
      return Padding(
          padding: const EdgeInsets.only(bottom: 4.0),
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                  const Text("• ", style: TextStyle(fontSize: 14, color: Colors.black87)),
                  Expanded(child: Text(text, style: const TextStyle(fontSize: 14, color: Colors.black87))),
              ],
          ),
      );
  }
}
