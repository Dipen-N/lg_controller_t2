import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  // These variables store user input
  String username = '';
  bool isConnected = false;
  String ipAddress = '';
  String port = '';
  String password = '';
  String rigs = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('LG SETTINGS')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(
                labelText: 'USERNAME',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                username = value;
              },
            ),

            const SizedBox(height: 12),

            TextField(
              decoration: const InputDecoration(
                labelText: 'IP ADDRESS',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                ipAddress = value;
              },
            ),

            const SizedBox(height: 12),

            TextField(
              decoration: const InputDecoration(
                labelText: 'PORT NUMBER',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                port = value;
              },
            ),

            const SizedBox(height: 12),

            TextField(
              decoration: const InputDecoration(
                labelText: 'PASSWORD',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                password = value;
              },
            ),

            const SizedBox(height: 12),

            TextField(
              decoration: const InputDecoration(
                labelText: 'NUMBER OF RIGS',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                rigs = value;
              },
            ),

            const SizedBox(height: 12),

            ElevatedButton(
              onPressed: () {
                if (username.isEmpty |
                    ipAddress.isEmpty |
                    port.isEmpty |
                    password.isEmpty |
                    rigs.isEmpty) {
                  debugPrint("ENTER ALL THE DETAILS");
                  return;
                }

                setState(() {
                  isConnected = true;
                });

                debugPrint(
                  "CONNECTED TO LG VM AT USERNAME:$username,IP ADDRESS:$ipAddress,PORT NUMBER:$port,PASSWORD:$password,RIGS:$rigs",
                );
              },
              child: const Text("CONNECT TO LG"),
            ),
          ],
        ),
      ),
    );
  }
}
