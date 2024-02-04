import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  //MAİL CONTROLLER OLUŞTURDUK
  final TextEditingController emailController = TextEditingController(text: "");

  //VERİTABANINA KAYDETTİĞİMİZ MAİLİ UYGULAMA AÇILINCA OKUMAK İÇİN
  readData() async {
    final SharedPreferences storeage = await SharedPreferences.getInstance();
    var email = storeage.getString("email");

    setState(() {
      emailController.text = email ?? '';
    });
  }

  @override
  void initState() {
    super.initState();
    //BU SAYFA AÇILINCA VERİYİ GÖSTER
    readData();
    getDeviceInfo();
  }

  //VERİTABANINA KAYDEDİLEN VERİYİ SİLMEK İÇİN. YANİ ÇIKIŞ YAPMAK İÇİN LOGOUT
  clearData() async {
    final SharedPreferences storeage = await SharedPreferences.getInstance();
    storeage.clear();
  }

  String platform = "";
  String data = "";

  getDeviceInfo() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

    if (kIsWeb) {
      //is it web platform (browser)
      platform = "web";
      WebBrowserInfo webBrowserInfo = await deviceInfo.webBrowserInfo;
      data = webBrowserInfo.toString();
    } else {
      if (defaultTargetPlatform == TargetPlatform.android) {
        platform = "android";
        AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
        data = androidInfo.toString();
      } else if (defaultTargetPlatform == TargetPlatform.iOS) {
        platform = "ios";
        IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
        data = iosInfo.toString();
      } else if (defaultTargetPlatform == TargetPlatform.linux) {
        platform = "linux";
        LinuxDeviceInfo linuxInfo = await deviceInfo.linuxInfo;
        data = linuxInfo.toString();
      } else if (defaultTargetPlatform == TargetPlatform.macOS) {
        platform = "macOS";
        MacOsDeviceInfo macInfo = await deviceInfo.macOsInfo;
        data = macInfo.toString();
      } else if (defaultTargetPlatform == TargetPlatform.windows) {
        platform = "windows";
        WindowsDeviceInfo winInfo = await deviceInfo.windowsInfo;
        data = winInfo.toString();
      } else {
        platform = "unknown";
      }
    }
    setState(() {});
  }

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
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircleAvatar(backgroundImage: NetworkImage('https://picsum.photos/200/300'), radius: 75),
                SizedBox(height: size.height * 0.03),
                Text(
                  //EĞER YENİ BİR KAYIT OLUŞTURUYORSA PROFİLDE O KISMIN MAİL ADRESİ YAZSIN EĞER SERVİSTEKİ KULLANICI İLE GİRİŞ YAPIYORSA ONU GÖSTERMESİ İÇİN SORGU
                  emailController.text.isNotEmpty ? emailController.text : 'eve.holt@reqres.in',
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
                ),
                SizedBox(height: size.height * 0.05),
                Material(
                  elevation: 10,
                  borderRadius: BorderRadius.circular(10.0),
                  child: SizedBox(
                    height: size.height * 0.08,
                    width: size.width * 0.8,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurpleAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      onPressed: () {
                        //LOGOUT TUŞUNA BASINCA VERİYİ SİLİP welcome SAYFASINA ATIYOR
                        clearData();
                        Navigator.pushNamedAndRemoveUntil(context, '/welcome', (route) => false);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.logout,
                            color: Colors.white,
                          ),
                          SizedBox(width: size.width * 0.05),
                          const Text(
                            'Logout',
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
