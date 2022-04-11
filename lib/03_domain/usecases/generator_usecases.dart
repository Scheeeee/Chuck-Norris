import 'package:chuck_norris_app/03_domain/entities/generator_entity.dart';
import 'package:chuck_norris_app/03_domain/failures/failures.dart';
import 'package:chuck_norris_app/03_domain/reposetories/generator_respository.dart';
import 'package:chuck_norris_app/04_infrastructure/repositories/fact_repository_impl.dart';
import 'package:dartz/dartz.dart';

class GeneratorUsecases {
  final GeneratorRepository generatorRepository = FactRepositoryImpl();

  Future<Either<Failure, FactEntity>> getFactUsecase() async {
    return generatorRepository.getFactFromApi();
  }
}
