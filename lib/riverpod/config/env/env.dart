import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract interface class Env {
  late final String apiBaseUrl;
  late final String accessToken;
}

class EnvImpl implements Env {
  @override
  String apiBaseUrl = dotenv.get('API_BASE_URL');

  @override
  String accessToken = dotenv.get('ACCESS_TOKEN');
}

final env = EnvImpl();
