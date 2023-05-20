import 'package:ticket_checker/src/providers/prefs.dart';

const _key = 'ok';
const _default = '200';

String getOkCode() => prefs.getString(_key) ?? _default;
Future<bool> setOkCode() => prefs.setString(_key, _default);
