import 'package:get/get_navigation/src/root/internacionalization.dart';


import 'en_lang.dart';
import 'hi_lang.dart';

class Languages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en': EnLang().enLang,
    'es': HiLang().hiLang,
  };
}