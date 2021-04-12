// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'alarm.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Alarm _$AlarmFromJson(Map<String, dynamic> json) {
  return _Alarm.fromJson(json);
}

/// @nodoc
class _$AlarmTearOff {
  const _$AlarmTearOff();

  _Alarm call(
      {required int alarmId,
      required String title,
      required DateTime alarmDateTime,
      required int isPending,
      required int gradientColorIndex,
      required String repeat}) {
    return _Alarm(
      alarmId: alarmId,
      title: title,
      alarmDateTime: alarmDateTime,
      isPending: isPending,
      gradientColorIndex: gradientColorIndex,
      repeat: repeat,
    );
  }

  Alarm fromJson(Map<String, Object> json) {
    return Alarm.fromJson(json);
  }
}

/// @nodoc
const $Alarm = _$AlarmTearOff();

/// @nodoc
mixin _$Alarm {
  int get alarmId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  DateTime get alarmDateTime => throw _privateConstructorUsedError;
  int get isPending => throw _privateConstructorUsedError;
  int get gradientColorIndex => throw _privateConstructorUsedError;
  String get repeat => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AlarmCopyWith<Alarm> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AlarmCopyWith<$Res> {
  factory $AlarmCopyWith(Alarm value, $Res Function(Alarm) then) =
      _$AlarmCopyWithImpl<$Res>;
  $Res call(
      {int alarmId,
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
    Object? alarmId = freezed,
    Object? title = freezed,
    Object? alarmDateTime = freezed,
    Object? isPending = freezed,
    Object? gradientColorIndex = freezed,
    Object? repeat = freezed,
  }) {
    return _then(_value.copyWith(
      alarmId: alarmId == freezed
          ? _value.alarmId
          : alarmId // ignore: cast_nullable_to_non_nullable
              as int,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      alarmDateTime: alarmDateTime == freezed
          ? _value.alarmDateTime
          : alarmDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isPending: isPending == freezed
          ? _value.isPending
          : isPending // ignore: cast_nullable_to_non_nullable
              as int,
      gradientColorIndex: gradientColorIndex == freezed
          ? _value.gradientColorIndex
          : gradientColorIndex // ignore: cast_nullable_to_non_nullable
              as int,
      repeat: repeat == freezed
          ? _value.repeat
          : repeat // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$AlarmCopyWith<$Res> implements $AlarmCopyWith<$Res> {
  factory _$AlarmCopyWith(_Alarm value, $Res Function(_Alarm) then) =
      __$AlarmCopyWithImpl<$Res>;
  @override
  $Res call(
      {int alarmId,
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
    Object? alarmId = freezed,
    Object? title = freezed,
    Object? alarmDateTime = freezed,
    Object? isPending = freezed,
    Object? gradientColorIndex = freezed,
    Object? repeat = freezed,
  }) {
    return _then(_Alarm(
      alarmId: alarmId == freezed
          ? _value.alarmId
          : alarmId // ignore: cast_nullable_to_non_nullable
              as int,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      alarmDateTime: alarmDateTime == freezed
          ? _value.alarmDateTime
          : alarmDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isPending: isPending == freezed
          ? _value.isPending
          : isPending // ignore: cast_nullable_to_non_nullable
              as int,
      gradientColorIndex: gradientColorIndex == freezed
          ? _value.gradientColorIndex
          : gradientColorIndex // ignore: cast_nullable_to_non_nullable
              as int,
      repeat: repeat == freezed
          ? _value.repeat
          : repeat // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_Alarm implements _Alarm {
  const _$_Alarm(
      {required this.alarmId,
      required this.title,
      required this.alarmDateTime,
      required this.isPending,
      required this.gradientColorIndex,
      required this.repeat});

  factory _$_Alarm.fromJson(Map<String, dynamic> json) =>
      _$_$_AlarmFromJson(json);

  @override
  final int alarmId;
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
    return 'Alarm(alarmId: $alarmId, title: $title, alarmDateTime: $alarmDateTime, isPending: $isPending, gradientColorIndex: $gradientColorIndex, repeat: $repeat)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Alarm &&
            (identical(other.alarmId, alarmId) ||
                const DeepCollectionEquality()
                    .equals(other.alarmId, alarmId)) &&
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
      const DeepCollectionEquality().hash(alarmId) ^
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
  const factory _Alarm(
      {required int alarmId,
      required String title,
      required DateTime alarmDateTime,
      required int isPending,
      required int gradientColorIndex,
      required String repeat}) = _$_Alarm;

  factory _Alarm.fromJson(Map<String, dynamic> json) = _$_Alarm.fromJson;

  @override
  int get alarmId => throw _privateConstructorUsedError;
  @override
  String get title => throw _privateConstructorUsedError;
  @override
  DateTime get alarmDateTime => throw _privateConstructorUsedError;
  @override
  int get isPending => throw _privateConstructorUsedError;
  @override
  int get gradientColorIndex => throw _privateConstructorUsedError;
  @override
  String get repeat => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$AlarmCopyWith<_Alarm> get copyWith => throw _privateConstructorUsedError;
}
