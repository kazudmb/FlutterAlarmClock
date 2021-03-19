// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'alarm.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
Alarm _$AlarmFromJson(Map<String, dynamic> json) {
  return _Alarm.fromJson(json);
}

/// @nodoc
class _$AlarmTearOff {
  const _$AlarmTearOff();

// ignore: unused_element
  _Alarm call(
      {int id,
      String title,
      DateTime alarmDateTime,
      int isPending,
      int gradientColorIndex,
      String repeat}) {
    return _Alarm(
      id: id,
      title: title,
      alarmDateTime: alarmDateTime,
      isPending: isPending,
      gradientColorIndex: gradientColorIndex,
      repeat: repeat,
    );
  }

// ignore: unused_element
  Alarm fromJson(Map<String, Object> json) {
    return Alarm.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $Alarm = _$AlarmTearOff();

/// @nodoc
mixin _$Alarm {
  int get id;
  String get title;
  DateTime get alarmDateTime;
  int get isPending;
  int get gradientColorIndex;
  String get repeat;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $AlarmCopyWith<Alarm> get copyWith;
}

/// @nodoc
abstract class $AlarmCopyWith<$Res> {
  factory $AlarmCopyWith(Alarm value, $Res Function(Alarm) then) =
      _$AlarmCopyWithImpl<$Res>;
  $Res call(
      {int id,
      String title,
      DateTime alarmDateTime,
      int isPending,
      int gradientColorIndex,
      String repeat});
}

/// @nodoc
class _$AlarmCopyWithImpl<$Res> implements $AlarmCopyWith<$Res> {
  _$AlarmCopyWithImpl(this._value, this._then);

  final Alarm _value;
  // ignore: unused_field
  final $Res Function(Alarm) _then;

  @override
  $Res call({
    Object id = freezed,
    Object title = freezed,
    Object alarmDateTime = freezed,
    Object isPending = freezed,
    Object gradientColorIndex = freezed,
    Object repeat = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as int,
      title: title == freezed ? _value.title : title as String,
      alarmDateTime: alarmDateTime == freezed
          ? _value.alarmDateTime
          : alarmDateTime as DateTime,
      isPending: isPending == freezed ? _value.isPending : isPending as int,
      gradientColorIndex: gradientColorIndex == freezed
          ? _value.gradientColorIndex
          : gradientColorIndex as int,
      repeat: repeat == freezed ? _value.repeat : repeat as String,
    ));
  }
}

/// @nodoc
abstract class _$AlarmCopyWith<$Res> implements $AlarmCopyWith<$Res> {
  factory _$AlarmCopyWith(_Alarm value, $Res Function(_Alarm) then) =
      __$AlarmCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      String title,
      DateTime alarmDateTime,
      int isPending,
      int gradientColorIndex,
      String repeat});
}

/// @nodoc
class __$AlarmCopyWithImpl<$Res> extends _$AlarmCopyWithImpl<$Res>
    implements _$AlarmCopyWith<$Res> {
  __$AlarmCopyWithImpl(_Alarm _value, $Res Function(_Alarm) _then)
      : super(_value, (v) => _then(v as _Alarm));

  @override
  _Alarm get _value => super._value as _Alarm;

  @override
  $Res call({
    Object id = freezed,
    Object title = freezed,
    Object alarmDateTime = freezed,
    Object isPending = freezed,
    Object gradientColorIndex = freezed,
    Object repeat = freezed,
  }) {
    return _then(_Alarm(
      id: id == freezed ? _value.id : id as int,
      title: title == freezed ? _value.title : title as String,
      alarmDateTime: alarmDateTime == freezed
          ? _value.alarmDateTime
          : alarmDateTime as DateTime,
      isPending: isPending == freezed ? _value.isPending : isPending as int,
      gradientColorIndex: gradientColorIndex == freezed
          ? _value.gradientColorIndex
          : gradientColorIndex as int,
      repeat: repeat == freezed ? _value.repeat : repeat as String,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_Alarm implements _Alarm {
  _$_Alarm(
      {this.id,
      this.title,
      this.alarmDateTime,
      this.isPending,
      this.gradientColorIndex,
      this.repeat});

  factory _$_Alarm.fromJson(Map<String, dynamic> json) =>
      _$_$_AlarmFromJson(json);

  @override
  final int id;
  @override
  final String title;
  @override
  final DateTime alarmDateTime;
  @override
  final int isPending;
  @override
  final int gradientColorIndex;
  @override
  final String repeat;

  @override
  String toString() {
    return 'Alarm(id: $id, title: $title, alarmDateTime: $alarmDateTime, isPending: $isPending, gradientColorIndex: $gradientColorIndex, repeat: $repeat)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Alarm &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.alarmDateTime, alarmDateTime) ||
                const DeepCollectionEquality()
                    .equals(other.alarmDateTime, alarmDateTime)) &&
            (identical(other.isPending, isPending) ||
                const DeepCollectionEquality()
                    .equals(other.isPending, isPending)) &&
            (identical(other.gradientColorIndex, gradientColorIndex) ||
                const DeepCollectionEquality()
                    .equals(other.gradientColorIndex, gradientColorIndex)) &&
            (identical(other.repeat, repeat) ||
                const DeepCollectionEquality().equals(other.repeat, repeat)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(alarmDateTime) ^
      const DeepCollectionEquality().hash(isPending) ^
      const DeepCollectionEquality().hash(gradientColorIndex) ^
      const DeepCollectionEquality().hash(repeat);

  @JsonKey(ignore: true)
  @override
  _$AlarmCopyWith<_Alarm> get copyWith =>
      __$AlarmCopyWithImpl<_Alarm>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_AlarmToJson(this);
  }
}

abstract class _Alarm implements Alarm {
  factory _Alarm(
      {int id,
      String title,
      DateTime alarmDateTime,
      int isPending,
      int gradientColorIndex,
      String repeat}) = _$_Alarm;

  factory _Alarm.fromJson(Map<String, dynamic> json) = _$_Alarm.fromJson;

  @override
  int get id;
  @override
  String get title;
  @override
  DateTime get alarmDateTime;
  @override
  int get isPending;
  @override
  int get gradientColorIndex;
  @override
  String get repeat;
  @override
  @JsonKey(ignore: true)
  _$AlarmCopyWith<_Alarm> get copyWith;
}
