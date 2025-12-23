import 'package:app_shield/app_shield_method_channel.dart';
import 'package:app_shield/app_shield_platform_interface.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockAppShieldPlatform
    with MockPlatformInterfaceMixin
    implements AppShieldPlatform {
  @override
  Future<void> preventScreenshotsAndRecording() {
    // TODO: implement preventScreenshotsAndRecording
    throw UnimplementedError();
  }

  @override
  Future<void> preventScreenshotsGlobally() {
    // TODO: implement preventScreenshotsGlobally
    throw UnimplementedError();
  }

  @override
  Future<void> allowScreenshots() {
    // TODO: implement allowScreenshots
    throw UnimplementedError();
  }

  @override
  Future<void> allowScreenshotsGlobally() {
    // TODO: implement allowScreenshotsGlobally
    throw UnimplementedError();
  }
}

void main() {
  final AppShieldPlatform initialPlatform = AppShieldPlatform.instance;

  test('$MethodChannelAppShield is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelAppShield>());
  });
}
