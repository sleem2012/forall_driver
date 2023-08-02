// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'logout_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LogoutState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(KFailure failure) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(KFailure failure)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(KFailure failure)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LogoutStateInitial value) initial,
    required TResult Function(LogoutStateLoading value) loading,
    required TResult Function(LogoutStateSuccess value) success,
    required TResult Function(LogoutStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LogoutStateInitial value)? initial,
    TResult? Function(LogoutStateLoading value)? loading,
    TResult? Function(LogoutStateSuccess value)? success,
    TResult? Function(LogoutStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LogoutStateInitial value)? initial,
    TResult Function(LogoutStateLoading value)? loading,
    TResult Function(LogoutStateSuccess value)? success,
    TResult Function(LogoutStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LogoutStateCopyWith<$Res> {
  factory $LogoutStateCopyWith(
          LogoutState value, $Res Function(LogoutState) then) =
      _$LogoutStateCopyWithImpl<$Res, LogoutState>;
}

/// @nodoc
class _$LogoutStateCopyWithImpl<$Res, $Val extends LogoutState>
    implements $LogoutStateCopyWith<$Res> {
  _$LogoutStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$LogoutStateInitialCopyWith<$Res> {
  factory _$$LogoutStateInitialCopyWith(_$LogoutStateInitial value,
          $Res Function(_$LogoutStateInitial) then) =
      __$$LogoutStateInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LogoutStateInitialCopyWithImpl<$Res>
    extends _$LogoutStateCopyWithImpl<$Res, _$LogoutStateInitial>
    implements _$$LogoutStateInitialCopyWith<$Res> {
  __$$LogoutStateInitialCopyWithImpl(
      _$LogoutStateInitial _value, $Res Function(_$LogoutStateInitial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LogoutStateInitial implements LogoutStateInitial {
  const _$LogoutStateInitial();

  @override
  String toString() {
    return 'LogoutState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LogoutStateInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(KFailure failure) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(KFailure failure)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(KFailure failure)? error,
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
    required TResult Function(LogoutStateInitial value) initial,
    required TResult Function(LogoutStateLoading value) loading,
    required TResult Function(LogoutStateSuccess value) success,
    required TResult Function(LogoutStateError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LogoutStateInitial value)? initial,
    TResult? Function(LogoutStateLoading value)? loading,
    TResult? Function(LogoutStateSuccess value)? success,
    TResult? Function(LogoutStateError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LogoutStateInitial value)? initial,
    TResult Function(LogoutStateLoading value)? loading,
    TResult Function(LogoutStateSuccess value)? success,
    TResult Function(LogoutStateError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class LogoutStateInitial implements LogoutState {
  const factory LogoutStateInitial() = _$LogoutStateInitial;
}

/// @nodoc
abstract class _$$LogoutStateLoadingCopyWith<$Res> {
  factory _$$LogoutStateLoadingCopyWith(_$LogoutStateLoading value,
          $Res Function(_$LogoutStateLoading) then) =
      __$$LogoutStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LogoutStateLoadingCopyWithImpl<$Res>
    extends _$LogoutStateCopyWithImpl<$Res, _$LogoutStateLoading>
    implements _$$LogoutStateLoadingCopyWith<$Res> {
  __$$LogoutStateLoadingCopyWithImpl(
      _$LogoutStateLoading _value, $Res Function(_$LogoutStateLoading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LogoutStateLoading implements LogoutStateLoading {
  const _$LogoutStateLoading();

  @override
  String toString() {
    return 'LogoutState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LogoutStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(KFailure failure) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(KFailure failure)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(KFailure failure)? error,
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
    required TResult Function(LogoutStateInitial value) initial,
    required TResult Function(LogoutStateLoading value) loading,
    required TResult Function(LogoutStateSuccess value) success,
    required TResult Function(LogoutStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LogoutStateInitial value)? initial,
    TResult? Function(LogoutStateLoading value)? loading,
    TResult? Function(LogoutStateSuccess value)? success,
    TResult? Function(LogoutStateError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LogoutStateInitial value)? initial,
    TResult Function(LogoutStateLoading value)? loading,
    TResult Function(LogoutStateSuccess value)? success,
    TResult Function(LogoutStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class LogoutStateLoading implements LogoutState {
  const factory LogoutStateLoading() = _$LogoutStateLoading;
}

/// @nodoc
abstract class _$$LogoutStateSuccessCopyWith<$Res> {
  factory _$$LogoutStateSuccessCopyWith(_$LogoutStateSuccess value,
          $Res Function(_$LogoutStateSuccess) then) =
      __$$LogoutStateSuccessCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LogoutStateSuccessCopyWithImpl<$Res>
    extends _$LogoutStateCopyWithImpl<$Res, _$LogoutStateSuccess>
    implements _$$LogoutStateSuccessCopyWith<$Res> {
  __$$LogoutStateSuccessCopyWithImpl(
      _$LogoutStateSuccess _value, $Res Function(_$LogoutStateSuccess) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LogoutStateSuccess implements LogoutStateSuccess {
  const _$LogoutStateSuccess();

  @override
  String toString() {
    return 'LogoutState.success()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LogoutStateSuccess);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(KFailure failure) error,
  }) {
    return success();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(KFailure failure)? error,
  }) {
    return success?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(KFailure failure)? error,
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
    required TResult Function(LogoutStateInitial value) initial,
    required TResult Function(LogoutStateLoading value) loading,
    required TResult Function(LogoutStateSuccess value) success,
    required TResult Function(LogoutStateError value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LogoutStateInitial value)? initial,
    TResult? Function(LogoutStateLoading value)? loading,
    TResult? Function(LogoutStateSuccess value)? success,
    TResult? Function(LogoutStateError value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LogoutStateInitial value)? initial,
    TResult Function(LogoutStateLoading value)? loading,
    TResult Function(LogoutStateSuccess value)? success,
    TResult Function(LogoutStateError value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class LogoutStateSuccess implements LogoutState {
  const factory LogoutStateSuccess() = _$LogoutStateSuccess;
}

/// @nodoc
abstract class _$$LogoutStateErrorCopyWith<$Res> {
  factory _$$LogoutStateErrorCopyWith(
          _$LogoutStateError value, $Res Function(_$LogoutStateError) then) =
      __$$LogoutStateErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({KFailure failure});

  $KFailureCopyWith<$Res> get failure;
}

/// @nodoc
class __$$LogoutStateErrorCopyWithImpl<$Res>
    extends _$LogoutStateCopyWithImpl<$Res, _$LogoutStateError>
    implements _$$LogoutStateErrorCopyWith<$Res> {
  __$$LogoutStateErrorCopyWithImpl(
      _$LogoutStateError _value, $Res Function(_$LogoutStateError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failure = null,
  }) {
    return _then(_$LogoutStateError(
      failure: null == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as KFailure,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $KFailureCopyWith<$Res> get failure {
    return $KFailureCopyWith<$Res>(_value.failure, (value) {
      return _then(_value.copyWith(failure: value));
    });
  }
}

/// @nodoc

class _$LogoutStateError implements LogoutStateError {
  const _$LogoutStateError({required this.failure});

  @override
  final KFailure failure;

  @override
  String toString() {
    return 'LogoutState.error(failure: $failure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LogoutStateError &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode => Object.hash(runtimeType, failure);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LogoutStateErrorCopyWith<_$LogoutStateError> get copyWith =>
      __$$LogoutStateErrorCopyWithImpl<_$LogoutStateError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(KFailure failure) error,
  }) {
    return error(failure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(KFailure failure)? error,
  }) {
    return error?.call(failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(KFailure failure)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(failure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LogoutStateInitial value) initial,
    required TResult Function(LogoutStateLoading value) loading,
    required TResult Function(LogoutStateSuccess value) success,
    required TResult Function(LogoutStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LogoutStateInitial value)? initial,
    TResult? Function(LogoutStateLoading value)? loading,
    TResult? Function(LogoutStateSuccess value)? success,
    TResult? Function(LogoutStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LogoutStateInitial value)? initial,
    TResult Function(LogoutStateLoading value)? loading,
    TResult Function(LogoutStateSuccess value)? success,
    TResult Function(LogoutStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class LogoutStateError implements LogoutState {
  const factory LogoutStateError({required final KFailure failure}) =
      _$LogoutStateError;

  KFailure get failure;
  @JsonKey(ignore: true)
  _$$LogoutStateErrorCopyWith<_$LogoutStateError> get copyWith =>
      throw _privateConstructorUsedError;
}
