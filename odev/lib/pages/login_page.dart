import 'package:flutter/material.dart';
import 'package:odev/service/login_service.dart';
import 'package:odev/widgets/text_field.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  //VERİLERİ UYGULAMA KAPANIRSA VEYA YENİDEN BAŞLATILIRSA DİYE SAKLAMAK İÇİN SHAREDPREFERENCES KULLANDIK. LOCAL VERİTABANI
  storeData() async {
    final SharedPreferences storeage = await SharedPreferences.getInstance();
    storeage.setString("Email", _emailController.text);
  }

  //KAYDETTİĞİMİZ VERİLERİ EKRANDA GÖSTERMEK İÇİN YAZILDI
  readData() async {
    final SharedPreferences storeage = await SharedPreferences.getInstance();
    var mail = storeage.getString("Email");

    setState(() {
      _emailController.text = mail ?? '';
    });
  }

  @override
  void initState() {
    super.initState();
    //BU SAYFA AÇILDIĞINDA KAYDEDİLEN VERİLERİ EKRANDA GÖSTERMEK İÇİN
    readData();
  }

  //SERVİSİ BURADA KULLANMAK İÇİN NESNSEYİ OLUŞTURUYORUZ
  final Service _service = Service();

  

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
              const Text('Login', style: TextStyle(fontSize: 40, color: Colors.white, fontWeight: FontWeight.bold)),
              Padding(
                padding: EdgeInsets.symmetric(vertical: size.height * 0.02, horizontal: size.width * 0.05),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: size.height * 0.05),
                    const Text('Email',
                        style: TextStyle(fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold)),
                    SizedBox(height: size.height * 0.02),
                    CustomTextField(
                      labeltext: 'E-mail',
                      icon: const Icon(Icons.mail),
                      obsecureText: false,
                      controller: _emailController,
                    ),
                    SizedBox(height: size.height * 0.02),
                    const Text('Password',
                        style: TextStyle(fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold)),
                    CustomTextField(
                      icon: const Icon(Icons.key),
                      labeltext: 'Password',
                      obsecureText: true,
                      controller: _passwordController,
                    ),
                    SizedBox(height: size.height * 0.25),
                    Material(
                      borderRadius: BorderRadius.circular(15),
                      elevation: 10,
                      child: SizedBox(
                        height: size.height * 0.07,
                        width: size.width * 1,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepPurpleAccent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          onPressed: () async {
                            //WEB SERVİSE ATTIĞIMIZ İSTEK İLE GİRİLEN ŞİFRE EŞİT Mİ DEĞİL Mİ KONTROLU YAPILIYOR
                            if (_passwordController.text == 'cityslicka') {
                              //EŞİTSE GİRİŞ BAŞARILI OLUYOR VE VERİLER VERİTABANINA KAYIT EDİLİYOR
                              _service.login(_emailController.text, _passwordController.text);
                              storeData();
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(content: Text('Giriş Başarılı')));
                              await Navigator.pushNamedAndRemoveUntil(context, '/navbar', (route) => false);
                            } else {
                              //DEĞİLSE ŞİFRE HATALI
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(content: Text('Giriş Başarısız')));
                            }
                          },
                          child: const Text(
                            'Sign In',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * 0.02),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Don’t have an account?',
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(width: size.width * 0.05),
                        SizedBox(
                          height: size.height * 0.05,
                          child: TextButton(
                              onPressed: () {
                                Navigator.pushNamedAndRemoveUntil(context, '/register', (route) => false);
                              },
                              child: const Text(
                                'create',
                                style: TextStyle(color: Colors.yellow, fontWeight: FontWeight.bold),
                              )),
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
