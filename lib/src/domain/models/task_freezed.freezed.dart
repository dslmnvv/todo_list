// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_freezed.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TaskFreezed _$TaskFreezedFromJson(Map<String, dynamic> json) {
  return _TaskFreezed.fromJson(json);
}

/// @nodoc
mixin _$TaskFreezed {
  String get id => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;
  Priority get importance => throw _privateConstructorUsedError;
  @EpochDateTimeConverter()
  DateTime? get deadline => throw _privateConstructorUsedError;
  bool get done => throw _privateConstructorUsedError;
  @EpochDateTimeConverter()
  @JsonKey(name: 'changed_at')
  DateTime get changeAt => throw _privateConstructorUsedError;
  @EpochDateTimeConverter()
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_updated_by')
  String get lastUpdateBy => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TaskFreezedCopyWith<TaskFreezed> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskFreezedCopyWith<$Res> {
  factory $TaskFreezedCopyWith(
          TaskFreezed value, $Res Function(TaskFreezed) then) =
      _$TaskFreezedCopyWithImpl<$Res, TaskFreezed>;
  @useResult
  $Res call(
      {String id,
      String text,
      Priority importance,
      @EpochDateTimeConverter() DateTime? deadline,
      bool done,
      @EpochDateTimeConverter() @JsonKey(name: 'changed_at') DateTime changeAt,
      @EpochDateTimeConverter()
      @JsonKey(name: 'created_at')
      DateTime? createdAt,
      @JsonKey(name: 'last_updated_by') String lastUpdateBy});
}

/// @nodoc
class _$TaskFreezedCopyWithImpl<$Res, $Val extends TaskFreezed>
    implements $TaskFreezedCopyWith<$Res> {
  _$TaskFreezedCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? text = null,
    Object? importance = null,
    Object? deadline = freezed,
    Object? done = null,
    Object? changeAt = null,
    Object? createdAt = freezed,
    Object? lastUpdateBy = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      importance: null == importance
          ? _value.importance
          : importance // ignore: cast_nullable_to_non_nullable
              as Priority,
      deadline: freezed == deadline
          ? _value.deadline
          : deadline // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      done: null == done
          ? _value.done
          : done // ignore: cast_nullable_to_non_nullable
              as bool,
      changeAt: null == changeAt
          ? _value.changeAt
          : changeAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lastUpdateBy: null == lastUpdateBy
          ? _value.lastUpdateBy
          : lastUpdateBy // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TaskFreezedCopyWith<$Res>
    implements $TaskFreezedCopyWith<$Res> {
  factory _$$_TaskFreezedCopyWith(
          _$_TaskFreezed value, $Res Function(_$_TaskFreezed) then) =
      __$$_TaskFreezedCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String text,
      Priority importance,
      @EpochDateTimeConverter() DateTime? deadline,
      bool done,
      @EpochDateTimeConverter() @JsonKey(name: 'changed_at') DateTime changeAt,
      @EpochDateTimeConverter()
      @JsonKey(name: 'created_at')
      DateTime? createdAt,
      @JsonKey(name: 'last_updated_by') String lastUpdateBy});
}

/// @nodoc
class __$$_TaskFreezedCopyWithImpl<$Res>
    extends _$TaskFreezedCopyWithImpl<$Res, _$_TaskFreezed>
    implements _$$_TaskFreezedCopyWith<$Res> {
  __$$_TaskFreezedCopyWithImpl(
      _$_TaskFreezed _value, $Res Function(_$_TaskFreezed) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? text = null,
    Object? importance = null,
    Object? deadline = freezed,
    Object? done = null,
    Object? changeAt = null,
    Object? createdAt = freezed,
    Object? lastUpdateBy = null,
  }) {
    return _then(_$_TaskFreezed(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      importance: null == importance
          ? _value.importance
          : importance // ignore: cast_nullable_to_non_nullable
              as Priority,
      deadline: freezed == deadline
          ? _value.deadline
          : deadline // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      done: null == done
          ? _value.done
          : done // ignore: cast_nullable_to_non_nullable
              as bool,
      changeAt: null == changeAt
          ? _value.changeAt
          : changeAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lastUpdateBy: null == lastUpdateBy
          ? _value.lastUpdateBy
          : lastUpdateBy // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TaskFreezed extends _TaskFreezed {
  _$_TaskFreezed(
      {required this.id,
      required this.text,
      required this.importance,
      @EpochDateTimeConverter() this.deadline,
      this.done = false,
      @EpochDateTimeConverter()
      @JsonKey(name: 'changed_at')
      required this.changeAt,
      @EpochDateTimeConverter()
      @JsonKey(name: 'created_at')
      required this.createdAt,
      @JsonKey(name: 'last_updated_by') required this.lastUpdateBy})
      : super._();

  factory _$_TaskFreezed.fromJson(Map<String, dynamic> json) =>
      _$$_TaskFreezedFromJson(json);

  @override
  final String id;
  @override
  final String text;
  @override
  final Priority importance;
  @override
  @EpochDateTimeConverter()
  final DateTime? deadline;
  @override
  @JsonKey()
  final bool done;
  @override
  @EpochDateTimeConverter()
  @JsonKey(name: 'changed_at')
  final DateTime changeAt;
  @override
  @EpochDateTimeConverter()
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'last_updated_by')
  final String lastUpdateBy;

  @override
  String toString() {
    return 'TaskFreezed(id: $id, text: $text, importance: $importance, deadline: $deadline, done: $done, changeAt: $changeAt, createdAt: $createdAt, lastUpdateBy: $lastUpdateBy)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TaskFreezed &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.importance, importance) ||
                other.importance == importance) &&
            (identical(other.deadline, deadline) ||
                other.deadline == deadline) &&
            (identical(other.done, done) || other.done == done) &&
            (identical(other.changeAt, changeAt) ||
                other.changeAt == changeAt) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.lastUpdateBy, lastUpdateBy) ||
                other.lastUpdateBy == lastUpdateBy));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, text, importance, deadline,
      done, changeAt, createdAt, lastUpdateBy);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TaskFreezedCopyWith<_$_TaskFreezed> get copyWith =>
      __$$_TaskFreezedCopyWithImpl<_$_TaskFreezed>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TaskFreezedToJson(
      this,
    );
  }
}

abstract class _TaskFreezed extends TaskFreezed {
  factory _TaskFreezed(
      {required final String id,
      required final String text,
      required final Priority importance,
      @EpochDateTimeConverter() final DateTime? deadline,
      final bool done,
      @EpochDateTimeConverter()
      @JsonKey(name: 'changed_at')
      required final DateTime changeAt,
      @EpochDateTimeConverter()
      @JsonKey(name: 'created_at')
      required final DateTime? createdAt,
      @JsonKey(name: 'last_updated_by')
      required final String lastUpdateBy}) = _$_TaskFreezed;
  _TaskFreezed._() : super._();

  factory _TaskFreezed.fromJson(Map<String, dynamic> json) =
      _$_TaskFreezed.fromJson;

  @override
  String get id;
  @override
  String get text;
  @override
  Priority get importance;
  @override
  @EpochDateTimeConverter()
  DateTime? get deadline;
  @override
  bool get done;
  @override
  @EpochDateTimeConverter()
  @JsonKey(name: 'changed_at')
  DateTime get changeAt;
  @override
  @EpochDateTimeConverter()
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'last_updated_by')
  String get lastUpdateBy;
  @override
  @JsonKey(ignore: true)
  _$$_TaskFreezedCopyWith<_$_TaskFreezed> get copyWith =>
      throw _privateConstructorUsedError;
}
