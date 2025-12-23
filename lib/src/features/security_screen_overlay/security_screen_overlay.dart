import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AppShieldOverlay extends StatefulWidget {
  final Widget child;
  final Widget overlayWidget;

  const AppShieldOverlay({
    super.key,
    required this.child,
    required this.overlayWidget,
  });

  @override
  SecurityOverlayState createState() => SecurityOverlayState();
}

class SecurityOverlayState extends State<AppShieldOverlay>
    with WidgetsBindingObserver {
  bool _isInBackground = false;

  @override
  void initState() {
    super.initState();
    if (kDebugMode) {
      print('initState');
    }
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    if (kDebugMode) {
      print('disposed');
    }
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    setState(() {
      if (kDebugMode) {
        print('didChangeAppLifecycleState -- ${state.name.toString()}');
      }
      _isInBackground = (state == AppLifecycleState.paused) ||
          (state == AppLifecycleState.inactive);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          widget.child,
          if (_isInBackground) Positioned.fill(child: widget.overlayWidget),
        ],
      ),
    );
  }
}
