import 'package:flutter/material.dart';
import 'package:gezi_uygulamasi/authentication/login_page.dart';
import 'package:gezi_uygulamasi/models/user.dart';
import 'package:gezi_uygulamasi/services/auth_service.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController controllerNameSurname = TextEditingController();
  TextEditingController controllerUserName = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();

  final AuthService _authService = AuthService();

  Future<void> registerUser() async {
    if (controllerNameSurname.text != "" && controllerUserName.text != "" && controllerEmail.text != "" && controllerPassword.text != "") {
      User registerUser = User(
          nameSurname: controllerNameSurname.text, userName: controllerUserName.text, email: controllerEmail.text, password: controllerPassword.text);

      final response = await _authService.registerUser(registerUser);
      print(response);
      if (response != null) {
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const LoginPage()));

        const snackBar = SnackBar(content: Text("Kayıt Başarıyla Tamamlandı"));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    } else {
      const snackBar = SnackBar(content: Text("Lütfen Tüm Alanları Dolurunuz"));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gezi Uygulaması'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "Kayıt Ol",
                  style: TextStyle(fontSize: 25),
                )
              ],
            ),
            const Divider(),
            const SizedBox(height: 30),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: controllerNameSurname,
                decoration: const InputDecoration(label: Text("Ad Soyad")),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: controllerUserName,
                decoration: const InputDecoration(label: Text("Kullanıcı Adı")),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: controllerEmail,
                decoration: const InputDecoration(label: Text("E-posta Adresi")),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                obscureText: true,
                controller: controllerPassword,
                decoration: const InputDecoration(label: Text("Şifre")),
              ),
            ),
            ElevatedButton(
                onPressed: () async {
                  await registerUser();
                },
                child: const Text("Kayıt Ol")),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Zaten Bir Hesabın Var Mı?"),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const LoginPage()));
                    },
                    child: const Text("GİRİŞ YAP"))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
