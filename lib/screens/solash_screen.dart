import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'Home_screen.dart';


class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: null,
        body: Container(
          child: SplashScreen(
            seconds:15,
            image: Image.asset("assets/OMM.gif",
              height: double.infinity ,
              width: double.infinity,
            ),
            navigateAfterSeconds: HomeScreen(),
            photoSize: 200,
//            loaderColor: Colors.black38,
//          loadingText: Text('Waiting Please',style: TextStyle(
//              fontWeight: FontWeight.w500,
//              color: Colors.grey.shade600
//          ),),
          ),
        )
    );
  }
}

