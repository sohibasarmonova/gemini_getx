
import 'package:gemini_getx/presentation/controller/home_controller.dart';
import 'package:gemini_getx/presentation/controller/starter_controller.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

class RootBinding implements Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => StarterController(),fenix: true);
    Get.lazyPut(() => HomeController(),fenix: true);

  }
}