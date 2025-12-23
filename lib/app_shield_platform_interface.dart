import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'app_shield_method_channel.dart';

/// The platform interface for the Dash Shield plugin, defining methods for
/// preventing screenshots and screen recording across platforms.
///
/// [AppShieldPlatform] acts as an interface between the Flutter plugin and
/// platform-specific implementations, defaulting to [MethodChannelAppShield].
///
/// Example usage:
/// ```dart
/// AppShieldPlatform.instance.preventScreenshotsGlobally();
/// AppShieldPlatform.instance.preventScreenshotsAndRecording();
/// ```
abstract class AppShieldPlatform extends PlatformInterface {
  /// Constructs a [AppShieldPlatform] instance with a verification token.
  AppShieldPlatform() : super(token: _token);

  static final Object _token = Object();

  /// The default instance of [AppShieldPlatform], which uses
  /// [MethodChannelAppShield] by default.
  static AppShieldPlatform _instance = MethodChannelAppShield();

  /// Gets the current instance of [AppShieldPlatform].
  static AppShieldPlatform get instance => _instance;

  /// Sets a new instance of [AppShieldPlatform], allowing platform-specific
  /// implementations to replace the default.
  static set instance(AppShieldPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  /// Prevents screenshots globally for the entire app.
  ///
  /// This method relies on the platform's native code to block screenshots
  /// and screen recording across all screens. Throws [UnimplementedError]
  /// if not implemented on a platform.
  Future<void> preventScreenshotsGlobally() {
    throw UnimplementedError(
        'preventScreenshotsGlobally() has not been implemented.');
  }

  /// Allows screenshots globally for the entire app.
  ///
  /// This method removes security flags across the app, enabling screenshots
  /// and screen recording for all screens. Throws [UnimplementedError]
  /// if not implemented on a platform.
  Future<void> allowScreenshotsGlobally() {
    throw UnimplementedError(
        'allowScreenshotsGlobally() has not been implemented.');
  }

  /// Prevents screenshots and screen recording for specific screens.
  ///
  /// This method restricts screenshots and recording for sensitive screens
  /// without affecting the entire app. Throws [UnimplementedError]
  /// if not implemented on a platform.
  Future<void> preventScreenshotsAndRecording() {
    throw UnimplementedError(
        'preventScreenshotsAndRecording() has not been implemented.');
  }

  /// Allows screenshots for the current screen only.
  ///
  /// This method removes the security flag for the current screen, allowing
  /// screenshots and screen recording for this screen. Throws [UnimplementedError]
  /// if not implemented on a platform.
  Future<void> allowScreenshots() {
    throw UnimplementedError('allowScreenshots() has not been implemented.');
  }
}
