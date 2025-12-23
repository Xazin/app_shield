import 'app_shield_exception.dart';

/// A specific exception type for handling HTTP client errors in the Dash Shield plugin.
///
/// This [HttpClientException] extends [AppShieldException] and is used to
/// capture errors specifically related to HTTP client operations within
/// Dash Shield.
///
/// Example usage:
/// ```dart
/// throw HttpClientException('Failed to fetch data from server.');
/// ```
class HttpClientException extends AppShieldException {
  /// Creates an [HttpClientException] with the given [message] and an optional
  /// [stackTrace] inherited from [AppShieldException].
  ///
  /// The [message] provides details about the HTTP client error.
  HttpClientException(super.message, [super.stackTrace]);

  /// Returns a string representation of the exception, including the message.
  @override
  String toString() => 'HttpClientException: $message';
}
