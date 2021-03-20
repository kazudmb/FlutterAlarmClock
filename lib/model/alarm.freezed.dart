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

  _Alarm call({required int userId, required List<AlarmInfo> alarms}) {
    return _Alarm(
      userId: userId,
      alarms: alarms,
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
  int get userId => throw _privateConstructorUsedError;
  List<AlarmInfo> get alarms => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AlarmCopyWith<Alarm> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AlarmCopyWith<$Res> {
  factory $AlarmCopyWith(Alarm value, $Res Function(Alarm) then) =
      _$AlarmCopyWithImpl<$Res>;
  $Res call({int userId, List<AlarmInfo> alarms});
}

/// @nodoc
class _$AlarmCopyWithImpl<$Res> implements $AlarmCopyWith<$Res> {
  _$AlarmCopyWithImpl(this._value, this._then);

  final Alarm _value;
  // ignore: unused_field
  final $Res Function(Alarm) _then;

  @override
  $Res call({
    Object? userId = freezed,
    Object? alarms = freezed,
  }) {
    return _then(_value.copyWith(
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      alarms: alarms == freezed
          ? _value.alarms
          : alarms // ignore: cast_nullable_to_non_nullable
              as List<AlarmInfo>,
    ));
  }
}

/// @nodoc
abstract class _$AlarmCopyWith<$Res> implements $AlarmCopyWith<$Res> {
  factory _$AlarmCopyWith(_Alarm value, $Res Function(_Alarm) then) =
      __$AlarmCopyWithImpl<$Res>;
  @override
  $Res call({int userId, List<AlarmInfo> alarms});
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
    Object? userId = freezed,
    Object? alarms = freezed,
  }) {
    return _then(_Alarm(
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      alarms: alarms == freezed
          ? _value.alarms
          : alarms // ignore: cast_nullable_to_non_nullable
              as List<AlarmInfo>,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_Alarm implements _Alarm {
  const _$_Alarm({required this.userId, required this.alarms});

  factory _$_Alarm.fromJson(Map<String, dynamic> json) =>
      _$_$_AlarmFromJson(json);

  @override
  final int userId;
  @override
  final List<AlarmInfo> alarms;

  @override
  String toString() {
    return 'Alarm(userId: $userId, alarms: $alarms)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Alarm &&
            (identical(other.userId, userId) ||
                const DeepCollectionEquality().equals(other.userId, userId)) &&
            (identical(other.alarms, alarms) ||
                const DeepCollectionEquality().equals(other.alarms, alarms)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(userId) ^
      const DeepCollectionEquality().hash(alarms);

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
  const factory _Alarm({required int userId, required List<AlarmInfo> alarms}) =
      _$_Alarm;

  factory _Alarm.fromJson(Map<String, dynamic> json) = _$_Alarm.fromJson;

  @override
  int get userId => throw _privateConstructorUsedError;
  @override
  List<AlarmInfo> get alarms => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$AlarmCopyWith<_Alarm> get copyWith => throw _privateConstructorUsedError;
}
