import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final storage = FlutterSecureStorage();

Future<String?> getStoredToken() async {
  return await storage.read(key: 'token');
}
