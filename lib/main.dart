import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
//import 'package:device_preview/device_preview.dart';
import 'package:project_bloem/screens/summery/summery.dart';
import 'package:project_bloem/screens/basket_screen/mybasket.dart';
import 'package:project_bloem/screens/chat/chatlist.dart';
import 'package:project_bloem/screens/delivery_screen/delivery.dart';
import 'package:project_bloem/screens/help_screen/help.dart';
import 'package:project_bloem/screens/homo_screen/home_screen.dart';
import 'package:project_bloem/screens/item_view/itemview.dart';
import 'package:project_bloem/screens/login_screen/login.dart';
import 'package:project_bloem/screens/place_a_listing/place_a_listing.dart';
import 'package:project_bloem/screens/register_form/registerform.dart';
import 'package:project_bloem/screens/resetpassword/restpassword.dart';
import 'package:project_bloem/screens/selling/selling_page.dart';
import 'package:project_bloem/screens/user_profile/profile.dart';
import 'package:project_bloem/screens/welcome_screen/welcome_screen.dart';
import 'components/size.dart';
import 'package:firebase_core/firebase_core.dart';



Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  if(kIsWeb){
    await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyDlZU5-YB1ikQ3JUvb_BGOVzwf5OZZZflw",
          appId: "1:698241380744:web:82fcffc4d940b3f3ab8a3d",
          messagingSenderId: "698241380744",
          projectId: "projectbloem-1e1c5")
    );
  }else{
    await Firebase.initializeApp();


  }
  runApp(
    // DevicePreview(
    //   builder: (context) => const MyApp(), // Wrap your app
    // ),
    const MyApp(),
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
        //home: const UserProfile());
        initialRoute: '/',
        routes: {
          '/':(context) => const WelcomeScreen(),
          '/mybusket' :(context) => const MyBasketScreen(),
          '/home' :(context) => const HomeScreen(),
          '/login' :(context) => const LoginPage(),
          '/listing' :(context) => const PlaceListing(),
          '/register' :(context) => const RegisterPage(),
          '/resetpassword' :(context) => const ResetPassword(),
          '/selling' :(context) => const SellingPage(),
          '/profile' :(context) => const UserProfile(),
          '/chat' :(context) => const ChatList(),
          '/delivery':(context) => const DeliveryScreen(),
          '/itemview':(context) => const ItemView(),
          '/help':(context) => const HelpScreen(),
          '/summery':(context) => const SummeryPage(),
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
