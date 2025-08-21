// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'test_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TestModel _$TestModelFromJson(Map<String, dynamic> json) => TestModel(
      intValue: (json['intValue'] as num).toInt(),
      stringValue: json['stringValue'] as String,
      doubleValue: (json['doubleValue'] as num).toDouble(),
      boolValue: json['boolValue'] as bool,
      dynamicValue: json['dynamicValue'],
      listValue: json['listValue'] as List<dynamic>,
      mapValue: json['mapValue'] as Map<String, dynamic>,
      listStringValue: (json['listStringValue'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      mapStringValue: json['mapStringValue'] as Map<String, dynamic>,
      subModelValue: TestOptionalModel.fromJson(
          json['subModelValue'] as Map<String, dynamic>),
      listSubModelValue: (json['listSubModelValue'] as List<dynamic>)
          .map((e) => TestOptionalModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      mapSubModelValue: (json['mapSubModelValue'] as Map<String, dynamic>).map(
        (k, e) =>
            MapEntry(k, TestOptionalModel.fromJson(e as Map<String, dynamic>)),
      ),
    );

Map<String, dynamic> _$TestModelToJson(TestModel instance) => <String, dynamic>{
      'intValue': instance.intValue,
      'stringValue': instance.stringValue,
      'doubleValue': instance.doubleValue,
      'boolValue': instance.boolValue,
      'dynamicValue': instance.dynamicValue,
      'listValue': instance.listValue,
      'mapValue': instance.mapValue,
      'listStringValue': instance.listStringValue,
      'mapStringValue': instance.mapStringValue,
      'subModelValue': instance.subModelValue,
      'listSubModelValue': instance.listSubModelValue,
      'mapSubModelValue': instance.mapSubModelValue,
    };

TestOptionalModel _$TestOptionalModelFromJson(Map<String, dynamic> json) =>
    TestOptionalModel(
      intValue: (json['intValue'] as num?)?.toInt(),
      stringValue: json['stringValue'] as String?,
      doubleValue: (json['doubleValue'] as num?)?.toDouble(),
      boolValue: json['boolValue'] as bool?,
      dynamicValue: json['dynamicValue'],
      listValue: json['listValue'] as List<dynamic>?,
      mapValue: json['mapValue'] as Map<String, dynamic>?,
      listStringValue: (json['listStringValue'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      mapStringValue: json['mapStringValue'] as Map<String, dynamic>?,
      subModelValue: json['subModelValue'] == null
          ? null
          : TestOptionalModel.fromJson(
              json['subModelValue'] as Map<String, dynamic>),
      listSubModelValue: (json['listSubModelValue'] as List<dynamic>?)
          ?.map((e) => TestOptionalModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      mapSubModelValue:
          (json['mapSubModelValue'] as Map<String, dynamic>?)?.map(
        (k, e) =>
            MapEntry(k, TestOptionalModel.fromJson(e as Map<String, dynamic>)),
      ),
    );

Map<String, dynamic> _$TestOptionalModelToJson(TestOptionalModel instance) =>
    <String, dynamic>{
      'intValue': instance.intValue,
      'stringValue': instance.stringValue,
      'doubleValue': instance.doubleValue,
      'boolValue': instance.boolValue,
      'dynamicValue': instance.dynamicValue,
      'listValue': instance.listValue,
      'mapValue': instance.mapValue,
      'listStringValue': instance.listStringValue,
      'mapStringValue': instance.mapStringValue,
      'subModelValue': instance.subModelValue,
      'listSubModelValue': instance.listSubModelValue,
      'mapSubModelValue': instance.mapSubModelValue,
    };
