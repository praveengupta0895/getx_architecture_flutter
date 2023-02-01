import '../../../common_libraries.dart';
import '../../../routes.dart';

class CustomBottomNavigationController extends GetxController {
  RxString artBoardSelected = RxString('CHAT');

  @override
  void onInit() {
    super.onInit();
    debounce<String>(artBoardSelected, artBoardSelectedValidations,
        time: $styles.times.fast);
  }

  void artBoardSelectedValidations(String val) async {}

  RiveAsset get artBoardValue {
    if (artBoardSelected.value == "CHAT") {
      return bottomNavs.first;
    } else if (artBoardSelected.value == "SEARCH") {
      return bottomNavs[1];
    } else if (artBoardSelected.value == "TIMER") {
      return bottomNavs[2];
    } else if (artBoardSelected.value == "BELL") {
      return bottomNavs[3];
    } else {
      return bottomNavs.last;
    }
  }

  void artBoardChanged(String val) {
    artBoardSelected.value = val;
  }

  Future<bool> Function() submitFunction() {
    return () async {
      await Future.delayed(const Duration(seconds: 1), () {});
      return true;
    };
  }
}
