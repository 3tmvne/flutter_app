import 'package:dartz/dartz.dart';
import 'package:fffff/core/errors/failure.dart';
import 'package:fffff/features/home/domain/entities/home_stats_entity.dart';
import 'package:fffff/features/home/domain/repositories/home_repository.dart';

/// Usecase for fetching home statistics
/// 
/// Retrieves the current user's home statistics including assessments completed,
/// nearest center distance, last chat activity, and unread notifications.
class GetHomeStatsUsecase {
  /// The repository dependency
  final HomeRepository repository;

  /// Creates an instance of GetHomeStatsUsecase
  const GetHomeStatsUsecase({required this.repository});

  /// Executes the usecase
  /// 
  /// Returns [Right] with [HomeStatsEntity] on success,
  /// or [Left] with [Failure] on error.
  Future<Either<Failure, HomeStatsEntity>> call() async {
    return repository.getHomeStats();
  }
}
