import 'package:flutter/material.dart';
import 'package:gezi_uygulamasi/authentication/register_page.dart';
import 'package:gezi_uygulamasi/models/user.dart';
import 'package:gezi_uygulamasi/services/user_service.dart';
import 'package:gezi_uygulamasi/screens/main_page.dart';
import 'package:gezi_uygulamasi/services/auth_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController controllerUseName = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();

  final AuthService _authService = AuthService();
  final UserService _currentUser = UserService.instance;

  Future<void> loginUser() async {
    if (controllerUseName.text != "" && controllerPassword.text != "") {
      final response = await _authService.readUserByUserName(controllerUseName.text);
      if (response != null && response.isNotEmpty) {
        if (response[0]["password"] == controllerPassword.text) {
          User currentUser = User(
            id: response[0]["id"],
            nameSurname: response[0]["nameSurname"],
            userName: response[0]["userName"],
            email: response[0]["email"],
            password: response[0]["password"],
          );
          _currentUser.setCurrentUser(currentUser);
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const MainPage()));
        } else {
          const snackBar = SnackBar(content: Text("Kullanıcı Adı veya Şifre Hatalı"));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      } else {
        const snackBar = SnackBar(content: Text("Kullanıcı Bulunamadı"));
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
      body: Column(
        children: [
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                "Giriş Yap",
                style: TextStyle(fontSize: 25),
              )
            ],
          ),
          const Divider(),
          const SizedBox(height: 30),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              controller: controllerUseName,
              decoration: const InputDecoration(label: Text("Kullanıcı Adı")),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              controller: controllerPassword,
              obscureText: true,
              decoration: const InputDecoration(label: Text("Şifre")),
            ),
          ),
          ElevatedButton(
              onPressed: () async {
                await loginUser();
              },
              child: const Text("Giriş Yap")),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Bir Hesabın Yok Mu?"),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const RegisterPage()));
                  },
                  child: const Text("KAYIT OL"))
            ],
          ),
        ],
      ),
    );
  }
}
