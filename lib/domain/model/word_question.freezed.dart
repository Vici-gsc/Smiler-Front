// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'word_question.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$WordQuestion {
  String get imagePath => throw _privateConstructorUsedError;
  List<Emotion> get emotionList => throw _privateConstructorUsedError;
  Emotion get correctEmotion => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WordQuestionCopyWith<WordQuestion> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WordQuestionCopyWith<$Res> {
  factory $WordQuestionCopyWith(
          WordQuestion value, $Res Function(WordQuestion) then) =
      _$WordQuestionCopyWithImpl<$Res, WordQuestion>;
  @useResult
  $Res call(
      {String imagePath, List<Emotion> emotionList, Emotion correctEmotion});
}

/// @nodoc
class _$WordQuestionCopyWithImpl<$Res, $Val extends WordQuestion>
    implements $WordQuestionCopyWith<$Res> {
  _$WordQuestionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imagePath = null,
    Object? emotionList = null,
    Object? correctEmotion = null,
  }) {
    return _then(_value.copyWith(
      imagePath: null == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String,
      emotionList: null == emotionList
          ? _value.emotionList
          : emotionList // ignore: cast_nullable_to_non_nullable
              as List<Emotion>,
      correctEmotion: null == correctEmotion
          ? _value.correctEmotion
          : correctEmotion // ignore: cast_nullable_to_non_nullable
              as Emotion,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_WordQuestionCopyWith<$Res>
    implements $WordQuestionCopyWith<$Res> {
  factory _$$_WordQuestionCopyWith(
          _$_WordQuestion value, $Res Function(_$_WordQuestion) then) =
      __$$_WordQuestionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String imagePath, List<Emotion> emotionList, Emotion correctEmotion});
}

/// @nodoc
class __$$_WordQuestionCopyWithImpl<$Res>
    extends _$WordQuestionCopyWithImpl<$Res, _$_WordQuestion>
    implements _$$_WordQuestionCopyWith<$Res> {
  __$$_WordQuestionCopyWithImpl(
      _$_WordQuestion _value, $Res Function(_$_WordQuestion) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imagePath = null,
    Object? emotionList = null,
    Object? correctEmotion = null,
  }) {
    return _then(_$_WordQuestion(
      imagePath: null == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String,
      emotionList: null == emotionList
          ? _value._emotionList
          : emotionList // ignore: cast_nullable_to_non_nullable
              as List<Emotion>,
      correctEmotion: null == correctEmotion
          ? _value.correctEmotion
          : correctEmotion // ignore: cast_nullable_to_non_nullable
              as Emotion,
    ));
  }
}

/// @nodoc

class _$_WordQuestion implements _WordQuestion {
  _$_WordQuestion(
      {required this.imagePath,
      required final List<Emotion> emotionList,
      required this.correctEmotion})
      : _emotionList = emotionList;

  @override
  final String imagePath;
  final List<Emotion> _emotionList;
  @override
  List<Emotion> get emotionList {
    if (_emotionList is EqualUnmodifiableListView) return _emotionList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_emotionList);
  }

  @override
  final Emotion correctEmotion;

  @override
  String toString() {
    return 'WordQuestion(imagePath: $imagePath, emotionList: $emotionList, correctEmotion: $correctEmotion)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WordQuestion &&
            (identical(other.imagePath, imagePath) ||
                other.imagePath == imagePath) &&
            const DeepCollectionEquality()
                .equals(other._emotionList, _emotionList) &&
            (identical(other.correctEmotion, correctEmotion) ||
                other.correctEmotion == correctEmotion));
  }

  @override
  int get hashCode => Object.hash(runtimeType, imagePath,
      const DeepCollectionEquality().hash(_emotionList), correctEmotion);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WordQuestionCopyWith<_$_WordQuestion> get copyWith =>
      __$$_WordQuestionCopyWithImpl<_$_WordQuestion>(this, _$identity);
}

abstract class _WordQuestion implements WordQuestion {
  factory _WordQuestion(
      {required final String imagePath,
      required final List<Emotion> emotionList,
      required final Emotion correctEmotion}) = _$_WordQuestion;

  @override
  String get imagePath;
  @override
  List<Emotion> get emotionList;
  @override
  Emotion get correctEmotion;
  @override
  @JsonKey(ignore: true)
  _$$_WordQuestionCopyWith<_$_WordQuestion> get copyWith =>
      throw _privateConstructorUsedError;
}
