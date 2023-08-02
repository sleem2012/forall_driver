// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'map_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MapState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() initial,
    required TResult Function(String? error) error,
    required TResult Function() success,
    required TResult Function(Position? p0) updatePosition,
    required TResult Function(double? height) onCameraMove,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? initial,
    TResult? Function(String? error)? error,
    TResult? Function()? success,
    TResult? Function(Position? p0)? updatePosition,
    TResult? Function(double? height)? onCameraMove,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? initial,
    TResult Function(String? error)? error,
    TResult Function()? success,
    TResult Function(Position? p0)? updatePosition,
    TResult Function(double? height)? onCameraMove,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MapStateLoading value) loading,
    required TResult Function(MapStateinitial value) initial,
    required TResult Function(MapStateError value) error,
    required TResult Function(MapStateSuccess value) success,
    required TResult Function(MapStateUpdatePosition value) updatePosition,
    required TResult Function(MapStateOnCameraMove value) onCameraMove,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MapStateLoading value)? loading,
    TResult? Function(MapStateinitial value)? initial,
    TResult? Function(MapStateError value)? error,
    TResult? Function(MapStateSuccess value)? success,
    TResult? Function(MapStateUpdatePosition value)? updatePosition,
    TResult? Function(MapStateOnCameraMove value)? onCameraMove,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MapStateLoading value)? loading,
    TResult Function(MapStateinitial value)? initial,
    TResult Function(MapStateError value)? error,
    TResult Function(MapStateSuccess value)? success,
    TResult Function(MapStateUpdatePosition value)? updatePosition,
    TResult Function(MapStateOnCameraMove value)? onCameraMove,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MapStateCopyWith<$Res> {
  factory $MapStateCopyWith(MapState value, $Res Function(MapState) then) =
      _$MapStateCopyWithImpl<$Res, MapState>;
}

/// @nodoc
class _$MapStateCopyWithImpl<$Res, $Val extends MapState>
    implements $MapStateCopyWith<$Res> {
  _$MapStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$MapStateLoadingCopyWith<$Res> {
  factory _$$MapStateLoadingCopyWith(
          _$MapStateLoading value, $Res Function(_$MapStateLoading) then) =
      __$$MapStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$MapStateLoadingCopyWithImpl<$Res>
    extends _$MapStateCopyWithImpl<$Res, _$MapStateLoading>
    implements _$$MapStateLoadingCopyWith<$Res> {
  __$$MapStateLoadingCopyWithImpl(
      _$MapStateLoading _value, $Res Function(_$MapStateLoading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$MapStateLoading implements MapStateLoading {
  const _$MapStateLoading();

  @override
  String toString() {
    return 'MapState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$MapStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() initial,
    required TResult Function(String? error) error,
    required TResult Function() success,
    required TResult Function(Position? p0) updatePosition,
    required TResult Function(double? height) onCameraMove,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? initial,
    TResult? Function(String? error)? error,
    TResult? Function()? success,
    TResult? Function(Position? p0)? updatePosition,
    TResult? Function(double? height)? onCameraMove,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? initial,
    TResult Function(String? error)? error,
    TResult Function()? success,
    TResult Function(Position? p0)? updatePosition,
    TResult Function(double? height)? onCameraMove,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MapStateLoading value) loading,
    required TResult Function(MapStateinitial value) initial,
    required TResult Function(MapStateError value) error,
    required TResult Function(MapStateSuccess value) success,
    required TResult Function(MapStateUpdatePosition value) updatePosition,
    required TResult Function(MapStateOnCameraMove value) onCameraMove,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MapStateLoading value)? loading,
    TResult? Function(MapStateinitial value)? initial,
    TResult? Function(MapStateError value)? error,
    TResult? Function(MapStateSuccess value)? success,
    TResult? Function(MapStateUpdatePosition value)? updatePosition,
    TResult? Function(MapStateOnCameraMove value)? onCameraMove,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MapStateLoading value)? loading,
    TResult Function(MapStateinitial value)? initial,
    TResult Function(MapStateError value)? error,
    TResult Function(MapStateSuccess value)? success,
    TResult Function(MapStateUpdatePosition value)? updatePosition,
    TResult Function(MapStateOnCameraMove value)? onCameraMove,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class MapStateLoading implements MapState {
  const factory MapStateLoading() = _$MapStateLoading;
}

/// @nodoc
abstract class _$$MapStateinitialCopyWith<$Res> {
  factory _$$MapStateinitialCopyWith(
          _$MapStateinitial value, $Res Function(_$MapStateinitial) then) =
      __$$MapStateinitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$MapStateinitialCopyWithImpl<$Res>
    extends _$MapStateCopyWithImpl<$Res, _$MapStateinitial>
    implements _$$MapStateinitialCopyWith<$Res> {
  __$$MapStateinitialCopyWithImpl(
      _$MapStateinitial _value, $Res Function(_$MapStateinitial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$MapStateinitial implements MapStateinitial {
  const _$MapStateinitial();

  @override
  String toString() {
    return 'MapState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$MapStateinitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() initial,
    required TResult Function(String? error) error,
    required TResult Function() success,
    required TResult Function(Position? p0) updatePosition,
    required TResult Function(double? height) onCameraMove,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? initial,
    TResult? Function(String? error)? error,
    TResult? Function()? success,
    TResult? Function(Position? p0)? updatePosition,
    TResult? Function(double? height)? onCameraMove,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? initial,
    TResult Function(String? error)? error,
    TResult Function()? success,
    TResult Function(Position? p0)? updatePosition,
    TResult Function(double? height)? onCameraMove,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MapStateLoading value) loading,
    required TResult Function(MapStateinitial value) initial,
    required TResult Function(MapStateError value) error,
    required TResult Function(MapStateSuccess value) success,
    required TResult Function(MapStateUpdatePosition value) updatePosition,
    required TResult Function(MapStateOnCameraMove value) onCameraMove,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MapStateLoading value)? loading,
    TResult? Function(MapStateinitial value)? initial,
    TResult? Function(MapStateError value)? error,
    TResult? Function(MapStateSuccess value)? success,
    TResult? Function(MapStateUpdatePosition value)? updatePosition,
    TResult? Function(MapStateOnCameraMove value)? onCameraMove,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MapStateLoading value)? loading,
    TResult Function(MapStateinitial value)? initial,
    TResult Function(MapStateError value)? error,
    TResult Function(MapStateSuccess value)? success,
    TResult Function(MapStateUpdatePosition value)? updatePosition,
    TResult Function(MapStateOnCameraMove value)? onCameraMove,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class MapStateinitial implements MapState {
  const factory MapStateinitial() = _$MapStateinitial;
}

/// @nodoc
abstract class _$$MapStateErrorCopyWith<$Res> {
  factory _$$MapStateErrorCopyWith(
          _$MapStateError value, $Res Function(_$MapStateError) then) =
      __$$MapStateErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({String? error});
}

/// @nodoc
class __$$MapStateErrorCopyWithImpl<$Res>
    extends _$MapStateCopyWithImpl<$Res, _$MapStateError>
    implements _$$MapStateErrorCopyWith<$Res> {
  __$$MapStateErrorCopyWithImpl(
      _$MapStateError _value, $Res Function(_$MapStateError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_$MapStateError(
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$MapStateError implements MapStateError {
  const _$MapStateError({this.error});

  @override
  final String? error;

  @override
  String toString() {
    return 'MapState.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MapStateError &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MapStateErrorCopyWith<_$MapStateError> get copyWith =>
      __$$MapStateErrorCopyWithImpl<_$MapStateError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() initial,
    required TResult Function(String? error) error,
    required TResult Function() success,
    required TResult Function(Position? p0) updatePosition,
    required TResult Function(double? height) onCameraMove,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? initial,
    TResult? Function(String? error)? error,
    TResult? Function()? success,
    TResult? Function(Position? p0)? updatePosition,
    TResult? Function(double? height)? onCameraMove,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? initial,
    TResult Function(String? error)? error,
    TResult Function()? success,
    TResult Function(Position? p0)? updatePosition,
    TResult Function(double? height)? onCameraMove,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MapStateLoading value) loading,
    required TResult Function(MapStateinitial value) initial,
    required TResult Function(MapStateError value) error,
    required TResult Function(MapStateSuccess value) success,
    required TResult Function(MapStateUpdatePosition value) updatePosition,
    required TResult Function(MapStateOnCameraMove value) onCameraMove,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MapStateLoading value)? loading,
    TResult? Function(MapStateinitial value)? initial,
    TResult? Function(MapStateError value)? error,
    TResult? Function(MapStateSuccess value)? success,
    TResult? Function(MapStateUpdatePosition value)? updatePosition,
    TResult? Function(MapStateOnCameraMove value)? onCameraMove,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MapStateLoading value)? loading,
    TResult Function(MapStateinitial value)? initial,
    TResult Function(MapStateError value)? error,
    TResult Function(MapStateSuccess value)? success,
    TResult Function(MapStateUpdatePosition value)? updatePosition,
    TResult Function(MapStateOnCameraMove value)? onCameraMove,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class MapStateError implements MapState {
  const factory MapStateError({final String? error}) = _$MapStateError;

  String? get error;
  @JsonKey(ignore: true)
  _$$MapStateErrorCopyWith<_$MapStateError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MapStateSuccessCopyWith<$Res> {
  factory _$$MapStateSuccessCopyWith(
          _$MapStateSuccess value, $Res Function(_$MapStateSuccess) then) =
      __$$MapStateSuccessCopyWithImpl<$Res>;
}

/// @nodoc
class __$$MapStateSuccessCopyWithImpl<$Res>
    extends _$MapStateCopyWithImpl<$Res, _$MapStateSuccess>
    implements _$$MapStateSuccessCopyWith<$Res> {
  __$$MapStateSuccessCopyWithImpl(
      _$MapStateSuccess _value, $Res Function(_$MapStateSuccess) _then)
      : super(_value, _then);
}

/// @nodoc

class _$MapStateSuccess implements MapStateSuccess {
  const _$MapStateSuccess();

  @override
  String toString() {
    return 'MapState.success()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$MapStateSuccess);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() initial,
    required TResult Function(String? error) error,
    required TResult Function() success,
    required TResult Function(Position? p0) updatePosition,
    required TResult Function(double? height) onCameraMove,
  }) {
    return success();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? initial,
    TResult? Function(String? error)? error,
    TResult? Function()? success,
    TResult? Function(Position? p0)? updatePosition,
    TResult? Function(double? height)? onCameraMove,
  }) {
    return success?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? initial,
    TResult Function(String? error)? error,
    TResult Function()? success,
    TResult Function(Position? p0)? updatePosition,
    TResult Function(double? height)? onCameraMove,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MapStateLoading value) loading,
    required TResult Function(MapStateinitial value) initial,
    required TResult Function(MapStateError value) error,
    required TResult Function(MapStateSuccess value) success,
    required TResult Function(MapStateUpdatePosition value) updatePosition,
    required TResult Function(MapStateOnCameraMove value) onCameraMove,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MapStateLoading value)? loading,
    TResult? Function(MapStateinitial value)? initial,
    TResult? Function(MapStateError value)? error,
    TResult? Function(MapStateSuccess value)? success,
    TResult? Function(MapStateUpdatePosition value)? updatePosition,
    TResult? Function(MapStateOnCameraMove value)? onCameraMove,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MapStateLoading value)? loading,
    TResult Function(MapStateinitial value)? initial,
    TResult Function(MapStateError value)? error,
    TResult Function(MapStateSuccess value)? success,
    TResult Function(MapStateUpdatePosition value)? updatePosition,
    TResult Function(MapStateOnCameraMove value)? onCameraMove,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class MapStateSuccess implements MapState {
  const factory MapStateSuccess() = _$MapStateSuccess;
}

/// @nodoc
abstract class _$$MapStateUpdatePositionCopyWith<$Res> {
  factory _$$MapStateUpdatePositionCopyWith(_$MapStateUpdatePosition value,
          $Res Function(_$MapStateUpdatePosition) then) =
      __$$MapStateUpdatePositionCopyWithImpl<$Res>;
  @useResult
  $Res call({Position? p0});
}

/// @nodoc
class __$$MapStateUpdatePositionCopyWithImpl<$Res>
    extends _$MapStateCopyWithImpl<$Res, _$MapStateUpdatePosition>
    implements _$$MapStateUpdatePositionCopyWith<$Res> {
  __$$MapStateUpdatePositionCopyWithImpl(_$MapStateUpdatePosition _value,
      $Res Function(_$MapStateUpdatePosition) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? p0 = freezed,
  }) {
    return _then(_$MapStateUpdatePosition(
      freezed == p0
          ? _value.p0
          : p0 // ignore: cast_nullable_to_non_nullable
              as Position?,
    ));
  }
}

/// @nodoc

class _$MapStateUpdatePosition implements MapStateUpdatePosition {
  const _$MapStateUpdatePosition(this.p0);

  @override
  final Position? p0;

  @override
  String toString() {
    return 'MapState.updatePosition(p0: $p0)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MapStateUpdatePosition &&
            (identical(other.p0, p0) || other.p0 == p0));
  }

  @override
  int get hashCode => Object.hash(runtimeType, p0);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MapStateUpdatePositionCopyWith<_$MapStateUpdatePosition> get copyWith =>
      __$$MapStateUpdatePositionCopyWithImpl<_$MapStateUpdatePosition>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() initial,
    required TResult Function(String? error) error,
    required TResult Function() success,
    required TResult Function(Position? p0) updatePosition,
    required TResult Function(double? height) onCameraMove,
  }) {
    return updatePosition(p0);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? initial,
    TResult? Function(String? error)? error,
    TResult? Function()? success,
    TResult? Function(Position? p0)? updatePosition,
    TResult? Function(double? height)? onCameraMove,
  }) {
    return updatePosition?.call(p0);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? initial,
    TResult Function(String? error)? error,
    TResult Function()? success,
    TResult Function(Position? p0)? updatePosition,
    TResult Function(double? height)? onCameraMove,
    required TResult orElse(),
  }) {
    if (updatePosition != null) {
      return updatePosition(p0);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MapStateLoading value) loading,
    required TResult Function(MapStateinitial value) initial,
    required TResult Function(MapStateError value) error,
    required TResult Function(MapStateSuccess value) success,
    required TResult Function(MapStateUpdatePosition value) updatePosition,
    required TResult Function(MapStateOnCameraMove value) onCameraMove,
  }) {
    return updatePosition(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MapStateLoading value)? loading,
    TResult? Function(MapStateinitial value)? initial,
    TResult? Function(MapStateError value)? error,
    TResult? Function(MapStateSuccess value)? success,
    TResult? Function(MapStateUpdatePosition value)? updatePosition,
    TResult? Function(MapStateOnCameraMove value)? onCameraMove,
  }) {
    return updatePosition?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MapStateLoading value)? loading,
    TResult Function(MapStateinitial value)? initial,
    TResult Function(MapStateError value)? error,
    TResult Function(MapStateSuccess value)? success,
    TResult Function(MapStateUpdatePosition value)? updatePosition,
    TResult Function(MapStateOnCameraMove value)? onCameraMove,
    required TResult orElse(),
  }) {
    if (updatePosition != null) {
      return updatePosition(this);
    }
    return orElse();
  }
}

abstract class MapStateUpdatePosition implements MapState {
  const factory MapStateUpdatePosition(final Position? p0) =
      _$MapStateUpdatePosition;

  Position? get p0;
  @JsonKey(ignore: true)
  _$$MapStateUpdatePositionCopyWith<_$MapStateUpdatePosition> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MapStateOnCameraMoveCopyWith<$Res> {
  factory _$$MapStateOnCameraMoveCopyWith(_$MapStateOnCameraMove value,
          $Res Function(_$MapStateOnCameraMove) then) =
      __$$MapStateOnCameraMoveCopyWithImpl<$Res>;
  @useResult
  $Res call({double? height});
}

/// @nodoc
class __$$MapStateOnCameraMoveCopyWithImpl<$Res>
    extends _$MapStateCopyWithImpl<$Res, _$MapStateOnCameraMove>
    implements _$$MapStateOnCameraMoveCopyWith<$Res> {
  __$$MapStateOnCameraMoveCopyWithImpl(_$MapStateOnCameraMove _value,
      $Res Function(_$MapStateOnCameraMove) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? height = freezed,
  }) {
    return _then(_$MapStateOnCameraMove(
      height: freezed == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc

class _$MapStateOnCameraMove implements MapStateOnCameraMove {
  const _$MapStateOnCameraMove({this.height});

  @override
  final double? height;

  @override
  String toString() {
    return 'MapState.onCameraMove(height: $height)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MapStateOnCameraMove &&
            (identical(other.height, height) || other.height == height));
  }

  @override
  int get hashCode => Object.hash(runtimeType, height);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MapStateOnCameraMoveCopyWith<_$MapStateOnCameraMove> get copyWith =>
      __$$MapStateOnCameraMoveCopyWithImpl<_$MapStateOnCameraMove>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() initial,
    required TResult Function(String? error) error,
    required TResult Function() success,
    required TResult Function(Position? p0) updatePosition,
    required TResult Function(double? height) onCameraMove,
  }) {
    return onCameraMove(height);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? initial,
    TResult? Function(String? error)? error,
    TResult? Function()? success,
    TResult? Function(Position? p0)? updatePosition,
    TResult? Function(double? height)? onCameraMove,
  }) {
    return onCameraMove?.call(height);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? initial,
    TResult Function(String? error)? error,
    TResult Function()? success,
    TResult Function(Position? p0)? updatePosition,
    TResult Function(double? height)? onCameraMove,
    required TResult orElse(),
  }) {
    if (onCameraMove != null) {
      return onCameraMove(height);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MapStateLoading value) loading,
    required TResult Function(MapStateinitial value) initial,
    required TResult Function(MapStateError value) error,
    required TResult Function(MapStateSuccess value) success,
    required TResult Function(MapStateUpdatePosition value) updatePosition,
    required TResult Function(MapStateOnCameraMove value) onCameraMove,
  }) {
    return onCameraMove(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MapStateLoading value)? loading,
    TResult? Function(MapStateinitial value)? initial,
    TResult? Function(MapStateError value)? error,
    TResult? Function(MapStateSuccess value)? success,
    TResult? Function(MapStateUpdatePosition value)? updatePosition,
    TResult? Function(MapStateOnCameraMove value)? onCameraMove,
  }) {
    return onCameraMove?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MapStateLoading value)? loading,
    TResult Function(MapStateinitial value)? initial,
    TResult Function(MapStateError value)? error,
    TResult Function(MapStateSuccess value)? success,
    TResult Function(MapStateUpdatePosition value)? updatePosition,
    TResult Function(MapStateOnCameraMove value)? onCameraMove,
    required TResult orElse(),
  }) {
    if (onCameraMove != null) {
      return onCameraMove(this);
    }
    return orElse();
  }
}

abstract class MapStateOnCameraMove implements MapState {
  const factory MapStateOnCameraMove({final double? height}) =
      _$MapStateOnCameraMove;

  double? get height;
  @JsonKey(ignore: true)
  _$$MapStateOnCameraMoveCopyWith<_$MapStateOnCameraMove> get copyWith =>
      throw _privateConstructorUsedError;
}
