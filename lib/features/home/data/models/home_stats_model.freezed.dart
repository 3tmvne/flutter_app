// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_stats_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

HomeStatsModel _$HomeStatsModelFromJson(Map<String, dynamic> json) {
  return _HomeStatsModel.fromJson(json);
}

/// @nodoc
mixin _$HomeStatsModel {
  @JsonKey(name: 'total_assessments')
  int get totalAssessmentsCompleted => throw _privateConstructorUsedError;
  @JsonKey(name: 'nearest_center_km')
  double? get nearestCenterDistance => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_chat_timestamp')
  DateTime? get lastChatMessageAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'unread_count')
  int get unreadNotificationsCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HomeStatsModelCopyWith<HomeStatsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStatsModelCopyWith<$Res> {
  factory $HomeStatsModelCopyWith(
          HomeStatsModel value, $Res Function(HomeStatsModel) then) =
      _$HomeStatsModelCopyWithImpl<$Res, HomeStatsModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'total_assessments') int totalAssessmentsCompleted,
      @JsonKey(name: 'nearest_center_km') double? nearestCenterDistance,
      @JsonKey(name: 'last_chat_timestamp') DateTime? lastChatMessageAt,
      @JsonKey(name: 'unread_count') int unreadNotificationsCount});
}

/// @nodoc
class _$HomeStatsModelCopyWithImpl<$Res, $Val extends HomeStatsModel>
    implements $HomeStatsModelCopyWith<$Res> {
  _$HomeStatsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalAssessmentsCompleted = null,
    Object? nearestCenterDistance = freezed,
    Object? lastChatMessageAt = freezed,
    Object? unreadNotificationsCount = null,
  }) {
    return _then(_value.copyWith(
      totalAssessmentsCompleted: null == totalAssessmentsCompleted
          ? _value.totalAssessmentsCompleted
          : totalAssessmentsCompleted // ignore: cast_nullable_to_non_nullable
              as int,
      nearestCenterDistance: freezed == nearestCenterDistance
          ? _value.nearestCenterDistance
          : nearestCenterDistance // ignore: cast_nullable_to_non_nullable
              as double?,
      lastChatMessageAt: freezed == lastChatMessageAt
          ? _value.lastChatMessageAt
          : lastChatMessageAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      unreadNotificationsCount: null == unreadNotificationsCount
          ? _value.unreadNotificationsCount
          : unreadNotificationsCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HomeStatsModelImplCopyWith<$Res>
    implements $HomeStatsModelCopyWith<$Res> {
  factory _$$HomeStatsModelImplCopyWith(_$HomeStatsModelImpl value,
          $Res Function(_$HomeStatsModelImpl) then) =
      __$$HomeStatsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'total_assessments') int totalAssessmentsCompleted,
      @JsonKey(name: 'nearest_center_km') double? nearestCenterDistance,
      @JsonKey(name: 'last_chat_timestamp') DateTime? lastChatMessageAt,
      @JsonKey(name: 'unread_count') int unreadNotificationsCount});
}

/// @nodoc
class __$$HomeStatsModelImplCopyWithImpl<$Res>
    extends _$HomeStatsModelCopyWithImpl<$Res, _$HomeStatsModelImpl>
    implements _$$HomeStatsModelImplCopyWith<$Res> {
  __$$HomeStatsModelImplCopyWithImpl(
      _$HomeStatsModelImpl _value, $Res Function(_$HomeStatsModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalAssessmentsCompleted = null,
    Object? nearestCenterDistance = freezed,
    Object? lastChatMessageAt = freezed,
    Object? unreadNotificationsCount = null,
  }) {
    return _then(_$HomeStatsModelImpl(
      totalAssessmentsCompleted: null == totalAssessmentsCompleted
          ? _value.totalAssessmentsCompleted
          : totalAssessmentsCompleted // ignore: cast_nullable_to_non_nullable
              as int,
      nearestCenterDistance: freezed == nearestCenterDistance
          ? _value.nearestCenterDistance
          : nearestCenterDistance // ignore: cast_nullable_to_non_nullable
              as double?,
      lastChatMessageAt: freezed == lastChatMessageAt
          ? _value.lastChatMessageAt
          : lastChatMessageAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      unreadNotificationsCount: null == unreadNotificationsCount
          ? _value.unreadNotificationsCount
          : unreadNotificationsCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HomeStatsModelImpl implements _HomeStatsModel {
  const _$HomeStatsModelImpl(
      {@JsonKey(name: 'total_assessments')
      required this.totalAssessmentsCompleted,
      @JsonKey(name: 'nearest_center_km') required this.nearestCenterDistance,
      @JsonKey(name: 'last_chat_timestamp') required this.lastChatMessageAt,
      @JsonKey(name: 'unread_count') required this.unreadNotificationsCount});

  factory _$HomeStatsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$HomeStatsModelImplFromJson(json);

  @override
  @JsonKey(name: 'total_assessments')
  final int totalAssessmentsCompleted;
  @override
  @JsonKey(name: 'nearest_center_km')
  final double? nearestCenterDistance;
  @override
  @JsonKey(name: 'last_chat_timestamp')
  final DateTime? lastChatMessageAt;
  @override
  @JsonKey(name: 'unread_count')
  final int unreadNotificationsCount;

  @override
  String toString() {
    return 'HomeStatsModel(totalAssessmentsCompleted: $totalAssessmentsCompleted, nearestCenterDistance: $nearestCenterDistance, lastChatMessageAt: $lastChatMessageAt, unreadNotificationsCount: $unreadNotificationsCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeStatsModelImpl &&
            (identical(other.totalAssessmentsCompleted,
                    totalAssessmentsCompleted) ||
                other.totalAssessmentsCompleted == totalAssessmentsCompleted) &&
            (identical(other.nearestCenterDistance, nearestCenterDistance) ||
                other.nearestCenterDistance == nearestCenterDistance) &&
            (identical(other.lastChatMessageAt, lastChatMessageAt) ||
                other.lastChatMessageAt == lastChatMessageAt) &&
            (identical(
                    other.unreadNotificationsCount, unreadNotificationsCount) ||
                other.unreadNotificationsCount == unreadNotificationsCount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, totalAssessmentsCompleted,
      nearestCenterDistance, lastChatMessageAt, unreadNotificationsCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeStatsModelImplCopyWith<_$HomeStatsModelImpl> get copyWith =>
      __$$HomeStatsModelImplCopyWithImpl<_$HomeStatsModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HomeStatsModelImplToJson(
      this,
    );
  }
}

abstract class _HomeStatsModel implements HomeStatsModel {
  const factory _HomeStatsModel(
      {@JsonKey(name: 'total_assessments')
      required final int totalAssessmentsCompleted,
      @JsonKey(name: 'nearest_center_km')
      required final double? nearestCenterDistance,
      @JsonKey(name: 'last_chat_timestamp')
      required final DateTime? lastChatMessageAt,
      @JsonKey(name: 'unread_count')
      required final int unreadNotificationsCount}) = _$HomeStatsModelImpl;

  factory _HomeStatsModel.fromJson(Map<String, dynamic> json) =
      _$HomeStatsModelImpl.fromJson;

  @override
  @JsonKey(name: 'total_assessments')
  int get totalAssessmentsCompleted;
  @override
  @JsonKey(name: 'nearest_center_km')
  double? get nearestCenterDistance;
  @override
  @JsonKey(name: 'last_chat_timestamp')
  DateTime? get lastChatMessageAt;
  @override
  @JsonKey(name: 'unread_count')
  int get unreadNotificationsCount;
  @override
  @JsonKey(ignore: true)
  _$$HomeStatsModelImplCopyWith<_$HomeStatsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
