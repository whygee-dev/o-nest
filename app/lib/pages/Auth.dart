import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vrouter/vrouter.dart';

import '../AppColors.dart';
import 'Login.dart';
import 'Register.dart';

class Auth extends StatelessWidget {
  const Auth({Key? key, Object? nextPage}) : super(key: key);

  static const route = '/auth';
  static const typoStyle = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 36,
    color: Colors.white,
  );

  static var registerTextStyle = TextStyle(
    fontSize: 20,
    color: AppColors.primaryColor,
  );

  static var loginTextStyle = const TextStyle(
    fontSize: 20,
    color: Colors.white,
  );

  @override
  Widget build(BuildContext context) {
    var padding = MediaQuery.of(context).padding;
    var window = MediaQuery.of(context).size;
    double height = window.height - padding.top - padding.bottom;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/pattern.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              child: Image.asset("assets/zigzag.png"),
              width: 190,
              height: height / 1.8,
              top: height / 4.75,
              right: window.width / 50,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: Center(child: Image.asset("assets/logo.png")),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 50.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text('Votre animal', style: typoStyle),
                            Text('de compagnie', style: typoStyle),
                            Text('accompagné', style: typoStyle),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 50,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        TextButton(
                          onPressed: () => context.vRouter.to(Register.route),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.white,
                            ),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(60.0),
                                side: const BorderSide(color: Colors.white54),
                              ),
                            ),
                          ),
                          child: Text(
                            "Inscription",
                            style: GoogleFonts.balsamiqSans(
                              textStyle: registerTextStyle,
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 10.0),
                          child: TextButton(
                            onPressed: () => {context.vRouter.to(Login.route)},
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(60.0),
                                  side: const BorderSide(color: Colors.white54),
                                ),
                              ),
                            ),
                            child: Text(
                              "Connexion",
                              style: GoogleFonts.balsamiqSans(
                                textStyle: loginTextStyle,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
