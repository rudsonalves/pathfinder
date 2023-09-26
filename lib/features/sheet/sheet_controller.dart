import 'package:flutter/foundation.dart';

import '../../models/ancestry_model.dart';
import '../../repository/ancestry_repository.dart';
import 'sheet_state.dart';

class SheetController extends ChangeNotifier {
  final List<AncestryModel> _ancestryList = [];

  List<AncestryModel> get ancestryList => _ancestryList;

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
      await Future.delayed(const Duration(seconds: 5));
      _ancestryList.clear();
      _ancestryList.addAll(await AncestryRepository.loadAncestryJson());
      _changeState(SheetStateSuccess());
    } catch (err) {
      _changeState(SheetStateError());
    }
  }
}
