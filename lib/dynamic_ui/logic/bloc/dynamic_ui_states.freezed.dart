// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dynamic_ui_states.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DynamicUiState {
  String? get id => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? id) initial,
    required TResult Function(String? id) loading,
    required TResult Function(String? id, String? key) update,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? id)? initial,
    TResult? Function(String? id)? loading,
    TResult? Function(String? id, String? key)? update,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? id)? initial,
    TResult Function(String? id)? loading,
    TResult Function(String? id, String? key)? update,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DynamicUiStateInitial value) initial,
    required TResult Function(_DynamicUiStateLoading value) loading,
    required TResult Function(_DynamicUiStateUpdate value) update,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DynamicUiStateInitial value)? initial,
    TResult? Function(_DynamicUiStateLoading value)? loading,
    TResult? Function(_DynamicUiStateUpdate value)? update,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DynamicUiStateInitial value)? initial,
    TResult Function(_DynamicUiStateLoading value)? loading,
    TResult Function(_DynamicUiStateUpdate value)? update,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DynamicUiStateCopyWith<DynamicUiState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DynamicUiStateCopyWith<$Res> {
  factory $DynamicUiStateCopyWith(
          DynamicUiState value, $Res Function(DynamicUiState) then) =
      _$DynamicUiStateCopyWithImpl<$Res, DynamicUiState>;
  @useResult
  $Res call({String? id});
}

/// @nodoc
class _$DynamicUiStateCopyWithImpl<$Res, $Val extends DynamicUiState>
    implements $DynamicUiStateCopyWith<$Res> {
  _$DynamicUiStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DynamicUiStateInitialCopyWith<$Res>
    implements $DynamicUiStateCopyWith<$Res> {
  factory _$$_DynamicUiStateInitialCopyWith(_$_DynamicUiStateInitial value,
          $Res Function(_$_DynamicUiStateInitial) then) =
      __$$_DynamicUiStateInitialCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? id});
}

/// @nodoc
class __$$_DynamicUiStateInitialCopyWithImpl<$Res>
    extends _$DynamicUiStateCopyWithImpl<$Res, _$_DynamicUiStateInitial>
    implements _$$_DynamicUiStateInitialCopyWith<$Res> {
  __$$_DynamicUiStateInitialCopyWithImpl(_$_DynamicUiStateInitial _value,
      $Res Function(_$_DynamicUiStateInitial) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
  }) {
    return _then(_$_DynamicUiStateInitial(
      freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_DynamicUiStateInitial implements _DynamicUiStateInitial {
  const _$_DynamicUiStateInitial(this.id);

  @override
  final String? id;

  @override
  String toString() {
    return 'DynamicUiState.initial(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DynamicUiStateInitial &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DynamicUiStateInitialCopyWith<_$_DynamicUiStateInitial> get copyWith =>
      __$$_DynamicUiStateInitialCopyWithImpl<_$_DynamicUiStateInitial>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? id) initial,
    required TResult Function(String? id) loading,
    required TResult Function(String? id, String? key) update,
  }) {
    return initial(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? id)? initial,
    TResult? Function(String? id)? loading,
    TResult? Function(String? id, String? key)? update,
  }) {
    return initial?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? id)? initial,
    TResult Function(String? id)? loading,
    TResult Function(String? id, String? key)? update,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DynamicUiStateInitial value) initial,
    required TResult Function(_DynamicUiStateLoading value) loading,
    required TResult Function(_DynamicUiStateUpdate value) update,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DynamicUiStateInitial value)? initial,
    TResult? Function(_DynamicUiStateLoading value)? loading,
    TResult? Function(_DynamicUiStateUpdate value)? update,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DynamicUiStateInitial value)? initial,
    TResult Function(_DynamicUiStateLoading value)? loading,
    TResult Function(_DynamicUiStateUpdate value)? update,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _DynamicUiStateInitial implements DynamicUiState {
  const factory _DynamicUiStateInitial(final String? id) =
      _$_DynamicUiStateInitial;

  @override
  String? get id;
  @override
  @JsonKey(ignore: true)
  _$$_DynamicUiStateInitialCopyWith<_$_DynamicUiStateInitial> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_DynamicUiStateLoadingCopyWith<$Res>
    implements $DynamicUiStateCopyWith<$Res> {
  factory _$$_DynamicUiStateLoadingCopyWith(_$_DynamicUiStateLoading value,
          $Res Function(_$_DynamicUiStateLoading) then) =
      __$$_DynamicUiStateLoadingCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? id});
}

/// @nodoc
class __$$_DynamicUiStateLoadingCopyWithImpl<$Res>
    extends _$DynamicUiStateCopyWithImpl<$Res, _$_DynamicUiStateLoading>
    implements _$$_DynamicUiStateLoadingCopyWith<$Res> {
  __$$_DynamicUiStateLoadingCopyWithImpl(_$_DynamicUiStateLoading _value,
      $Res Function(_$_DynamicUiStateLoading) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
  }) {
    return _then(_$_DynamicUiStateLoading(
      freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_DynamicUiStateLoading implements _DynamicUiStateLoading {
  const _$_DynamicUiStateLoading(this.id);

  @override
  final String? id;

  @override
  String toString() {
    return 'DynamicUiState.loading(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DynamicUiStateLoading &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DynamicUiStateLoadingCopyWith<_$_DynamicUiStateLoading> get copyWith =>
      __$$_DynamicUiStateLoadingCopyWithImpl<_$_DynamicUiStateLoading>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? id) initial,
    required TResult Function(String? id) loading,
    required TResult Function(String? id, String? key) update,
  }) {
    return loading(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? id)? initial,
    TResult? Function(String? id)? loading,
    TResult? Function(String? id, String? key)? update,
  }) {
    return loading?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? id)? initial,
    TResult Function(String? id)? loading,
    TResult Function(String? id, String? key)? update,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DynamicUiStateInitial value) initial,
    required TResult Function(_DynamicUiStateLoading value) loading,
    required TResult Function(_DynamicUiStateUpdate value) update,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DynamicUiStateInitial value)? initial,
    TResult? Function(_DynamicUiStateLoading value)? loading,
    TResult? Function(_DynamicUiStateUpdate value)? update,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DynamicUiStateInitial value)? initial,
    TResult Function(_DynamicUiStateLoading value)? loading,
    TResult Function(_DynamicUiStateUpdate value)? update,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _DynamicUiStateLoading implements DynamicUiState {
  const factory _DynamicUiStateLoading(final String? id) =
      _$_DynamicUiStateLoading;

  @override
  String? get id;
  @override
  @JsonKey(ignore: true)
  _$$_DynamicUiStateLoadingCopyWith<_$_DynamicUiStateLoading> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_DynamicUiStateUpdateCopyWith<$Res>
    implements $DynamicUiStateCopyWith<$Res> {
  factory _$$_DynamicUiStateUpdateCopyWith(_$_DynamicUiStateUpdate value,
          $Res Function(_$_DynamicUiStateUpdate) then) =
      __$$_DynamicUiStateUpdateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? id, String? key});
}

/// @nodoc
class __$$_DynamicUiStateUpdateCopyWithImpl<$Res>
    extends _$DynamicUiStateCopyWithImpl<$Res, _$_DynamicUiStateUpdate>
    implements _$$_DynamicUiStateUpdateCopyWith<$Res> {
  __$$_DynamicUiStateUpdateCopyWithImpl(_$_DynamicUiStateUpdate _value,
      $Res Function(_$_DynamicUiStateUpdate) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? key = freezed,
  }) {
    return _then(_$_DynamicUiStateUpdate(
      freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      key: freezed == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_DynamicUiStateUpdate implements _DynamicUiStateUpdate {
  const _$_DynamicUiStateUpdate(this.id, {this.key});

  @override
  final String? id;
  @override
  final String? key;

  @override
  String toString() {
    return 'DynamicUiState.update(id: $id, key: $key)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DynamicUiStateUpdate &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.key, key) || other.key == key));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, key);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DynamicUiStateUpdateCopyWith<_$_DynamicUiStateUpdate> get copyWith =>
      __$$_DynamicUiStateUpdateCopyWithImpl<_$_DynamicUiStateUpdate>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? id) initial,
    required TResult Function(String? id) loading,
    required TResult Function(String? id, String? key) update,
  }) {
    return update(id, key);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? id)? initial,
    TResult? Function(String? id)? loading,
    TResult? Function(String? id, String? key)? update,
  }) {
    return update?.call(id, key);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? id)? initial,
    TResult Function(String? id)? loading,
    TResult Function(String? id, String? key)? update,
    required TResult orElse(),
  }) {
    if (update != null) {
      return update(id, key);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DynamicUiStateInitial value) initial,
    required TResult Function(_DynamicUiStateLoading value) loading,
    required TResult Function(_DynamicUiStateUpdate value) update,
  }) {
    return update(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DynamicUiStateInitial value)? initial,
    TResult? Function(_DynamicUiStateLoading value)? loading,
    TResult? Function(_DynamicUiStateUpdate value)? update,
  }) {
    return update?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DynamicUiStateInitial value)? initial,
    TResult Function(_DynamicUiStateLoading value)? loading,
    TResult Function(_DynamicUiStateUpdate value)? update,
    required TResult orElse(),
  }) {
    if (update != null) {
      return update(this);
    }
    return orElse();
  }
}

abstract class _DynamicUiStateUpdate implements DynamicUiState {
  const factory _DynamicUiStateUpdate(final String? id, {final String? key}) =
      _$_DynamicUiStateUpdate;

  @override
  String? get id;
  String? get key;
  @override
  @JsonKey(ignore: true)
  _$$_DynamicUiStateUpdateCopyWith<_$_DynamicUiStateUpdate> get copyWith =>
      throw _privateConstructorUsedError;
}
