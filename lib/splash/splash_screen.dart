import 'dart:convert';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flare_splash_screen/flare_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../main.dart';

class MSplashScreen extends StatefulWidget {
  @override
  _MSplashScreenState createState() => _MSplashScreenState();
}

class _MSplashScreenState extends State<MSplashScreen> {
  var foto =
      "iVBORw0KGgoAAAANSUhEUgAAAtAAAAXoCAYAAACU2fzSAAAAAXNSR0IArs4c6QAAAARzQklUCAgICHwIZIgAACAASURBVHic7N15fCRXfe/9b0vV0imNNJJmn/GMZ8H72MbYxhjwgs1uQwJctoQkxCRAtkvIDUtIuCRkIXmS5wnkhlxiCMkDhEASboCEgINjYmMwGOMN4wXj3WOP7VmkmdFMHalL6vtHbaeqqyWdsWb/vF8vmFF3V9Wp6pbnW6d/55yGLn9/WwAAAADmpedQNwAAAAA4khCgAQAAAA8EaAAAAMADARoAAADwQIAGAAAAPBCgAQAAAA8EaAAAAMADARoAAADwQIAGAAAAPBCgAQAAAA8EaAAAAMADARoAAADwQIAGAAAAPBCgAQAAAA8EaAAAAMADARoAAADwQIAGAAAAPASHugEAAADAbD607BG9b/Sx+ud2Hqff2XH8QW0PARoAAOAIFfT2aJHp08gio2WLB9TfLEe7yVas7bv3addeqwk7pXh65qC2b6C/qXXLh7VyZFDf/OFDB/XYBxIBGgAAYAE1Gg0N9Dd18ekbdMv9j+vJ8b1qt9sKent06rrlWj06pMlWrMd27NaWHbtlp2Kv/fcFvdq0aolWjQ5qKOyf8/VrlizO/74nmtQTYxN64Imdmoqnvc9tvobCfh2/fFjHrxhR0LP/FcOjPbHO7N+nF4S7JUnvW3yZ7uxdKUnaHD+hP97zNb1gYLcu3rdbt00t0q7p3gVp/1wOaIBuBr160VnP0DknrNHwQL/2Tbb0o8e262vf/7HGJiLv/b307BN0y/1btW3X3gVr41DYrxed9Yz851sfeFwPPTk+r22XDy/Ss088TksXD+ieR7fpph/Xf7UAAACOHc3eHl24eb3+5Odfond+4qvatushTbfbeuEzN+mSMzdpkelTb09D+yZb+vw379APHnxiXmF20PRp06olWrtssXr3M5QOhf0aCvu1adWotmzfrQefHNOeaHK/9lVnZJHR8ctHtH7FyNP";

  @override
  void initState() {
    assetsAudioPlayer.open("file/audio.mp3");
    super.initState();
  }

  final assetsAudioPlayer = AssetsAudioPlayer();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Color(0xff2c2c2c),
      statusBarColor: Colors.transparent,
      systemNavigationBarDividerColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
      // iOS
      statusBarBrightness: Brightness.dark,
      // Android
      statusBarIconBrightness: Brightness.dark,
    ));
    final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Color(0xff2c2c2c),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 400.0,
            child: FlareActor("file/intro.flr",
                alignment: Alignment.center,
                fit: BoxFit.contain,
                animation: "coding"),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  margin: new EdgeInsetsDirectional.only(start: 1.0, end: 1.0),
                  height: 3.0,
                  width: 150.0,
                  color: Colors.white70,
                ),
                Center(
                    child: Text(
                  "Programing",
                  style: TextStyle(fontSize: 14.0, color: Colors.blue),
                  textAlign: TextAlign.center,
                )),
                Container(
                  margin: new EdgeInsetsDirectional.only(start: 1.0, end: 1.0),
                  height: 3.0,
                  width: 150.0,
                  color: Colors.white70,
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    avatar(), //Julio
                    avatar(), //Marcos
                    avatar(), //Jardiano
                    //avatar(), //Moises
                   // avatar(), //Dion
                  ],
                ),
                AvatarGlow(
                  endRadius: 50.0,
                  glowColor: Colors.white,
                  showTwoGlows: true,
                  child: InkWell(
                    onTap: () {
                      _scaffoldKey.currentState.showSnackBar(new SnackBar(
                        duration: Duration(seconds: 50),
                          content: new Text("Programar também é uma arte!", textAlign: TextAlign.center,)
                      ));
                    },// assetsAudioPlayer.play(),
                    child: Material(
                      elevation: 8.0,
                      shape: CircleBorder(),
                      child: Container(
                        width: 40.0,
                        height: 40.0,
                        decoration: new BoxDecoration(
                          shape: BoxShape.circle,
                          image: new DecorationImage(
                            image: AssetImage("file/photo.jpg"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
//                   Center(child: Text("Jardiano :(", style: TextStyle(fontSize: 14.0, color: Colors.blue), textAlign: TextAlign.center,)),
                Container(
                  height: 20.0,
                  width: 200.0,
                  child: FlareActor("file/audio.flr",
                      alignment: Alignment.center,
                      fit: BoxFit.contain,
                      animation: "record",
                  ),
                ),
                //                 Center(child: Text("Desenvolvedor de Software", style: TextStyle(fontSize: 14.0, color: Colors.blue), textAlign: TextAlign.center,)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
avatar(){
  return AvatarGlow(
    endRadius: 50.0,
    glowColor: Colors.white,
    showTwoGlows: true,
    child: InkWell(
      onTap: () {
      },// assetsAudioPlayer.play(),
      child: Material(
        elevation: 8.0,
        shape: CircleBorder(),
        child: Container(
          width: 40.0,
          height: 40.0,
          decoration: new BoxDecoration(
            shape: BoxShape.circle,
            image: new DecorationImage(
              image: AssetImage("file/photo.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    ),
  );
}