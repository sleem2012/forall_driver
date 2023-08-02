// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'place_details_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PlaceDetailsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? error) error,
    required TResult Function(Place? place) success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? error)? error,
    TResult? Function(Place? place)? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? error)? error,
    TResult Function(Place? place)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PlaceDetailsStateInitial value) initial,
    required TResult Function(PlaceDetailsStateLoading value) loading,
    required TResult Function(PlaceDetailsStateError value) error,
    required TResult Function(PlaceDetailsStateSuccess value) success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PlaceDetailsStateInitial value)? initial,
    TResult? Function(PlaceDetailsStateLoading value)? loading,
    TResult? Function(PlaceDetailsStateError value)? error,
    TResult? Function(PlaceDetailsStateSuccess value)? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PlaceDetailsStateInitial value)? initial,
    TResult Function(PlaceDetailsStateLoading value)? loading,
    TResult Function(PlaceDetailsStateError value)? error,
    TResult Function(PlaceDetailsStateSuccess value)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlaceDetailsStateCopyWith<$Res> {
  factory $PlaceDetailsStateCopyWith(
          PlaceDetailsState value, $Res Function(PlaceDetailsState) then) =
      _$PlaceDetailsStateCopyWithImpl<$Res, PlaceDetailsState>;
}

/// @nodoc
class _$PlaceDetailsStateCopyWithImpl<$Res, $Val extends PlaceDetailsState>
    implements $PlaceDetailsStateCopyWith<$Res> {
  _$PlaceDetailsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$PlaceDetailsStateInitialCopyWith<$Res> {
  factory _$$PlaceDetailsStateInitialCopyWith(_$PlaceDetailsStateInitial value,
          $Res Function(_$PlaceDetailsStateInitial) then) =
      __$$PlaceDetailsStateInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PlaceDetailsStateInitialCopyWithImpl<$Res>
    extends _$PlaceDetailsStateCopyWithImpl<$Res, _$PlaceDetailsStateInitial>
    implements _$$PlaceDetailsStateInitialCopyWith<$Res> {
  __$$PlaceDetailsStateInitialCopyWithImpl(_$PlaceDetailsStateInitial _value,
      $Res Function(_$PlaceDetailsStateInitial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$PlaceDetailsStateInitial implements PlaceDetailsStateInitial {
  const _$PlaceDetailsStateInitial();

  @override
  String toString() {
    return 'PlaceDetailsState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlaceDetailsStateInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? error) error,
    required TResult Function(Place? place) success,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? error)? error,
    TResult? Function(Place? place)? success,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? error)? error,
    TResult Function(Place? place)? success,
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
    required TResult Function(PlaceDetailsStateInitial value) initial,
    required TResult Function(PlaceDetailsStateLoading value) loading,
    required TResult Function(PlaceDetailsStateError value) error,
    required TResult Function(PlaceDetailsStateSuccess value) success,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PlaceDetailsStateInitial value)? initial,
    TResult? Function(PlaceDetailsStateLoading value)? loading,
    TResult? Function(PlaceDetailsStateError value)? error,
    TResult? Function(PlaceDetailsStateSuccess value)? success,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PlaceDetailsStateInitial value)? initial,
    TResult Function(PlaceDetailsStateLoading value)? loading,
    TResult Function(PlaceDetailsStateError value)? error,
    TResult Function(PlaceDetailsStateSuccess value)? success,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class PlaceDetailsStateInitial implements PlaceDetailsState {
  const factory PlaceDetailsStateInitial() = _$PlaceDetailsStateInitial;
}

/// @nodoc
abstract class _$$PlaceDetailsStateLoadingCopyWith<$Res> {
  factory _$$PlaceDetailsStateLoadingCopyWith(_$PlaceDetailsStateLoading value,
          $Res Function(_$PlaceDetailsStateLoading) then) =
      __$$PlaceDetailsStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PlaceDetailsStateLoadingCopyWithImpl<$Res>
    extends _$PlaceDetailsStateCopyWithImpl<$Res, _$PlaceDetailsStateLoading>
    implements _$$PlaceDetailsStateLoadingCopyWith<$Res> {
  __$$PlaceDetailsStateLoadingCopyWithImpl(_$PlaceDetailsStateLoading _value,
      $Res Function(_$PlaceDetailsStateLoading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$PlaceDetailsStateLoading implements PlaceDetailsStateLoading {
  const _$PlaceDetailsStateLoading();

  @override
  String toString() {
    return 'PlaceDetailsState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlaceDetailsStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? error) error,
    required TResult Function(Place? place) success,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? error)? error,
    TResult? Function(Place? place)? success,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? error)? error,
    TResult Function(Place? place)? success,
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
    required TResult Function(PlaceDetailsStateInitial value) initial,
    required TResult Function(PlaceDetailsStateLoading value) loading,
    required TResult Function(PlaceDetailsStateError value) error,
    required TResult Function(PlaceDetailsStateSuccess value) success,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PlaceDetailsStateInitial value)? initial,
    TResult? Function(PlaceDetailsStateLoading value)? loading,
    TResult? Function(PlaceDetailsStateError value)? error,
    TResult? Function(PlaceDetailsStateSuccess value)? success,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PlaceDetailsStateInitial value)? initial,
    TResult Function(PlaceDetailsStateLoading value)? loading,
    TResult Function(PlaceDetailsStateError value)? error,
    TResult Function(PlaceDetailsStateSuccess value)? success,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class PlaceDetailsStateLoading implements PlaceDetailsState {
  const factory PlaceDetailsStateLoading() = _$PlaceDetailsStateLoading;
}

/// @nodoc
abstract class _$$PlaceDetailsStateErrorCopyWith<$Res> {
  factory _$$PlaceDetailsStateErrorCopyWith(_$PlaceDetailsStateError value,
          $Res Function(_$PlaceDetailsStateError) then) =
      __$$PlaceDetailsStateErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({String? error});
}

/// @nodoc
class __$$PlaceDetailsStateErrorCopyWithImpl<$Res>
    extends _$PlaceDetailsStateCopyWithImpl<$Res, _$PlaceDetailsStateError>
    implements _$$PlaceDetailsStateErrorCopyWith<$Res> {
  __$$PlaceDetailsStateErrorCopyWithImpl(_$PlaceDetailsStateError _value,
      $Res Function(_$PlaceDetailsStateError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_$PlaceDetailsStateError(
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$PlaceDetailsStateError implements PlaceDetailsStateError {
  const _$PlaceDetailsStateError({this.error});

  @override
  final String? error;

  @override
  String toString() {
    return 'PlaceDetailsState.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlaceDetailsStateError &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PlaceDetailsStateErrorCopyWith<_$PlaceDetailsStateError> get copyWith =>
      __$$PlaceDetailsStateErrorCopyWithImpl<_$PlaceDetailsStateError>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? error) error,
    required TResult Function(Place? place) success,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? error)? error,
    TResult? Function(Place? place)? success,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? error)? error,
    TResult Function(Place? place)? success,
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
    required TResult Function(PlaceDetailsStateInitial value) initial,
    required TResult Function(PlaceDetailsStateLoading value) loading,
    required TResult Function(PlaceDetailsStateError value) error,
    required TResult Function(PlaceDetailsStateSuccess value) success,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PlaceDetailsStateInitial value)? initial,
    TResult? Function(PlaceDetailsStateLoading value)? loading,
    TResult? Function(PlaceDetailsStateError value)? error,
    TResult? Function(PlaceDetailsStateSuccess value)? success,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PlaceDetailsStateInitial value)? initial,
    TResult Function(PlaceDetailsStateLoading value)? loading,
    TResult Function(PlaceDetailsStateError value)? error,
    TResult Function(PlaceDetailsStateSuccess value)? success,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class PlaceDetailsStateError implements PlaceDetailsState {
  const factory PlaceDetailsStateError({final String? error}) =
      _$PlaceDetailsStateError;

  String? get error;
  @JsonKey(ignore: true)
  _$$PlaceDetailsStateErrorCopyWith<_$PlaceDetailsStateError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PlaceDetailsStateSuccessCopyWith<$Res> {
  factory _$$PlaceDetailsStateSuccessCopyWith(_$PlaceDetailsStateSuccess value,
          $Res Function(_$PlaceDetailsStateSuccess) then) =
      __$$PlaceDetailsStateSuccessCopyWithImpl<$Res>;
  @useResult
  $Res call({Place? place});
}

/// @nodoc
class __$$PlaceDetailsStateSuccessCopyWithImpl<$Res>
    extends _$PlaceDetailsStateCopyWithImpl<$Res, _$PlaceDetailsStateSuccess>
    implements _$$PlaceDetailsStateSuccessCopyWith<$Res> {
  __$$PlaceDetailsStateSuccessCopyWithImpl(_$PlaceDetailsStateSuccess _value,
      $Res Function(_$PlaceDetailsStateSuccess) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? place = freezed,
  }) {
    return _then(_$PlaceDetailsStateSuccess(
      place: freezed == place
          ? _value.place
          : place // ignore: cast_nullable_to_non_nullable
              as Place?,
    ));
  }
}

/// @nodoc

class _$PlaceDetailsStateSuccess implements PlaceDetailsStateSuccess {
  const _$PlaceDetailsStateSuccess({this.place});

  @override
  final Place? place;

  @override
  String toString() {
    return 'PlaceDetailsState.success(place: $place)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlaceDetailsStateSuccess &&
            (identical(other.place, place) || other.place == place));
  }

  @override
  int get hashCode => Object.hash(runtimeType, place);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PlaceDetailsStateSuccessCopyWith<_$PlaceDetailsStateSuccess>
      get copyWith =>
          __$$PlaceDetailsStateSuccessCopyWithImpl<_$PlaceDetailsStateSuccess>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? error) error,
    required TResult Function(Place? place) success,
  }) {
    return success(place);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? error)? error,
    TResult? Function(Place? place)? success,
  }) {
    return success?.call(place);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? error)? error,
    TResult Function(Place? place)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(place);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PlaceDetailsStateInitial value) initial,
    required TResult Function(PlaceDetailsStateLoading value) loading,
    required TResult Function(PlaceDetailsStateError value) error,
    required TResult Function(PlaceDetailsStateSuccess value) success,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PlaceDetailsStateInitial value)? initial,
    TResult? Function(PlaceDetailsStateLoading value)? loading,
    TResult? Function(PlaceDetailsStateError value)? error,
    TResult? Function(PlaceDetailsStateSuccess value)? success,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PlaceDetailsStateInitial value)? initial,
    TResult Function(PlaceDetailsStateLoading value)? loading,
    TResult Function(PlaceDetailsStateError value)? error,
    TResult Function(PlaceDetailsStateSuccess value)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class PlaceDetailsStateSuccess implements PlaceDetailsState {
  const factory PlaceDetailsStateSuccess({final Place? place}) =
      _$PlaceDetailsStateSuccess;

  Place? get place;
  @JsonKey(ignore: true)
  _$$PlaceDetailsStateSuccessCopyWith<_$PlaceDetailsStateSuccess>
      get copyWith => throw _privateConstructorUsedError;
}
