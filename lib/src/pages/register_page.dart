import 'package:firstapp/src/contants.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(onPressed: () {Navigator.pop(context);}, icon: Icon(Icons.arrow_back)),
              const SizedBox(height: 10,),
              Text('สมัครบัญชี', style: TextStyle(fontSize: 30,fontWeight: FontWeight.w600, color: secColor),),
              const SizedBox(height: 20,),

            ],
          ),
        ),
      ),
    );
  }
}