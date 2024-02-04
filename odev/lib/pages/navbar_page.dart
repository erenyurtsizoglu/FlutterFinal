import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:odev/pages/contact_us_page.dart';
import 'package:odev/pages/device_info.dart';
import 'package:odev/pages/home_page.dart';
import 'package:odev/pages/profile_page.dart';


class MainNavBar extends StatefulWidget {
  const MainNavBar({super.key});

  @override
  State<MainNavBar> createState() => _MainNavBarState();
}

class _MainNavBarState extends State<MainNavBar> {
  //UYGULAMA AÇILDIĞINDA HANGİ SAYFADA AÇILMASI GEREKTİĞİNİ BELİRLEMEK İÇİN SAYISAL DEĞER OLUŞTURDUK
  int _selectedIndex = 0;
  //BOTTOM NABİGATİON BAR'IN HANGİ SAYFALARDAN OLUŞACAĞINI BELİRLEDİK
  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    ContactUsPage(),
    ProfilePage(),
    DeviceInfo(),
  ];

  //BASTIĞIM ZAMAN SEÇTİĞİM İNDEXE GİTMESİ İÇİN
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    //RESPONSİVE OLMASI İÇİN
    final size = MediaQuery.of(context).size;

    return Scaffold(
      //BOTTOM NAV BARIN ÖZELLİKLERİ
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: GNav(
          onTabChange: (index) => _onItemTapped(index),
          tabMargin: EdgeInsets.symmetric(vertical: size.height * 0.01),
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.05, vertical: size.height * 0.015),
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          color: Colors.white,
          activeColor: Colors.deepPurple.shade700,
          backgroundColor: Colors.deepPurple.shade800.withOpacity(0.8),
          tabBackgroundColor: Colors.white,
          selectedIndex: _selectedIndex,
          gap: 8,
          tabs: const [
            GButton(
              icon: Icons.home,
              text: 'Home',
            ),
            GButton(
              icon: Icons.contact_page_rounded,
              text: 'Contact Us',
            ),
            GButton(
              icon: Icons.person,
              text: 'Profile',
            ),
            GButton(
              icon: Icons.info,
              text: 'Device Info',
            ),
          ]),
    );
  }
}
