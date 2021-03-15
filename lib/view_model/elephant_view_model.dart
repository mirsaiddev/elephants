import 'package:elephants_mvvm_provider/data/repositories/elephant_repository.dart';
import 'package:flutter/material.dart';
import '../data/models/elephant.dart';

enum ElephantState { INITIAL, LOADING, COMPLETED }

class ElephantViewModel with ChangeNotifier {
  ElephantRepository _elephantRepository;

  ElephantViewModel() {
    _elephantRepository = ElephantRepository();
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
