import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mazerunner/Pages/game%20mode/Homepage.dart';
import 'package:mazerunner/Pages/start_game.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage>
    with SingleTickerProviderStateMixin {
  bool _showText = false;
  bool _showImage = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // systemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        _showText = true;
      });
    });
    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        _showImage = true;
      });
    });
    Future.delayed(Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => StartGame()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.pink, Colors.red],
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft)),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // if (!_showText) // Placeholder to maintain layout
              SizedBox(
                // Width of the text to keep the layout stable
                height: 200, // Height of the text to keep the layout stable
              ),
              if (_showText)
                Text(
                  "Maze Runner",
                  style: TextStyle(
                      fontSize: 40,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              SizedBox(
                // Width of the text to keep the layout stable
                height: 100, // Height of the text to keep the layout stable
              ),

              if (_showImage)
                // Image(
                //   width: 300,
                //   height: 500,
                //   image: AssetImage("assets/images/b.jpeg"),
                // ),
                Lottie.asset("assets/animations/dog.json")
            ],
          ),
        ),
      ),
    );
  }
}
