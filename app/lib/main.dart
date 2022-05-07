import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vrouter/vrouter.dart';
import 'AppColors.dart';
import 'AuthHandler.dart';
import 'pages/Auth.dart';
import 'pages/Home.dart';
import 'pages/Login.dart';
import 'pages/Register.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
  initialization();
}

void initialization() async {
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  await Future.delayed(const Duration(seconds: 5));
  FlutterNativeSplash.remove();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VRouter(
        debugShowCheckedModeBanner: false,
        mode: VRouterMode.history,
        title: 'O\'nest',
        theme: ThemeData(
          primarySwatch: AppColors.primaryColor,
          scaffoldBackgroundColor: AppColors.primaryColor,
          textTheme: GoogleFonts.balsamiqSansTextTheme(
            Theme.of(context).textTheme,
          ),
        ),
        initialUrl: '/auth',
        routes: [
          VGuard(
              beforeEnter: (vRedirector) async => !AuthHandler.isUserLoggedIn()
                  ? vRedirector.to(Auth.route)
                  : null,
              stackedRoutes: [
                VWidget(
                  path: '/home',
                  widget: const Home(),
                ),
              ]),
          VGuard(
              beforeEnter: (vRedirector) async => AuthHandler.isUserLoggedIn()
                  ? vRedirector.to(Home.route)
                  : null,
              stackedRoutes: [
                VWidget(
                  path: '/login',
                  widget: const Login(),
                ),
                VWidget(
                  path: '/register',
                  widget: const Register(),
                ),
                VWidget(
                  path: '/auth',
                  widget: const Auth(),
                ),
              ]),
        ]);
  }
}
