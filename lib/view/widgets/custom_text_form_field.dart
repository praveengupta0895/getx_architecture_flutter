import 'package:enigma/common_libraries.dart';

import '../form_page/form_page_controller.dart';

class CustomTextFormField extends StatelessWidget {
   const CustomTextFormField({
    Key? key,
    required this.labelText,
     required this.errorText,
     required this.obscureText,
     required this.onChange,
     // required this.enabledValue,
  }) : super(key: key);
  final String labelText;
   final String? errorText;
  final bool obscureText;
   // final bool? enabledValue;
  final void Function(String)? onChange;

  @override
  Widget build(BuildContext context) {

          return TextFormField(
              onChanged: onChange,
              autocorrect: false,
              enableSuggestions: false,
              // enabled: enabledValue,
              obscureText: obscureText,
              decoration: InputDecoration(
                  labelText: labelText,
                  border: InputBorder.none,
                  fillColor: Colors.deepOrange,
                  focusedBorder: $styles.borderSide.focusedBorder,
                  enabledBorder: $styles.borderSide.enabledBorder,
                  errorBorder:  $styles.borderSide.errorBorder,
                  focusedErrorBorder:  $styles.borderSide.focusedErrorBorder,
                  disabledBorder: $styles.borderSide.disabledBorder,
                  errorText: errorText
              )
          );

  }
}