class AppConfig {
  final String baseUrl;
  final Duration connectTimeout;
  final Duration receiveTimeout;
  final String authToken;

  AppConfig({
    required this.baseUrl,
    required this.connectTimeout,
    required this.receiveTimeout,
    required this.authToken,
  });
}
