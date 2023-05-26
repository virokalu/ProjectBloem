import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:project_bloem/revenue.dart';
import 'package:project_bloem/revenuecard.dart';
import 'package:project_bloem/screens/about_us/aboutus.dart';
import 'package:project_bloem/screens/login_screen/adminlogin.dart';
import 'package:project_bloem/screens/search_screen/categorypage.dart';
import 'package:project_bloem/screens/search_screen/sresult.dart';
import 'package:project_bloem/screens/selling/registersellerform.dart';

import 'package:project_bloem/screens/setting_screen/account_info/info.dart';

import 'package:project_bloem/screens/setting_screen/password_info/password.dart';
import 'package:project_bloem/screens/setting_screen/policies/policy.dart';
//import 'package:device_preview/device_preview.dart';
import 'package:project_bloem/screens/summery/summery.dart';
import 'package:project_bloem/screens/basket_screen/mybasket.dart';
import 'package:project_bloem/screens/chat/chatlist.dart';
import 'package:project_bloem/screens/delivery_screen/delivery.dart';
import 'package:project_bloem/screens/help_screen/help.dart';
import 'package:project_bloem/screens/homo_screen/home_screen.dart';
//import 'package:project_bloem/screens/item_view/item_view_new.dart';
import 'package:project_bloem/screens/item_view/itemview.dart';
import 'package:project_bloem/screens/login_screen/login.dart';
import 'package:project_bloem/screens/place_a_listing/place_a_listing.dart';
import 'package:project_bloem/screens/register_form/registerform.dart';
import 'package:project_bloem/screens/resetpassword/restpassword.dart';
import 'package:project_bloem/screens/selling/selling_page.dart';
import 'package:project_bloem/screens/user_profile/profile.dart';
import 'package:project_bloem/screens/welcome_screen/welcome_screen.dart';
import 'package:project_bloem/screens/wish_list/wish_list.dart';
import 'components/size.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

import 'package:project_bloem/screens/setting_screen/setting.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyDlZU5-YB1ikQ3JUvb_BGOVzwf5OZZZflw",
            appId: "1:698241380744:web:82fcffc4d940b3f3ab8a3d",
            messagingSenderId: "698241380744",
            storageBucket: "projectbloem-1e1c5.appspot.com",
            projectId: "projectbloem-1e1c5"));
  } else {
    await Firebase.initializeApp();
  }

  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey =
      "pk_test_51MlHd3KwlHMvGTgl6qL1yVwQK3pW2bv4JSzAPTgLg4pI9jZN5ONlAQtEDO84v52tZAGKgkpZsGRQ8gJQIqibPgcZ00pB2W8QEX";
  //await Stripe.instance.applySettings();
  runApp(
    // ProviderScope(child: DevicePreview(
    //   builder: (context) => MyApp(), // Wrap your app
    // ),),

    const ProviderScope(child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return MaterialApp(
      scrollBehavior: AppScrollBehavior(),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        //brightness: Brightness.dark,
        primarySwatch: Colors.blue,
      ),
      //home: const ForAdmin());
      navigatorKey: navigatorKey,

      initialRoute: '/',
      routes: {
        '/': (context) => const WelcomeScreen(),
        '/mybusket': (context) => const MyBasketScreen(),
        '/home': (context) => const HomeScreen(),
        '/login': (context) => const LoginPage(),
        '/listing': (context) => const PlaceListing(),
        '/register': (context) => const RegisterPage(),
        '/selling': (context) => const SellingPage(),
        '/profile': (context) => const UserProfile(),
        '/chat': (context) => const ChatList(),
        '/delivery': (context) => const DeliveryScreen(),
        '/itemview': (context) => const ItemView(),
        // '/itemviewNew':(context) => const ItemViewNew(item: model),
        '/preview': (context) => const Preview(),
        '/help': (context) => const HelpScreen(),
        '/summery': (context) => const SummeryPage(),
        '/addListing': (context) => const PlaceListing(),
        '/search': (context) => const SearchResultScreen(),
        '/category': (context) => const CategoryPage(),
        '/aboutus': (context) => const AboutUs(),
        '/setting': (context) => const SettingScreen(),
        '/changeinfo': (context) => const UpdateDetails(),

        '/policy': (context) => const PolicyScreen(),
        '/password': (context) => const PasswordScreen(),
        '/sellerreg' : (context) => const SellerRegister(),
        '/reset': (context)=> ResetPassword(),
        '/adminpage' :(context) => const ForAdmin(),
        '/wishlist' :(context) => const WishListScreen(),

        '/adminloginpage' : (context) => const AdminLoginPage(),
      },
    );
  }
}

class AppScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
