
import 'package:flutter/material.dart';
import 'package:mazerunner/Utilities/utilities.dart';

class SnackbarWidget {
  static void showSnackbar(BuildContext context , AnimationController animationController) {
    String message;
    if(Utilities.selecttile=="" && Utilities.mode==""){
      message = "Plz Select Game Mode & Character";
    }
    else if (Utilities.selecttile == "") {
      message = "Please choose a character";
    } else if (Utilities.mode == "") {
      message = "Select Game Mode";
    } else{
      message="";
    }


    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.black,
        content: Text(message,style: TextStyle(fontSize: 18,color: Colors.white),),
        dismissDirection: DismissDirection.up,
        margin: EdgeInsets.only(
            bottom: MediaQuery.of(context).size.height/1.09,
            left: 10,
            right: 10),
        behavior: SnackBarBehavior.floating,
        duration: Duration(seconds: 1),
        animation: CurvedAnimation(parent: animationController, curve: Curves.easeInOut),
      ),
    );
  }
}


void showSnackbar(BuildContext context ,AnimationController animationController) {
  if (Utilities.selecttile == "" && Utilities.mode == "") {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Plz Select Game Mode & Character"
          ,style: TextStyle(fontSize: 18,color: Colors.white),),
        behavior: SnackBarBehavior.floating,
        duration: Duration(seconds: 2),
        animation: CurvedAnimation(parent: animationController, curve: Curves.easeOut),
      ),
    );
  } else if (Utilities.selecttile == "") {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Please choose a character" ,
          style: TextStyle(fontSize: 18,color: Colors.white),),
        behavior: SnackBarBehavior.floating,
        duration: Duration(seconds: 2),
        animation: CurvedAnimation(parent: animationController, curve: Curves.easeOut),
      ),
    );
  } else if (Utilities.mode == "") {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Select Game Mode",
            style: TextStyle(fontSize: 18,color: Colors.white),),
        behavior: SnackBarBehavior.floating,
        duration: Duration(seconds: 2),
        animation: CurvedAnimation(parent: animationController, curve: Curves.easeOut),
      ),
    );
  }
}