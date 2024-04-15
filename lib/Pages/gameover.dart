import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';
import 'package:mazerunner/Pages/game%20mode/Homepage.dart';
import 'package:mazerunner/Pages/game_mode.dart';
import 'package:mazerunner/Utilities/utilities.dart';

class GameOver extends StatefulWidget {
  const GameOver({super.key});

  @override
  State<GameOver> createState() => _GameOverState();
}

class _GameOverState extends State<GameOver> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    final hoverTransform = Matrix4.identity()..translate(0.0, -10.0, 0.0);
    // final hoverTransform= Matrix4.identity()..scale(2.0);
    final transform = _isHovering ? hoverTransform : Matrix4.identity();

    final modeNames = {
      "easy": "Easy mode",
      "medium": "Medium mode",
      "hard": "Hard mode",
    };

    final mode = Utilities.mode;
    final modeText = modeNames[mode];

    return Scaffold(
      backgroundColor: Colors.red,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.red, Colors.white],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // if (!_showText) // Placeholder to maintain layout

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30))),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        "Congratulations",
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.red,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 15,
                      ),

                      Container(
                        // margin: const EdgeInsets.only(bottom: 0.5),
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50.0),
                              bottomRight: Radius.circular(50.0),
                            )),
                        child: Text(
                          "You have Completed the",
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      // Image

                      // Utilities.mode=="easy"?
                      // Text(
                      //   "${Utilities.mode} mode",
                      //   style: TextStyle(
                      //     fontSize: 22,
                      //     color: Colors.black,
                      //   ),
                      // ): SizedBox(),
                      // Utilities.mode=="medium"?
                      // Text(
                      //   "${Utilities.mode} mode",
                      //   style: TextStyle(
                      //     fontSize: 22,
                      //     color: Colors.black,
                      //   ),
                      // ): SizedBox(),
                      // Utilities.mode=="hard"?
                      // Text(
                      //   "${Utilities.mode} mode",
                      //   style: TextStyle(
                      //     fontSize: 22,
                      //     color: Colors.black,
                      //   ),
                      // ): SizedBox(),

                      // Game Mode print

                      modeText != null
                          ? Container(
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(50.0),
                                    bottomRight: Radius.circular(50.0),
                                  )),
                              child: Text(modeText,
                                  style: TextStyle(
                                      fontSize: 22,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)),
                            )
                          : SizedBox(),

                      SizedBox(
                        height: 60,
                      ),
                      Lottie.asset("assets/animations/boom.json",fit: BoxFit.fill),

                      Center(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              _isHovering = !_isHovering;
                              if (Utilities.mode == "easy") {
                                Utilities.easycol = 2;
                                Utilities.easyrow = 2;
                                Utilities.easylevel = 1;
                              }
                              if (Utilities.mode == "medium") {
                                Utilities.mediumcol = 7;
                                Utilities.mediumrow = 7;
                                Utilities.mediumlevel = 10;
                              }
                              if (Utilities.mode == "hard") {
                                Utilities.row = 12;
                                Utilities.col = 12;
                                Utilities.level = 19;
                              }
                            });
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => GameMode(),
                                ));
                          },
                          child: AnimatedContainer(
                              padding: const EdgeInsets.all(20),
                              alignment: Alignment.center,
                              // height:  100,
                              width: 300,
                              // color: Colors.red,
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(30.0),
                                    bottomRight: Radius.circular(30.0),
                                  )),
                              duration: Duration(milliseconds: 200),
                              transform: transform,
                              child: Text("FINISHED",
                              style: TextStyle(
                                fontSize: 28,
                                color: Colors.white
                              ),)),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Column(
//   children: [
//     Text(
//       "Game Over",
//       style: TextStyle(fontSize: 80),
//     ),
//     SizedBox(
//       height: 20,
//     ),
//     Center(
//       child: GestureDetector(
//         onTap: (){
//           setState(() {
//             _isHovering= !_isHovering;
//             if(Utilities.mode=="easy"){
//               Utilities.easycol=2;
//               Utilities.easyrow=2;
//               Utilities.easylevel=1;
//             }
//             if(Utilities.mode=="medium"){
//               Utilities.mediumcol=7;
//               Utilities.mediumrow=7;
//               Utilities.mediumlevel=10;
//             }
//             if(Utilities.mode=="hard"){
//               Utilities.row=12;
//               Utilities.col=12;
//               Utilities.level=19;
//             }
//
//           });
//           Navigator.push(context, MaterialPageRoute(builder: (context) => GameMode(),));
//         },
//         child: AnimatedContainer(
//           padding: const EdgeInsets.all(10),
//           // height:  100,
//           // width: 100,
//           color: Colors.red,
//           duration: Duration(milliseconds: 200),
//           transform: transform,
//           child: Text("Restart Game")
//         ),
//       ),
//     ),
//   ],
// ),
