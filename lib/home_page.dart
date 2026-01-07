import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String lgIP = "";
  bool isConnected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('LG CONTROLLER T2')),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: const InputDecoration(
                  labelText: 'LG VM IP ADDRESS',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  lgIP = value;
                },
              ),

              const SizedBox(height: 12),

              ElevatedButton(
                onPressed: () {
                  if (lgIP.isEmpty) {
                    debugPrint("Please enter LG VM IP ADDRESS");
                    return;
                  }

                  setState(() {
                    isConnected = true;
                  });

                  debugPrint("Connected to LG VM at $lgIP");
                },
                child: const Text("Connect to LG"),
              ),

              const SizedBox(height: 80),

              ElevatedButton(
                onPressed: () {
                  debugPrint("LG LOGO SENT");
                },
                child: const Text("SEND LG LOGO"),
              ),

              const SizedBox(height: 50),

              ElevatedButton(
                onPressed: () {
                  debugPrint('COLOURED PYRAMID KML SENT');
                },
                child: const Text('SEND 3D KML CONTAINING A COLOURED PYRAMID'),
              ),

              const SizedBox(height: 50),

              ElevatedButton(
                onPressed: () {
                  debugPrint('FLY TO INSTRUCTION SENT');
                },
                child: const Text('SEND FLY TO INSTRUCTION FOR HOME CITY '),
              ),

              const SizedBox(height: 50),

              ElevatedButton(
                onPressed: () {
                  debugPrint('LOGO REMOVED');
                },
                child: const Text('CLEAN LOGO'),
              ),

              const SizedBox(height: 50),

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
