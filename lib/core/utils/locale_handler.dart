import '../../lib.dart';

class LocaleHandler{
 static Locale read()=>
  SystemDao.getLocale()??Get.deviceLocale??const Locale('en', 'US');   

}