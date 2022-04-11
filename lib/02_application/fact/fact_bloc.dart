import 'package:bloc/bloc.dart';
import 'package:chuck_norris_app/03_domain/entities/generator_entity.dart';
import 'package:chuck_norris_app/03_domain/failures/failures.dart';
import 'package:chuck_norris_app/03_domain/usecases/generator_usecases.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

part 'fact_event.dart';
part 'fact_state.dart';

class FactBloc extends Bloc<FactEvent, FactState> {
  FactBloc() : super(FactInitial()) {
    final GeneratorUsecases usecases = GeneratorUsecases();

    on<FactRequestedEvent>((event, emit) async {
      emit(FactStateLoading());

      Either<Failure, FactEntity> factOrFailure =
          await usecases.getFactUsecase();

      factOrFailure.fold(
        (failure) =>
            emit(FactStateError(message: _mapFailureToMessage(failure))),
        (fact) => emit(FactStateLoaded(fact: fact.fact)),
      );
    });

    on<ExampleEvent>((event, emit) {});
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return "Ups, API Error, please try again!";
      case GeneralFailure:
        return "Ups, something gone wrong. Please try again!";

      default:
        return "Ups, something gone wrong. Please try again!";
    }
  }
}
