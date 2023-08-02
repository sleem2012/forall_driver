// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'change_pass_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ChangePassState {
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
    required TResult Function(ChangePassStateInitial value) initial,
    required TResult Function(ChangePassStateLoading value) loading,
    required TResult Function(ChangePassStateSuccess value) success,
    required TResult Function(ChangePassStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ChangePassStateInitial value)? initial,
    TResult? Function(ChangePassStateLoading value)? loading,
    TResult? Function(ChangePassStateSuccess value)? success,
    TResult? Function(ChangePassStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChangePassStateInitial value)? initial,
    TResult Function(ChangePassStateLoading value)? loading,
    TResult Function(ChangePassStateSuccess value)? success,
    TResult Function(ChangePassStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChangePassStateCopyWith<$Res> {
  factory $ChangePassStateCopyWith(
          ChangePassState value, $Res Function(ChangePassState) then) =
      _$ChangePassStateCopyWithImpl<$Res, ChangePassState>;
}

/// @nodoc
class _$ChangePassStateCopyWithImpl<$Res, $Val extends ChangePassState>
    implements $ChangePassStateCopyWith<$Res> {
  _$ChangePassStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ChangePassStateInitialCopyWith<$Res> {
  factory _$$ChangePassStateInitialCopyWith(_$ChangePassStateInitial value,
          $Res Function(_$ChangePassStateInitial) then) =
      __$$ChangePassStateInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ChangePassStateInitialCopyWithImpl<$Res>
    extends _$ChangePassStateCopyWithImpl<$Res, _$ChangePassStateInitial>
    implements _$$ChangePassStateInitialCopyWith<$Res> {
  __$$ChangePassStateInitialCopyWithImpl(_$ChangePassStateInitial _value,
      $Res Function(_$ChangePassStateInitial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ChangePassStateInitial implements ChangePassStateInitial {
  const _$ChangePassStateInitial();

  @override
  String toString() {
    return 'ChangePassState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ChangePassStateInitial);
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
    required TResult Function(ChangePassStateInitial value) initial,
    required TResult Function(ChangePassStateLoading value) loading,
    required TResult Function(ChangePassStateSuccess value) success,
    required TResult Function(ChangePassStateError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ChangePassStateInitial value)? initial,
    TResult? Function(ChangePassStateLoading value)? loading,
    TResult? Function(ChangePassStateSuccess value)? success,
    TResult? Function(ChangePassStateError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChangePassStateInitial value)? initial,
    TResult Function(ChangePassStateLoading value)? loading,
    TResult Function(ChangePassStateSuccess value)? success,
    TResult Function(ChangePassStateError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class ChangePassStateInitial implements ChangePassState {
  const factory ChangePassStateInitial() = _$ChangePassStateInitial;
}

/// @nodoc
abstract class _$$ChangePassStateLoadingCopyWith<$Res> {
  factory _$$ChangePassStateLoadingCopyWith(_$ChangePassStateLoading value,
          $Res Function(_$ChangePassStateLoading) then) =
      __$$ChangePassStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ChangePassStateLoadingCopyWithImpl<$Res>
    extends _$ChangePassStateCopyWithImpl<$Res, _$ChangePassStateLoading>
    implements _$$ChangePassStateLoadingCopyWith<$Res> {
  __$$ChangePassStateLoadingCopyWithImpl(_$ChangePassStateLoading _value,
      $Res Function(_$ChangePassStateLoading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ChangePassStateLoading implements ChangePassStateLoading {
  const _$ChangePassStateLoading();

  @override
  String toString() {
    return 'ChangePassState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ChangePassStateLoading);
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
    required TResult Function(ChangePassStateInitial value) initial,
    required TResult Function(ChangePassStateLoading value) loading,
    required TResult Function(ChangePassStateSuccess value) success,
    required TResult Function(ChangePassStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ChangePassStateInitial value)? initial,
    TResult? Function(ChangePassStateLoading value)? loading,
    TResult? Function(ChangePassStateSuccess value)? success,
    TResult? Function(ChangePassStateError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChangePassStateInitial value)? initial,
    TResult Function(ChangePassStateLoading value)? loading,
    TResult Function(ChangePassStateSuccess value)? success,
    TResult Function(ChangePassStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class ChangePassStateLoading implements ChangePassState {
  const factory ChangePassStateLoading() = _$ChangePassStateLoading;
}

/// @nodoc
abstract class _$$ChangePassStateSuccessCopyWith<$Res> {
  factory _$$ChangePassStateSuccessCopyWith(_$ChangePassStateSuccess value,
          $Res Function(_$ChangePassStateSuccess) then) =
      __$$ChangePassStateSuccessCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ChangePassStateSuccessCopyWithImpl<$Res>
    extends _$ChangePassStateCopyWithImpl<$Res, _$ChangePassStateSuccess>
    implements _$$ChangePassStateSuccessCopyWith<$Res> {
  __$$ChangePassStateSuccessCopyWithImpl(_$ChangePassStateSuccess _value,
      $Res Function(_$ChangePassStateSuccess) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ChangePassStateSuccess implements ChangePassStateSuccess {
  const _$ChangePassStateSuccess();

  @override
  String toString() {
    return 'ChangePassState.success()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ChangePassStateSuccess);
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
    required TResult Function(ChangePassStateInitial value) initial,
    required TResult Function(ChangePassStateLoading value) loading,
    required TResult Function(ChangePassStateSuccess value) success,
    required TResult Function(ChangePassStateError value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ChangePassStateInitial value)? initial,
    TResult? Function(ChangePassStateLoading value)? loading,
    TResult? Function(ChangePassStateSuccess value)? success,
    TResult? Function(ChangePassStateError value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChangePassStateInitial value)? initial,
    TResult Function(ChangePassStateLoading value)? loading,
    TResult Function(ChangePassStateSuccess value)? success,
    TResult Function(ChangePassStateError value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class ChangePassStateSuccess implements ChangePassState {
  const factory ChangePassStateSuccess() = _$ChangePassStateSuccess;
}

/// @nodoc
abstract class _$$ChangePassStateErrorCopyWith<$Res> {
  factory _$$ChangePassStateErrorCopyWith(_$ChangePassStateError value,
          $Res Function(_$ChangePassStateError) then) =
      __$$ChangePassStateErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({KFailure failure});

  $KFailureCopyWith<$Res> get failure;
}

/// @nodoc
class __$$ChangePassStateErrorCopyWithImpl<$Res>
    extends _$ChangePassStateCopyWithImpl<$Res, _$ChangePassStateError>
    implements _$$ChangePassStateErrorCopyWith<$Res> {
  __$$ChangePassStateErrorCopyWithImpl(_$ChangePassStateError _value,
      $Res Function(_$ChangePassStateError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failure = null,
  }) {
    return _then(_$ChangePassStateError(
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

class _$ChangePassStateError implements ChangePassStateError {
  const _$ChangePassStateError({required this.failure});

  @override
  final KFailure failure;

  @override
  String toString() {
    return 'ChangePassState.error(failure: $failure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangePassStateError &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode => Object.hash(runtimeType, failure);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangePassStateErrorCopyWith<_$ChangePassStateError> get copyWith =>
      __$$ChangePassStateErrorCopyWithImpl<_$ChangePassStateError>(
          this, _$identity);

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
    required TResult Function(ChangePassStateInitial value) initial,
    required TResult Function(ChangePassStateLoading value) loading,
    required TResult Function(ChangePassStateSuccess value) success,
    required TResult Function(ChangePassStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ChangePassStateInitial value)? initial,
    TResult? Function(ChangePassStateLoading value)? loading,
    TResult? Function(ChangePassStateSuccess value)? success,
    TResult? Function(ChangePassStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChangePassStateInitial value)? initial,
    TResult Function(ChangePassStateLoading value)? loading,
    TResult Function(ChangePassStateSuccess value)? success,
    TResult Function(ChangePassStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ChangePassStateError implements ChangePassState {
  const factory ChangePassStateError({required final KFailure failure}) =
      _$ChangePassStateError;

  KFailure get failure;
  @JsonKey(ignore: true)
  _$$ChangePassStateErrorCopyWith<_$ChangePassStateError> get copyWith =>
      throw _privateConstructorUsedError;
}
