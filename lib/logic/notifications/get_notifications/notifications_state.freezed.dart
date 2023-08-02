// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notifications_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NotificationsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(NotificationsModel notificationsModel) success,
    required TResult Function(String error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(NotificationsModel notificationsModel)? success,
    TResult? Function(String error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(NotificationsModel notificationsModel)? success,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NotificationsStateInitial value) initial,
    required TResult Function(NotificationsStateLoading value) loading,
    required TResult Function(NotificationsStateSuccess value) success,
    required TResult Function(NotificationsStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NotificationsStateInitial value)? initial,
    TResult? Function(NotificationsStateLoading value)? loading,
    TResult? Function(NotificationsStateSuccess value)? success,
    TResult? Function(NotificationsStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NotificationsStateInitial value)? initial,
    TResult Function(NotificationsStateLoading value)? loading,
    TResult Function(NotificationsStateSuccess value)? success,
    TResult Function(NotificationsStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationsStateCopyWith<$Res> {
  factory $NotificationsStateCopyWith(
          NotificationsState value, $Res Function(NotificationsState) then) =
      _$NotificationsStateCopyWithImpl<$Res, NotificationsState>;
}

/// @nodoc
class _$NotificationsStateCopyWithImpl<$Res, $Val extends NotificationsState>
    implements $NotificationsStateCopyWith<$Res> {
  _$NotificationsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$NotificationsStateInitialCopyWith<$Res> {
  factory _$$NotificationsStateInitialCopyWith(
          _$NotificationsStateInitial value,
          $Res Function(_$NotificationsStateInitial) then) =
      __$$NotificationsStateInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NotificationsStateInitialCopyWithImpl<$Res>
    extends _$NotificationsStateCopyWithImpl<$Res, _$NotificationsStateInitial>
    implements _$$NotificationsStateInitialCopyWith<$Res> {
  __$$NotificationsStateInitialCopyWithImpl(_$NotificationsStateInitial _value,
      $Res Function(_$NotificationsStateInitial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$NotificationsStateInitial implements NotificationsStateInitial {
  const _$NotificationsStateInitial();

  @override
  String toString() {
    return 'NotificationsState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationsStateInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(NotificationsModel notificationsModel) success,
    required TResult Function(String error) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(NotificationsModel notificationsModel)? success,
    TResult? Function(String error)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(NotificationsModel notificationsModel)? success,
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
    required TResult Function(NotificationsStateInitial value) initial,
    required TResult Function(NotificationsStateLoading value) loading,
    required TResult Function(NotificationsStateSuccess value) success,
    required TResult Function(NotificationsStateError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NotificationsStateInitial value)? initial,
    TResult? Function(NotificationsStateLoading value)? loading,
    TResult? Function(NotificationsStateSuccess value)? success,
    TResult? Function(NotificationsStateError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NotificationsStateInitial value)? initial,
    TResult Function(NotificationsStateLoading value)? loading,
    TResult Function(NotificationsStateSuccess value)? success,
    TResult Function(NotificationsStateError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class NotificationsStateInitial implements NotificationsState {
  const factory NotificationsStateInitial() = _$NotificationsStateInitial;
}

/// @nodoc
abstract class _$$NotificationsStateLoadingCopyWith<$Res> {
  factory _$$NotificationsStateLoadingCopyWith(
          _$NotificationsStateLoading value,
          $Res Function(_$NotificationsStateLoading) then) =
      __$$NotificationsStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NotificationsStateLoadingCopyWithImpl<$Res>
    extends _$NotificationsStateCopyWithImpl<$Res, _$NotificationsStateLoading>
    implements _$$NotificationsStateLoadingCopyWith<$Res> {
  __$$NotificationsStateLoadingCopyWithImpl(_$NotificationsStateLoading _value,
      $Res Function(_$NotificationsStateLoading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$NotificationsStateLoading implements NotificationsStateLoading {
  const _$NotificationsStateLoading();

  @override
  String toString() {
    return 'NotificationsState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationsStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(NotificationsModel notificationsModel) success,
    required TResult Function(String error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(NotificationsModel notificationsModel)? success,
    TResult? Function(String error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(NotificationsModel notificationsModel)? success,
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
    required TResult Function(NotificationsStateInitial value) initial,
    required TResult Function(NotificationsStateLoading value) loading,
    required TResult Function(NotificationsStateSuccess value) success,
    required TResult Function(NotificationsStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NotificationsStateInitial value)? initial,
    TResult? Function(NotificationsStateLoading value)? loading,
    TResult? Function(NotificationsStateSuccess value)? success,
    TResult? Function(NotificationsStateError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NotificationsStateInitial value)? initial,
    TResult Function(NotificationsStateLoading value)? loading,
    TResult Function(NotificationsStateSuccess value)? success,
    TResult Function(NotificationsStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class NotificationsStateLoading implements NotificationsState {
  const factory NotificationsStateLoading() = _$NotificationsStateLoading;
}

/// @nodoc
abstract class _$$NotificationsStateSuccessCopyWith<$Res> {
  factory _$$NotificationsStateSuccessCopyWith(
          _$NotificationsStateSuccess value,
          $Res Function(_$NotificationsStateSuccess) then) =
      __$$NotificationsStateSuccessCopyWithImpl<$Res>;
  @useResult
  $Res call({NotificationsModel notificationsModel});
}

/// @nodoc
class __$$NotificationsStateSuccessCopyWithImpl<$Res>
    extends _$NotificationsStateCopyWithImpl<$Res, _$NotificationsStateSuccess>
    implements _$$NotificationsStateSuccessCopyWith<$Res> {
  __$$NotificationsStateSuccessCopyWithImpl(_$NotificationsStateSuccess _value,
      $Res Function(_$NotificationsStateSuccess) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notificationsModel = null,
  }) {
    return _then(_$NotificationsStateSuccess(
      notificationsModel: null == notificationsModel
          ? _value.notificationsModel
          : notificationsModel // ignore: cast_nullable_to_non_nullable
              as NotificationsModel,
    ));
  }
}

/// @nodoc

class _$NotificationsStateSuccess implements NotificationsStateSuccess {
  const _$NotificationsStateSuccess({required this.notificationsModel});

  @override
  final NotificationsModel notificationsModel;

  @override
  String toString() {
    return 'NotificationsState.success(notificationsModel: $notificationsModel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationsStateSuccess &&
            (identical(other.notificationsModel, notificationsModel) ||
                other.notificationsModel == notificationsModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, notificationsModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NotificationsStateSuccessCopyWith<_$NotificationsStateSuccess>
      get copyWith => __$$NotificationsStateSuccessCopyWithImpl<
          _$NotificationsStateSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(NotificationsModel notificationsModel) success,
    required TResult Function(String error) error,
  }) {
    return success(notificationsModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(NotificationsModel notificationsModel)? success,
    TResult? Function(String error)? error,
  }) {
    return success?.call(notificationsModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(NotificationsModel notificationsModel)? success,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(notificationsModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NotificationsStateInitial value) initial,
    required TResult Function(NotificationsStateLoading value) loading,
    required TResult Function(NotificationsStateSuccess value) success,
    required TResult Function(NotificationsStateError value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NotificationsStateInitial value)? initial,
    TResult? Function(NotificationsStateLoading value)? loading,
    TResult? Function(NotificationsStateSuccess value)? success,
    TResult? Function(NotificationsStateError value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NotificationsStateInitial value)? initial,
    TResult Function(NotificationsStateLoading value)? loading,
    TResult Function(NotificationsStateSuccess value)? success,
    TResult Function(NotificationsStateError value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class NotificationsStateSuccess implements NotificationsState {
  const factory NotificationsStateSuccess(
          {required final NotificationsModel notificationsModel}) =
      _$NotificationsStateSuccess;

  NotificationsModel get notificationsModel;
  @JsonKey(ignore: true)
  _$$NotificationsStateSuccessCopyWith<_$NotificationsStateSuccess>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NotificationsStateErrorCopyWith<$Res> {
  factory _$$NotificationsStateErrorCopyWith(_$NotificationsStateError value,
          $Res Function(_$NotificationsStateError) then) =
      __$$NotificationsStateErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$NotificationsStateErrorCopyWithImpl<$Res>
    extends _$NotificationsStateCopyWithImpl<$Res, _$NotificationsStateError>
    implements _$$NotificationsStateErrorCopyWith<$Res> {
  __$$NotificationsStateErrorCopyWithImpl(_$NotificationsStateError _value,
      $Res Function(_$NotificationsStateError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$NotificationsStateError(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$NotificationsStateError implements NotificationsStateError {
  const _$NotificationsStateError({required this.error});

  @override
  final String error;

  @override
  String toString() {
    return 'NotificationsState.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationsStateError &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NotificationsStateErrorCopyWith<_$NotificationsStateError> get copyWith =>
      __$$NotificationsStateErrorCopyWithImpl<_$NotificationsStateError>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(NotificationsModel notificationsModel) success,
    required TResult Function(String error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(NotificationsModel notificationsModel)? success,
    TResult? Function(String error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(NotificationsModel notificationsModel)? success,
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
    required TResult Function(NotificationsStateInitial value) initial,
    required TResult Function(NotificationsStateLoading value) loading,
    required TResult Function(NotificationsStateSuccess value) success,
    required TResult Function(NotificationsStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NotificationsStateInitial value)? initial,
    TResult? Function(NotificationsStateLoading value)? loading,
    TResult? Function(NotificationsStateSuccess value)? success,
    TResult? Function(NotificationsStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NotificationsStateInitial value)? initial,
    TResult Function(NotificationsStateLoading value)? loading,
    TResult Function(NotificationsStateSuccess value)? success,
    TResult Function(NotificationsStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class NotificationsStateError implements NotificationsState {
  const factory NotificationsStateError({required final String error}) =
      _$NotificationsStateError;

  String get error;
  @JsonKey(ignore: true)
  _$$NotificationsStateErrorCopyWith<_$NotificationsStateError> get copyWith =>
      throw _privateConstructorUsedError;
}
