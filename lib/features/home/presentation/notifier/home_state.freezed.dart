// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HomeState {
  /// Current home statistics
  HomeStatsEntity? get homeStats => throw _privateConstructorUsedError;

  /// List of active notification banners
  List<NotificationBannerEntity> get banners =>
      throw _privateConstructorUsedError;

  /// Currently selected feature for animation feedback
  HomeFeature? get selectedFeature => throw _privateConstructorUsedError;

  /// Loading state for stats
  bool get isLoadingStats => throw _privateConstructorUsedError;

  /// Loading state for banners
  bool get isLoadingBanners => throw _privateConstructorUsedError;

  /// Error state for stats
  Failure? get statsError => throw _privateConstructorUsedError;

  /// Error state for banners
  Failure? get bannersError => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeStateCopyWith<HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res, HomeState>;
  @useResult
  $Res call(
      {HomeStatsEntity? homeStats,
      List<NotificationBannerEntity> banners,
      HomeFeature? selectedFeature,
      bool isLoadingStats,
      bool isLoadingBanners,
      Failure? statsError,
      Failure? bannersError});
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res, $Val extends HomeState>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? homeStats = freezed,
    Object? banners = null,
    Object? selectedFeature = freezed,
    Object? isLoadingStats = null,
    Object? isLoadingBanners = null,
    Object? statsError = freezed,
    Object? bannersError = freezed,
  }) {
    return _then(_value.copyWith(
      homeStats: freezed == homeStats
          ? _value.homeStats
          : homeStats // ignore: cast_nullable_to_non_nullable
              as HomeStatsEntity?,
      banners: null == banners
          ? _value.banners
          : banners // ignore: cast_nullable_to_non_nullable
              as List<NotificationBannerEntity>,
      selectedFeature: freezed == selectedFeature
          ? _value.selectedFeature
          : selectedFeature // ignore: cast_nullable_to_non_nullable
              as HomeFeature?,
      isLoadingStats: null == isLoadingStats
          ? _value.isLoadingStats
          : isLoadingStats // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingBanners: null == isLoadingBanners
          ? _value.isLoadingBanners
          : isLoadingBanners // ignore: cast_nullable_to_non_nullable
              as bool,
      statsError: freezed == statsError
          ? _value.statsError
          : statsError // ignore: cast_nullable_to_non_nullable
              as Failure?,
      bannersError: freezed == bannersError
          ? _value.bannersError
          : bannersError // ignore: cast_nullable_to_non_nullable
              as Failure?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HomeStateImplCopyWith<$Res>
    implements $HomeStateCopyWith<$Res> {
  factory _$$HomeStateImplCopyWith(
          _$HomeStateImpl value, $Res Function(_$HomeStateImpl) then) =
      __$$HomeStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {HomeStatsEntity? homeStats,
      List<NotificationBannerEntity> banners,
      HomeFeature? selectedFeature,
      bool isLoadingStats,
      bool isLoadingBanners,
      Failure? statsError,
      Failure? bannersError});
}

/// @nodoc
class __$$HomeStateImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$HomeStateImpl>
    implements _$$HomeStateImplCopyWith<$Res> {
  __$$HomeStateImplCopyWithImpl(
      _$HomeStateImpl _value, $Res Function(_$HomeStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? homeStats = freezed,
    Object? banners = null,
    Object? selectedFeature = freezed,
    Object? isLoadingStats = null,
    Object? isLoadingBanners = null,
    Object? statsError = freezed,
    Object? bannersError = freezed,
  }) {
    return _then(_$HomeStateImpl(
      homeStats: freezed == homeStats
          ? _value.homeStats
          : homeStats // ignore: cast_nullable_to_non_nullable
              as HomeStatsEntity?,
      banners: null == banners
          ? _value._banners
          : banners // ignore: cast_nullable_to_non_nullable
              as List<NotificationBannerEntity>,
      selectedFeature: freezed == selectedFeature
          ? _value.selectedFeature
          : selectedFeature // ignore: cast_nullable_to_non_nullable
              as HomeFeature?,
      isLoadingStats: null == isLoadingStats
          ? _value.isLoadingStats
          : isLoadingStats // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingBanners: null == isLoadingBanners
          ? _value.isLoadingBanners
          : isLoadingBanners // ignore: cast_nullable_to_non_nullable
              as bool,
      statsError: freezed == statsError
          ? _value.statsError
          : statsError // ignore: cast_nullable_to_non_nullable
              as Failure?,
      bannersError: freezed == bannersError
          ? _value.bannersError
          : bannersError // ignore: cast_nullable_to_non_nullable
              as Failure?,
    ));
  }
}

/// @nodoc

class _$HomeStateImpl implements _HomeState {
  const _$HomeStateImpl(
      {required this.homeStats,
      required final List<NotificationBannerEntity> banners,
      required this.selectedFeature,
      required this.isLoadingStats,
      required this.isLoadingBanners,
      required this.statsError,
      required this.bannersError})
      : _banners = banners;

  /// Current home statistics
  @override
  final HomeStatsEntity? homeStats;

  /// List of active notification banners
  final List<NotificationBannerEntity> _banners;

  /// List of active notification banners
  @override
  List<NotificationBannerEntity> get banners {
    if (_banners is EqualUnmodifiableListView) return _banners;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_banners);
  }

  /// Currently selected feature for animation feedback
  @override
  final HomeFeature? selectedFeature;

  /// Loading state for stats
  @override
  final bool isLoadingStats;

  /// Loading state for banners
  @override
  final bool isLoadingBanners;

  /// Error state for stats
  @override
  final Failure? statsError;

  /// Error state for banners
  @override
  final Failure? bannersError;

  @override
  String toString() {
    return 'HomeState(homeStats: $homeStats, banners: $banners, selectedFeature: $selectedFeature, isLoadingStats: $isLoadingStats, isLoadingBanners: $isLoadingBanners, statsError: $statsError, bannersError: $bannersError)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeStateImpl &&
            (identical(other.homeStats, homeStats) ||
                other.homeStats == homeStats) &&
            const DeepCollectionEquality().equals(other._banners, _banners) &&
            (identical(other.selectedFeature, selectedFeature) ||
                other.selectedFeature == selectedFeature) &&
            (identical(other.isLoadingStats, isLoadingStats) ||
                other.isLoadingStats == isLoadingStats) &&
            (identical(other.isLoadingBanners, isLoadingBanners) ||
                other.isLoadingBanners == isLoadingBanners) &&
            (identical(other.statsError, statsError) ||
                other.statsError == statsError) &&
            (identical(other.bannersError, bannersError) ||
                other.bannersError == bannersError));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      homeStats,
      const DeepCollectionEquality().hash(_banners),
      selectedFeature,
      isLoadingStats,
      isLoadingBanners,
      statsError,
      bannersError);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeStateImplCopyWith<_$HomeStateImpl> get copyWith =>
      __$$HomeStateImplCopyWithImpl<_$HomeStateImpl>(this, _$identity);
}

abstract class _HomeState implements HomeState {
  const factory _HomeState(
      {required final HomeStatsEntity? homeStats,
      required final List<NotificationBannerEntity> banners,
      required final HomeFeature? selectedFeature,
      required final bool isLoadingStats,
      required final bool isLoadingBanners,
      required final Failure? statsError,
      required final Failure? bannersError}) = _$HomeStateImpl;

  @override

  /// Current home statistics
  HomeStatsEntity? get homeStats;
  @override

  /// List of active notification banners
  List<NotificationBannerEntity> get banners;
  @override

  /// Currently selected feature for animation feedback
  HomeFeature? get selectedFeature;
  @override

  /// Loading state for stats
  bool get isLoadingStats;
  @override

  /// Loading state for banners
  bool get isLoadingBanners;
  @override

  /// Error state for stats
  Failure? get statsError;
  @override

  /// Error state for banners
  Failure? get bannersError;
  @override
  @JsonKey(ignore: true)
  _$$HomeStateImplCopyWith<_$HomeStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
