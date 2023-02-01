import 'package:enigma/environments.dart';
import 'package:enigma/main.dart';

void main(){
  Constants.setEnvironment(Environment.prod);
  mainDelegate();
}