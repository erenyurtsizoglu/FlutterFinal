import 'package:flutter/material.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
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
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: size.height * 0.15),
              Image.asset(
                'assets/images/headphones1.png',
                fit: BoxFit.fill,
                height: size.height * 0.4,
                width: size.width * 0.7,
              ),
              SizedBox(height: size.height * 0.05),
              SizedBox(
                width: size.width,
                height: size.height * 0.08,
                child: const Text(
                  'Getting started',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(
                width: size.width,
                height: size.height * 0.2,
                child: Text(
                  'From the latest to the greatest hits, play your favorite tracks onmusium now!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.800000011920929),
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
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
                      Navigator.pushNamedAndRemoveUntil(context, '/onboarding2', (route) => false);
                    },
                    child: const Text(
                      'Get Started',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
