import 'package:flutter/material.dart';
import 'package:lg_controller_t2/connections/lg_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isConnected = false;
  late SSH ssh;

  @override
  void initState() {
    super.initState();
    ssh = SSH();
    _connectToLG();
  }

  Future<void> _connectToLG() async {
    bool? result = await ssh.connectToLG();
    setState(() {
      isConnected = result ?? false;
    });
  }

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
                onPressed: () async {
                  await ssh.execute();
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
