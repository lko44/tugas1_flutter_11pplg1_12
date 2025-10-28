import 'package:get/route_manager.dart';
import 'package:latihan1_11pplg1/bindings/calculator_binding.dart';
import 'package:latihan1_11pplg1/bindings/contact_binding.dart';
import 'package:latihan1_11pplg1/bindings/example_binding.dart';
import 'package:latihan1_11pplg1/bindings/football_binding.dart';
import 'package:latihan1_11pplg1/bindings/football_edit_binding.dart';
import 'package:latihan1_11pplg1/bindings/football_responsicve_binding.dart';
import 'package:latihan1_11pplg1/bindings/hsr_list_binding.dart';
import 'package:latihan1_11pplg1/bindings/login_api_binding.dart';
import 'package:latihan1_11pplg1/bindings/login_binding.dart';
import 'package:latihan1_11pplg1/bindings/splashscreen_binding.dart';
import 'package:latihan1_11pplg1/bindings/uma_binding.dart';
import 'package:latihan1_11pplg1/pages/contact_page.dart';
import 'package:latihan1_11pplg1/pages/example_page.dart';
import 'package:latihan1_11pplg1/pages/hsr_list_page.dart';
import 'package:latihan1_11pplg1/pages/login_api_page.dart';
import 'package:latihan1_11pplg1/pages/login_page.dart';
import 'package:latihan1_11pplg1/pages/bottom_nav_page.dart';
import 'package:latihan1_11pplg1/pages/calculator_page.dart';
import 'package:latihan1_11pplg1/pages/football_edit_page.dart';
import 'package:latihan1_11pplg1/pages/football_page.dart';
import 'package:latihan1_11pplg1/pages/main_menu_page.dart';
import 'package:latihan1_11pplg1/pages/mobile/football_mobile_page.dart';
import 'package:latihan1_11pplg1/pages/profile_page.dart';
import 'package:latihan1_11pplg1/pages/spalshscreen_page.dart';
import 'package:latihan1_11pplg1/pages/uma_list_page.dart';
import 'package:latihan1_11pplg1/routes/routes.dart';

class AppPages {
  //list / Array yang isinys kumpulan pages/ui kita
  static final pages = [
    GetPage(
      name: AppRoutes.loginpage,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
    // GetPage(
    //   name: AppRoutes.footballplayers,
    //   page: () => FootballPage(),
    //   binding: FootballBinding(),
    // ),
    GetPage(
      name: AppRoutes.footballeditplayers,
      page: () => FootballEditPage(),
      binding: FootballEditBinding(),
    ),
    GetPage(
      name: AppRoutes.calculator,
      page: () => CalculatorPage(),
      binding: CalculatorBinding(),
    ),
    GetPage(
      name: AppRoutes.contact,
      page: () => ContactPage(),
      binding: ContactBinding(),
    ),
    GetPage(name: AppRoutes.profilepage, page: () => ProfilePage()),
    GetPage(name: AppRoutes.navbar, page: () => BottomNavPage()),
    GetPage(name: AppRoutes.mainmenu, page: () => MainMenuPage()),
    GetPage(name: AppRoutes.examplescreen, 
    page: () => ExamplePage(), 
    binding: ExampleBinding()),

    // GetPage(name: AppRoutes.register, page: () => MainMenuPage ()),
    GetPage(
      name: AppRoutes.splashscreen,
      page: () => SpalshscreenPage(),
      binding: SplashscreenBinding(),
    ),
    GetPage(
      name: AppRoutes.footballmobile,
      page: () => FootballPage(),
      binding: FootballResponsicveBinding(),
    ),
    
    GetPage(
      name: AppRoutes.loginapi,
      page: () => LoginApiPage(),
      binding: LoginApiBinding(),
    ),
    
    GetPage(
      name: AppRoutes.hsrClist,
      page: () => HsrListPage(),
      binding: HsrListBinding(),
    ),
    GetPage(
      name: AppRoutes.umaClist,
      page: () => UmaListPage(),
      binding: UmaBinding(),
    ),

  ];
}
