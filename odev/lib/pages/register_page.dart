import 'package:flutter/material.dart';
import 'package:odev/widgets/text_field.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //CONTROLLERLAR OLUŞTURULDU
  final TextEditingController emailController = TextEditingController(text: "");
  final TextEditingController fullNameController = TextEditingController(text: "");
  final TextEditingController passwordController = TextEditingController(text: "");
  final TextEditingController confirmPasswordController = TextEditingController(text: "");

  @override
  void initState() {
    super.initState();
    //SAYFA AÇILINCA KAYDEDİLERN VERİYİ GÖSTER
    readData();
  }

  //YENİ KAYIT OLUŞTURURKEN VERİLERİ VERİTABANINA KAYDETMEK İÇİN
  storeData() async {
    final SharedPreferences storeage = await SharedPreferences.getInstance();

    storeage.setString("email", emailController.text);
    storeage.setString("fullName", fullNameController.text);
    storeage.setString("password", passwordController.text);
    storeage.setString("passwordAgain", confirmPasswordController.text);
  }

  //OLUŞTURULAN VERİYİ TEMİZLEMEK İÇİN
  clearData() async {
    final SharedPreferences storeage = await SharedPreferences.getInstance();
    storeage.clear();
  }

  //KAYDEDİLEN VERİYİ OKUMAK İÇİN
  readData() async {
    final SharedPreferences storeage = await SharedPreferences.getInstance();
    var email = storeage.getString("email");
    var fullName = storeage.getString("fullName");
    var password = storeage.getString("password");
    var passwordAgain = storeage.getString("passwordAgain");

    setState(() {
      emailController.text = email ?? '';
      fullNameController.text = fullName ?? '';
      passwordController.text = password ?? '';
      confirmPasswordController.text = passwordAgain ?? '';
    });
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  var emailRegex = RegExp(r'^[a-zA-Z0-9._]+@[a-zA-Z0-9]+\.[a-zA-Z]+');

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
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(height: size.height * 0.1),
                const Text('Register',
                    style: TextStyle(fontSize: 40, color: Colors.white, fontWeight: FontWeight.bold)),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: size.height * 0.02, horizontal: size.width * 0.05),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: size.height * 0.02),
                      const Text('Email',
                          style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold)),
                      SizedBox(height: size.height * 0.015),
                      CustomTextField(
                        labeltext: 'E-mail',
                        icon: const Icon(Icons.mail),
                        obsecureText: false,
                        controller: emailController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter an email';
                          } else if (!emailRegex.hasMatch(value)) {
                            return 'Please enter a valid email';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: size.height * 0.015),
                      const Text('Full Name',
                          style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold)),
                      CustomTextField(
                        icon: const Icon(Icons.key),
                        labeltext: 'Full Name',
                        obsecureText: false,
                        controller: fullNameController,
                      ),
                      SizedBox(height: size.height * 0.015),
                      const Text('Password',
                          style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold)),
                      CustomTextField(
                        icon: const Icon(Icons.key),
                        labeltext: 'Password',
                        obsecureText: true,
                        controller: passwordController,
                      ),
                      SizedBox(height: size.height * 0.015),
                      const Text('Password Again',
                          style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold)),
                      SizedBox(height: size.height * 0.015),
                      CustomTextField(
                        icon: const Icon(Icons.key),
                        labeltext: 'Password Again',
                        obsecureText: true,
                        controller: confirmPasswordController,
                      ),
                      SizedBox(height: size.height * 0.15),
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
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                if (passwordController.text != confirmPasswordController.text) {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(const SnackBar(content: Text('Passwords do not match')));
                                } else {
                                  storeData();
                                  Navigator.pushNamedAndRemoveUntil(context, '/navbar', (route) => false);
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(const SnackBar(content: Text('Data Saved')));
                                }
                              }
                            },
                            child: const Text(
                              'Create',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
