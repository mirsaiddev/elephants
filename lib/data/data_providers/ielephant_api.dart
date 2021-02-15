
import '../models/elephant.dart';

abstract class IElephantApi {
  Future<List<Elephant>> fetchElephants();
}
