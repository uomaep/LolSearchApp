import 'package:app/screens/homeScreen.dart';
import 'package:app/services/apiServices.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return HomeScreen();
  }
}
