// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'range_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RangeState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() initial,
    required TResult Function(String? error) error,
    required TResult Function() success,
    required TResult Function(double range) changeRange,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? initial,
    TResult? Function(String? error)? error,
    TResult? Function()? success,
    TResult? Function(double range)? changeRange,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? initial,
    TResult Function(String? error)? error,
    TResult Function()? success,
    TResult Function(double range)? changeRange,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RangeStateLoading value) loading,
    required TResult Function(RangeStateinitial value) initial,
    required TResult Function(RangeStateError value) error,
    required TResult Function(RangeStateSuccess value) success,
    required TResult Function(RangeStateChangeRange value) changeRange,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RangeStateLoading value)? loading,
    TResult? Function(RangeStateinitial value)? initial,
    TResult? Function(RangeStateError value)? error,
    TResult? Function(RangeStateSuccess value)? success,
    TResult? Function(RangeStateChangeRange value)? changeRange,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RangeStateLoading value)? loading,
    TResult Function(RangeStateinitial value)? initial,
    TResult Function(RangeStateError value)? error,
    TResult Function(RangeStateSuccess value)? success,
    TResult Function(RangeStateChangeRange value)? changeRange,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RangeStateCopyWith<$Res> {
  factory $RangeStateCopyWith(
          RangeState value, $Res Function(RangeState) then) =
      _$RangeStateCopyWithImpl<$Res, RangeState>;
}

/// @nodoc
class _$RangeStateCopyWithImpl<$Res, $Val extends RangeState>
    implements $RangeStateCopyWith<$Res> {
  _$RangeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$RangeStateLoadingCopyWith<$Res> {
  factory _$$RangeStateLoadingCopyWith(
          _$RangeStateLoading value, $Res Function(_$RangeStateLoading) then) =
      __$$RangeStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RangeStateLoadingCopyWithImpl<$Res>
    extends _$RangeStateCopyWithImpl<$Res, _$RangeStateLoading>
    implements _$$RangeStateLoadingCopyWith<$Res> {
  __$$RangeStateLoadingCopyWithImpl(
      _$RangeStateLoading _value, $Res Function(_$RangeStateLoading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$RangeStateLoading implements RangeStateLoading {
  const _$RangeStateLoading();

  @override
  String toString() {
    return 'RangeState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RangeStateLoading);
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
    required TResult Function(double range) changeRange,
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
    TResult? Function(double range)? changeRange,
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
    TResult Function(double range)? changeRange,
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
    required TResult Function(RangeStateLoading value) loading,
    required TResult Function(RangeStateinitial value) initial,
    required TResult Function(RangeStateError value) error,
    required TResult Function(RangeStateSuccess value) success,
    required TResult Function(RangeStateChangeRange value) changeRange,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RangeStateLoading value)? loading,
    TResult? Function(RangeStateinitial value)? initial,
    TResult? Function(RangeStateError value)? error,
    TResult? Function(RangeStateSuccess value)? success,
    TResult? Function(RangeStateChangeRange value)? changeRange,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RangeStateLoading value)? loading,
    TResult Function(RangeStateinitial value)? initial,
    TResult Function(RangeStateError value)? error,
    TResult Function(RangeStateSuccess value)? success,
    TResult Function(RangeStateChangeRange value)? changeRange,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class RangeStateLoading implements RangeState {
  const factory RangeStateLoading() = _$RangeStateLoading;
}

/// @nodoc
abstract class _$$RangeStateinitialCopyWith<$Res> {
  factory _$$RangeStateinitialCopyWith(
          _$RangeStateinitial value, $Res Function(_$RangeStateinitial) then) =
      __$$RangeStateinitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RangeStateinitialCopyWithImpl<$Res>
    extends _$RangeStateCopyWithImpl<$Res, _$RangeStateinitial>
    implements _$$RangeStateinitialCopyWith<$Res> {
  __$$RangeStateinitialCopyWithImpl(
      _$RangeStateinitial _value, $Res Function(_$RangeStateinitial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$RangeStateinitial implements RangeStateinitial {
  const _$RangeStateinitial();

  @override
  String toString() {
    return 'RangeState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RangeStateinitial);
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
    required TResult Function(double range) changeRange,
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
    TResult? Function(double range)? changeRange,
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
    TResult Function(double range)? changeRange,
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
    required TResult Function(RangeStateLoading value) loading,
    required TResult Function(RangeStateinitial value) initial,
    required TResult Function(RangeStateError value) error,
    required TResult Function(RangeStateSuccess value) success,
    required TResult Function(RangeStateChangeRange value) changeRange,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RangeStateLoading value)? loading,
    TResult? Function(RangeStateinitial value)? initial,
    TResult? Function(RangeStateError value)? error,
    TResult? Function(RangeStateSuccess value)? success,
    TResult? Function(RangeStateChangeRange value)? changeRange,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RangeStateLoading value)? loading,
    TResult Function(RangeStateinitial value)? initial,
    TResult Function(RangeStateError value)? error,
    TResult Function(RangeStateSuccess value)? success,
    TResult Function(RangeStateChangeRange value)? changeRange,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class RangeStateinitial implements RangeState {
  const factory RangeStateinitial() = _$RangeStateinitial;
}

/// @nodoc
abstract class _$$RangeStateErrorCopyWith<$Res> {
  factory _$$RangeStateErrorCopyWith(
          _$RangeStateError value, $Res Function(_$RangeStateError) then) =
      __$$RangeStateErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({String? error});
}

/// @nodoc
class __$$RangeStateErrorCopyWithImpl<$Res>
    extends _$RangeStateCopyWithImpl<$Res, _$RangeStateError>
    implements _$$RangeStateErrorCopyWith<$Res> {
  __$$RangeStateErrorCopyWithImpl(
      _$RangeStateError _value, $Res Function(_$RangeStateError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_$RangeStateError(
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$RangeStateError implements RangeStateError {
  const _$RangeStateError({this.error});

  @override
  final String? error;

  @override
  String toString() {
    return 'RangeState.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RangeStateError &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RangeStateErrorCopyWith<_$RangeStateError> get copyWith =>
      __$$RangeStateErrorCopyWithImpl<_$RangeStateError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() initial,
    required TResult Function(String? error) error,
    required TResult Function() success,
    required TResult Function(double range) changeRange,
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
    TResult? Function(double range)? changeRange,
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
    TResult Function(double range)? changeRange,
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
    required TResult Function(RangeStateLoading value) loading,
    required TResult Function(RangeStateinitial value) initial,
    required TResult Function(RangeStateError value) error,
    required TResult Function(RangeStateSuccess value) success,
    required TResult Function(RangeStateChangeRange value) changeRange,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RangeStateLoading value)? loading,
    TResult? Function(RangeStateinitial value)? initial,
    TResult? Function(RangeStateError value)? error,
    TResult? Function(RangeStateSuccess value)? success,
    TResult? Function(RangeStateChangeRange value)? changeRange,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RangeStateLoading value)? loading,
    TResult Function(RangeStateinitial value)? initial,
    TResult Function(RangeStateError value)? error,
    TResult Function(RangeStateSuccess value)? success,
    TResult Function(RangeStateChangeRange value)? changeRange,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class RangeStateError implements RangeState {
  const factory RangeStateError({final String? error}) = _$RangeStateError;

  String? get error;
  @JsonKey(ignore: true)
  _$$RangeStateErrorCopyWith<_$RangeStateError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RangeStateSuccessCopyWith<$Res> {
  factory _$$RangeStateSuccessCopyWith(
          _$RangeStateSuccess value, $Res Function(_$RangeStateSuccess) then) =
      __$$RangeStateSuccessCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RangeStateSuccessCopyWithImpl<$Res>
    extends _$RangeStateCopyWithImpl<$Res, _$RangeStateSuccess>
    implements _$$RangeStateSuccessCopyWith<$Res> {
  __$$RangeStateSuccessCopyWithImpl(
      _$RangeStateSuccess _value, $Res Function(_$RangeStateSuccess) _then)
      : super(_value, _then);
}

/// @nodoc

class _$RangeStateSuccess implements RangeStateSuccess {
  const _$RangeStateSuccess();

  @override
  String toString() {
    return 'RangeState.success()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RangeStateSuccess);
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
    required TResult Function(double range) changeRange,
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
    TResult? Function(double range)? changeRange,
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
    TResult Function(double range)? changeRange,
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
    required TResult Function(RangeStateLoading value) loading,
    required TResult Function(RangeStateinitial value) initial,
    required TResult Function(RangeStateError value) error,
    required TResult Function(RangeStateSuccess value) success,
    required TResult Function(RangeStateChangeRange value) changeRange,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RangeStateLoading value)? loading,
    TResult? Function(RangeStateinitial value)? initial,
    TResult? Function(RangeStateError value)? error,
    TResult? Function(RangeStateSuccess value)? success,
    TResult? Function(RangeStateChangeRange value)? changeRange,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RangeStateLoading value)? loading,
    TResult Function(RangeStateinitial value)? initial,
    TResult Function(RangeStateError value)? error,
    TResult Function(RangeStateSuccess value)? success,
    TResult Function(RangeStateChangeRange value)? changeRange,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class RangeStateSuccess implements RangeState {
  const factory RangeStateSuccess() = _$RangeStateSuccess;
}

/// @nodoc
abstract class _$$RangeStateChangeRangeCopyWith<$Res> {
  factory _$$RangeStateChangeRangeCopyWith(_$RangeStateChangeRange value,
          $Res Function(_$RangeStateChangeRange) then) =
      __$$RangeStateChangeRangeCopyWithImpl<$Res>;
  @useResult
  $Res call({double range});
}

/// @nodoc
class __$$RangeStateChangeRangeCopyWithImpl<$Res>
    extends _$RangeStateCopyWithImpl<$Res, _$RangeStateChangeRange>
    implements _$$RangeStateChangeRangeCopyWith<$Res> {
  __$$RangeStateChangeRangeCopyWithImpl(_$RangeStateChangeRange _value,
      $Res Function(_$RangeStateChangeRange) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? range = null,
  }) {
    return _then(_$RangeStateChangeRange(
      range: null == range
          ? _value.range
          : range // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$RangeStateChangeRange implements RangeStateChangeRange {
  const _$RangeStateChangeRange({required this.range});

  @override
  final double range;

  @override
  String toString() {
    return 'RangeState.changeRange(range: $range)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RangeStateChangeRange &&
            (identical(other.range, range) || other.range == range));
  }

  @override
  int get hashCode => Object.hash(runtimeType, range);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RangeStateChangeRangeCopyWith<_$RangeStateChangeRange> get copyWith =>
      __$$RangeStateChangeRangeCopyWithImpl<_$RangeStateChangeRange>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() initial,
    required TResult Function(String? error) error,
    required TResult Function() success,
    required TResult Function(double range) changeRange,
  }) {
    return changeRange(range);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? initial,
    TResult? Function(String? error)? error,
    TResult? Function()? success,
    TResult? Function(double range)? changeRange,
  }) {
    return changeRange?.call(range);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? initial,
    TResult Function(String? error)? error,
    TResult Function()? success,
    TResult Function(double range)? changeRange,
    required TResult orElse(),
  }) {
    if (changeRange != null) {
      return changeRange(range);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RangeStateLoading value) loading,
    required TResult Function(RangeStateinitial value) initial,
    required TResult Function(RangeStateError value) error,
    required TResult Function(RangeStateSuccess value) success,
    required TResult Function(RangeStateChangeRange value) changeRange,
  }) {
    return changeRange(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RangeStateLoading value)? loading,
    TResult? Function(RangeStateinitial value)? initial,
    TResult? Function(RangeStateError value)? error,
    TResult? Function(RangeStateSuccess value)? success,
    TResult? Function(RangeStateChangeRange value)? changeRange,
  }) {
    return changeRange?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RangeStateLoading value)? loading,
    TResult Function(RangeStateinitial value)? initial,
    TResult Function(RangeStateError value)? error,
    TResult Function(RangeStateSuccess value)? success,
    TResult Function(RangeStateChangeRange value)? changeRange,
    required TResult orElse(),
  }) {
    if (changeRange != null) {
      return changeRange(this);
    }
    return orElse();
  }
}

abstract class RangeStateChangeRange implements RangeState {
  const factory RangeStateChangeRange({required final double range}) =
      _$RangeStateChangeRange;

  double get range;
  @JsonKey(ignore: true)
  _$$RangeStateChangeRangeCopyWith<_$RangeStateChangeRange> get copyWith =>
      throw _privateConstructorUsedError;
}
