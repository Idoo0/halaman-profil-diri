import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

TextStyle titleTextStyle = GoogleFonts.montserrat();

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Ido's Flutter",
          style: TextStyle(fontSize: 25, fontFamily: 'Times New Roman'),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: Stack(
        children: [
          Positioned.fill(child: _BackgroundPainter()),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.4),
                        blurRadius: 10,
                        offset: Offset(0, 5),
                      ),
                    ],
                    image: DecorationImage(
                      image: AssetImage('images/foto.jpeg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Ridho Aditya Putra',
                  style: titleTextStyle.copyWith(
                    letterSpacing: 2,
                    color: Colors.deepPurple,
                    fontSize: 25,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  'all-rounded',
                  style: titleTextStyle.copyWith(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Mahasiswa IT di salah satu Universitas di manado.\nGak suka coding sukanya uang.\nCPP, Python, C#, Java, JS itu bahasa pemrograman\nbukan bahasa yang saya bisa :)',
                  textAlign: TextAlign.center,
                  style: titleTextStyle.copyWith(
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: const Icon(FontAwesomeIcons.facebook, size: 30.0),
                      onPressed: () {
                        _launchURL('https://www.facebook.com/ridho.aditya.33/');
                      },
                    ),
                    IconButton(
                      icon: const Icon(FontAwesomeIcons.instagram, size: 30.0),
                      onPressed: () {
                        _launchURL('https://www.instagram.com/ido.adtya/');
                      },
                    ),
                    IconButton(
                      icon: const Icon(FontAwesomeIcons.linkedin, size: 30.0),
                      onPressed: () {
                        _launchURL('https://www.linkedin.com/in/ridho-aditya-991a1b262/');
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 200,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withOpacity(0.7),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _BackgroundPainter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _BackgroundPainterPainter(),
      child: Container(),
    );
  }
}

class _BackgroundPainterPainter extends CustomPainter {
  final random = Random();
  final List<Color> colors = [
    Color.fromARGB(255, 35, 86, 128),
    Color.fromARGB(255, 29, 78, 117),
    Color.fromARGB(255, 23, 92, 148),
    Color.fromARGB(255, 12, 86, 146),
    Color.fromARGB(255, 32, 96, 148),
  ];

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.fill
      ..strokeWidth = 1.0;

    final darkBlueColor = Color.fromARGB(255, 21, 21, 52); // Ubah warna ini sesuai dengan warna biru gelap yang diinginkan

    canvas.drawColor(darkBlueColor, BlendMode.srcOver); // Mengganti warna latar belakang canvas

    for (int i = 0; i < 200; i++) {
      final radius = random.nextInt(5).toDouble();
      final xPos = random.nextDouble() * size.width;
      final yPos = random.nextDouble() * size.height;
      final color = colors[random.nextInt(colors.length)];

      paint.color = color.withOpacity(random.nextDouble() * 0.5 + 0.1);
      canvas.drawCircle(Offset(xPos, yPos), radius, paint);
    }
  }

  @override
  bool shouldRepaint(_BackgroundPainterPainter oldDelegate) => false;
}
