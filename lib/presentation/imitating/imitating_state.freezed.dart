// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'imitating_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ImitatingState {
  int get questionCount => throw _privateConstructorUsedError;

  int get correctAnswerCount => throw _privateConstructorUsedError;

  Emotion get answerEmotion => throw _privateConstructorUsedError;

  bool get isLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ImitatingStateCopyWith<ImitatingState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImitatingStateCopyWith<$Res> {
  factory $ImitatingStateCopyWith(
          ImitatingState value, $Res Function(ImitatingState) then) =
      _$ImitatingStateCopyWithImpl<$Res, ImitatingState>;

  @useResult
  $Res call(
      {int questionCount,
      int correctAnswerCount,
      Emotion answerEmotion,
      bool isLoading});
}

/// @nodoc
class _$ImitatingStateCopyWithImpl<$Res, $Val extends ImitatingState>
    implements $ImitatingStateCopyWith<$Res> {
  _$ImitatingStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;

  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? questionCount = null,
    Object? correctAnswerCount = null,
    Object? answerEmotion = null,
    Object? isLoading = null,
  }) {
    return _then(_value.copyWith(
      questionCount: null == questionCount
          ? _value.questionCount
          : questionCount // ignore: cast_nullable_to_non_nullable
              as int,
      correctAnswerCount: null == correctAnswerCount
          ? _value.correctAnswerCount
          : correctAnswerCount // ignore: cast_nullable_to_non_nullable
              as int,
      answerEmotion: null == answerEmotion
          ? _value.answerEmotion
          : answerEmotion // ignore: cast_nullable_to_non_nullable
              as Emotion,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ImitatingStateCopyWith<$Res>
    implements $ImitatingStateCopyWith<$Res> {
  factory _$$_ImitatingStateCopyWith(
          _$_ImitatingState value, $Res Function(_$_ImitatingState) then) =
      __$$_ImitatingStateCopyWithImpl<$Res>;

  @override
  @useResult
  $Res call(
      {int questionCount,
      int correctAnswerCount,
      Emotion answerEmotion,
      bool isLoading});
}

/// @nodoc
class __$$_ImitatingStateCopyWithImpl<$Res>
    extends _$ImitatingStateCopyWithImpl<$Res, _$_ImitatingState>
    implements _$$_ImitatingStateCopyWith<$Res> {
  __$$_ImitatingStateCopyWithImpl(
      _$_ImitatingState _value, $Res Function(_$_ImitatingState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? questionCount = null,
    Object? correctAnswerCount = null,
    Object? answerEmotion = null,
    Object? isLoading = null,
  }) {
    return _then(_$_ImitatingState(
      questionCount: null == questionCount
          ? _value.questionCount
          : questionCount // ignore: cast_nullable_to_non_nullable
              as int,
      correctAnswerCount: null == correctAnswerCount
          ? _value.correctAnswerCount
          : correctAnswerCount // ignore: cast_nullable_to_non_nullable
              as int,
      answerEmotion: null == answerEmotion
          ? _value.answerEmotion
          : answerEmotion // ignore: cast_nullable_to_non_nullable
              as Emotion,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_ImitatingState implements _ImitatingState {
  _$_ImitatingState(
      {required this.questionCount,
      required this.correctAnswerCount,
      required this.answerEmotion,
      required this.isLoading});

  @override
  final int questionCount;
  @override
  final int correctAnswerCount;
  @override
  final Emotion answerEmotion;
  @override
  final bool isLoading;

  @override
  String toString() {
    return 'ImitatingState(questionCount: $questionCount, correctAnswerCount: $correctAnswerCount, answerEmotion: $answerEmotion, isLoading: $isLoading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ImitatingState &&
            (identical(other.questionCount, questionCount) ||
                other.questionCount == questionCount) &&
            (identical(other.correctAnswerCount, correctAnswerCount) ||
                other.correctAnswerCount == correctAnswerCount) &&
            (identical(other.answerEmotion, answerEmotion) ||
                other.answerEmotion == answerEmotion) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, questionCount, correctAnswerCount, answerEmotion, isLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ImitatingStateCopyWith<_$_ImitatingState> get copyWith =>
      __$$_ImitatingStateCopyWithImpl<_$_ImitatingState>(this, _$identity);
}

abstract class _ImitatingState implements ImitatingState {
  factory _ImitatingState(
      {required final int questionCount,
      required final int correctAnswerCount,
      required final Emotion answerEmotion,
      required final bool isLoading}) = _$_ImitatingState;

  @override
  int get questionCount;

  @override
  int get correctAnswerCount;

  @override
  Emotion get answerEmotion;

  @override
  bool get isLoading;

  @override
  @JsonKey(ignore: true)
  _$$_ImitatingStateCopyWith<_$_ImitatingState> get copyWith =>
      throw _privateConstructorUsedError;
}
