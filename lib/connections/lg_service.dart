import 'package:dartssh2/dartssh2.dart';
import 'package:flutter/widgets.dart';
import 'dart:async';
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:lg_controller_t2/kml/screen_overlay_kml_model.dart';

class SSH {
  late String _ipAddress;
  late String _port;
  late String _username;
  late String _password;
  late String _rigs;

  SSHClient? _client;

  //Initialize connection details from shared preferences
  Future<void> initConnectionDetails() async {
    final prefs = await SharedPreferences.getInstance();

    _ipAddress = prefs.getString('ipAddress') ?? '';
    _port = prefs.getString('port') ?? '22';
    _username = prefs.getString('username') ?? '';
    _password = prefs.getString('password') ?? '';
    _rigs = prefs.getString('rigs') ?? '';

    debugPrint('SSH DETAILS');
    debugPrint('Host: $_ipAddress');
    debugPrint('Port: $_port');
    debugPrint('User: $_username');
    debugPrint('Rigs: $_rigs');
  }

  //Connect to liquid galaxy system
  Future<bool?> connectToLG() async {
    await initConnectionDetails();

    try {
      final socket = await SSHSocket.connect(_ipAddress, int.parse(_port));

      _client = SSHClient(
        socket,
        username: _username,
        onPasswordRequest: () => _password,
      );

      debugPrint('SSH CONNECTED SUCCESSFULLY');
      return true;
    } on SocketException catch (e) {
      debugPrint('Failed to connect: $e');
      return false;
    }
  }

  // SEND LOGO KML TO LG3

  Future<void> execute() async {
    if (_client == null) {
      debugPrint('SSH client is not connected.');
      return;
    }

    try {
      // GENERATE KML FROM OVERLAY
      final String kmlContent = ScreenOverlayKmlModel.generateLogoKML();

      // WRITE KML TO LEFTMOST SCREEN
      await _client!.execute(
        "echo '${kmlContent.replaceAll("'", "'\\''")}' > /var/www/html/kml/slave_3.kml",
      );

      // SET PERMISSION
      await _client!.execute('Chmod 777 /var/www/html/kml/slave_3.kml');

      //REFRESH LG
      await _client!.execute(
        'echo "http://lg1:81/kml/slave_3.kml" > /tmp/query.txt',
      );

      debugPrint('LOGO KML SENT TO LG3');
    } catch (e) {
      debugPrint('error sending logo KML: $e');
    }
  }
}
