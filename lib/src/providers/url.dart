import 'package:ticket_checker/src/providers/prefs.dart';

const _key = 'url';
const _default = 'https://api.mkh.mn';

String getUrl() => prefs.getString(_key) ?? _default;
Future<bool> setUrl() => prefs.setString(_key, _default);
