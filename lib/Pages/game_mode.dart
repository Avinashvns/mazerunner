import 'package:flutter/material.dart';
import 'package:mazerunner/Pages/game%20mode/Homepage.dart';
import 'package:mazerunner/Pages/character.dart';
import 'package:mazerunner/Pages/game%20mode/easy_game.dart';
import 'package:mazerunner/Pages/game%20mode/medium_game.dart';
import 'package:mazerunner/Pages/widget/snack_bar_widget.dart';
import 'package:mazerunner/Utilities/utilities.dart';

class GameMode extends StatefulWidget {
  const GameMode({super.key});

  @override
  State<GameMode> createState() => _GameModeState();
}

class _GameModeState extends State<GameMode> with TickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500), // Define animation duration
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // if (!_showText) // Placeholder to maintain layout

              Container(
                alignment: Alignment.topLeft,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        "Game Mode",
                        style: TextStyle(
                            fontSize: 40,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: Utilities.mode == "easy"
                            ? MaterialStateProperty.all<Color>(Colors.black)
                            : MaterialStateProperty.all<Color>(Colors.white),
                      ),
                      child: Text(
                        "Easy",
                        style: TextStyle(
                            fontSize: 24,
                            color: Colors.red,
                            fontWeight: FontWeight.bold),
                      ),
                      onPressed: () {
                        setState(() {
                          Utilities.mode = "easy";
                        });
                      },
                    ),

                    SizedBox(
                      height: 5,
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: Utilities.mode == "medium"
                            ? MaterialStateProperty.all<Color>(Colors.black)
                            : MaterialStateProperty.all<Color>(Colors.white),
                      ),
                      child: Text(
                        "Medium",
                        style: TextStyle(
                            fontSize: 24,
                            color: Colors.red,
                            fontWeight: FontWeight.bold),
                      ),
                      onPressed: () {
                        setState(() {
                          Utilities.mode = "medium";
                        });
                      },
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: Utilities.mode == "hard"
                            ? MaterialStateProperty.all<Color>(Colors.black)
                            : MaterialStateProperty.all<Color>(Colors.white),
                      ),
                      child: Text(
                        "Hard",
                        style: TextStyle(
                            fontSize: 24,
                            color: Colors.red,
                            fontWeight: FontWeight.bold),
                      ),
                      onPressed: () {
                        setState(() {
                          Utilities.mode = "hard";
                        });
                      },
                    ),
                    // SizedBox(height: 100,)
                  ],
                ),
              ),

              //
              Container(
                // decoration: const BoxDecoration(
                //     gradient: LinearGradient(
                //         colors: [Colors.white, Colors.red],
                //         begin: Alignment.topRight,
                //         end: Alignment.bottomRight)
                // ),
                child: Column(
                  children: [
                    Text(
                      "Choose Character",
                      style: TextStyle(
                          fontSize: 40,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    // Container(
                    //   child: Column(
                    //     crossAxisAlignment: CrossAxisAlignment.start,
                    //     children: [
                    //       ElevatedButton(
                    //         style: ButtonStyle(
                    //           backgroundColor: Utilities.mode == "easy"
                    //               ? MaterialStateProperty.all<Color>(Colors.black)
                    //               : MaterialStateProperty.all<Color>(Colors.white),
                    //         ),
                    //         child:Text(
                    //           "Easy",
                    //           style: TextStyle(
                    //               fontSize: 40,
                    //               color: Colors.red,
                    //               fontWeight: FontWeight.bold),
                    //         ),
                    //         onPressed: (){
                    //           setState(() {
                    //             Utilities.mode="easy";
                    //           });
                    //         },
                    //       ),
                    //
                    //       SizedBox(height: 20,),
                    //       ElevatedButton(
                    //         style: ButtonStyle(
                    //           backgroundColor: Utilities.mode == "medium"
                    //               ? MaterialStateProperty.all<Color>(Colors.black)
                    //               : MaterialStateProperty.all<Color>(Colors.white),
                    //         ),
                    //         child:Text(
                    //           "Medium",
                    //           style: TextStyle(
                    //               fontSize: 40,
                    //               color: Colors.red,
                    //               fontWeight: FontWeight.bold),
                    //         ),
                    //         onPressed: (){
                    //           setState(() {
                    //             Utilities.mode="medium";
                    //           });
                    //         },
                    //       ),
                    //       SizedBox(height: 20,),
                    //       ElevatedButton(
                    //         style: ButtonStyle(
                    //           backgroundColor: Utilities.mode == "hard"
                    //               ? MaterialStateProperty.all<Color>(Colors.black)
                    //               : MaterialStateProperty.all<Color>(Colors.white),
                    //         ),
                    //         child:Text(
                    //           "Hard",
                    //           style: TextStyle(
                    //               fontSize: 40,
                    //               color: Colors.red,
                    //               fontWeight: FontWeight.bold),
                    //         ),
                    //         onPressed: (){
                    //           setState(() {
                    //             Utilities.mode="hard";
                    //           });
                    //         },
                    //       ),
                    //       // SizedBox(height: 100,)
                    //     ],
                    //   ),
                    // ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                          height: 200,
                          // color: Colors.white,
                          child: ListView(
                            children: [
                              Container(
                                color: Utilities.selecttile == "dog"
                                    ? Colors.red
                                    : Colors.white,
                                margin: const EdgeInsets.only(bottom: 5),
                                child: ListTile(
                                  leading: Image(
                                    image: AssetImage("assets/images/dog.png"),
                                  ),
                                  title: Text(
                                    "Dog",
                                    style: TextStyle(fontSize: 30),
                                  ),
                                  textColor: Utilities.selecttile == "dog"
                                      ? Colors.white
                                      : Colors.red,
                                  onTap: () {
                                    print("Clicked");
                                    setState(() {
                                      Utilities.selecttile = "dog";
                                    });
                                  },
                                ),
                              ),
                              Container(
                                color: Utilities.selecttile == "cat"
                                    ? Colors.red
                                    : Colors.white,
                                margin: const EdgeInsets.only(bottom: 5),
                                child: ListTile(
                                  leading: Image(
                                    image: AssetImage("assets/images/cat.png"),
                                  ),
                                  title: Text(
                                    "Cat",
                                    style: TextStyle(fontSize: 30),
                                  ),
                                  textColor: Utilities.selecttile == "cat"
                                      ? Colors.white
                                      : Colors.red,
                                  onTap: () {
                                    print("Clicked");
                                    setState(() {
                                      Utilities.selecttile = "cat";
                                    });
                                  },
                                ),
                              ),
                              Container(
                                color: Utilities.selecttile == "ball"
                                    ? Colors.red
                                    : Colors.white,
                                child: ListTile(
                                  leading: Image(
                                    image: AssetImage(
                                        "assets/images/football.png"),
                                  ),
                                  title: Text(
                                    "Ball",
                                    style: TextStyle(fontSize: 30),
                                  ),
                                  textColor: Utilities.selecttile == "ball"
                                      ? Colors.white
                                      : Colors.red,
                                  onTap: () {
                                    print("Clicked");
                                    setState(() {
                                      Utilities.selecttile =
                                          "ball"; // Toggle tilecolor
                                    });
                                  },
                                ),
                              ),
                            ],
                          )),
                    )
                  ],
                ),
              ),

              GestureDetector(
                child: Container(
                  alignment: Alignment.center,
                  // color: Colors.red,
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(50)),
                  child: Text(
                    "Start Game",
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                onTap: () {
                  print("Select Mode");

                  // showSnackbar(context);
                  // SnackbarWidget.showSnackbar(context, animationController);
                  showSnackbar(context, animationController);

                  if (Utilities.mode == "easy" && Utilities.selecttile != "") {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EasyGame(),
                        ));
                  }
                  if (Utilities.mode == "medium" &&
                      Utilities.selecttile != "") {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MediumGame(),
                        ));
                  }
                  if (Utilities.mode == "hard" && Utilities.selecttile != "") {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MazeRunner(),
                        ));
                  } else {
                    print("Select mode");
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
