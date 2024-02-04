import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
          //sayfayı mordan açık mora yapan kod kısmı
          gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [
        Colors.deepPurple.shade800.withOpacity(0.8),
        const Color.fromARGB(255, 174, 0, 255).withOpacity(0.8),
        const Color(0xff886AE2).withOpacity(0.8),
      ])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            SizedBox(height: size.height * 0.22),
            Image.asset(
              'assets/images/wel.png',
              fit: BoxFit.fill,
              height: size.height * 0.3,
              width: size.width * 0.6,
            ),
            SizedBox(height: size.height * 0.2),
            SizedBox(
              height: size.height * 0.07,
              width: size.width * 0.8,
              child: Material(
                elevation: 10,
                borderRadius: BorderRadius.circular(20),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurpleAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
                  },
                  child: const Text(
                    'Login',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            SizedBox(height: size.height * 0.025),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: size.height * 0.002,
                  width: size.width * 0.35,
                  color: Colors.white,
                ),
                const Text('Or', style: TextStyle(color: Colors.white)),
                Container(
                  height: size.height * 0.002,
                  width: size.width * 0.35,
                  color: Colors.white,
                ),
              ],
            ),
            SizedBox(height: size.height * 0.025),
            SizedBox(
              height: size.height * 0.07,
              width: size.width * 0.8,
              child: Material(
                elevation: 10,
                borderRadius: BorderRadius.circular(20),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurpleAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(context, '/register', (route) => false);
                  },
                  child: const Text(
                    'Register',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
