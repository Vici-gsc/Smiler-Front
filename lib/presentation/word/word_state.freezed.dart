// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'word_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$WordState {
  int get questionCount => throw _privateConstructorUsedError;
  int get correctAnswerCount => throw _privateConstructorUsedError;

  Emotion? get answerEmotion => throw _privateConstructorUsedError;

  List<Emotion> get emotionChoices => throw _privateConstructorUsedError;

  String? get imageUrl => throw _privateConstructorUsedError;

  bool get isLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WordStateCopyWith<WordState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WordStateCopyWith<$Res> {
  factory $WordStateCopyWith(WordState value, $Res Function(WordState) then) =
      _$WordStateCopyWithImpl<$Res, WordState>;
  @useResult
  $Res call(
      {int questionCount,
      int correctAnswerCount,
      Emotion? answerEmotion,
      List<Emotion> emotionChoices,
      String? imageUrl,
      bool isLoading});
}

/// @nodoc
class _$WordStateCopyWithImpl<$Res, $Val extends WordState>
    implements $WordStateCopyWith<$Res> {
  _$WordStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? questionCount = null,
    Object? correctAnswerCount = null,
    Object? answerEmotion = freezed,
    Object? emotionChoices = null,
    Object? imageUrl = freezed,
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
      answerEmotion: freezed == answerEmotion
          ? _value.answerEmotion
          : answerEmotion // ignore: cast_nullable_to_non_nullable
              as Emotion?,
      emotionChoices: null == emotionChoices
          ? _value.emotionChoices
          : emotionChoices // ignore: cast_nullable_to_non_nullable
              as List<Emotion>,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_WordStateCopyWith<$Res> implements $WordStateCopyWith<$Res> {
  factory _$$_WordStateCopyWith(
          _$_WordState value, $Res Function(_$_WordState) then) =
      __$$_WordStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int questionCount,
      int correctAnswerCount,
      Emotion? answerEmotion,
      List<Emotion> emotionChoices,
      String? imageUrl,
      bool isLoading});
}

/// @nodoc
class __$$_WordStateCopyWithImpl<$Res>
    extends _$WordStateCopyWithImpl<$Res, _$_WordState>
    implements _$$_WordStateCopyWith<$Res> {
  __$$_WordStateCopyWithImpl(
      _$_WordState _value, $Res Function(_$_WordState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? questionCount = null,
    Object? correctAnswerCount = null,
    Object? answerEmotion = freezed,
    Object? emotionChoices = null,
    Object? imageUrl = freezed,
    Object? isLoading = null,
  }) {
    return _then(_$_WordState(
      questionCount: null == questionCount
          ? _value.questionCount
          : questionCount // ignore: cast_nullable_to_non_nullable
              as int,
      correctAnswerCount: null == correctAnswerCount
          ? _value.correctAnswerCount
          : correctAnswerCount // ignore: cast_nullable_to_non_nullable
              as int,
      answerEmotion: freezed == answerEmotion
          ? _value.answerEmotion
          : answerEmotion // ignore: cast_nullable_to_non_nullable
              as Emotion?,
      emotionChoices: null == emotionChoices
          ? _value._emotionChoices
          : emotionChoices // ignore: cast_nullable_to_non_nullable
              as List<Emotion>,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_WordState implements _WordState {
  _$_WordState(
      {required this.questionCount,
      required this.correctAnswerCount,
      required this.answerEmotion,
      required final List<Emotion> emotionChoices,
      required this.imageUrl,
      required this.isLoading})
      : _emotionChoices = emotionChoices;

  @override
  final int questionCount;
  @override
  final int correctAnswerCount;
  @override
  final Emotion? answerEmotion;
  final List<Emotion> _emotionChoices;

  @override
  List<Emotion> get emotionChoices {
    if (_emotionChoices is EqualUnmodifiableListView) return _emotionChoices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_emotionChoices);
  }

  @override
  final String? imageUrl;
  @override
  final bool isLoading;

  @override
  String toString() {
    return 'WordState(questionCount: $questionCount, correctAnswerCount: $correctAnswerCount, answerEmotion: $answerEmotion, emotionChoices: $emotionChoices, imageUrl: $imageUrl, isLoading: $isLoading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WordState &&
            (identical(other.questionCount, questionCount) ||
                other.questionCount == questionCount) &&
            (identical(other.correctAnswerCount, correctAnswerCount) ||
                other.correctAnswerCount == correctAnswerCount) &&
            (identical(other.answerEmotion, answerEmotion) ||
                other.answerEmotion == answerEmotion) &&
            const DeepCollectionEquality()
                .equals(other._emotionChoices, _emotionChoices) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      questionCount,
      correctAnswerCount,
      answerEmotion,
      const DeepCollectionEquality().hash(_emotionChoices),
      imageUrl,
      isLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WordStateCopyWith<_$_WordState> get copyWith =>
      __$$_WordStateCopyWithImpl<_$_WordState>(this, _$identity);
}

abstract class _WordState implements WordState {
  factory _WordState(
      {required final int questionCount,
      required final int correctAnswerCount,
      required final Emotion? answerEmotion,
      required final List<Emotion> emotionChoices,
      required final String? imageUrl,
      required final bool isLoading}) = _$_WordState;

  @override
  int get questionCount;

  @override
  int get correctAnswerCount;

  @override
  Emotion? get answerEmotion;

  @override
  List<Emotion> get emotionChoices;

  @override
  String? get imageUrl;

  @override
  bool get isLoading;

  @override
  @JsonKey(ignore: true)
  _$$_WordStateCopyWith<_$_WordState> get copyWith =>
      throw _privateConstructorUsedError;
}
