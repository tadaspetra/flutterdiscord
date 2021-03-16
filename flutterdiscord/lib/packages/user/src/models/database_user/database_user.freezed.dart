// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'database_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$DatabaseUserTearOff {
  const _$DatabaseUserTearOff();

  _DatabaseUser call(
      {required String uid, required String email, String? name}) {
    return _DatabaseUser(
      uid: uid,
      email: email,
      name: name,
    );
  }
}

/// @nodoc
const $DatabaseUser = _$DatabaseUserTearOff();

/// @nodoc
mixin _$DatabaseUser {
  String get uid => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DatabaseUserCopyWith<DatabaseUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DatabaseUserCopyWith<$Res> {
  factory $DatabaseUserCopyWith(
          DatabaseUser value, $Res Function(DatabaseUser) then) =
      _$DatabaseUserCopyWithImpl<$Res>;
  $Res call({String uid, String email, String? name});
}

/// @nodoc
class _$DatabaseUserCopyWithImpl<$Res> implements $DatabaseUserCopyWith<$Res> {
  _$DatabaseUserCopyWithImpl(this._value, this._then);

  final DatabaseUser _value;
  // ignore: unused_field
  final $Res Function(DatabaseUser) _then;

  @override
  $Res call({
    Object? uid = freezed,
    Object? email = freezed,
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      uid: uid == freezed ? _value.uid : uid as String,
      email: email == freezed ? _value.email : email as String,
      name: name == freezed ? _value.name : name as String?,
    ));
  }
}

/// @nodoc
abstract class _$DatabaseUserCopyWith<$Res>
    implements $DatabaseUserCopyWith<$Res> {
  factory _$DatabaseUserCopyWith(
          _DatabaseUser value, $Res Function(_DatabaseUser) then) =
      __$DatabaseUserCopyWithImpl<$Res>;
  @override
  $Res call({String uid, String email, String? name});
}

/// @nodoc
class __$DatabaseUserCopyWithImpl<$Res> extends _$DatabaseUserCopyWithImpl<$Res>
    implements _$DatabaseUserCopyWith<$Res> {
  __$DatabaseUserCopyWithImpl(
      _DatabaseUser _value, $Res Function(_DatabaseUser) _then)
      : super(_value, (v) => _then(v as _DatabaseUser));

  @override
  _DatabaseUser get _value => super._value as _DatabaseUser;

  @override
  $Res call({
    Object? uid = freezed,
    Object? email = freezed,
    Object? name = freezed,
  }) {
    return _then(_DatabaseUser(
      uid: uid == freezed ? _value.uid : uid as String,
      email: email == freezed ? _value.email : email as String,
      name: name == freezed ? _value.name : name as String?,
    ));
  }
}

/// @nodoc
class _$_DatabaseUser implements _DatabaseUser {
  const _$_DatabaseUser({required this.uid, required this.email, this.name});

  @override
  final String uid;
  @override
  final String email;
  @override
  final String? name;

  @override
  String toString() {
    return 'DatabaseUser(uid: $uid, email: $email, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _DatabaseUser &&
            (identical(other.uid, uid) ||
                const DeepCollectionEquality().equals(other.uid, uid)) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(uid) ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(name);

  @JsonKey(ignore: true)
  @override
  _$DatabaseUserCopyWith<_DatabaseUser> get copyWith =>
      __$DatabaseUserCopyWithImpl<_DatabaseUser>(this, _$identity);
}

abstract class _DatabaseUser implements DatabaseUser {
  const factory _DatabaseUser(
      {required String uid,
      required String email,
      String? name}) = _$_DatabaseUser;

  @override
  String get uid => throw _privateConstructorUsedError;
  @override
  String get email => throw _privateConstructorUsedError;
  @override
  String? get name => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$DatabaseUserCopyWith<_DatabaseUser> get copyWith =>
      throw _privateConstructorUsedError;
}
