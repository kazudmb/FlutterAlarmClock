// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'timer.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Timer _$TimerFromJson(Map<String, dynamic> json) {
  return _Timer.fromJson(json);
}

/// @nodoc
class _$TimerTearOff {
  const _$TimerTearOff();

  _Timer call({int? timerId, required DateTime alarmDateTime}) {
    return _Timer(
      timerId: timerId,
      alarmDateTime: alarmDateTime,
    );
  }

  Timer fromJson(Map<String, Object> json) {
    return Timer.fromJson(json);
  }
}

/// @nodoc
const $Timer = _$TimerTearOff();

/// @nodoc
mixin _$Timer {
  int? get timerId => throw _privateConstructorUsedError;
  DateTime get alarmDateTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TimerCopyWith<Timer> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimerCopyWith<$Res> {
  factory $TimerCopyWith(Timer value, $Res Function(Timer) then) =
      _$TimerCopyWithImpl<$Res>;
  $Res call({int? timerId, DateTime alarmDateTime});
}

/// @nodoc
class _$TimerCopyWithImpl<$Res> implements $TimerCopyWith<$Res> {
  _$TimerCopyWithImpl(this._value, this._then);

  final Timer _value;
  // ignore: unused_field
  final $Res Function(Timer) _then;

  @override
  $Res call({
    Object? timerId = freezed,
    Object? alarmDateTime = freezed,
  }) {
    return _then(_value.copyWith(
      timerId: timerId == freezed
          ? _value.timerId
          : timerId // ignore: cast_nullable_to_non_nullable
              as int?,
      alarmDateTime: alarmDateTime == freezed
          ? _value.alarmDateTime
          : alarmDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
abstract class _$TimerCopyWith<$Res> implements $TimerCopyWith<$Res> {
  factory _$TimerCopyWith(_Timer value, $Res Function(_Timer) then) =
      __$TimerCopyWithImpl<$Res>;
  @override
  $Res call({int? timerId, DateTime alarmDateTime});
}

/// @nodoc
class __$TimerCopyWithImpl<$Res> extends _$TimerCopyWithImpl<$Res>
    implements _$TimerCopyWith<$Res> {
  __$TimerCopyWithImpl(_Timer _value, $Res Function(_Timer) _then)
      : super(_value, (v) => _then(v as _Timer));

  @override
  _Timer get _value => super._value as _Timer;

  @override
  $Res call({
    Object? timerId = freezed,
    Object? alarmDateTime = freezed,
  }) {
    return _then(_Timer(
      timerId: timerId == freezed
          ? _value.timerId
          : timerId // ignore: cast_nullable_to_non_nullable
              as int?,
      alarmDateTime: alarmDateTime == freezed
          ? _value.alarmDateTime
          : alarmDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_Timer implements _Timer {
  const _$_Timer({this.timerId, required this.alarmDateTime});

  factory _$_Timer.fromJson(Map<String, dynamic> json) =>
      _$_$_TimerFromJson(json);

  @override
  final int? timerId;
  @override
  final DateTime alarmDateTime;

  @override
  String toString() {
    return 'Timer(timerId: $timerId, alarmDateTime: $alarmDateTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Timer &&
            (identical(other.timerId, timerId) ||
                const DeepCollectionEquality()
                    .equals(other.timerId, timerId)) &&
            (identical(other.alarmDateTime, alarmDateTime) ||
                const DeepCollectionEquality()
                    .equals(other.alarmDateTime, alarmDateTime)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(timerId) ^
      const DeepCollectionEquality().hash(alarmDateTime);

  @JsonKey(ignore: true)
  @override
  _$TimerCopyWith<_Timer> get copyWith =>
      __$TimerCopyWithImpl<_Timer>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_TimerToJson(this);
  }
}

abstract class _Timer implements Timer {
  const factory _Timer({int? timerId, required DateTime alarmDateTime}) =
      _$_Timer;

  factory _Timer.fromJson(Map<String, dynamic> json) = _$_Timer.fromJson;

  @override
  int? get timerId => throw _privateConstructorUsedError;
  @override
  DateTime get alarmDateTime => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$TimerCopyWith<_Timer> get copyWith => throw _privateConstructorUsedError;
}
