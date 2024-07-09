import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'auth.dart';

class HomePage extends StatelessWidget {
   HomePage({super.key});

  final User? user = Auth().currentUser; // get current user

  Future<void> signOut() async{
    await Auth().signOut();
  }

  Widget _sButton(){
    return ElevatedButton(onPressed: signOut, child: const Text("LogOut"));
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Text("Currently in Home Page",style: TextStyle(fontSize: 14),),
            const SizedBox(height: 15,),
            Text(user?.email ?? 'User email',style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),),
            const SizedBox(height: 15,),
            _sButton(),
            
          ],
        ),
      ),
    );
  }
}