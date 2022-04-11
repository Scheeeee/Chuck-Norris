import 'package:chuck_norris_app/03_domain/entities/generator_entity.dart';

class GeneratorModel extends FactEntity {
  GeneratorModel({required String fact}) : super(fact: fact);

  factory GeneratorModel.fromJson(List<String> json) {
    return GeneratorModel(fact: json["value"]);
  }
}
