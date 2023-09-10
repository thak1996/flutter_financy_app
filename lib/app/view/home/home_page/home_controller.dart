import 'package:flutter/foundation.dart';
import 'package:flutter_financy_app/app/common/models/transaction_model.dart';
import 'package:flutter_financy_app/app/repositories/transaction_repository.dart';
import 'package:flutter_financy_app/app/view/home/home_page/home_state.dart';

class HomeController extends ChangeNotifier {
  HomeController(this._transactionRepository);

  final TransactionRepository _transactionRepository;
  HomeState _state = HomeStateInitial();

  HomeState get state => _state;

  List<TransactionModel> _transactions = [];

  List<TransactionModel> get transactions => _transactions;

  void _changeState(HomeState newState) {
    _state = newState;
    notifyListeners();
  }

  Future<void> getAllTransactions() async {
    _changeState(HomeStateLoading());
    try {
      _transactions = await _transactionRepository.getAllTransactions();
      _changeState(HomeStateSucess());
    } catch (e) {
      _changeState(HomeStateError());
    }
  }
}
