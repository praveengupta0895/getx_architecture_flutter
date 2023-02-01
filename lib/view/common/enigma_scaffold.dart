import 'package:enigma/common_libraries.dart';
import 'package:enigma/view/widgets/bottom_navigation/custom_bottom_navigation_controller.dart';
import 'package:rive/rive.dart';

import '../../components/animated_bar.dart';
import '../../misc/rive_utils.dart';
import '../../models/rive_asset.dart';
import '../widgets/bottom_navigation/custom_bottom_navigation.dart';

class EnigmaScaffold extends StatelessWidget {
   EnigmaScaffold({Key? key, required this.child}) : super(key: key);

  final Widget child;
  RiveAsset selectedBottomNav = bottomNavs.first;
  @override
  Widget build(BuildContext context) {
    CustomBottomNavigationController customBottomNavigationController =
    Get.put(CustomBottomNavigationController());
    return  Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Obx((){
          return CustomBottomNavigation(selectedBottomNav:customBottomNavigationController.artBoardValue );
        })
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: child,
        ),
      ),
    );
  }
}



