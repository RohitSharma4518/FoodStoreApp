import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foodstore/firebase_options.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:foodstore/Routes/app_pages.dart';
import 'package:sizer/sizer.dart';

import 'Controllers/global_controller_binding.dart';

void main() async {
  // Returns an instance of the binding that implements
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Get_Stoarage Initialisation
  await GetStorage.init();

  // Unble Portraite mode
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
    ],
  );

  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (
        context,
        orientation,
        deviceType,
      ) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'GetX Base Project',
          getPages: AppPages.routes,
          initialRoute: AppPages.INITIAL,
          initialBinding: GlobalControllerBindings(),
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
        );
      },
    );
  }
}
