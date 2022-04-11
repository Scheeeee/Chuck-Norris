import 'package:chuck_norris_app/03_domain/entities/generator_entity.dart';
import 'package:dartz/dartz.dart';

import '../failures/failures.dart';

abstract class GeneratorRepository {
  Future<Either<Failure, FactEntity>> getFactFromApi();
}
