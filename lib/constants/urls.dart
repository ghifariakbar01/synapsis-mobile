class BaseUrl {
  BaseUrl._();

  static const String dev = 'https://dev-api-fms.apps-madhani.com/v1';
  static const String qa = '';
  static const String prod = '';
}

extension BaseExt on String {
  String get url {
    switch (this) {
      case 'dev':
        return BaseUrl.dev;
      case 'qa':
        return BaseUrl.qa;
      default:
        return BaseUrl.prod;
    }
  }
}
