import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_zoom_wrapper_platform_interface.dart';

/// An implementation of [FlutterZoomWrapperPlatform] that uses method channels.
class MethodChannelFlutterZoomWrapper extends FlutterZoomWrapperPlatform {
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_zoom_wrapper');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<void> initialize({
    required String sdkKey,
    required String sdkSecret,
  }) async {
    await methodChannel.invokeMethod('initialize', {
      'sdkKey': sdkKey,
      'sdkSecret': sdkSecret,
    });
  }

  @override
  Future<void> joinMeeting({
    required String meetingId,
    required String meetingPassword,
    required String displayName,
  }) async {
    await methodChannel.invokeMethod('joinMeeting', {
      'meetingId': meetingId,
      'meetingPassword': meetingPassword,
      'displayName': displayName,
    });
  }
}

