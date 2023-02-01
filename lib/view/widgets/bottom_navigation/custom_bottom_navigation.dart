import 'package:rive/rive.dart';
import 'package:enigma/common_libraries.dart';

import '../../../routes.dart';
import 'custom_bottom_navigation_controller.dart';

class CustomBottomNavigation extends StatelessWidget {
  const CustomBottomNavigation({
    super.key,
    required this.selectedBottomNav,
  });

  final RiveAsset selectedBottomNav;

  @override
  Widget build(BuildContext context) {
    CustomBottomNavigationController customBottomNavigationController = Get.find();
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.symmetric(horizontal: 24),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(24)),
            color: $styles.colors.greyStrong.withOpacity(.8)),
        child:
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            ...List.generate(
              bottomNavs.length,
              (index) => GestureDetector(
                onTap: () {
                  bottomNavs[index].input!.change(true);
                  if (bottomNavs[index] != selectedBottomNav) {
                    customBottomNavigationController.artBoardChanged(bottomNavs[index].artBoard);
                  }
                  customBottomNavigationController.artBoardValue.artBoard=="SEARCH"?Get.toNamed(Routes.formScreen):Get.toNamed(Routes.homeScreen);
                  Future.delayed(const Duration(seconds: 1), () {
                    bottomNavs[index].input!.change(false);

                  });
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AnimatedBar(
                        isActive: bottomNavs[index] == selectedBottomNav),
                    SizedBox(
                      height: 36,
                      width: 36,
                      child: Opacity(
                        opacity:
                            bottomNavs[index] == selectedBottomNav ? 1 : 0.5,
                        child: RiveAnimation.asset(
                          bottomNavs.first.src,
                          artboard: bottomNavs[index].artBoard,
                          onInit: (artBoard) {
                            StateMachineController controller =
                                RiveUtils.getRiveController(artBoard,
                                    stateMachineName:
                                        bottomNavs[index].stateMachineName);

                            bottomNavs[index].input =
                                controller.findSMI("active") as SMIBool;
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
