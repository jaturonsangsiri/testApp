import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('หน้าหลัก'),
              const SizedBox(height: 10,),
              IconButton(onPressed: () {Navigator.pop(context);}, icon: Icon(Icons.arrow_back)),
              const SizedBox(height: 30,),
              Text('data'),
              const SizedBox(height: 10,),
              Text('data'),
              const SizedBox(height: 10,),
              Text('data'),
            ],
          ),
        ),
      ),
    );
  }
}