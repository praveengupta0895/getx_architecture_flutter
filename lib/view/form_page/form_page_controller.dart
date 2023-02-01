import '../../common_libraries.dart';

class FormPageController extends GetxController {
  RxString username = RxString('');
  RxnString usernameErrorText = RxnString(null);
  RxString password = RxString('');
  RxnString passwordErrorText = RxnString(null);
  Rxn<Function()> submitFunc = Rxn<Function()>(null);

  @override
  void onInit() {
    super.onInit();
    debounce<String>(username, userNameValidations, time: $styles.times.fast);
    debounce<String>(password, passwordValidations, time: $styles.times.fast);
  }

  void userNameValidations(String val) async {
    usernameErrorText.value = null; // reset validation errors to nothing
    submitFunc.value = null;
    if (val.isNotEmpty) {
      if (usernameLengthOK(val) && await available(val)) {
        usernameErrorText.value = null;
      }
    }
  }

  void passwordValidations(String val) async {
    passwordErrorText.value =null; // reset validation errors to nothing
    submitFunc.value = null; // disable submit while validating
    if (val.isNotEmpty) {
      if (passwordLengthOK(val)) {
        print('All validations passed, enable submit btn...');
        submitFunc.value = submitFunction();
        passwordErrorText.value = null;
      }
    }
  }

  bool usernameLengthOK(String val, {int minLen = 5}) {
    if (val.length < minLen) {
      usernameErrorText.value = 'min. 5 chars';
      return false;
    }
    return true;
  }
  bool passwordLengthOK(String val, {int minLen = 5}) {
    if (val.length < minLen) {
      passwordErrorText.value = 'min. 5 chars';
      return false;
    }
    return true;
  }

  Future<bool> available(String val) async {
    await Future.delayed(
        const Duration(seconds: 1),
            () => print('Available query returned')
    );

    if (val == "praveen") {
      usernameErrorText.value = 'Name Taken';
      return false;
    }
    return true;
  }

  void usernameChanged(String val) {
    username.value = val;
  }

  void passwordChanged(String val) {
    password.value = val;
  }

  Future<bool> Function() submitFunction() {
    return () async {
      await Future.delayed(const Duration(seconds: 1), (){
        // print('User account created');
        print(username.value);
      } );
      return true;
    };
  }
}
