library flutter_zoom_wrapper;

import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:flutter/services.dart';

class FlutterZoomWrapper {
  static const MethodChannel _channel = MethodChannel('flutter_zoom_wrapper');

  /// Initialize Zoom with a JWT token
  static Future<void> initializeZoom(String jwtToken) async {
    await _channel.invokeMethod('initZoom', {'jwt': jwtToken});
  }

  /// Join a meeting
  static Future<void> joinMeeting({
    required String meetingId,
    required String meetingPassword,
    required String displayName,
  }) async {
    await _channel.invokeMethod('joinMeeting', {
      'meetingId': meetingId,
      'meetingPassword': meetingPassword,
      'displayName': displayName,
    });
  }

  static String generateZoomJWT(String apiKey, String apiSecret) {
    final jwt = JWT({
      'appKey': apiKey,
      'iat': DateTime.now().millisecondsSinceEpoch ~/ 1000,
      'exp': DateTime.now().add(const Duration(hours: 1)).millisecondsSinceEpoch ~/ 1000,
      'tokenExp': DateTime.now().add(const Duration(hours: 1)).millisecondsSinceEpoch ~/ 1000,
    });

    return jwt.sign(SecretKey(apiSecret), algorithm: JWTAlgorithm.HS256);
  }
}

