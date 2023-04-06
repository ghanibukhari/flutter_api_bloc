import 'package:bloc_api/models/user_model.dart';
import 'package:bloc_api/services/web_services.dart';

class ApiRepository {
  final _services = WebServices();

  Future<List<UserModel>?> fetchUserList() {
    print(_services.fetchUserList());
    return _services.fetchUserList();
  }
}
