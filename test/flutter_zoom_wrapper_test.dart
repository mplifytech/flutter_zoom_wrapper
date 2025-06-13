/*
import 'package:flutter_test/flutter_test.dart';


import '../lib/flutter_zoom_wrapper.dart';
import '../lib/flutter_zoom_wrapper_method_channel.dart';
import '../lib/flutter_zoom_wrapper_platform_interface.dart';

class MockFlutterZoomWrapperPlatform with MockPlatformInterfaceMixin implements FlutterZoomWrapperPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FlutterZoomWrapperPlatform initialPlatform = FlutterZoomWrapperPlatform.instance;

  test('$MethodChannelFlutterZoomWrapper is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterZoomWrapper>());
  });

  test('getPlatformVersion', () async {
    FlutterZoomWrapper flutterZoomWrapperPlugin = FlutterZoomWrapper();
    MockFlutterZoomWrapperPlatform fakePlatform = MockFlutterZoomWrapperPlatform();
    FlutterZoomWrapperPlatform.instance = fakePlatform;

    //expect(await flutterZoomWrapperPlugin.getPlatformVersion(), '42');
  });
}
*/
