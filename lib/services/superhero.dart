// handles the call to the Superhero API, parses the response using our model classes, and returns the data to our viewmodel

import 'package:handle_connectivity/app/app.locator.dart';
import 'package:handle_connectivity/models/superheroresponse_model.dart';
import 'package:handle_connectivity/services/apiservice.dart';
import 'package:handle_connectivity/utils/api_constants.dart';

class SuperheroService {
  final _apiService = locator<ApiService>();

  Future<SuperheroResponse?> getCharactersDetails() async {
    try {
      final response = await _apiService.call(ApiConstants.getSuperhero);
      if (response != null) {
        final superheroData = SuperheroResponse.fromJson(response);
        return superheroData;
      }
    } catch (e) {
      rethrow;
    }
  }
}
