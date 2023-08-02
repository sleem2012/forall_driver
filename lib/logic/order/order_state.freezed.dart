// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$OrderState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(OrderModel orderModel) success,
    required TResult Function() updateSuccess,
    required TResult Function(String error) updateError,
    required TResult Function(String error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(OrderModel orderModel)? success,
    TResult? Function()? updateSuccess,
    TResult? Function(String error)? updateError,
    TResult? Function(String error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(OrderModel orderModel)? success,
    TResult Function()? updateSuccess,
    TResult Function(String error)? updateError,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OrderStateInitial value) initial,
    required TResult Function(OrderStateLoading value) loading,
    required TResult Function(OrderStateSuccess value) success,
    required TResult Function(OrderStateUpdateSuccess value) updateSuccess,
    required TResult Function(OrderStateUpdateError value) updateError,
    required TResult Function(OrderStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OrderStateInitial value)? initial,
    TResult? Function(OrderStateLoading value)? loading,
    TResult? Function(OrderStateSuccess value)? success,
    TResult? Function(OrderStateUpdateSuccess value)? updateSuccess,
    TResult? Function(OrderStateUpdateError value)? updateError,
    TResult? Function(OrderStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OrderStateInitial value)? initial,
    TResult Function(OrderStateLoading value)? loading,
    TResult Function(OrderStateSuccess value)? success,
    TResult Function(OrderStateUpdateSuccess value)? updateSuccess,
    TResult Function(OrderStateUpdateError value)? updateError,
    TResult Function(OrderStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderStateCopyWith<$Res> {
  factory $OrderStateCopyWith(
          OrderState value, $Res Function(OrderState) then) =
      _$OrderStateCopyWithImpl<$Res, OrderState>;
}

/// @nodoc
class _$OrderStateCopyWithImpl<$Res, $Val extends OrderState>
    implements $OrderStateCopyWith<$Res> {
  _$OrderStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$OrderStateInitialCopyWith<$Res> {
  factory _$$OrderStateInitialCopyWith(
          _$OrderStateInitial value, $Res Function(_$OrderStateInitial) then) =
      __$$OrderStateInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$OrderStateInitialCopyWithImpl<$Res>
    extends _$OrderStateCopyWithImpl<$Res, _$OrderStateInitial>
    implements _$$OrderStateInitialCopyWith<$Res> {
  __$$OrderStateInitialCopyWithImpl(
      _$OrderStateInitial _value, $Res Function(_$OrderStateInitial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$OrderStateInitial implements OrderStateInitial {
  const _$OrderStateInitial();

  @override
  String toString() {
    return 'OrderState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$OrderStateInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(OrderModel orderModel) success,
    required TResult Function() updateSuccess,
    required TResult Function(String error) updateError,
    required TResult Function(String error) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(OrderModel orderModel)? success,
    TResult? Function()? updateSuccess,
    TResult? Function(String error)? updateError,
    TResult? Function(String error)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(OrderModel orderModel)? success,
    TResult Function()? updateSuccess,
    TResult Function(String error)? updateError,
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
    required TResult Function(OrderStateInitial value) initial,
    required TResult Function(OrderStateLoading value) loading,
    required TResult Function(OrderStateSuccess value) success,
    required TResult Function(OrderStateUpdateSuccess value) updateSuccess,
    required TResult Function(OrderStateUpdateError value) updateError,
    required TResult Function(OrderStateError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OrderStateInitial value)? initial,
    TResult? Function(OrderStateLoading value)? loading,
    TResult? Function(OrderStateSuccess value)? success,
    TResult? Function(OrderStateUpdateSuccess value)? updateSuccess,
    TResult? Function(OrderStateUpdateError value)? updateError,
    TResult? Function(OrderStateError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OrderStateInitial value)? initial,
    TResult Function(OrderStateLoading value)? loading,
    TResult Function(OrderStateSuccess value)? success,
    TResult Function(OrderStateUpdateSuccess value)? updateSuccess,
    TResult Function(OrderStateUpdateError value)? updateError,
    TResult Function(OrderStateError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class OrderStateInitial implements OrderState {
  const factory OrderStateInitial() = _$OrderStateInitial;
}

/// @nodoc
abstract class _$$OrderStateLoadingCopyWith<$Res> {
  factory _$$OrderStateLoadingCopyWith(
          _$OrderStateLoading value, $Res Function(_$OrderStateLoading) then) =
      __$$OrderStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$OrderStateLoadingCopyWithImpl<$Res>
    extends _$OrderStateCopyWithImpl<$Res, _$OrderStateLoading>
    implements _$$OrderStateLoadingCopyWith<$Res> {
  __$$OrderStateLoadingCopyWithImpl(
      _$OrderStateLoading _value, $Res Function(_$OrderStateLoading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$OrderStateLoading implements OrderStateLoading {
  const _$OrderStateLoading();

  @override
  String toString() {
    return 'OrderState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$OrderStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(OrderModel orderModel) success,
    required TResult Function() updateSuccess,
    required TResult Function(String error) updateError,
    required TResult Function(String error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(OrderModel orderModel)? success,
    TResult? Function()? updateSuccess,
    TResult? Function(String error)? updateError,
    TResult? Function(String error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(OrderModel orderModel)? success,
    TResult Function()? updateSuccess,
    TResult Function(String error)? updateError,
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
    required TResult Function(OrderStateInitial value) initial,
    required TResult Function(OrderStateLoading value) loading,
    required TResult Function(OrderStateSuccess value) success,
    required TResult Function(OrderStateUpdateSuccess value) updateSuccess,
    required TResult Function(OrderStateUpdateError value) updateError,
    required TResult Function(OrderStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OrderStateInitial value)? initial,
    TResult? Function(OrderStateLoading value)? loading,
    TResult? Function(OrderStateSuccess value)? success,
    TResult? Function(OrderStateUpdateSuccess value)? updateSuccess,
    TResult? Function(OrderStateUpdateError value)? updateError,
    TResult? Function(OrderStateError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OrderStateInitial value)? initial,
    TResult Function(OrderStateLoading value)? loading,
    TResult Function(OrderStateSuccess value)? success,
    TResult Function(OrderStateUpdateSuccess value)? updateSuccess,
    TResult Function(OrderStateUpdateError value)? updateError,
    TResult Function(OrderStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class OrderStateLoading implements OrderState {
  const factory OrderStateLoading() = _$OrderStateLoading;
}

/// @nodoc
abstract class _$$OrderStateSuccessCopyWith<$Res> {
  factory _$$OrderStateSuccessCopyWith(
          _$OrderStateSuccess value, $Res Function(_$OrderStateSuccess) then) =
      __$$OrderStateSuccessCopyWithImpl<$Res>;
  @useResult
  $Res call({OrderModel orderModel});
}

/// @nodoc
class __$$OrderStateSuccessCopyWithImpl<$Res>
    extends _$OrderStateCopyWithImpl<$Res, _$OrderStateSuccess>
    implements _$$OrderStateSuccessCopyWith<$Res> {
  __$$OrderStateSuccessCopyWithImpl(
      _$OrderStateSuccess _value, $Res Function(_$OrderStateSuccess) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderModel = null,
  }) {
    return _then(_$OrderStateSuccess(
      orderModel: null == orderModel
          ? _value.orderModel
          : orderModel // ignore: cast_nullable_to_non_nullable
              as OrderModel,
    ));
  }
}

/// @nodoc

class _$OrderStateSuccess implements OrderStateSuccess {
  const _$OrderStateSuccess({required this.orderModel});

  @override
  final OrderModel orderModel;

  @override
  String toString() {
    return 'OrderState.success(orderModel: $orderModel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderStateSuccess &&
            (identical(other.orderModel, orderModel) ||
                other.orderModel == orderModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, orderModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderStateSuccessCopyWith<_$OrderStateSuccess> get copyWith =>
      __$$OrderStateSuccessCopyWithImpl<_$OrderStateSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(OrderModel orderModel) success,
    required TResult Function() updateSuccess,
    required TResult Function(String error) updateError,
    required TResult Function(String error) error,
  }) {
    return success(orderModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(OrderModel orderModel)? success,
    TResult? Function()? updateSuccess,
    TResult? Function(String error)? updateError,
    TResult? Function(String error)? error,
  }) {
    return success?.call(orderModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(OrderModel orderModel)? success,
    TResult Function()? updateSuccess,
    TResult Function(String error)? updateError,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(orderModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OrderStateInitial value) initial,
    required TResult Function(OrderStateLoading value) loading,
    required TResult Function(OrderStateSuccess value) success,
    required TResult Function(OrderStateUpdateSuccess value) updateSuccess,
    required TResult Function(OrderStateUpdateError value) updateError,
    required TResult Function(OrderStateError value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OrderStateInitial value)? initial,
    TResult? Function(OrderStateLoading value)? loading,
    TResult? Function(OrderStateSuccess value)? success,
    TResult? Function(OrderStateUpdateSuccess value)? updateSuccess,
    TResult? Function(OrderStateUpdateError value)? updateError,
    TResult? Function(OrderStateError value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OrderStateInitial value)? initial,
    TResult Function(OrderStateLoading value)? loading,
    TResult Function(OrderStateSuccess value)? success,
    TResult Function(OrderStateUpdateSuccess value)? updateSuccess,
    TResult Function(OrderStateUpdateError value)? updateError,
    TResult Function(OrderStateError value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class OrderStateSuccess implements OrderState {
  const factory OrderStateSuccess({required final OrderModel orderModel}) =
      _$OrderStateSuccess;

  OrderModel get orderModel;
  @JsonKey(ignore: true)
  _$$OrderStateSuccessCopyWith<_$OrderStateSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OrderStateUpdateSuccessCopyWith<$Res> {
  factory _$$OrderStateUpdateSuccessCopyWith(_$OrderStateUpdateSuccess value,
          $Res Function(_$OrderStateUpdateSuccess) then) =
      __$$OrderStateUpdateSuccessCopyWithImpl<$Res>;
}

/// @nodoc
class __$$OrderStateUpdateSuccessCopyWithImpl<$Res>
    extends _$OrderStateCopyWithImpl<$Res, _$OrderStateUpdateSuccess>
    implements _$$OrderStateUpdateSuccessCopyWith<$Res> {
  __$$OrderStateUpdateSuccessCopyWithImpl(_$OrderStateUpdateSuccess _value,
      $Res Function(_$OrderStateUpdateSuccess) _then)
      : super(_value, _then);
}

/// @nodoc

class _$OrderStateUpdateSuccess implements OrderStateUpdateSuccess {
  const _$OrderStateUpdateSuccess();

  @override
  String toString() {
    return 'OrderState.updateSuccess()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderStateUpdateSuccess);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(OrderModel orderModel) success,
    required TResult Function() updateSuccess,
    required TResult Function(String error) updateError,
    required TResult Function(String error) error,
  }) {
    return updateSuccess();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(OrderModel orderModel)? success,
    TResult? Function()? updateSuccess,
    TResult? Function(String error)? updateError,
    TResult? Function(String error)? error,
  }) {
    return updateSuccess?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(OrderModel orderModel)? success,
    TResult Function()? updateSuccess,
    TResult Function(String error)? updateError,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (updateSuccess != null) {
      return updateSuccess();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OrderStateInitial value) initial,
    required TResult Function(OrderStateLoading value) loading,
    required TResult Function(OrderStateSuccess value) success,
    required TResult Function(OrderStateUpdateSuccess value) updateSuccess,
    required TResult Function(OrderStateUpdateError value) updateError,
    required TResult Function(OrderStateError value) error,
  }) {
    return updateSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OrderStateInitial value)? initial,
    TResult? Function(OrderStateLoading value)? loading,
    TResult? Function(OrderStateSuccess value)? success,
    TResult? Function(OrderStateUpdateSuccess value)? updateSuccess,
    TResult? Function(OrderStateUpdateError value)? updateError,
    TResult? Function(OrderStateError value)? error,
  }) {
    return updateSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OrderStateInitial value)? initial,
    TResult Function(OrderStateLoading value)? loading,
    TResult Function(OrderStateSuccess value)? success,
    TResult Function(OrderStateUpdateSuccess value)? updateSuccess,
    TResult Function(OrderStateUpdateError value)? updateError,
    TResult Function(OrderStateError value)? error,
    required TResult orElse(),
  }) {
    if (updateSuccess != null) {
      return updateSuccess(this);
    }
    return orElse();
  }
}

abstract class OrderStateUpdateSuccess implements OrderState {
  const factory OrderStateUpdateSuccess() = _$OrderStateUpdateSuccess;
}

/// @nodoc
abstract class _$$OrderStateUpdateErrorCopyWith<$Res> {
  factory _$$OrderStateUpdateErrorCopyWith(_$OrderStateUpdateError value,
          $Res Function(_$OrderStateUpdateError) then) =
      __$$OrderStateUpdateErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$OrderStateUpdateErrorCopyWithImpl<$Res>
    extends _$OrderStateCopyWithImpl<$Res, _$OrderStateUpdateError>
    implements _$$OrderStateUpdateErrorCopyWith<$Res> {
  __$$OrderStateUpdateErrorCopyWithImpl(_$OrderStateUpdateError _value,
      $Res Function(_$OrderStateUpdateError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$OrderStateUpdateError(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$OrderStateUpdateError implements OrderStateUpdateError {
  const _$OrderStateUpdateError({required this.error});

  @override
  final String error;

  @override
  String toString() {
    return 'OrderState.updateError(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderStateUpdateError &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderStateUpdateErrorCopyWith<_$OrderStateUpdateError> get copyWith =>
      __$$OrderStateUpdateErrorCopyWithImpl<_$OrderStateUpdateError>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(OrderModel orderModel) success,
    required TResult Function() updateSuccess,
    required TResult Function(String error) updateError,
    required TResult Function(String error) error,
  }) {
    return updateError(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(OrderModel orderModel)? success,
    TResult? Function()? updateSuccess,
    TResult? Function(String error)? updateError,
    TResult? Function(String error)? error,
  }) {
    return updateError?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(OrderModel orderModel)? success,
    TResult Function()? updateSuccess,
    TResult Function(String error)? updateError,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (updateError != null) {
      return updateError(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OrderStateInitial value) initial,
    required TResult Function(OrderStateLoading value) loading,
    required TResult Function(OrderStateSuccess value) success,
    required TResult Function(OrderStateUpdateSuccess value) updateSuccess,
    required TResult Function(OrderStateUpdateError value) updateError,
    required TResult Function(OrderStateError value) error,
  }) {
    return updateError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OrderStateInitial value)? initial,
    TResult? Function(OrderStateLoading value)? loading,
    TResult? Function(OrderStateSuccess value)? success,
    TResult? Function(OrderStateUpdateSuccess value)? updateSuccess,
    TResult? Function(OrderStateUpdateError value)? updateError,
    TResult? Function(OrderStateError value)? error,
  }) {
    return updateError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OrderStateInitial value)? initial,
    TResult Function(OrderStateLoading value)? loading,
    TResult Function(OrderStateSuccess value)? success,
    TResult Function(OrderStateUpdateSuccess value)? updateSuccess,
    TResult Function(OrderStateUpdateError value)? updateError,
    TResult Function(OrderStateError value)? error,
    required TResult orElse(),
  }) {
    if (updateError != null) {
      return updateError(this);
    }
    return orElse();
  }
}

abstract class OrderStateUpdateError implements OrderState {
  const factory OrderStateUpdateError({required final String error}) =
      _$OrderStateUpdateError;

  String get error;
  @JsonKey(ignore: true)
  _$$OrderStateUpdateErrorCopyWith<_$OrderStateUpdateError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OrderStateErrorCopyWith<$Res> {
  factory _$$OrderStateErrorCopyWith(
          _$OrderStateError value, $Res Function(_$OrderStateError) then) =
      __$$OrderStateErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$OrderStateErrorCopyWithImpl<$Res>
    extends _$OrderStateCopyWithImpl<$Res, _$OrderStateError>
    implements _$$OrderStateErrorCopyWith<$Res> {
  __$$OrderStateErrorCopyWithImpl(
      _$OrderStateError _value, $Res Function(_$OrderStateError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$OrderStateError(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$OrderStateError implements OrderStateError {
  const _$OrderStateError({required this.error});

  @override
  final String error;

  @override
  String toString() {
    return 'OrderState.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderStateError &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderStateErrorCopyWith<_$OrderStateError> get copyWith =>
      __$$OrderStateErrorCopyWithImpl<_$OrderStateError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(OrderModel orderModel) success,
    required TResult Function() updateSuccess,
    required TResult Function(String error) updateError,
    required TResult Function(String error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(OrderModel orderModel)? success,
    TResult? Function()? updateSuccess,
    TResult? Function(String error)? updateError,
    TResult? Function(String error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(OrderModel orderModel)? success,
    TResult Function()? updateSuccess,
    TResult Function(String error)? updateError,
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
    required TResult Function(OrderStateInitial value) initial,
    required TResult Function(OrderStateLoading value) loading,
    required TResult Function(OrderStateSuccess value) success,
    required TResult Function(OrderStateUpdateSuccess value) updateSuccess,
    required TResult Function(OrderStateUpdateError value) updateError,
    required TResult Function(OrderStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OrderStateInitial value)? initial,
    TResult? Function(OrderStateLoading value)? loading,
    TResult? Function(OrderStateSuccess value)? success,
    TResult? Function(OrderStateUpdateSuccess value)? updateSuccess,
    TResult? Function(OrderStateUpdateError value)? updateError,
    TResult? Function(OrderStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OrderStateInitial value)? initial,
    TResult Function(OrderStateLoading value)? loading,
    TResult Function(OrderStateSuccess value)? success,
    TResult Function(OrderStateUpdateSuccess value)? updateSuccess,
    TResult Function(OrderStateUpdateError value)? updateError,
    TResult Function(OrderStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class OrderStateError implements OrderState {
  const factory OrderStateError({required final String error}) =
      _$OrderStateError;

  String get error;
  @JsonKey(ignore: true)
  _$$OrderStateErrorCopyWith<_$OrderStateError> get copyWith =>
      throw _privateConstructorUsedError;
}
