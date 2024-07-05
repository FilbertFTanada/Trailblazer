import 'package:Trailblazer_Flutter/pages/register/login.dart';
import 'package:flutter/material.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.black,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 450,
                margin: EdgeInsets.all(0),
                child: Image.asset(
                  'assets/image 3.png',
                  fit: BoxFit.fill,
                ),
              ),
              Center(
                child: Container(
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 70),
                        child: const Text(
                          "Coffee so good,",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 34,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 70),
                        child: const Text(
                          "your taste buds",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 34,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 90),
                        child: const Text(
                          "will love it.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 34,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 70),
                        child: const Text(
                          "The best grain, the finest roast, the",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color.fromARGB(1000, 169, 169, 169),
                              fontWeight: FontWeight.normal,
                              fontSize: 14),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 90),
                        child: const Text(
                          "powerful flavor.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color.fromARGB(1000, 169, 169, 169),
                              fontWeight: FontWeight.normal,
                              fontSize: 14),
                        ),
                      ),
                      const SizedBox(height: 40),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Login()));
                          },
                          child: Text("Get Started"),
                          style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor:
                                  Color.fromARGB(1000, 198, 124, 78),
                              minimumSize: Size(280, 62))),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
