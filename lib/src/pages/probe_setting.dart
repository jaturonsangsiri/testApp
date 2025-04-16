import 'package:flutter/material.dart';

class ProbeSetting extends StatefulWidget {
  const ProbeSetting({super.key});

  @override
  State<ProbeSetting> createState() => _ProbeSettingState();
}

class _ProbeSettingState extends State<ProbeSetting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Probe Setting'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Text('Probe Setting Page'),
      ),
    );
  }
}