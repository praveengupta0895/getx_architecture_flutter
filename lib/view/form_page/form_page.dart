import 'package:enigma/common_libraries.dart';
import 'package:enigma/view/common/enigma_scaffold.dart';
import 'package:enigma/view/form_page/form_page_controller.dart';

import '../widgets/custom_text_form_field.dart';

class FormPage extends StatelessWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FormPageController formPageController =
        Get.put(FormPageController()); // controller

    return EnigmaScaffold(
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Obx(() {
              return CustomTextFormField(
                labelText: 'username',
                obscureText: false,
                errorText: formPageController.usernameErrorText.value,
                onChange: formPageController.usernameChanged,
                // enabledValue: formPageController.usernameEnabled.value,
              );
            }),
            Obx(
              () {
                return CustomTextFormField(
                  labelText: 'password',
                  obscureText: true,
                  errorText: formPageController.passwordErrorText.value,
                  onChange: formPageController.passwordChanged,
                  // enabledValue: formPageController.passwordEnabled.value,
                );
              }),
            Obx(
              () => ElevatedButton(
                onPressed: formPageController.submitFunc.value,
                child: const Text('Submit'), // obs
              ),
            )
          ],
        ),
      ),
    );
  }
}
