import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:reservation_demo/controller/app_controller.dart';
import 'package:reservation_demo/controller/hotel_reservation_controller.dart';
import 'package:reservation_demo/screens/home_screen.dart';
import 'package:reservation_demo/utils/themes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //init storage : must complete first
  await GetStorage.init();

  ///
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ///
    Get.config(enableLog: true, defaultTransition: Transition.fadeIn);

    ///
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Reservation Demo',
      theme: MyThemes.lightTheme,
      darkTheme: MyThemes.darkTheme,
      themeMode: myThemeMode,
      getPages: [
        GetPage(name: '/home', page: () => const HomeScreen()),
      ],
      home: const HomeScreen(),
      initialBinding: BindingsBuilder(() {
        Get.put(HotelReservationController(), permanent: true);
        Get.put(AppController(), permanent: true);
      }),
    );
  }
}

class MyHomeWidget extends StatefulWidget {
  const MyHomeWidget({super.key});

  @override
  State<MyHomeWidget> createState() => _MyHomeWidgetState();
}

class _MyHomeWidgetState extends State<MyHomeWidget> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (controller) {
      return const Scaffold(
        body: HomeScreen(),
      );
    });
  }
}
