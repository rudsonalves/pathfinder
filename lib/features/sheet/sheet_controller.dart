import 'package:flutter/foundation.dart';
import 'package:pathfinder/models/classes_model.dart';
import 'package:pathfinder/repository/classes_repository.dart';

import '../../models/ancestry_model.dart';
import '../../repository/ancestry_repository.dart';
import 'sheet_state.dart';

class SheetController extends ChangeNotifier {
  final List<AncestryModel> _ancestryList = [];
  final List<ClassesModel> _classesList = [];

  List<AncestryModel> get ancestryList => _ancestryList;
  List<ClassesModel> get classesList => _classesList;

  SheetState _state = SheetStateInitial();

  SheetState get state => _state;

  void _changeState(SheetState newState) {
    _state = newState;
    notifyListeners();
  }

  Future<void> init() async {
    getAncestryList();
  }

  Future<void> getAncestryList() async {
    _changeState(SheetStateLoading());
    try {
      _ancestryList.clear();
      _ancestryList.addAll(await AncestryRepository.loadAncestryJson());

      _classesList.clear();
      _classesList.addAll(await ClassesRepository.loadClassesJson());

      _changeState(SheetStateSuccess());
    } catch (err) {
      _changeState(SheetStateError());
    }
  }
}
