// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:ticket_checker/src/providers/dio.dart';
import 'package:ticket_checker/src/providers/fail_code.dart';
import 'package:ticket_checker/src/providers/ok_code.dart';
import 'package:ticket_checker/src/providers/url.dart';

sealed class CheckStatus {}

class Success extends CheckStatus {}

class Failure extends CheckStatus {}

class NetworkException extends CheckStatus {}

class UnknownCode extends CheckStatus {
  final String code;
  UnknownCode({
    required this.code,
  });
}

class UnknownError extends CheckStatus {
  final Object? error;
  UnknownError({
    this.error,
  });
}

Future<CheckStatus> check(String id) async {
  final url = getUrl();
  final ok = getOkCode();
  final fail = getFailCode();

  try {
    final res = await dio.post(url);
    final status = res.statusCode.toString();

    print(status);

    if (status == ok) return Success();
    if (status == fail) return Failure();

    return UnknownCode(code: status);
  } on SocketException catch (_) {
    return NetworkException();
  } on DioError catch (e) {
    return UnknownError(error: e);
  } catch (e) {
    return UnknownError(error: e);
  }
}

final checkProvider =
    FutureProvider.family<CheckStatus, String>((ref, id) async {
  return check(id);
});
