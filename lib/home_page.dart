import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('LG CONTROLLER T2')),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 5),

              ElevatedButton(
                onPressed: () {
                  debugPrint("LG LOGO SENT");
                },
                child: const Text("SEND LG LOGO"),
              ),

              const SizedBox(height: 100),

              ElevatedButton(
                onPressed: () {
                  debugPrint('COLOURED PYRAMID KML SENT');
                },
                child: const Text('SEND 3D KML CONTAINING A COLOURED PYRAMID'),
              ),

              const SizedBox(height: 100),

              ElevatedButton(
                onPressed: () {
                  debugPrint('FLY TO INSTRUCTION SENT');
                },
                child: const Text('SEND FLY TO INSTRUCTION FOR HOME CITY '),
              ),

              const SizedBox(height: 100),

              ElevatedButton(
                onPressed: () {
                  debugPrint('LOGO REMOVED');
                },
                child: const Text('CLEAN LOGO'),
              ),

              const SizedBox(height: 100),

              ElevatedButton(
                onPressed: () {
                  debugPrint('KMLS REMOVED');
                },
                child: const Text('CLEAN KMLS'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
