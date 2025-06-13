// example/lib/zoom_helper.dart

import 'dart:io';
import 'package:flutter/services.dart';
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';

const zoomSdkKey = 'your_key';
const zoomSdkSecret = 'your_secret';

class ZoomHelper {
  static const MethodChannel _channel = MethodChannel('flutter_zoom_wrapper');

  static Future<void> initializeZoom() async {
    final jwt = _generateZoomJWT(zoomSdkKey, zoomSdkSecret);
    await _channel.invokeMethod('initZoom', {'jwt': jwt});
    print("✅ Zoom SDK initialized");
  }

  static Future<void> joinMeeting({
    required String meetingId,
    required String password,
    required String displayName,
  }) async {
    await _channel.invokeMethod('joinMeeting', {
      'meetingId': meetingId,
      'meetingPassword': password,
      'displayName': displayName,
    });
  }

  static String _generateZoomJWT(String apiKey, String apiSecret) {
    final jwt = JWT({
      'appKey': apiKey,
      'iat': DateTime.now().millisecondsSinceEpoch ~/ 1000,
      'exp': DateTime.now().add(const Duration(hours: 1)).millisecondsSinceEpoch ~/ 1000,
      'tokenExp': DateTime.now().add(const Duration(hours: 1)).millisecondsSinceEpoch ~/ 1000,
    });

    return jwt.sign(SecretKey(apiSecret), algorithm: JWTAlgorithm.HS256);
  }
}
