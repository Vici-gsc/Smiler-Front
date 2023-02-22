// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'statistics_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$StatisticsState {
  int get totalQuestionCount => throw _privateConstructorUsedError;

  int get totalCorrectAnswerCount => throw _privateConstructorUsedError;

  Map<Emotion, double> get correctRateByEmotion =>
      throw _privateConstructorUsedError;

  Map<QuestionType, double> get correctRateByQuestionType =>
      throw _privateConstructorUsedError;

  Emotion? get worstEmotion => throw _privateConstructorUsedError;

  QuestionType? get bestQuestionType => throw _privateConstructorUsedError;

  bool get isLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $StatisticsStateCopyWith<StatisticsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StatisticsStateCopyWith<$Res> {
  factory $StatisticsStateCopyWith(
          StatisticsState value, $Res Function(StatisticsState) then) =
      _$StatisticsStateCopyWithImpl<$Res, StatisticsState>;

  @useResult
  $Res call(
      {int totalQuestionCount,
      int totalCorrectAnswerCount,
      Map<Emotion, double> correctRateByEmotion,
      Map<QuestionType, double> correctRateByQuestionType,
      Emotion? worstEmotion,
      QuestionType? bestQuestionType,
      bool isLoading});
}

/// @nodoc
class _$StatisticsStateCopyWithImpl<$Res, $Val extends StatisticsState>
    implements $StatisticsStateCopyWith<$Res> {
  _$StatisticsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;

  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalQuestionCount = null,
    Object? totalCorrectAnswerCount = null,
    Object? correctRateByEmotion = null,
    Object? correctRateByQuestionType = null,
    Object? worstEmotion = freezed,
    Object? bestQuestionType = freezed,
    Object? isLoading = null,
  }) {
    return _then(_value.copyWith(
      totalQuestionCount: null == totalQuestionCount
          ? _value.totalQuestionCount
          : totalQuestionCount // ignore: cast_nullable_to_non_nullable
              as int,
      totalCorrectAnswerCount: null == totalCorrectAnswerCount
          ? _value.totalCorrectAnswerCount
          : totalCorrectAnswerCount // ignore: cast_nullable_to_non_nullable
              as int,
      correctRateByEmotion: null == correctRateByEmotion
          ? _value.correctRateByEmotion
          : correctRateByEmotion // ignore: cast_nullable_to_non_nullable
              as Map<Emotion, double>,
      correctRateByQuestionType: null == correctRateByQuestionType
          ? _value.correctRateByQuestionType
          : correctRateByQuestionType // ignore: cast_nullable_to_non_nullable
              as Map<QuestionType, double>,
      worstEmotion: freezed == worstEmotion
          ? _value.worstEmotion
          : worstEmotion // ignore: cast_nullable_to_non_nullable
              as Emotion?,
      bestQuestionType: freezed == bestQuestionType
          ? _value.bestQuestionType
          : bestQuestionType // ignore: cast_nullable_to_non_nullable
              as QuestionType?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_StatisticsStateCopyWith<$Res>
    implements $StatisticsStateCopyWith<$Res> {
  factory _$$_StatisticsStateCopyWith(
          _$_StatisticsState value, $Res Function(_$_StatisticsState) then) =
      __$$_StatisticsStateCopyWithImpl<$Res>;

  @override
  @useResult
  $Res call(
      {int totalQuestionCount,
      int totalCorrectAnswerCount,
      Map<Emotion, double> correctRateByEmotion,
      Map<QuestionType, double> correctRateByQuestionType,
      Emotion? worstEmotion,
      QuestionType? bestQuestionType,
      bool isLoading});
}

/// @nodoc
class __$$_StatisticsStateCopyWithImpl<$Res>
    extends _$StatisticsStateCopyWithImpl<$Res, _$_StatisticsState>
    implements _$$_StatisticsStateCopyWith<$Res> {
  __$$_StatisticsStateCopyWithImpl(
      _$_StatisticsState _value, $Res Function(_$_StatisticsState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalQuestionCount = null,
    Object? totalCorrectAnswerCount = null,
    Object? correctRateByEmotion = null,
    Object? correctRateByQuestionType = null,
    Object? worstEmotion = freezed,
    Object? bestQuestionType = freezed,
    Object? isLoading = null,
  }) {
    return _then(_$_StatisticsState(
      totalQuestionCount: null == totalQuestionCount
          ? _value.totalQuestionCount
          : totalQuestionCount // ignore: cast_nullable_to_non_nullable
              as int,
      totalCorrectAnswerCount: null == totalCorrectAnswerCount
          ? _value.totalCorrectAnswerCount
          : totalCorrectAnswerCount // ignore: cast_nullable_to_non_nullable
              as int,
      correctRateByEmotion: null == correctRateByEmotion
          ? _value._correctRateByEmotion
          : correctRateByEmotion // ignore: cast_nullable_to_non_nullable
              as Map<Emotion, double>,
      correctRateByQuestionType: null == correctRateByQuestionType
          ? _value._correctRateByQuestionType
          : correctRateByQuestionType // ignore: cast_nullable_to_non_nullable
              as Map<QuestionType, double>,
      worstEmotion: freezed == worstEmotion
          ? _value.worstEmotion
          : worstEmotion // ignore: cast_nullable_to_non_nullable
              as Emotion?,
      bestQuestionType: freezed == bestQuestionType
          ? _value.bestQuestionType
          : bestQuestionType // ignore: cast_nullable_to_non_nullable
              as QuestionType?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_StatisticsState implements _StatisticsState {
  _$_StatisticsState(
      {required this.totalQuestionCount,
      required this.totalCorrectAnswerCount,
      required final Map<Emotion, double> correctRateByEmotion,
      required final Map<QuestionType, double> correctRateByQuestionType,
      required this.worstEmotion,
      required this.bestQuestionType,
      required this.isLoading})
      : _correctRateByEmotion = correctRateByEmotion,
        _correctRateByQuestionType = correctRateByQuestionType;

  @override
  final int totalQuestionCount;
  @override
  final int totalCorrectAnswerCount;
  final Map<Emotion, double> _correctRateByEmotion;

  @override
  Map<Emotion, double> get correctRateByEmotion {
    if (_correctRateByEmotion is EqualUnmodifiableMapView)
      return _correctRateByEmotion;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_correctRateByEmotion);
  }

  final Map<QuestionType, double> _correctRateByQuestionType;

  @override
  Map<QuestionType, double> get correctRateByQuestionType {
    if (_correctRateByQuestionType is EqualUnmodifiableMapView)
      return _correctRateByQuestionType;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_correctRateByQuestionType);
  }

  @override
  final Emotion? worstEmotion;
  @override
  final QuestionType? bestQuestionType;
  @override
  final bool isLoading;

  @override
  String toString() {
    return 'StatisticsState(totalQuestionCount: $totalQuestionCount, totalCorrectAnswerCount: $totalCorrectAnswerCount, correctRateByEmotion: $correctRateByEmotion, correctRateByQuestionType: $correctRateByQuestionType, worstEmotion: $worstEmotion, bestQuestionType: $bestQuestionType, isLoading: $isLoading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StatisticsState &&
            (identical(other.totalQuestionCount, totalQuestionCount) ||
                other.totalQuestionCount == totalQuestionCount) &&
            (identical(
                    other.totalCorrectAnswerCount, totalCorrectAnswerCount) ||
                other.totalCorrectAnswerCount == totalCorrectAnswerCount) &&
            const DeepCollectionEquality()
                .equals(other._correctRateByEmotion, _correctRateByEmotion) &&
            const DeepCollectionEquality().equals(
                other._correctRateByQuestionType, _correctRateByQuestionType) &&
            (identical(other.worstEmotion, worstEmotion) ||
                other.worstEmotion == worstEmotion) &&
            (identical(other.bestQuestionType, bestQuestionType) ||
                other.bestQuestionType == bestQuestionType) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      totalQuestionCount,
      totalCorrectAnswerCount,
      const DeepCollectionEquality().hash(_correctRateByEmotion),
      const DeepCollectionEquality().hash(_correctRateByQuestionType),
      worstEmotion,
      bestQuestionType,
      isLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StatisticsStateCopyWith<_$_StatisticsState> get copyWith =>
      __$$_StatisticsStateCopyWithImpl<_$_StatisticsState>(this, _$identity);
}

abstract class _StatisticsState implements StatisticsState {
  factory _StatisticsState(
      {required final int totalQuestionCount,
      required final int totalCorrectAnswerCount,
      required final Map<Emotion, double> correctRateByEmotion,
      required final Map<QuestionType, double> correctRateByQuestionType,
      required final Emotion? worstEmotion,
      required final QuestionType? bestQuestionType,
      required final bool isLoading}) = _$_StatisticsState;

  @override
  int get totalQuestionCount;

  @override
  int get totalCorrectAnswerCount;

  @override
  Map<Emotion, double> get correctRateByEmotion;

  @override
  Map<QuestionType, double> get correctRateByQuestionType;

  @override
  Emotion? get worstEmotion;

  @override
  QuestionType? get bestQuestionType;

  @override
  bool get isLoading;

  @override
  @JsonKey(ignore: true)
  _$$_StatisticsStateCopyWith<_$_StatisticsState> get copyWith =>
      throw _privateConstructorUsedError;
}
