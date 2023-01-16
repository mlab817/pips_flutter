class Config {
  static const String baseUrl = "https://api.pips.da.gov.ph/api";
  static const int itemsPerPage = 25;
  static const String defaultLanguage = 'en';

  const Config._internal();

  static const Config instance = Config._internal();

  factory Config() => instance;
}
