// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'alarm_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AlarmInfo _$AlarmInfoFromJson(Map<String, dynamic> json) {
  return _AlarmInfo.fromJson(json);
}

/// @nodoc
class _$AlarmInfoTearOff {
  const _$AlarmInfoTearOff();

  _AlarmInfo call(
      {required int id,
      required String title,
      required DateTime alarmDateTime,
      required int isPending,
      required int gradientColorIndex,
      required String repeat}) {
    return _AlarmInfo(
      id: id,
      title: title,
      alarmDateTime: alarmDateTime,
      isPending: isPending,
      gradientColorIndex: gradientColorIndex,
      repeat: repeat,
    );
  }

  AlarmInfo fromJson(Map<String, Object> json) {
    return AlarmInfo.fromJson(json);
  }
}

/// @nodoc
const $AlarmInfo = _$AlarmInfoTearOff();

/// @nodoc
mixin _$AlarmInfo {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  DateTime get alarmDateTime => throw _privateConstructorUsedError;
  int get isPending => throw _privateConstructorUsedError;
  int get gradientColorIndex => throw _privateConstructorUsedError;
  String get repeat => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AlarmInfoCopyWith<AlarmInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AlarmInfoCopyWith<$Res> {
  factory $AlarmInfoCopyWith(AlarmInfo value, $Res Function(AlarmInfo) then) =
      _$AlarmInfoCopyWithImpl<$Res>;
  $Res call(
      {int id,
      String title,
      DateTime alarmDateTime,
      int isPending,
      int gradientColorIndex,
      String repeat});
}

/// @nodoc
class _$AlarmInfoCopyWithImpl<$Res> implements $AlarmInfoCopyWith<$Res> {
  _$AlarmInfoCopyWithImpl(this._value, this._then);

  final AlarmInfo _value;
  // ignore: unused_field
  final $Res Function(AlarmInfo) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? alarmDateTime = freezed,
    Object? isPending = freezed,
    Object? gradientColorIndex = freezed,
    Object? repeat = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
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
abstract class _$AlarmInfoCopyWith<$Res> implements $AlarmInfoCopyWith<$Res> {
  factory _$AlarmInfoCopyWith(
          _AlarmInfo value, $Res Function(_AlarmInfo) then) =
      __$AlarmInfoCopyWithImpl<$Res>;
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
class __$AlarmInfoCopyWithImpl<$Res> extends _$AlarmInfoCopyWithImpl<$Res>
    implements _$AlarmInfoCopyWith<$Res> {
  __$AlarmInfoCopyWithImpl(_AlarmInfo _value, $Res Function(_AlarmInfo) _then)
      : super(_value, (v) => _then(v as _AlarmInfo));

  @override
  _AlarmInfo get _value => super._value as _AlarmInfo;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? alarmDateTime = freezed,
    Object? isPending = freezed,
    Object? gradientColorIndex = freezed,
    Object? repeat = freezed,
  }) {
    return _then(_AlarmInfo(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
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
class _$_AlarmInfo implements _AlarmInfo {
  const _$_AlarmInfo(
      {required this.id,
      required this.title,
      required this.alarmDateTime,
      required this.isPending,
      required this.gradientColorIndex,
      required this.repeat});

  factory _$_AlarmInfo.fromJson(Map<String, dynamic> json) =>
      _$_$_AlarmInfoFromJson(json);

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
    return 'AlarmInfo(id: $id, title: $title, alarmDateTime: $alarmDateTime, isPending: $isPending, gradientColorIndex: $gradientColorIndex, repeat: $repeat)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AlarmInfo &&
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
  _$AlarmInfoCopyWith<_AlarmInfo> get copyWith =>
      __$AlarmInfoCopyWithImpl<_AlarmInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_AlarmInfoToJson(this);
  }
}

abstract class _AlarmInfo implements AlarmInfo {
  const factory _AlarmInfo(
      {required int id,
      required String title,
      required DateTime alarmDateTime,
      required int isPending,
      required int gradientColorIndex,
      required String repeat}) = _$_AlarmInfo;

  factory _AlarmInfo.fromJson(Map<String, dynamic> json) =
      _$_AlarmInfo.fromJson;

  @override
  int get id => throw _privateConstructorUsedError;
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
  _$AlarmInfoCopyWith<_AlarmInfo> get copyWith =>
      throw _privateConstructorUsedError;
}
