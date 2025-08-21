import 'package:flutter/foundation.dart';
import 'package:fwframework_flutter/fwframework_flutter.dart';

part 'test_model.g.dart';

@JsonSerializable()
class TestModel {
  final int intValue;
  @JsonKey(name: 'stringValue')
  final String stringValue;
  final double doubleValue;
  final bool boolValue;
  final dynamic dynamicValue;
  final List<dynamic> listValue;
  final Map mapValue;
  final List<String> listStringValue;
  final Map<String, dynamic> mapStringValue;
  final TestOptionalModel subModelValue;
  final List<TestOptionalModel> listSubModelValue;
  final Map<String, TestOptionalModel> mapSubModelValue;

  TestModel({
    required this.intValue,
    required this.stringValue,
    required this.doubleValue,
    required this.boolValue,
    required this.dynamicValue,
    required this.listValue,
    required this.mapValue,
    required this.listStringValue,
    required this.mapStringValue,
    required this.subModelValue,
    required this.listSubModelValue,
    required this.mapSubModelValue,
  });

  factory TestModel.fromJson(Map<String, dynamic> json) {
    return _$TestModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TestModelToJson(this);

  TestModel copyWith({
    int? intValue,
    String? stringValue,
    double? doubleValue,
    bool? boolValue,
    dynamic dynamicValue,
    List<dynamic>? listValue,
    Map? mapValue,
    List<String>? listStringValue,
    Map<String, dynamic>? mapStringValue,
    TestOptionalModel? subModelValue,
    List<TestOptionalModel>? listSubModelValue,
    Map<String, TestOptionalModel>? mapSubModelValue,
  }) {
    return TestModel(
      intValue: intValue ?? this.intValue,
      stringValue: stringValue ?? this.stringValue,
      doubleValue: doubleValue ?? this.doubleValue,
      boolValue: boolValue ?? this.boolValue,
      dynamicValue: dynamicValue ?? this.dynamicValue,
      listValue: listValue ?? this.listValue,
      mapValue: mapValue ?? this.mapValue,
      listStringValue: listStringValue ?? this.listStringValue,
      mapStringValue: mapStringValue ?? this.mapStringValue,
      subModelValue: subModelValue ?? this.subModelValue,
      listSubModelValue: listSubModelValue ?? this.listSubModelValue,
      mapSubModelValue: mapSubModelValue ?? this.mapSubModelValue,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! TestModel) return false;
    return const DeepCollectionEquality().equals(toJson(), other.toJson());
  }

  @override
  int get hashCode => const DeepCollectionEquality().hash(toJson());
}

@JsonSerializable()
class TestOptionalModel {
  final int? intValue;
  @JsonKey(name: 'stringValue')
  final String? stringValue;
  final double? doubleValue;
  final bool? boolValue;
  final dynamic dynamicValue;
  final List<dynamic>? listValue;
  final Map? mapValue;
  final List<String>? listStringValue;
  final Map<String, dynamic>? mapStringValue;
  final TestOptionalModel? subModelValue;
  final List<TestOptionalModel>? listSubModelValue;
  final Map<String, TestOptionalModel>? mapSubModelValue;

  TestOptionalModel({
    this.intValue,
    this.stringValue,
    this.doubleValue,
    this.boolValue,
    this.dynamicValue,
    this.listValue,
    this.mapValue,
    this.listStringValue,
    this.mapStringValue,
    this.subModelValue,
    this.listSubModelValue,
    this.mapSubModelValue,
  });

  factory TestOptionalModel.fromJson(Map<String, dynamic> json) {
    return _$TestOptionalModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TestOptionalModelToJson(this);

  TestOptionalModel copyWith({
    int? intValue,
    String? stringValue,
    double? doubleValue,
    bool? boolValue,
    dynamic dynamicValue,
    List<dynamic>? listValue,
    Map? mapValue,
    List<String>? listStringValue,
    Map<String, dynamic>? mapStringValue,
    TestOptionalModel? subModelValue,
    List<TestOptionalModel>? listSubModelValue,
    Map<String, TestOptionalModel>? mapSubModelValue,
  }) {
    return TestOptionalModel(
      intValue: intValue ?? this.intValue,
      stringValue: stringValue ?? this.stringValue,
      doubleValue: doubleValue ?? this.doubleValue,
      boolValue: boolValue ?? this.boolValue,
      dynamicValue: dynamicValue ?? this.dynamicValue,
      listValue: listValue ?? this.listValue,
      mapValue: mapValue ?? this.mapValue,
      listStringValue: listStringValue ?? this.listStringValue,
      mapStringValue: mapStringValue ?? this.mapStringValue,
      subModelValue: subModelValue ?? this.subModelValue,
      listSubModelValue: listSubModelValue ?? this.listSubModelValue,
      mapSubModelValue: mapSubModelValue ?? this.mapSubModelValue,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! TestOptionalModel) return false;
    return intValue == other.intValue &&
        stringValue == other.stringValue &&
        doubleValue == other.doubleValue &&
        boolValue == other.boolValue &&
        dynamicValue == other.dynamicValue &&
        listEquals(listValue, other.listValue) &&
        mapEquals(mapValue, other.mapValue) &&
        listEquals(listStringValue, other.listStringValue) &&
        mapEquals(mapStringValue, other.mapStringValue) &&
        subModelValue == other.subModelValue &&
        listEquals(listSubModelValue, other.listSubModelValue) &&
        mapEquals(mapSubModelValue, other.mapSubModelValue);
  }

  @override
  int get hashCode => Object.hash(
        intValue,
        stringValue,
        doubleValue,
        boolValue,
        dynamicValue,
        listValue,
        mapValue,
        listStringValue,
        mapStringValue,
        subModelValue,
        listSubModelValue,
        mapSubModelValue,
      );

  /*
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! TestOptionalModel) return false;
    return runtimeType == other.runtimeType &&
        intValue == other.intValue &&
        stringValue == other.stringValue &&
        doubleValue == other.doubleValue &&
        boolValue == other.boolValue &&
        dynamicValue == other.dynamicValue &&
        listValue == other.listValue &&
        mapValue == other.mapValue &&
        listStringValue == other.listStringValue &&
        mapStringValue == other.mapStringValue &&
        subModelValue == other.subModelValue &&
        listSubModelValue == other.listSubModelValue &&
        mapSubModelValue == other.mapSubModelValue;
  }
  */

  /*
  @override
  int get hashCode =>
      super.hashCode ^
      runtimeType.hashCode ^
      intValue.hashCode ^
      stringValue.hashCode ^
      doubleValue.hashCode ^
      boolValue.hashCode ^
      dynamicValue.hashCode ^
      listValue.hashCode ^
      mapValue.hashCode ^
      listStringValue.hashCode ^
      mapStringValue.hashCode ^
      subModelValue.hashCode ^
      listSubModelValue.hashCode ^
      mapSubModelValue.hashCode;
  */
}
