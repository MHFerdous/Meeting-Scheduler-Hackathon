class Urls {
  static const String _hostBaseUrl = 'http://10.0.2.2:2024/api/v1/host';
  static const String _guestBaseUrl = 'http://10.0.2.2:2024/api/v1/guest';

  /// host
  static const String hostRegistration = '$_hostBaseUrl/registration';
  static const String hostLogin = '$_hostBaseUrl/login';
  static const String hostProfile = '$_hostBaseUrl/profile';

  /// guest
  static const String guestRegistration = '$_guestBaseUrl/registration';
  static const String guestLogin = '$_guestBaseUrl/login';
  static const String guestProfile = '$_guestBaseUrl/profile';
}
