import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:untitled2/controllers/main_controller.dart';
import 'package:untitled2/screens/hall_screens/order_page.dart';
import 'package:untitled2/screens/hall_screens/pick_hall_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  var mc = MainController();
  mc.initialize();
  Get.put(mc);


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      designSize: const Size(360, 690),
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Тест',
        theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.blueAccent,
          textTheme: const TextTheme(
              bodyLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              bodyMedium: TextStyle(
                fontSize: 20,
              )),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
              padding: MaterialStateProperty.all(
                const EdgeInsets.all(20),
              ),
              textStyle: MaterialStateProperty.all(
                const TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ),
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.blueAccent,
          ),
        ),
        home: Builder(builder: (BuildContext context) {
          Get.put<ScaffoldMessengerState>(ScaffoldMessenger.of(context));
          return const PickHallPage();
        }),
      ),
    );
  }
}

Future<void> showSnackBarMessage(String text, {Duration? duration}) async {
  duration = duration ?? const Duration(seconds: 2);
  Get.showSnackbar(GetSnackBar(
    messageText: Text(
      text,
      maxLines: 4,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 19,
      ),
    ),
    backgroundColor: Colors.white,
    padding: const EdgeInsets.all(10),
    borderRadius: 4,
    margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
    duration: duration,
  ));
}
