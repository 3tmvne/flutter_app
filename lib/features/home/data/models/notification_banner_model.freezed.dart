// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_banner_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NotificationBannerModel _$NotificationBannerModelFromJson(
    Map<String, dynamic> json) {
  return _NotificationBannerModel.fromJson(json);
}

/// @nodoc
mixin _$NotificationBannerModel {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'title_fr')
  String get titleFr => throw _privateConstructorUsedError;
  @JsonKey(name: 'title_ar')
  String get titleAr => throw _privateConstructorUsedError;
  @JsonKey(name: 'body_fr')
  String get bodyFr => throw _privateConstructorUsedError;
  @JsonKey(name: 'body_ar')
  String get bodyAr => throw _privateConstructorUsedError;
  @JsonKey(name: 'icon_emoji')
  String get iconEmoji => throw _privateConstructorUsedError;
  @JsonKey(name: 'action_route')
  String? get actionRoute => throw _privateConstructorUsedError;
  @JsonKey(
      name: 'priority', fromJson: _priorityFromJson, toJson: _priorityToJson)
  BannerPriority get priority => throw _privateConstructorUsedError;
  @JsonKey(name: 'expires_at')
  DateTime? get expiresAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NotificationBannerModelCopyWith<NotificationBannerModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationBannerModelCopyWith<$Res> {
  factory $NotificationBannerModelCopyWith(NotificationBannerModel value,
          $Res Function(NotificationBannerModel) then) =
      _$NotificationBannerModelCopyWithImpl<$Res, NotificationBannerModel>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'title_fr') String titleFr,
      @JsonKey(name: 'title_ar') String titleAr,
      @JsonKey(name: 'body_fr') String bodyFr,
      @JsonKey(name: 'body_ar') String bodyAr,
      @JsonKey(name: 'icon_emoji') String iconEmoji,
      @JsonKey(name: 'action_route') String? actionRoute,
      @JsonKey(
          name: 'priority',
          fromJson: _priorityFromJson,
          toJson: _priorityToJson)
      BannerPriority priority,
      @JsonKey(name: 'expires_at') DateTime? expiresAt});
}

/// @nodoc
class _$NotificationBannerModelCopyWithImpl<$Res,
        $Val extends NotificationBannerModel>
    implements $NotificationBannerModelCopyWith<$Res> {
  _$NotificationBannerModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? titleFr = null,
    Object? titleAr = null,
    Object? bodyFr = null,
    Object? bodyAr = null,
    Object? iconEmoji = null,
    Object? actionRoute = freezed,
    Object? priority = null,
    Object? expiresAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      titleFr: null == titleFr
          ? _value.titleFr
          : titleFr // ignore: cast_nullable_to_non_nullable
              as String,
      titleAr: null == titleAr
          ? _value.titleAr
          : titleAr // ignore: cast_nullable_to_non_nullable
              as String,
      bodyFr: null == bodyFr
          ? _value.bodyFr
          : bodyFr // ignore: cast_nullable_to_non_nullable
              as String,
      bodyAr: null == bodyAr
          ? _value.bodyAr
          : bodyAr // ignore: cast_nullable_to_non_nullable
              as String,
      iconEmoji: null == iconEmoji
          ? _value.iconEmoji
          : iconEmoji // ignore: cast_nullable_to_non_nullable
              as String,
      actionRoute: freezed == actionRoute
          ? _value.actionRoute
          : actionRoute // ignore: cast_nullable_to_non_nullable
              as String?,
      priority: null == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as BannerPriority,
      expiresAt: freezed == expiresAt
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NotificationBannerModelImplCopyWith<$Res>
    implements $NotificationBannerModelCopyWith<$Res> {
  factory _$$NotificationBannerModelImplCopyWith(
          _$NotificationBannerModelImpl value,
          $Res Function(_$NotificationBannerModelImpl) then) =
      __$$NotificationBannerModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'title_fr') String titleFr,
      @JsonKey(name: 'title_ar') String titleAr,
      @JsonKey(name: 'body_fr') String bodyFr,
      @JsonKey(name: 'body_ar') String bodyAr,
      @JsonKey(name: 'icon_emoji') String iconEmoji,
      @JsonKey(name: 'action_route') String? actionRoute,
      @JsonKey(
          name: 'priority',
          fromJson: _priorityFromJson,
          toJson: _priorityToJson)
      BannerPriority priority,
      @JsonKey(name: 'expires_at') DateTime? expiresAt});
}

/// @nodoc
class __$$NotificationBannerModelImplCopyWithImpl<$Res>
    extends _$NotificationBannerModelCopyWithImpl<$Res,
        _$NotificationBannerModelImpl>
    implements _$$NotificationBannerModelImplCopyWith<$Res> {
  __$$NotificationBannerModelImplCopyWithImpl(
      _$NotificationBannerModelImpl _value,
      $Res Function(_$NotificationBannerModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? titleFr = null,
    Object? titleAr = null,
    Object? bodyFr = null,
    Object? bodyAr = null,
    Object? iconEmoji = null,
    Object? actionRoute = freezed,
    Object? priority = null,
    Object? expiresAt = freezed,
  }) {
    return _then(_$NotificationBannerModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      titleFr: null == titleFr
          ? _value.titleFr
          : titleFr // ignore: cast_nullable_to_non_nullable
              as String,
      titleAr: null == titleAr
          ? _value.titleAr
          : titleAr // ignore: cast_nullable_to_non_nullable
              as String,
      bodyFr: null == bodyFr
          ? _value.bodyFr
          : bodyFr // ignore: cast_nullable_to_non_nullable
              as String,
      bodyAr: null == bodyAr
          ? _value.bodyAr
          : bodyAr // ignore: cast_nullable_to_non_nullable
              as String,
      iconEmoji: null == iconEmoji
          ? _value.iconEmoji
          : iconEmoji // ignore: cast_nullable_to_non_nullable
              as String,
      actionRoute: freezed == actionRoute
          ? _value.actionRoute
          : actionRoute // ignore: cast_nullable_to_non_nullable
              as String?,
      priority: null == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as BannerPriority,
      expiresAt: freezed == expiresAt
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NotificationBannerModelImpl implements _NotificationBannerModel {
  const _$NotificationBannerModelImpl(
      {required this.id,
      @JsonKey(name: 'title_fr') required this.titleFr,
      @JsonKey(name: 'title_ar') required this.titleAr,
      @JsonKey(name: 'body_fr') required this.bodyFr,
      @JsonKey(name: 'body_ar') required this.bodyAr,
      @JsonKey(name: 'icon_emoji') required this.iconEmoji,
      @JsonKey(name: 'action_route') required this.actionRoute,
      @JsonKey(
          name: 'priority',
          fromJson: _priorityFromJson,
          toJson: _priorityToJson)
      required this.priority,
      @JsonKey(name: 'expires_at') required this.expiresAt});

  factory _$NotificationBannerModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$NotificationBannerModelImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'title_fr')
  final String titleFr;
  @override
  @JsonKey(name: 'title_ar')
  final String titleAr;
  @override
  @JsonKey(name: 'body_fr')
  final String bodyFr;
  @override
  @JsonKey(name: 'body_ar')
  final String bodyAr;
  @override
  @JsonKey(name: 'icon_emoji')
  final String iconEmoji;
  @override
  @JsonKey(name: 'action_route')
  final String? actionRoute;
  @override
  @JsonKey(
      name: 'priority', fromJson: _priorityFromJson, toJson: _priorityToJson)
  final BannerPriority priority;
  @override
  @JsonKey(name: 'expires_at')
  final DateTime? expiresAt;

  @override
  String toString() {
    return 'NotificationBannerModel(id: $id, titleFr: $titleFr, titleAr: $titleAr, bodyFr: $bodyFr, bodyAr: $bodyAr, iconEmoji: $iconEmoji, actionRoute: $actionRoute, priority: $priority, expiresAt: $expiresAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationBannerModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.titleFr, titleFr) || other.titleFr == titleFr) &&
            (identical(other.titleAr, titleAr) || other.titleAr == titleAr) &&
            (identical(other.bodyFr, bodyFr) || other.bodyFr == bodyFr) &&
            (identical(other.bodyAr, bodyAr) || other.bodyAr == bodyAr) &&
            (identical(other.iconEmoji, iconEmoji) ||
                other.iconEmoji == iconEmoji) &&
            (identical(other.actionRoute, actionRoute) ||
                other.actionRoute == actionRoute) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, titleFr, titleAr, bodyFr,
      bodyAr, iconEmoji, actionRoute, priority, expiresAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NotificationBannerModelImplCopyWith<_$NotificationBannerModelImpl>
      get copyWith => __$$NotificationBannerModelImplCopyWithImpl<
          _$NotificationBannerModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NotificationBannerModelImplToJson(
      this,
    );
  }
}

abstract class _NotificationBannerModel implements NotificationBannerModel {
  const factory _NotificationBannerModel(
          {required final String id,
          @JsonKey(name: 'title_fr') required final String titleFr,
          @JsonKey(name: 'title_ar') required final String titleAr,
          @JsonKey(name: 'body_fr') required final String bodyFr,
          @JsonKey(name: 'body_ar') required final String bodyAr,
          @JsonKey(name: 'icon_emoji') required final String iconEmoji,
          @JsonKey(name: 'action_route') required final String? actionRoute,
          @JsonKey(
              name: 'priority',
              fromJson: _priorityFromJson,
              toJson: _priorityToJson)
          required final BannerPriority priority,
          @JsonKey(name: 'expires_at') required final DateTime? expiresAt}) =
      _$NotificationBannerModelImpl;

  factory _NotificationBannerModel.fromJson(Map<String, dynamic> json) =
      _$NotificationBannerModelImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'title_fr')
  String get titleFr;
  @override
  @JsonKey(name: 'title_ar')
  String get titleAr;
  @override
  @JsonKey(name: 'body_fr')
  String get bodyFr;
  @override
  @JsonKey(name: 'body_ar')
  String get bodyAr;
  @override
  @JsonKey(name: 'icon_emoji')
  String get iconEmoji;
  @override
  @JsonKey(name: 'action_route')
  String? get actionRoute;
  @override
  @JsonKey(
      name: 'priority', fromJson: _priorityFromJson, toJson: _priorityToJson)
  BannerPriority get priority;
  @override
  @JsonKey(name: 'expires_at')
  DateTime? get expiresAt;
  @override
  @JsonKey(ignore: true)
  _$$NotificationBannerModelImplCopyWith<_$NotificationBannerModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
