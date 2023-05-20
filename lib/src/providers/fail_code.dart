import 'package:ticket_checker/src/providers/prefs.dart';

const _key = 'fail';
const _default = '403';

String getFailCode() => prefs.getString(_key) ?? _default;
Future<bool> setFailCode() => prefs.setString(_key, _default);
