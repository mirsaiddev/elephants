 import 'package:elephants_mvvm_provider/data/data_providers/elephant_api.dart';
import 'package:elephants_mvvm_provider/data/models/elephant.dart';

class ElephantRepository {
  
  Future fetchElephants() {
    Future<List<Elephant>> elephants = ElephantApi().fetchElephants();

    return elephants;
  }
}
