import 'package:elephants_mvvm_provider/constant/constants.dart';

import '../models/elephant.dart';
import 'package:http/http.dart' as _http;

 class ElephantApi {
  Future<List<Elephant>> fetchElephants() async {
    final String _url = Constants.ELEPHANT_API;

    var _response = await _http.get(_url);

    if (_response.statusCode == 200) {
      final _jsonBody = _response.body;
      final _postResponse = elephantFromJson(_jsonBody);
      return _postResponse;
    } else {
      throw Exception("Failed to get data from API");
    }
  }
}
