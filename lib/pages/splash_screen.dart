import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quiz_app/quiz.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(const Duration(seconds: 10), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => const Quiz()));
    });
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var deviceHeight = MediaQuery.of(context).size.height;
    var deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color.fromARGB(153, 1, 14, 56),
      //const Color.fromARGB(255, 0, 24, 43),
      //const Color.fromARGB(255, 74, 9, 75),
      body: SizedBox(
        height: deviceHeight,
        width: deviceWidth,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/quiz-logo.png",
              height: deviceHeight * 0.5,
              width: deviceWidth * 0.77,
              color: const Color.fromARGB(255, 172, 190, 248),
            ),
            SizedBox(
              height: deviceHeight * 0.015,
            ),
            Text(
              "Learn Flutter The Fun Way!!!",
              style: TextStyle(
                  fontSize: deviceWidth * 0.057,
                  color: const Color.fromARGB(255, 194, 208, 253),
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic),
            ),
            SizedBox(
              height: deviceHeight * 0.15,
            ),
          ],
        ),
      ),
    );
  }
}
/*OutlinedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.add),
              label: Text(
                "Get started",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            )*/