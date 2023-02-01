import 'package:enigma/common_libraries.dart';
import 'package:enigma/view/common/enigma_scaffold.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../../routes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EnigmaScaffold(
      child: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              //buildBottomSheet();
              Get.toNamed(Routes.formScreen);
            },
            child: const Text("Open Form"),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height/1.23,
            child: GridView.custom(
              gridDelegate: SliverStairedGridDelegate(
                crossAxisSpacing: 48,
                mainAxisSpacing: 24,
                startCrossAxisDirectionReversed: true,
                pattern: [
                  const StairedGridTile(0.5, 1),
                  const StairedGridTile(0.5, 3 / 4),
                  const StairedGridTile(1.0, 10 / 4),
                ],
              ),
              childrenDelegate: SliverChildBuilderDelegate(
                (context, indexVal) => GridTile(
                  child: Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),color: Colors.red),
                  child: Text(indexVal.toString()),
                ),),
                childCount: 10,
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<dynamic> buildBottomSheet() {
    return Get.bottomSheet(
      Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8), topRight: Radius.circular(8)),
              color: Colors.cyan),
          child: Column(
            children: [
              Text(
                'Hii 1',
                style: $styles.text.h2,
              ),
              Text(
                'Hii 2',
                style: $styles.text.h2,
              ),
            ],
          )),
      isDismissible: false,
      backgroundColor: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
