import 'package:flutter/material.dart';

import '../data/data_providers/elephant_api.dart';
import '../data/models/elephant.dart';
import '../data/repositories/elephant_repository.dart';

enum ElephantState { INITIAL, LOADING, COMPLETED }

class ElephantViewModel with ChangeNotifier {
  ElephantRepository _elephantRepository;

  ElephantViewModel() {
    _elephantRepository = ElephantRepository(elephantApi: ElephantApi());
  }

  List<Elephant> _elephantModel;
  List<Elephant> get elephantModel => _elephantModel;

  ElephantState _elephantState = ElephantState.INITIAL;
  ElephantState get elephanState => _elephantState;

  void _setPostState(ElephantState elephanState) {
    _elephantState = elephanState;
    notifyListeners();
  }

  Future<void> fetchElephant() async {
    _setPostState(ElephantState.LOADING);
    _elephantModel = await _elephantRepository.fetchElephants();
    _setPostState(ElephantState.COMPLETED);
  }
}
