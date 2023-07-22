import 'package:get/get.dart';
import 'package:get_a/data/response/status.dart';
import 'package:get_a/models/user_model.dart';
import 'package:get_a/respository/home/home_repository.dart';

class HomeController extends GetxController {
  final _myRepo = HomeRepository();

  final rxRequestStatus = Status.LOADING.obs;
  final userList = UserModel().obs;
  RxString error = ''.obs;

  void setRxRequestStatus(Status _value) {
    rxRequestStatus.value = _value;
  }

  void setUserList(UserModel _value) {
    userList.value = _value;
  }

  void setError(String _value) {
    error.value = _value;
  }

  userListApi() {
    setRxRequestStatus(Status.LOADING);
    _myRepo.getUserList().then((value) {
      setRxRequestStatus(Status.COMPLETED);
      setUserList(value);
    }).onError((error, stackTrace) {
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);
    });
  }
}
