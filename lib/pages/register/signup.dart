import 'package:Trailblazer_Flutter/pages/home/main_home.dart';
import 'package:flutter/material.dart';

class signup extends StatefulWidget {
  const signup({Key? key}) : super(key: key);

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  final String password = 'password123';
  final String username = 'fauzan';

  TextEditingController Username = TextEditingController();
  TextEditingController Password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  bool isEmptyUsername = false;
  bool isEmptyPassword = false;
  bool isMatched = true;

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
                  "Sign Up",
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
                  controller: Username,
                  onChanged: (value) {
                    setState(() {
                      isEmptyUsername = value.isEmpty;
                    });
                  },
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(top: 7, left: 10),
                    border: InputBorder.none,
                    hintText: "Username",
                    icon: Padding(
                      padding: const EdgeInsets.only(left: 25, top: 7),
                      child: Icon(Icons.person,
                          color: Colors.white.withOpacity(0.8)),
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
                        style:
                            TextStyle(color: Color.fromARGB(255, 255, 127, 80)),
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
                  controller: Password,
                  onChanged: (value) {
                    setState(() {
                      isEmptyPassword = value.isEmpty;
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
                      child: Icon(Icons.lock,
                          color: Colors.white.withOpacity(0.8)),
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
                        style:
                            TextStyle(color: Color.fromARGB(255, 255, 127, 80)),
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
                  controller: confirmPassword,
                  onChanged: (value) {
                    setState(() {
                      value == Password.text
                          ? isMatched = true
                          : isMatched = false;
                    });
                  },
                  obscureText: true,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(top: 7, left: 10),
                    border: InputBorder.none,
                    hintText: "Confirm Password",
                    icon: Padding(
                      padding: const EdgeInsets.only(left: 25, top: 7),
                      child: Icon(Icons.lock,
                          color: Colors.white.withOpacity(0.8)),
                    ),
                    hintStyle: const TextStyle(
                      color: Color.fromARGB(255, 150, 150, 150),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              isMatched
                  ? SizedBox()
                  : Padding(
                      padding: EdgeInsets.only(left: 10, top: 5),
                      child: Text(
                        "Password Do Not Match",
                        style:
                            TextStyle(color: Color.fromARGB(255, 255, 127, 80)),
                      ),
                    ),
              SizedBox(
                height: 30,
              ),
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
                  onPressed: () {
                    setState(() {
                      if (Username.text != '' &&
                          Password.text != '' &&
                          isMatched) {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => const MainHome(),
                          ),
                        );
                      } else {
                        isEmptyUsername = Username.text.isEmpty;
                        isEmptyPassword = Password.text.isEmpty;
                      }
                    });
                  },
                  child: Text(
                    "Create an Account",
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ),
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
