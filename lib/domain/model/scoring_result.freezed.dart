// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'scoring_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ScoringResult {
  bool get isCorrect => throw _privateConstructorUsedError;
  Emotion get userAnswer => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ScoringResultCopyWith<ScoringResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScoringResultCopyWith<$Res> {
  factory $ScoringResultCopyWith(
          ScoringResult value, $Res Function(ScoringResult) then) =
      _$ScoringResultCopyWithImpl<$Res, ScoringResult>;
  @useResult
  $Res call({bool isCorrect, Emotion userAnswer});
}

/// @nodoc
class _$ScoringResultCopyWithImpl<$Res, $Val extends ScoringResult>
    implements $ScoringResultCopyWith<$Res> {
  _$ScoringResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isCorrect = null,
    Object? userAnswer = null,
  }) {
    return _then(_value.copyWith(
      isCorrect: null == isCorrect
          ? _value.isCorrect
          : isCorrect // ignore: cast_nullable_to_non_nullable
              as bool,
      userAnswer: null == userAnswer
          ? _value.userAnswer
          : userAnswer // ignore: cast_nullable_to_non_nullable
              as Emotion,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ScoringResultCopyWith<$Res>
    implements $ScoringResultCopyWith<$Res> {
  factory _$$_ScoringResultCopyWith(
          _$_ScoringResult value, $Res Function(_$_ScoringResult) then) =
      __$$_ScoringResultCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isCorrect, Emotion userAnswer});
}

/// @nodoc
class __$$_ScoringResultCopyWithImpl<$Res>
    extends _$ScoringResultCopyWithImpl<$Res, _$_ScoringResult>
    implements _$$_ScoringResultCopyWith<$Res> {
  __$$_ScoringResultCopyWithImpl(
      _$_ScoringResult _value, $Res Function(_$_ScoringResult) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isCorrect = null,
    Object? userAnswer = null,
  }) {
    return _then(_$_ScoringResult(
      isCorrect: null == isCorrect
          ? _value.isCorrect
          : isCorrect // ignore: cast_nullable_to_non_nullable
              as bool,
      userAnswer: null == userAnswer
          ? _value.userAnswer
          : userAnswer // ignore: cast_nullable_to_non_nullable
              as Emotion,
    ));
  }
}

/// @nodoc

class _$_ScoringResult implements _ScoringResult {
  _$_ScoringResult({required this.isCorrect, required this.userAnswer});

  @override
  final bool isCorrect;
  @override
  final Emotion userAnswer;

  @override
  String toString() {
    return 'ScoringResult(isCorrect: $isCorrect, userAnswer: $userAnswer)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ScoringResult &&
            (identical(other.isCorrect, isCorrect) ||
                other.isCorrect == isCorrect) &&
            (identical(other.userAnswer, userAnswer) ||
                other.userAnswer == userAnswer));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isCorrect, userAnswer);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ScoringResultCopyWith<_$_ScoringResult> get copyWith =>
      __$$_ScoringResultCopyWithImpl<_$_ScoringResult>(this, _$identity);
}

abstract class _ScoringResult implements ScoringResult {
  factory _ScoringResult(
      {required final bool isCorrect,
      required final Emotion userAnswer}) = _$_ScoringResult;

  @override
  bool get isCorrect;
  @override
  Emotion get userAnswer;
  @override
  @JsonKey(ignore: true)
  _$$_ScoringResultCopyWith<_$_ScoringResult> get copyWith =>
      throw _privateConstructorUsedError;
}
