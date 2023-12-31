import 'package:flutter/material.dart';
import 'package:shopping/pages/signup.page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: const Color(0xFFF5F5F5),
          padding: const EdgeInsets.only(
            top: 80,
            left: 20,
            right: 20,
            bottom: 40,
          ),
          child: Column(
            children: [
              Container(
                height: 400,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.red,
                        offset: Offset(1, 2.0),
                        blurRadius: 8,
                        spreadRadius: 2)
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 15,
                    right: 15,
                    top: 40,
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Column(
                            children: [
                              Text(
                                "Welcome",
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                "Sign in to continue",
                                style: TextStyle(),
                              ),
                            ],
                          ),
                          TextButton(
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.green,
                              textStyle:
                                  const TextStyle(fontWeight: FontWeight.w800),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SignUpPage(),
                                ),
                              );
                            },
                            child: const Text("Sign up"),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      TextFormField(
                        autofocus: false,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          labelText: "Email",
                          labelStyle: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 16),
                        ),
                        style: const TextStyle(fontSize: 20),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        autofocus: false,
                        keyboardType: TextInputType.text,
                        obscureText: true,
                        decoration: const InputDecoration(
                          labelText: "Password",
                          labelStyle: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 16),
                        ),
                        style: const TextStyle(fontSize: 20),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 40,
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {},
                          child: const Text("Forgot your password?"),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 40,
                        child: TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.red,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text("Sign in"),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 15, bottom: 15),
                child: const Text(
                  "- OR -",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 2,
                    color: Theme.of(context).primaryColor,
                  ),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: TextButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      SizedBox(
                        height: 24,
                        width: 120,
                        child: Image.asset(
                          "assets/facebook.png",
                        ),
                      ),
                      const Text(
                        "Sign in with Facebook",
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 2,
                    color: Theme.of(context).primaryColor,
                  ),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: TextButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      SizedBox(
                        height: 24,
                        width: 120,
                        child: Image.asset(
                          "assets/google.png",
                        ),
                      ),
                      const Text(
                        "Sign in with Google",
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
