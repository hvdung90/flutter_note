import 'package:noteapp/data/HomeRepoImpl.dart';
import 'package:noteapp/model/DataAccount.dart';
import 'package:noteapp/repo/HomeRepo.dart';
import 'package:scoped_model/scoped_model.dart';

class HomeViewModel extends Model {
  static HomeViewModel _instance;
  HomeRepo homeRepo = HomeRepoImpl();
  DataAccount account;

  static HomeViewModel getInstance() {
    if (_instance == null) {
      _instance = HomeViewModel();
    }
    return _instance;
  }

  void loadAccount() async {
    account = await homeRepo.getAccount();
    notifyListeners();
  }

  void deleteAccount(DataAccount data) async {
    await homeRepo.removeAccount(data);
    notifyListeners();
  }

  void saveAccount(DataAccount data) async {
    await homeRepo.saveAccount(data);
  }

  void updateAccount(DataAccount data) async {
    await homeRepo.updateAccount(data);
  }
}
