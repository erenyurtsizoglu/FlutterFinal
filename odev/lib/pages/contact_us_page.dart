import 'package:flutter/material.dart';
import 'package:odev/widgets/custom_launcher_button.dart';
import 'package:url_launcher/url_launcher.dart' as launcher;

class ContactUsPage extends StatefulWidget {
  const ContactUsPage({super.key});

  @override
  State<ContactUsPage> createState() => _ContactUsPageState();
}

class _ContactUsPageState extends State<ContactUsPage> {
  @override
  Widget build(BuildContext context) {
    //ekran boyutunu size a ata
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
          body: Center(
            child: SizedBox(
              width: size.width * 0.75,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/contactus.png',
                    height: size.height * 0.2,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: size.height * 0.05),
                  SizedBox(
                    width: size.width * 0.9,
                    child: const Text(
                        textAlign: TextAlign.center,
                        'Share your suggestions and criticisms with us.',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: Colors.white)),
                  ),
                  SizedBox(height: size.height * 0.02),
                  //URL LAUNCHER KULLANARAK TELEFON NUMARASINA YÖNLENDİREN KOD
                  //URLLAUNCHERBUTTON'U WİDGET OLARAK AYIRDIM
                  UrlLauncherButton(
                    title: 'Launch Phone Number',
                    icon: Icons.phone,
                    onPressed: () async {
                      Uri uri = Uri.parse('tel:+905555555555');
                      if (!await launcher.launchUrl(uri)) {
                        debugPrint("Could not launch the uri");
                      }
                    },
                  ),
                  //URL LAUNCHER KULLANARAK WEB SİTESİNE YÖNLENDİREN KOD
                  //URLLAUNCHERBUTTON'U WİDGET OLARAK AYIRDIM
                  SizedBox(height: size.height * 0.02),
                  UrlLauncherButton(
                    title: 'Launch Website / URL',
                    icon: Icons.language,
                    onPressed: () {
                      launcher.launchUrl(
                        Uri.parse('https://github.com/erenyurtsizoglu'),
                        mode: launcher.LaunchMode.externalApplication,
                      );
                    },
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
