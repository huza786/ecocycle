import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recycle_app/Models/local_storage/local_storage.dart';
import 'package:recycle_app/Models/local_storage/local_storage_instatiate.dart';

import 'package:recycle_app/View/utils/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:recycle_app/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await SharedPrefs().init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: ScreenUtilInit(
          designSize: const Size(430, 932),
          builder: (context, _) {
            return MaterialApp(
              theme: ThemeData(fontFamily: 'Poppins'),
              initialRoute: AppRoutes.initialRoute,
              routes: routes,
              debugShowCheckedModeBanner: false,
            );
          }),
    );
  }
}
