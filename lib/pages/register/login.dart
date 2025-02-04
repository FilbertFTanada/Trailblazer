import 'package:Trailblazer_Flutter/pages/home/main_home.dart';
import 'package:Trailblazer_Flutter/pages/register/signup.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final String defaultPassword = 'password123';
  final String defaultUsername = 'trailblazer';

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isEmptyUsername = false;
  bool isEmptyPassword = false;
  bool isInvalidCredentials = false;

  Future<bool> checkAccount(String username, String password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedUsername = prefs.getString('username');
    String? savedPassword = prefs.getString('password');
    return (username == defaultUsername && password == defaultPassword) ||
        (username == savedUsername && password == savedPassword);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 40),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 20, 20, 20),
                Color.fromARGB(255, 32, 32, 32)
              ],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 150),
              Center(
                child: Text(
                  "Sign In",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(height: 40),
              Container(
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(255, 40, 40, 40),
                      Color.fromARGB(255, 52, 52, 52)
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: TextField(
                  controller: usernameController,
                  onChanged: (value) {
                    setState(() {
                      isEmptyUsername = value.isEmpty;
                      isInvalidCredentials = false;
                    });
                  },
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(top: 7, left: 10),
                    border: InputBorder.none,
                    hintText: "Username",
                    icon: Padding(
                      padding: const EdgeInsets.only(left: 25, top: 7),
                      child: Icon(Icons.person, color: Colors.white.withOpacity(0.8)),
                    ),
                    hintStyle: const TextStyle(
                      color: Color.fromARGB(255, 150, 150, 150),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              isEmptyUsername
                  ? Padding(
                      padding: const EdgeInsets.only(left: 10, top: 5),
                      child: Text(
                        "Please Fill Username",
                        style: TextStyle(color: Color.fromARGB(255, 255, 127, 80)),
                      ),
                    )
                  : SizedBox(),
              SizedBox(height: 30),
              Container(
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(255, 40, 40, 40),
                      Color.fromARGB(255, 55, 55, 55)
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: TextField(
                  controller: passwordController,
                  onChanged: (value) {
                    setState(() {
                      isEmptyPassword = value.isEmpty;
                      isInvalidCredentials = false;
                    });
                  },
                  obscureText: true,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(top: 7, left: 10),
                    border: InputBorder.none,
                    hintText: "Password",
                    icon: Padding(
                      padding: const EdgeInsets.only(left: 25, top: 7),
                      child: Icon(Icons.lock, color: Colors.white.withOpacity(0.8)),
                    ),
                    hintStyle: const TextStyle(
                      color: Color.fromARGB(255, 150, 150, 150),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              isEmptyPassword
                  ? Padding(
                      padding: const EdgeInsets.only(left: 10, top: 5),
                      child: Text(
                        "Please Fill Password",
                        style: TextStyle(color: Color.fromARGB(255, 255, 127, 80)),
                      ),
                    )
                  : SizedBox(),
              SizedBox(height: 30),
              isInvalidCredentials
                  ? Padding(
                      padding: const EdgeInsets.only(left: 10, top: 5),
                      child: Text(
                        "Invalid Username or Password",
                        style: TextStyle(color: Color.fromARGB(255, 255, 127, 80)),
                      ),
                    )
                  : SizedBox(),
              Container(
                height: 60,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: LinearGradient(
                    colors: const [
                      Color.fromARGB(255, 135, 135, 135),
                      Color.fromARGB(255, 185, 185, 185)
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: TextButton(
                  onPressed: () async {
                    bool isValid = await checkAccount(usernameController.text, passwordController.text);
                    setState(() {
                      if (isValid) {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => const MainHome(),
                          ),
                        );
                      } else {
                        isEmptyUsername = usernameController.text.isEmpty;
                        isEmptyPassword = passwordController.text.isEmpty;
                        isInvalidCredentials = true;
                      }
                    });
                  },
                  child: Text(
                    "Login",
                    style: TextStyle(color: Colors.black, fontSize: 17),
                  ),
                ),
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account ?",
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => Signup()));
                      },
                      child: Text(
                        "SignUp",
                        style: TextStyle(
                            color: Colors.white70,
                            fontWeight: FontWeight.w800,
                            fontFamily: "Sora"),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
