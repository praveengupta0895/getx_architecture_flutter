import 'package:enigma/view/form_page/form_page.dart';
import 'package:enigma/view/home_screen/home_screen.dart';
import 'common_libraries.dart';

class Routes {
  static String homeScreen = '/homeScreen';
  static String formScreen = '/formScreen';
}

final getPages = [
  GetPage(name: Routes.homeScreen, page: () => const HomeScreen(),transition: Transition.leftToRight),
  GetPage(name: Routes.formScreen, page: () => const FormPage())
];
