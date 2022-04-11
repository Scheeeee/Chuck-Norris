import 'package:chuck_norris_app/03_domain/entities/generator_entity.dart';
import 'package:chuck_norris_app/04_infrastructure/models/generator_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

abstract class GeneratorRemoteDatasource {
  /// request random fact from free api
  /// throws a server exception if respond code is not 200
  Future<FactEntity> getRandomFactFromApi();
}

class GeneratorRemoteDatasourceImpl implements GeneratorRemoteDatasource {
  final http.Client client = http.Client();
  @override
  Future<FactEntity> getRandomFactFromApi() async {
    final response = await client.get(
      Uri.parse("https://api.chucknorris.io/jokes/random"),
      headers: {'Content-Type': 'application/json'},
    );

    final responseBody = json.decode(response.body);

    return GeneratorModel.fromJson(responseBody["categories"]);
  }
}
