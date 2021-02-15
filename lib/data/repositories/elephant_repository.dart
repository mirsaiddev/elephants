import '../data_providers/elephant_api.dart';
import '../data_providers/ielephant_api.dart';
import '../models/elephant.dart';
import 'ielephant_repository.dart';

class ElephantRepository extends IElephantRepository {
  final IElephantApi elephantApi;

  ElephantRepository({this.elephantApi});

  @override
  Future fetchElephants() {
    Future<List<Elephant>> elephants = ElephantApi().fetchElephants();

    return elephants;
  }
}
