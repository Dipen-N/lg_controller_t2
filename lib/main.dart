import 'package:flutter/material.dart';
import 'package:lg_controller_t2/home_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
     home:HomePage(),
    );
  }
}

