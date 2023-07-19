import 'package:realm/realm.dart';

import 'package:super_ui_kit/super_ui_kit.dart';

import '../data/data_keys.dart';

class AuthService extends GetxService {
  late String id;
  late Uri baseUrl;
  late App _app;
  final currentUser = Rxn<User>();

  Future<AuthService> init(String id, Uri baseUrl) async {
    this.id = id;
    this.baseUrl = baseUrl;
    _app = App(AppConfiguration(id, baseUrl: baseUrl));
    currentUser.value = _app.currentUser;
    return this;
  }

  Future<User> logInUserEmailPw(String email, String password) async {
    User loggedInUser =
        await _app.logIn(Credentials.emailPassword(email, password));
    currentUser.value = loggedInUser;
    return loggedInUser;
  }

  Future<User> registerUserEmailPw(String email, String password) async {
    EmailPasswordAuthProvider authProvider = EmailPasswordAuthProvider(_app);
    await authProvider.registerUser(email, password);
    User loggedInUser =
        await _app.logIn(Credentials.emailPassword(email, password));
    currentUser.value = loggedInUser;
    return loggedInUser;
  }

  Future<void> changePassWord(String oldPassWord, String newPassWord) async {
    final Map<String, dynamic> args = {
      "oldpassword": oldPassWord,
      "newpassword": newPassWord
    };
    var result =
        await _app.currentUser?.functions.call(kfChangeUserPassword, [args]);
    printInfo(info: '${result['success']}');
    //
  }

  Future<void> logOutUser() async {
    await currentUser.value?.logOut();
    currentUser.value = null;
  }

  Future<dynamic> refreshUserData() async {
    if (currentUser.value == null) return null;
    await currentUser.value?.refreshCustomData().then((value) {
      currentUser.refresh();
      return value;
    });
  }
}
