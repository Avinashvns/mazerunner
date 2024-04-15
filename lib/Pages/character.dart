import 'package:flutter/material.dart';
import 'package:mazerunner/Pages/game%20mode/Homepage.dart';

class GameCharacter extends StatefulWidget {
  const GameCharacter({super.key});

  @override
  State<GameCharacter> createState() => _GameCharacterState();
}

class _GameCharacterState extends State<GameCharacter> {
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
                  end: Alignment.bottomCenter)
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // if (!_showText) // Placeholder to maintain layout
              SizedBox(
                // Width of the text to keep the layout stable
                height: 50, // Height of the text to keep the layout stable
              ),
              Text(
                "Game Character",
                style: TextStyle(
                    fontSize: 40,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),

              CircleAvatar(
                radius: 100,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: 94,
                  backgroundColor: Colors.green,
                ),
              ),
              SizedBox(height: 40),


              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      child:Text(
                        "Easy",
                        style: TextStyle(
                            fontSize: 40,
                            color: Colors.red,
                            fontWeight: FontWeight.bold),
                      ),
                      onPressed: (){

                      },
                    ),

                    SizedBox(height: 20,),
                    ElevatedButton(
                      child:Text(
                        "Medium",
                        style: TextStyle(
                            fontSize: 40,
                            color: Colors.red,
                            fontWeight: FontWeight.bold),
                      ),
                      onPressed: (){

                      },
                    ),
                    SizedBox(height: 20,),
                    ElevatedButton(
                      child:Text(
                        "Hard",
                        style: TextStyle(
                            fontSize: 40,
                            color: Colors.red,
                            fontWeight: FontWeight.bold),
                      ),
                      onPressed: (){

                      },
                    ),
                    SizedBox(height: 100,)
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
                      borderRadius: BorderRadius.circular(50)
                  ),
                  child: Text("Let`s Go" , style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.w700
                  ),),
                ),
                onTap: (){
                  print("Start Game");
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MazeRunner(),));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
