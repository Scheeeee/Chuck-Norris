part of 'fact_bloc.dart';

@immutable
abstract class FactEvent {}

class FactRequestedEvent extends FactEvent {}

class ExampleEvent extends FactEvent {}
