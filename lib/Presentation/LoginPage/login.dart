import 'package:flutter/material.dart';
import 'package:medicare/Presentation/HomePage/HomePage.dart';
import 'package:medicare/Presentation/LoginPage/registration.dart';
import 'package:medicare/Presentation/MainPage/main_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final username_controller = TextEditingController();
  final password_controller = TextEditingController();

  late SharedPreferences logindata;
  late bool newuser;
  late String uname;
  late String pwd;
  late String name;

  @override
  void initState() {
    check_if_already_login();
    getValue();
  }

  void getValue() async {
    logindata = await SharedPreferences.getInstance();

    setState(() {
      name = logindata.getString("name")!;
      uname = logindata.getString("username")!;
      pwd = logindata.getString("password")!;
    });
  }

  void check_if_already_login() async {
    logindata = await SharedPreferences.getInstance();
    newuser = (logindata.getBool("newuser") ?? true);

    if (newuser == false) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => ScreenMainPage()));
    }
  }


  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    username_controller.dispose();
    password_controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Align(
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Login Form",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const Text(
                "To show example of shared preferences",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                    controller: username_controller,
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.account_box_sharp),
                        hintText: "Enter username",
                        labelText: "USERNAME",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30))),
                    textInputAction: TextInputAction.next),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                    controller: password_controller,
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.account_box_sharp),
                        hintText: "Enter password",
                        labelText: "PASSWORD",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30))),
                    textInputAction: TextInputAction.next),
              ),
              ElevatedButton(
                onPressed: () {
                  String username = username_controller.text;
                  String password = password_controller.text;

                  if (username != "" &&
                      password != "" &&
                      username == uname &&
                      password == pwd) {

                    logindata.setBool("newuser", false);
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => ScreenMainPage()));
                  }
                },
                child: Text("Login"),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Registration()));
                  }, child: Text("Not a user Register here..")),
            ],
          ),
        ),
      ),
    );
  }
}
