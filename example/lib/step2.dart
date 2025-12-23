import 'package:app_shield/app_shield.dart';
import 'package:flutter/material.dart';

class Step2 extends StatefulWidget {
  const Step2({super.key});

  @override
  State<Step2> createState() => _Step2State();
}

class _Step2State extends State<Step2> {
  @override
  void initState() {
    AppShield.preventScreenshotsAndRecordingForThisScreen();
    super.initState();
  }

  @override
  void dispose() {
    AppShield
        .allowScreenshotsAndRecordingForThisScreen(); // Allow screenshots when leaving this screen
    super.dispose();
  }

  @override
  void deactivate() {
    AppShield
        .allowScreenshotsAndRecordingForThisScreen(); // Allow screenshots when leaving this screen
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(child: Text('Page 2')),
    );
  }
}
