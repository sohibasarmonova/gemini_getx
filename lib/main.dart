import 'package:flutter/material.dart';
import 'package:gemini_getx/core/config/root_binding.dart';
import 'package:gemini_getx/date/models/message_model.dart';
import 'package:gemini_getx/presentation/pages/home_page.dart';
import 'package:gemini_getx/presentation/pages/starter_page.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDirectory = await getApplicationDocumentsDirectory();
  Hive
    ..init(appDocumentDirectory.path)
    ..registerAdapter(MessageModelAdapter());
  await Hive.openBox("my_nosql");
  runApp(const MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const StarterPage(),
      initialBinding:RootBinding(),
      routes: {
        HomePage.id: (context) =>const HomePage(),
      },    );
  }
}


