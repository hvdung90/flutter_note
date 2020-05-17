import 'package:noteapp/data/local/AccountDao.dart';
import 'package:noteapp/model/DataAccount.dart';
import 'package:noteapp/repo/HomeRepo.dart';

class HomeRepoImpl with HomeRepo {
  static HomeRepo instance;
  AccountDao accountDao = AccountDao();

  static HomeRepo getInstance() {
    if (instance == null) {
      instance = HomeRepoImpl();
    }
    return instance;
  }

  @override
  Future<DataAccount> getAccount() async {
    DataAccount local = await accountDao.getAccount();
    if (local == null) {
      return null;
    }
    return local;
  }

  @override
  Future<void> removeAccount(DataAccount dataAccount) {
    return accountDao.removeAccount(dataAccount);
  }

  @override
  Future<DataAccount> saveAccount(DataAccount account )async{
     accountDao.saveAccount(account);
    return account;
  }

  @override
  Future<DataAccount> updateAccount(DataAccount account ) async{
    accountDao.updateAccount(account);
    return account;
  }
}
