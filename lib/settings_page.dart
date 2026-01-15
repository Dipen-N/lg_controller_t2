import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:lg_controller_t2/connections/lg_service.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  // These variables store user input
  String username = '';
  String ipAddress = '';
  String port = '22';
  String password = '';
  String rigs = '';

  bool isConnected = false;

  late SSH ssh;

  @override
  void initState() {
    super.initState();
    ssh = SSH();
    _loadSettings();
    _connectToLG();
  }

  // _loadsettings code
  Future<void> _loadSettings() async {
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      ipAddress = prefs.getString('ipAddress') ?? '';
      port = prefs.getString('sshPort') ?? '22';
      username = prefs.getString('username') ?? '';
      password = prefs.getString('password') ?? '';
      rigs = prefs.getString('numberOfRigs') ?? '3';
    });
  }

  // _save settings code
  Future<void> _saveSettings() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString('ipAddress', ipAddress);
    await prefs.setString('Port', port);
    await prefs.setString('username', username);
    await prefs.setString('password', password);
    await prefs.setString('rigs', rigs);
  }

  // CONNECT TO LG CODE

  Future<void> _connectToLG() async {
    await _saveSettings();

    final bool result = await ssh.connectToLG() ?? false;

    setState(() {
      isConnected = result;
    });
  }

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
              onPressed: () async {
                if (username.isEmpty |
                    ipAddress.isEmpty |
                    port.isEmpty |
                    password.isEmpty |
                    rigs.isEmpty) {
                  debugPrint("ENTER ALL THE DETAILS");
                  return;
                }

                await _saveSettings();
                SSH ssh = SSH();
                await ssh.connectToLG();

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
