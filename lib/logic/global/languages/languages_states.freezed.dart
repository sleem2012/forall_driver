// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'languages_states.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LanguagesState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(String? langDatum, LanguagesModel model) success,
    required TResult Function(String erorr) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(String? langDatum, LanguagesModel model)? success,
    TResult? Function(String erorr)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String? langDatum, LanguagesModel model)? success,
    TResult Function(String erorr)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LanguagesStateLoading value) loading,
    required TResult Function(LanguagesStateSelect value) success,
    required TResult Function(LanguagesStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LanguagesStateLoading value)? loading,
    TResult? Function(LanguagesStateSelect value)? success,
    TResult? Function(LanguagesStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LanguagesStateLoading value)? loading,
    TResult Function(LanguagesStateSelect value)? success,
    TResult Function(LanguagesStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LanguagesStateCopyWith<$Res> {
  factory $LanguagesStateCopyWith(
          LanguagesState value, $Res Function(LanguagesState) then) =
      _$LanguagesStateCopyWithImpl<$Res, LanguagesState>;
}

/// @nodoc
class _$LanguagesStateCopyWithImpl<$Res, $Val extends LanguagesState>
    implements $LanguagesStateCopyWith<$Res> {
  _$LanguagesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$LanguagesStateLoadingCopyWith<$Res> {
  factory _$$LanguagesStateLoadingCopyWith(_$LanguagesStateLoading value,
          $Res Function(_$LanguagesStateLoading) then) =
      __$$LanguagesStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LanguagesStateLoadingCopyWithImpl<$Res>
    extends _$LanguagesStateCopyWithImpl<$Res, _$LanguagesStateLoading>
    implements _$$LanguagesStateLoadingCopyWith<$Res> {
  __$$LanguagesStateLoadingCopyWithImpl(_$LanguagesStateLoading _value,
      $Res Function(_$LanguagesStateLoading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LanguagesStateLoading implements LanguagesStateLoading {
  const _$LanguagesStateLoading();

  @override
  String toString() {
    return 'LanguagesState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LanguagesStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(String? langDatum, LanguagesModel model) success,
    required TResult Function(String erorr) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(String? langDatum, LanguagesModel model)? success,
    TResult? Function(String erorr)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String? langDatum, LanguagesModel model)? success,
    TResult Function(String erorr)? error,
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
    required TResult Function(LanguagesStateLoading value) loading,
    required TResult Function(LanguagesStateSelect value) success,
    required TResult Function(LanguagesStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LanguagesStateLoading value)? loading,
    TResult? Function(LanguagesStateSelect value)? success,
    TResult? Function(LanguagesStateError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LanguagesStateLoading value)? loading,
    TResult Function(LanguagesStateSelect value)? success,
    TResult Function(LanguagesStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class LanguagesStateLoading implements LanguagesState {
  const factory LanguagesStateLoading() = _$LanguagesStateLoading;
}

/// @nodoc
abstract class _$$LanguagesStateSelectCopyWith<$Res> {
  factory _$$LanguagesStateSelectCopyWith(_$LanguagesStateSelect value,
          $Res Function(_$LanguagesStateSelect) then) =
      __$$LanguagesStateSelectCopyWithImpl<$Res>;
  @useResult
  $Res call({String? langDatum, LanguagesModel model});
}

/// @nodoc
class __$$LanguagesStateSelectCopyWithImpl<$Res>
    extends _$LanguagesStateCopyWithImpl<$Res, _$LanguagesStateSelect>
    implements _$$LanguagesStateSelectCopyWith<$Res> {
  __$$LanguagesStateSelectCopyWithImpl(_$LanguagesStateSelect _value,
      $Res Function(_$LanguagesStateSelect) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? langDatum = freezed,
    Object? model = null,
  }) {
    return _then(_$LanguagesStateSelect(
      langDatum: freezed == langDatum
          ? _value.langDatum
          : langDatum // ignore: cast_nullable_to_non_nullable
              as String?,
      model: null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as LanguagesModel,
    ));
  }
}

/// @nodoc

class _$LanguagesStateSelect implements LanguagesStateSelect {
  const _$LanguagesStateSelect({this.langDatum, required this.model});

  @override
  final String? langDatum;
  @override
  final LanguagesModel model;

  @override
  String toString() {
    return 'LanguagesState.success(langDatum: $langDatum, model: $model)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LanguagesStateSelect &&
            (identical(other.langDatum, langDatum) ||
                other.langDatum == langDatum) &&
            (identical(other.model, model) || other.model == model));
  }

  @override
  int get hashCode => Object.hash(runtimeType, langDatum, model);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LanguagesStateSelectCopyWith<_$LanguagesStateSelect> get copyWith =>
      __$$LanguagesStateSelectCopyWithImpl<_$LanguagesStateSelect>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(String? langDatum, LanguagesModel model) success,
    required TResult Function(String erorr) error,
  }) {
    return success(langDatum, model);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(String? langDatum, LanguagesModel model)? success,
    TResult? Function(String erorr)? error,
  }) {
    return success?.call(langDatum, model);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String? langDatum, LanguagesModel model)? success,
    TResult Function(String erorr)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(langDatum, model);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LanguagesStateLoading value) loading,
    required TResult Function(LanguagesStateSelect value) success,
    required TResult Function(LanguagesStateError value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LanguagesStateLoading value)? loading,
    TResult? Function(LanguagesStateSelect value)? success,
    TResult? Function(LanguagesStateError value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LanguagesStateLoading value)? loading,
    TResult Function(LanguagesStateSelect value)? success,
    TResult Function(LanguagesStateError value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class LanguagesStateSelect implements LanguagesState {
  const factory LanguagesStateSelect(
      {final String? langDatum,
      required final LanguagesModel model}) = _$LanguagesStateSelect;

  String? get langDatum;
  LanguagesModel get model;
  @JsonKey(ignore: true)
  _$$LanguagesStateSelectCopyWith<_$LanguagesStateSelect> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LanguagesStateErrorCopyWith<$Res> {
  factory _$$LanguagesStateErrorCopyWith(_$LanguagesStateError value,
          $Res Function(_$LanguagesStateError) then) =
      __$$LanguagesStateErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({String erorr});
}

/// @nodoc
class __$$LanguagesStateErrorCopyWithImpl<$Res>
    extends _$LanguagesStateCopyWithImpl<$Res, _$LanguagesStateError>
    implements _$$LanguagesStateErrorCopyWith<$Res> {
  __$$LanguagesStateErrorCopyWithImpl(
      _$LanguagesStateError _value, $Res Function(_$LanguagesStateError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? erorr = null,
  }) {
    return _then(_$LanguagesStateError(
      erorr: null == erorr
          ? _value.erorr
          : erorr // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LanguagesStateError implements LanguagesStateError {
  const _$LanguagesStateError({required this.erorr});

  @override
  final String erorr;

  @override
  String toString() {
    return 'LanguagesState.error(erorr: $erorr)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LanguagesStateError &&
            (identical(other.erorr, erorr) || other.erorr == erorr));
  }

  @override
  int get hashCode => Object.hash(runtimeType, erorr);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LanguagesStateErrorCopyWith<_$LanguagesStateError> get copyWith =>
      __$$LanguagesStateErrorCopyWithImpl<_$LanguagesStateError>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(String? langDatum, LanguagesModel model) success,
    required TResult Function(String erorr) error,
  }) {
    return error(erorr);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(String? langDatum, LanguagesModel model)? success,
    TResult? Function(String erorr)? error,
  }) {
    return error?.call(erorr);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String? langDatum, LanguagesModel model)? success,
    TResult Function(String erorr)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(erorr);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LanguagesStateLoading value) loading,
    required TResult Function(LanguagesStateSelect value) success,
    required TResult Function(LanguagesStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LanguagesStateLoading value)? loading,
    TResult? Function(LanguagesStateSelect value)? success,
    TResult? Function(LanguagesStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LanguagesStateLoading value)? loading,
    TResult Function(LanguagesStateSelect value)? success,
    TResult Function(LanguagesStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class LanguagesStateError implements LanguagesState {
  const factory LanguagesStateError({required final String erorr}) =
      _$LanguagesStateError;

  String get erorr;
  @JsonKey(ignore: true)
  _$$LanguagesStateErrorCopyWith<_$LanguagesStateError> get copyWith =>
      throw _privateConstructorUsedError;
}
