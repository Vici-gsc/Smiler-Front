import 'package:freezed_annotation/freezed_annotation.dart';

part 'result.freezed.dart';

/// API 호출 등의 결과를 나타내는 클래스입니다.
@freezed
class Result<T> with _$Result<T> {
  /// 성공한 경우의 결과입니다. [data]에는 성공한 결과가 담겨있습니다.
  const factory Result.success(T data) = Success;

  /// 실패한 경우의 결과입니다. [message]에는 오류 메세지가 담겨있습니다.
  const factory Result.failure(String message) = Error;
}
