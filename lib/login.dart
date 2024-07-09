import 'package:authpractice/signup.dart';
import 'package:flutter/material.dart';
import 'auth.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String errorMessage = '';

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> signInWithEmailAndPassword() async {
    try {
      await Auth().signInWithEmailAndPassword(
          email: _emailController.text, password: _passwordController.text);
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message!;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // SizedBox(width: 25,),
                Container(
                  height: 20,
                  width: 30,
                  decoration: const BoxDecoration(color: Colors.green),
                ),
                const Text(
                  "  Username :",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 60,
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 209, 255, 211),
                borderRadius: BorderRadiusDirectional.circular(25),
              ),
              child:  Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10),
                child: TextField(
                  controller: _emailController,
                  clipBehavior: Clip.antiAlias,
                  textAlign: TextAlign.start,
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // SizedBox(width: 25,),
                Container(
                  height: 20,
                  width: 30,
                  decoration: const BoxDecoration(color: Colors.green),
                ),
                const Text(
                  "  Password :",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 60,
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 209, 255, 211),
                borderRadius: BorderRadiusDirectional.circular(25),
              ),
              child:  Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10),
                child: TextField(
                  controller: _passwordController,
                  clipBehavior: Clip.antiAlias,
                  textAlign: TextAlign.start,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(errorMessage == '' ? '' : 'Hmm ? $errorMessage'),
            const SizedBox(
              height: 25,
            ),
            // Container(
            //   height: 50,
            //   width: MediaQuery.of(context).size.width*0.6,
            //   decoration: BoxDecoration(color: const Color.fromARGB(255, 0, 54, 2),borderRadius: BorderRadius.circular(25)),
            //   child: Center(child: Text("Login", style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.w800),)),
            // ),
            SizedBox(
              height: 50,
              width: MediaQuery.of(context).size.width * 0.6,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 0, 54, 2),
                    foregroundColor: Colors.white),
                onPressed: signInWithEmailAndPassword,
                child: const Text(
                  "Login",
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Don't have account,",
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SignUp()),
                    );
                  },
                  child: const Text("Create account"),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}