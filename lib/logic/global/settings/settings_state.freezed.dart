// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'settings_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SettingsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(SettingsModel model) success,
    required TResult Function(String error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(SettingsModel model)? success,
    TResult? Function(String error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(SettingsModel model)? success,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SettingsStateInitial value) initial,
    required TResult Function(SettingsStateLoading value) loading,
    required TResult Function(SettingsStateSuccess value) success,
    required TResult Function(SettingsStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SettingsStateInitial value)? initial,
    TResult? Function(SettingsStateLoading value)? loading,
    TResult? Function(SettingsStateSuccess value)? success,
    TResult? Function(SettingsStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SettingsStateInitial value)? initial,
    TResult Function(SettingsStateLoading value)? loading,
    TResult Function(SettingsStateSuccess value)? success,
    TResult Function(SettingsStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingsStateCopyWith<$Res> {
  factory $SettingsStateCopyWith(
          SettingsState value, $Res Function(SettingsState) then) =
      _$SettingsStateCopyWithImpl<$Res, SettingsState>;
}

/// @nodoc
class _$SettingsStateCopyWithImpl<$Res, $Val extends SettingsState>
    implements $SettingsStateCopyWith<$Res> {
  _$SettingsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$SettingsStateInitialCopyWith<$Res> {
  factory _$$SettingsStateInitialCopyWith(_$SettingsStateInitial value,
          $Res Function(_$SettingsStateInitial) then) =
      __$$SettingsStateInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SettingsStateInitialCopyWithImpl<$Res>
    extends _$SettingsStateCopyWithImpl<$Res, _$SettingsStateInitial>
    implements _$$SettingsStateInitialCopyWith<$Res> {
  __$$SettingsStateInitialCopyWithImpl(_$SettingsStateInitial _value,
      $Res Function(_$SettingsStateInitial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SettingsStateInitial implements SettingsStateInitial {
  const _$SettingsStateInitial();

  @override
  String toString() {
    return 'SettingsState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SettingsStateInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(SettingsModel model) success,
    required TResult Function(String error) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(SettingsModel model)? success,
    TResult? Function(String error)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(SettingsModel model)? success,
    TResult Function(String error)? error,
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
    required TResult Function(SettingsStateInitial value) initial,
    required TResult Function(SettingsStateLoading value) loading,
    required TResult Function(SettingsStateSuccess value) success,
    required TResult Function(SettingsStateError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SettingsStateInitial value)? initial,
    TResult? Function(SettingsStateLoading value)? loading,
    TResult? Function(SettingsStateSuccess value)? success,
    TResult? Function(SettingsStateError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SettingsStateInitial value)? initial,
    TResult Function(SettingsStateLoading value)? loading,
    TResult Function(SettingsStateSuccess value)? success,
    TResult Function(SettingsStateError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class SettingsStateInitial implements SettingsState {
  const factory SettingsStateInitial() = _$SettingsStateInitial;
}

/// @nodoc
abstract class _$$SettingsStateLoadingCopyWith<$Res> {
  factory _$$SettingsStateLoadingCopyWith(_$SettingsStateLoading value,
          $Res Function(_$SettingsStateLoading) then) =
      __$$SettingsStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SettingsStateLoadingCopyWithImpl<$Res>
    extends _$SettingsStateCopyWithImpl<$Res, _$SettingsStateLoading>
    implements _$$SettingsStateLoadingCopyWith<$Res> {
  __$$SettingsStateLoadingCopyWithImpl(_$SettingsStateLoading _value,
      $Res Function(_$SettingsStateLoading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SettingsStateLoading implements SettingsStateLoading {
  const _$SettingsStateLoading();

  @override
  String toString() {
    return 'SettingsState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SettingsStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(SettingsModel model) success,
    required TResult Function(String error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(SettingsModel model)? success,
    TResult? Function(String error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(SettingsModel model)? success,
    TResult Function(String error)? error,
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
    required TResult Function(SettingsStateInitial value) initial,
    required TResult Function(SettingsStateLoading value) loading,
    required TResult Function(SettingsStateSuccess value) success,
    required TResult Function(SettingsStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SettingsStateInitial value)? initial,
    TResult? Function(SettingsStateLoading value)? loading,
    TResult? Function(SettingsStateSuccess value)? success,
    TResult? Function(SettingsStateError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SettingsStateInitial value)? initial,
    TResult Function(SettingsStateLoading value)? loading,
    TResult Function(SettingsStateSuccess value)? success,
    TResult Function(SettingsStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class SettingsStateLoading implements SettingsState {
  const factory SettingsStateLoading() = _$SettingsStateLoading;
}

/// @nodoc
abstract class _$$SettingsStateSuccessCopyWith<$Res> {
  factory _$$SettingsStateSuccessCopyWith(_$SettingsStateSuccess value,
          $Res Function(_$SettingsStateSuccess) then) =
      __$$SettingsStateSuccessCopyWithImpl<$Res>;
  @useResult
  $Res call({SettingsModel model});
}

/// @nodoc
class __$$SettingsStateSuccessCopyWithImpl<$Res>
    extends _$SettingsStateCopyWithImpl<$Res, _$SettingsStateSuccess>
    implements _$$SettingsStateSuccessCopyWith<$Res> {
  __$$SettingsStateSuccessCopyWithImpl(_$SettingsStateSuccess _value,
      $Res Function(_$SettingsStateSuccess) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? model = null,
  }) {
    return _then(_$SettingsStateSuccess(
      model: null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as SettingsModel,
    ));
  }
}

/// @nodoc

class _$SettingsStateSuccess implements SettingsStateSuccess {
  const _$SettingsStateSuccess({required this.model});

  @override
  final SettingsModel model;

  @override
  String toString() {
    return 'SettingsState.success(model: $model)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SettingsStateSuccess &&
            (identical(other.model, model) || other.model == model));
  }

  @override
  int get hashCode => Object.hash(runtimeType, model);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SettingsStateSuccessCopyWith<_$SettingsStateSuccess> get copyWith =>
      __$$SettingsStateSuccessCopyWithImpl<_$SettingsStateSuccess>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(SettingsModel model) success,
    required TResult Function(String error) error,
  }) {
    return success(model);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(SettingsModel model)? success,
    TResult? Function(String error)? error,
  }) {
    return success?.call(model);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(SettingsModel model)? success,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(model);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SettingsStateInitial value) initial,
    required TResult Function(SettingsStateLoading value) loading,
    required TResult Function(SettingsStateSuccess value) success,
    required TResult Function(SettingsStateError value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SettingsStateInitial value)? initial,
    TResult? Function(SettingsStateLoading value)? loading,
    TResult? Function(SettingsStateSuccess value)? success,
    TResult? Function(SettingsStateError value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SettingsStateInitial value)? initial,
    TResult Function(SettingsStateLoading value)? loading,
    TResult Function(SettingsStateSuccess value)? success,
    TResult Function(SettingsStateError value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class SettingsStateSuccess implements SettingsState {
  const factory SettingsStateSuccess({required final SettingsModel model}) =
      _$SettingsStateSuccess;

  SettingsModel get model;
  @JsonKey(ignore: true)
  _$$SettingsStateSuccessCopyWith<_$SettingsStateSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SettingsStateErrorCopyWith<$Res> {
  factory _$$SettingsStateErrorCopyWith(_$SettingsStateError value,
          $Res Function(_$SettingsStateError) then) =
      __$$SettingsStateErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$SettingsStateErrorCopyWithImpl<$Res>
    extends _$SettingsStateCopyWithImpl<$Res, _$SettingsStateError>
    implements _$$SettingsStateErrorCopyWith<$Res> {
  __$$SettingsStateErrorCopyWithImpl(
      _$SettingsStateError _value, $Res Function(_$SettingsStateError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$SettingsStateError(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SettingsStateError implements SettingsStateError {
  const _$SettingsStateError({required this.error});

  @override
  final String error;

  @override
  String toString() {
    return 'SettingsState.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SettingsStateError &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SettingsStateErrorCopyWith<_$SettingsStateError> get copyWith =>
      __$$SettingsStateErrorCopyWithImpl<_$SettingsStateError>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(SettingsModel model) success,
    required TResult Function(String error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(SettingsModel model)? success,
    TResult? Function(String error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(SettingsModel model)? success,
    TResult Function(String error)? error,
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
    required TResult Function(SettingsStateInitial value) initial,
    required TResult Function(SettingsStateLoading value) loading,
    required TResult Function(SettingsStateSuccess value) success,
    required TResult Function(SettingsStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SettingsStateInitial value)? initial,
    TResult? Function(SettingsStateLoading value)? loading,
    TResult? Function(SettingsStateSuccess value)? success,
    TResult? Function(SettingsStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SettingsStateInitial value)? initial,
    TResult Function(SettingsStateLoading value)? loading,
    TResult Function(SettingsStateSuccess value)? success,
    TResult Function(SettingsStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class SettingsStateError implements SettingsState {
  const factory SettingsStateError({required final String error}) =
      _$SettingsStateError;

  String get error;
  @JsonKey(ignore: true)
  _$$SettingsStateErrorCopyWith<_$SettingsStateError> get copyWith =>
      throw _privateConstructorUsedError;
}
