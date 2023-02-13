// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scoring_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ScoringResult _$$_ScoringResultFromJson(Map<String, dynamic> json) =>
    _$_ScoringResult(
      isCorrect: json['isCorrect'] as bool,
      userAnswer: $enumDecode(_$EmotionEnumMap, json['userAnswer']),
    );

Map<String, dynamic> _$$_ScoringResultToJson(_$_ScoringResult instance) =>
    <String, dynamic>{
      'isCorrect': instance.isCorrect,
      'userAnswer': _$EmotionEnumMap[instance.userAnswer]!,
    };

const _$EmotionEnumMap = {
  Emotion.natural: 'natural',
  Emotion.happy: 'happy',
  Emotion.embarrass: 'embarrass',
  Emotion.angry: 'angry',
  Emotion.fear: 'fear',
  Emotion.hurt: 'hurt',
  Emotion.sad: 'sad',
};
