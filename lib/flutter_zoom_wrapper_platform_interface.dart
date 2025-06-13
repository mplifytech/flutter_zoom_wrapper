import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_zoom_wrapper_method_channel.dart';

abstract class FlutterZoomWrapperPlatform extends PlatformInterface {
  FlutterZoomWrapperPlatform() : super(token: _token);

  static final Object _token = Object();
  static FlutterZoomWrapperPlatform _instance = MethodChannelFlutterZoomWrapper();

  static FlutterZoomWrapperPlatform get instance => _instance;

  static set instance(FlutterZoomWrapperPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('getPlatformVersion() has not been implemented.');
  }

  Future<void> initialize({required String sdkKey, required String sdkSecret}) {
    throw UnimplementedError('initialize() has not been implemented.');
  }

  Future<void> joinMeeting({
    required String meetingId,
    required String meetingPassword,
    required String displayName,
  }) {
    throw UnimplementedError('joinMeeting() has not been implemented.');
  }
}

