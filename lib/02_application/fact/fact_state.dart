part of 'fact_bloc.dart';

@immutable
abstract class FactState {}

class FactInitial extends FactState {}

class FactStateLoading extends FactState {}

class FactStateLoaded extends FactState {
  final String fact;
  FactStateLoaded({required this.fact});
}

class FactStateError extends FactState {
  final String message;

  FactStateError({required this.message});
}
