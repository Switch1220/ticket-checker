import 'package:ticket_checker/src/providers/prefs.dart';

const _key = 'url';
// const _default = 'api.mkh.mn';
const _default = 'https://jsonplaceholder.typicode.com/posts';

String getUrl() => prefs.getString(_key) ?? _default;
Future<bool> setUrl() => prefs.setString(_key, _default);
