// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'history.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$History {
  int? get key => throw _privateConstructorUsedError;
  QuestionType get questionType => throw _privateConstructorUsedError;
  Emotion get correctAnswer => throw _privateConstructorUsedError;
  Emotion get userAnswer => throw _privateConstructorUsedError;
  bool get isCorrect => throw _privateConstructorUsedError;
  DateTime? get solvedTime => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HistoryCopyWith<History> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HistoryCopyWith<$Res> {
  factory $HistoryCopyWith(History value, $Res Function(History) then) =
      _$HistoryCopyWithImpl<$Res, History>;
  @useResult
  $Res call(
      {int? key,
      QuestionType questionType,
      Emotion correctAnswer,
      Emotion userAnswer,
      bool isCorrect,
      DateTime? solvedTime});
}

/// @nodoc
class _$HistoryCopyWithImpl<$Res, $Val extends History>
    implements $HistoryCopyWith<$Res> {
  _$HistoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = freezed,
    Object? questionType = null,
    Object? correctAnswer = null,
    Object? userAnswer = null,
    Object? isCorrect = null,
    Object? solvedTime = freezed,
  }) {
    return _then(_value.copyWith(
      key: freezed == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as int?,
      questionType: null == questionType
          ? _value.questionType
          : questionType // ignore: cast_nullable_to_non_nullable
              as QuestionType,
      correctAnswer: null == correctAnswer
          ? _value.correctAnswer
          : correctAnswer // ignore: cast_nullable_to_non_nullable
              as Emotion,
      userAnswer: null == userAnswer
          ? _value.userAnswer
          : userAnswer // ignore: cast_nullable_to_non_nullable
              as Emotion,
      isCorrect: null == isCorrect
          ? _value.isCorrect
          : isCorrect // ignore: cast_nullable_to_non_nullable
              as bool,
      solvedTime: freezed == solvedTime
          ? _value.solvedTime
          : solvedTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_HistoryCopyWith<$Res> implements $HistoryCopyWith<$Res> {
  factory _$$_HistoryCopyWith(
          _$_History value, $Res Function(_$_History) then) =
      __$$_HistoryCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? key,
      QuestionType questionType,
      Emotion correctAnswer,
      Emotion userAnswer,
      bool isCorrect,
      DateTime? solvedTime});
}

/// @nodoc
class __$$_HistoryCopyWithImpl<$Res>
    extends _$HistoryCopyWithImpl<$Res, _$_History>
    implements _$$_HistoryCopyWith<$Res> {
  __$$_HistoryCopyWithImpl(_$_History _value, $Res Function(_$_History) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = freezed,
    Object? questionType = null,
    Object? correctAnswer = null,
    Object? userAnswer = null,
    Object? isCorrect = null,
    Object? solvedTime = freezed,
  }) {
    return _then(_$_History(
      key: freezed == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as int?,
      questionType: null == questionType
          ? _value.questionType
          : questionType // ignore: cast_nullable_to_non_nullable
              as QuestionType,
      correctAnswer: null == correctAnswer
          ? _value.correctAnswer
          : correctAnswer // ignore: cast_nullable_to_non_nullable
              as Emotion,
      userAnswer: null == userAnswer
          ? _value.userAnswer
          : userAnswer // ignore: cast_nullable_to_non_nullable
              as Emotion,
      isCorrect: null == isCorrect
          ? _value.isCorrect
          : isCorrect // ignore: cast_nullable_to_non_nullable
              as bool,
      solvedTime: freezed == solvedTime
          ? _value.solvedTime
          : solvedTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _$_History implements _History {
  _$_History(
      {required this.key,
      required this.questionType,
      required this.correctAnswer,
      required this.userAnswer,
      required this.isCorrect,
      required this.solvedTime});

  @override
  final int? key;
  @override
  final QuestionType questionType;
  @override
  final Emotion correctAnswer;
  @override
  final Emotion userAnswer;
  @override
  final bool isCorrect;
  @override
  final DateTime? solvedTime;

  @override
  String toString() {
    return 'History(key: $key, questionType: $questionType, correctAnswer: $correctAnswer, userAnswer: $userAnswer, isCorrect: $isCorrect, solvedTime: $solvedTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_History &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.questionType, questionType) ||
                other.questionType == questionType) &&
            (identical(other.correctAnswer, correctAnswer) ||
                other.correctAnswer == correctAnswer) &&
            (identical(other.userAnswer, userAnswer) ||
                other.userAnswer == userAnswer) &&
            (identical(other.isCorrect, isCorrect) ||
                other.isCorrect == isCorrect) &&
            (identical(other.solvedTime, solvedTime) ||
                other.solvedTime == solvedTime));
  }

  @override
  int get hashCode => Object.hash(runtimeType, key, questionType, correctAnswer,
      userAnswer, isCorrect, solvedTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HistoryCopyWith<_$_History> get copyWith =>
      __$$_HistoryCopyWithImpl<_$_History>(this, _$identity);
}

abstract class _History implements History {
  factory _History(
      {required final int? key,
      required final QuestionType questionType,
      required final Emotion correctAnswer,
      required final Emotion userAnswer,
      required final bool isCorrect,
      required final DateTime? solvedTime}) = _$_History;

  @override
  int? get key;
  @override
  QuestionType get questionType;
  @override
  Emotion get correctAnswer;
  @override
  Emotion get userAnswer;
  @override
  bool get isCorrect;
  @override
  DateTime? get solvedTime;
  @override
  @JsonKey(ignore: true)
  _$$_HistoryCopyWith<_$_History> get copyWith =>
      throw _privateConstructorUsedError;
}
