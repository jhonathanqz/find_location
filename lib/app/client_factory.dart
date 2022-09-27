import 'package:dio/dio.dart';

class ClientFactory {
  static Dio? _baseClient;

  static Dio? get baseClient {
    _baseClient ??= Dio();

    return _baseClient;
  }
}

class ClientJwt {
  static Dio? _clientJwt;

  static Dio? get baseClientJwt {
    _clientJwt ??= Dio();

    return _clientJwt;
  }
}

class ClientFdv {
  static Dio? _clientFdv;

  static Dio? get baseClientFdv {
    _clientFdv ??= Dio();

    return _clientFdv;
  }
}

class ClientSimple {
  static Dio? _clientSimple;

  static Dio? get baseClientSimple {
    _clientSimple ??= Dio();

    return _clientSimple;
  }
}
