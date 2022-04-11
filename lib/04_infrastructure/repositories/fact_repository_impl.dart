import 'package:chuck_norris_app/03_domain/failures/failures.dart';
import 'package:chuck_norris_app/03_domain/entities/generator_entity.dart';
import 'package:chuck_norris_app/03_domain/reposetories/generator_respository.dart';
import 'package:chuck_norris_app/04_infrastructure/datasources/generator_remote_datasource.dart';
import 'package:dartz/dartz.dart';

class FactRepositoryImpl implements GeneratorRepository {
  final GeneratorRemoteDatasource generatorRemoteDatasource =
      GeneratorRemoteDatasourceImpl();
  @override
  Future<Either<Failure, FactEntity>> getFactFromApi() async {
    final remoteFact = await generatorRemoteDatasource.getRandomFactFromApi();
    return Right(remoteFact);
  }
}
