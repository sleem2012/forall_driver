// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'requests_union.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RequestsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() pending,
    required TResult Function() preparing,
    required TResult Function() delivery,
    required TResult Function() history,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? pending,
    TResult? Function()? preparing,
    TResult? Function()? delivery,
    TResult? Function()? history,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? pending,
    TResult Function()? preparing,
    TResult Function()? delivery,
    TResult Function()? history,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RequestsStatePending value) pending,
    required TResult Function(RequestsStatePreparing value) preparing,
    required TResult Function(RequestsStateDelivery value) delivery,
    required TResult Function(RequestsStateHistory value) history,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RequestsStatePending value)? pending,
    TResult? Function(RequestsStatePreparing value)? preparing,
    TResult? Function(RequestsStateDelivery value)? delivery,
    TResult? Function(RequestsStateHistory value)? history,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RequestsStatePending value)? pending,
    TResult Function(RequestsStatePreparing value)? preparing,
    TResult Function(RequestsStateDelivery value)? delivery,
    TResult Function(RequestsStateHistory value)? history,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequestsStateCopyWith<$Res> {
  factory $RequestsStateCopyWith(
          RequestsState value, $Res Function(RequestsState) then) =
      _$RequestsStateCopyWithImpl<$Res, RequestsState>;
}

/// @nodoc
class _$RequestsStateCopyWithImpl<$Res, $Val extends RequestsState>
    implements $RequestsStateCopyWith<$Res> {
  _$RequestsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$RequestsStatePendingCopyWith<$Res> {
  factory _$$RequestsStatePendingCopyWith(_$RequestsStatePending value,
          $Res Function(_$RequestsStatePending) then) =
      __$$RequestsStatePendingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RequestsStatePendingCopyWithImpl<$Res>
    extends _$RequestsStateCopyWithImpl<$Res, _$RequestsStatePending>
    implements _$$RequestsStatePendingCopyWith<$Res> {
  __$$RequestsStatePendingCopyWithImpl(_$RequestsStatePending _value,
      $Res Function(_$RequestsStatePending) _then)
      : super(_value, _then);
}

/// @nodoc

class _$RequestsStatePending implements RequestsStatePending {
  const _$RequestsStatePending();

  @override
  String toString() {
    return 'RequestsState.pending()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RequestsStatePending);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() pending,
    required TResult Function() preparing,
    required TResult Function() delivery,
    required TResult Function() history,
  }) {
    return pending();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? pending,
    TResult? Function()? preparing,
    TResult? Function()? delivery,
    TResult? Function()? history,
  }) {
    return pending?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? pending,
    TResult Function()? preparing,
    TResult Function()? delivery,
    TResult Function()? history,
    required TResult orElse(),
  }) {
    if (pending != null) {
      return pending();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RequestsStatePending value) pending,
    required TResult Function(RequestsStatePreparing value) preparing,
    required TResult Function(RequestsStateDelivery value) delivery,
    required TResult Function(RequestsStateHistory value) history,
  }) {
    return pending(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RequestsStatePending value)? pending,
    TResult? Function(RequestsStatePreparing value)? preparing,
    TResult? Function(RequestsStateDelivery value)? delivery,
    TResult? Function(RequestsStateHistory value)? history,
  }) {
    return pending?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RequestsStatePending value)? pending,
    TResult Function(RequestsStatePreparing value)? preparing,
    TResult Function(RequestsStateDelivery value)? delivery,
    TResult Function(RequestsStateHistory value)? history,
    required TResult orElse(),
  }) {
    if (pending != null) {
      return pending(this);
    }
    return orElse();
  }
}

abstract class RequestsStatePending implements RequestsState {
  const factory RequestsStatePending() = _$RequestsStatePending;
}

/// @nodoc
abstract class _$$RequestsStatePreparingCopyWith<$Res> {
  factory _$$RequestsStatePreparingCopyWith(_$RequestsStatePreparing value,
          $Res Function(_$RequestsStatePreparing) then) =
      __$$RequestsStatePreparingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RequestsStatePreparingCopyWithImpl<$Res>
    extends _$RequestsStateCopyWithImpl<$Res, _$RequestsStatePreparing>
    implements _$$RequestsStatePreparingCopyWith<$Res> {
  __$$RequestsStatePreparingCopyWithImpl(_$RequestsStatePreparing _value,
      $Res Function(_$RequestsStatePreparing) _then)
      : super(_value, _then);
}

/// @nodoc

class _$RequestsStatePreparing implements RequestsStatePreparing {
  const _$RequestsStatePreparing();

  @override
  String toString() {
    return 'RequestsState.preparing()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RequestsStatePreparing);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() pending,
    required TResult Function() preparing,
    required TResult Function() delivery,
    required TResult Function() history,
  }) {
    return preparing();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? pending,
    TResult? Function()? preparing,
    TResult? Function()? delivery,
    TResult? Function()? history,
  }) {
    return preparing?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? pending,
    TResult Function()? preparing,
    TResult Function()? delivery,
    TResult Function()? history,
    required TResult orElse(),
  }) {
    if (preparing != null) {
      return preparing();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RequestsStatePending value) pending,
    required TResult Function(RequestsStatePreparing value) preparing,
    required TResult Function(RequestsStateDelivery value) delivery,
    required TResult Function(RequestsStateHistory value) history,
  }) {
    return preparing(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RequestsStatePending value)? pending,
    TResult? Function(RequestsStatePreparing value)? preparing,
    TResult? Function(RequestsStateDelivery value)? delivery,
    TResult? Function(RequestsStateHistory value)? history,
  }) {
    return preparing?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RequestsStatePending value)? pending,
    TResult Function(RequestsStatePreparing value)? preparing,
    TResult Function(RequestsStateDelivery value)? delivery,
    TResult Function(RequestsStateHistory value)? history,
    required TResult orElse(),
  }) {
    if (preparing != null) {
      return preparing(this);
    }
    return orElse();
  }
}

abstract class RequestsStatePreparing implements RequestsState {
  const factory RequestsStatePreparing() = _$RequestsStatePreparing;
}

/// @nodoc
abstract class _$$RequestsStateDeliveryCopyWith<$Res> {
  factory _$$RequestsStateDeliveryCopyWith(_$RequestsStateDelivery value,
          $Res Function(_$RequestsStateDelivery) then) =
      __$$RequestsStateDeliveryCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RequestsStateDeliveryCopyWithImpl<$Res>
    extends _$RequestsStateCopyWithImpl<$Res, _$RequestsStateDelivery>
    implements _$$RequestsStateDeliveryCopyWith<$Res> {
  __$$RequestsStateDeliveryCopyWithImpl(_$RequestsStateDelivery _value,
      $Res Function(_$RequestsStateDelivery) _then)
      : super(_value, _then);
}

/// @nodoc

class _$RequestsStateDelivery implements RequestsStateDelivery {
  const _$RequestsStateDelivery();

  @override
  String toString() {
    return 'RequestsState.delivery()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RequestsStateDelivery);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() pending,
    required TResult Function() preparing,
    required TResult Function() delivery,
    required TResult Function() history,
  }) {
    return delivery();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? pending,
    TResult? Function()? preparing,
    TResult? Function()? delivery,
    TResult? Function()? history,
  }) {
    return delivery?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? pending,
    TResult Function()? preparing,
    TResult Function()? delivery,
    TResult Function()? history,
    required TResult orElse(),
  }) {
    if (delivery != null) {
      return delivery();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RequestsStatePending value) pending,
    required TResult Function(RequestsStatePreparing value) preparing,
    required TResult Function(RequestsStateDelivery value) delivery,
    required TResult Function(RequestsStateHistory value) history,
  }) {
    return delivery(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RequestsStatePending value)? pending,
    TResult? Function(RequestsStatePreparing value)? preparing,
    TResult? Function(RequestsStateDelivery value)? delivery,
    TResult? Function(RequestsStateHistory value)? history,
  }) {
    return delivery?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RequestsStatePending value)? pending,
    TResult Function(RequestsStatePreparing value)? preparing,
    TResult Function(RequestsStateDelivery value)? delivery,
    TResult Function(RequestsStateHistory value)? history,
    required TResult orElse(),
  }) {
    if (delivery != null) {
      return delivery(this);
    }
    return orElse();
  }
}

abstract class RequestsStateDelivery implements RequestsState {
  const factory RequestsStateDelivery() = _$RequestsStateDelivery;
}

/// @nodoc
abstract class _$$RequestsStateHistoryCopyWith<$Res> {
  factory _$$RequestsStateHistoryCopyWith(_$RequestsStateHistory value,
          $Res Function(_$RequestsStateHistory) then) =
      __$$RequestsStateHistoryCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RequestsStateHistoryCopyWithImpl<$Res>
    extends _$RequestsStateCopyWithImpl<$Res, _$RequestsStateHistory>
    implements _$$RequestsStateHistoryCopyWith<$Res> {
  __$$RequestsStateHistoryCopyWithImpl(_$RequestsStateHistory _value,
      $Res Function(_$RequestsStateHistory) _then)
      : super(_value, _then);
}

/// @nodoc

class _$RequestsStateHistory implements RequestsStateHistory {
  const _$RequestsStateHistory();

  @override
  String toString() {
    return 'RequestsState.history()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RequestsStateHistory);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() pending,
    required TResult Function() preparing,
    required TResult Function() delivery,
    required TResult Function() history,
  }) {
    return history();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? pending,
    TResult? Function()? preparing,
    TResult? Function()? delivery,
    TResult? Function()? history,
  }) {
    return history?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? pending,
    TResult Function()? preparing,
    TResult Function()? delivery,
    TResult Function()? history,
    required TResult orElse(),
  }) {
    if (history != null) {
      return history();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RequestsStatePending value) pending,
    required TResult Function(RequestsStatePreparing value) preparing,
    required TResult Function(RequestsStateDelivery value) delivery,
    required TResult Function(RequestsStateHistory value) history,
  }) {
    return history(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RequestsStatePending value)? pending,
    TResult? Function(RequestsStatePreparing value)? preparing,
    TResult? Function(RequestsStateDelivery value)? delivery,
    TResult? Function(RequestsStateHistory value)? history,
  }) {
    return history?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RequestsStatePending value)? pending,
    TResult Function(RequestsStatePreparing value)? preparing,
    TResult Function(RequestsStateDelivery value)? delivery,
    TResult Function(RequestsStateHistory value)? history,
    required TResult orElse(),
  }) {
    if (history != null) {
      return history(this);
    }
    return orElse();
  }
}

abstract class RequestsStateHistory implements RequestsState {
  const factory RequestsStateHistory() = _$RequestsStateHistory;
}
