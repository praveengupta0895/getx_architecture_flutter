import 'package:enigma/common_libraries.dart';
import 'package:enigma/routes.dart';

void mainDelegate() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: $styles.text.body.fontFamily),
      initialRoute: Routes.homeScreen,
      getPages: getPages,
    );
  }
}

