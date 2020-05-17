import 'package:noteapp/model/DataAccount.dart';

abstract class HomeRepo {
  Future<DataAccount> getAccount();

  Future<void> removeAccount(DataAccount dataAccount);

  Future<DataAccount> saveAccount(DataAccount dataAccount);

  Future<DataAccount> updateAccount(DataAccount dataAccount);
}
