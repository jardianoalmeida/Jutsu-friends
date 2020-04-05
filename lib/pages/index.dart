import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:permission_handler/permission_handler.dart';
import './call.dart';

class IndexPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => IndexState();
}

class IndexState extends State<IndexPage> {
  /// create a channelController to retrieve text value
  final _channelController = TextEditingController(text: 'friends');

  /// if channel textField is validated to have error
  bool _validateError = false;

  @override
  void dispose() {
    // dispose input controller
    _channelController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
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

    Color mC = Colors.grey.shade100;
    Color mCL = Colors.white;
    Color mCD = Colors.black.withOpacity(0.075);
    Color mCC = Colors.green.withOpacity(0.65);
    Color fCD = Colors.grey.shade700;
    Color fCL = Colors.grey;
    BoxDecoration nMbox = BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: mC,
        boxShadow: [
          BoxShadow(
            color: mCD,
            offset: Offset(10, 10),
            blurRadius: 10,
          ),
          BoxShadow(
            color: mCL,
            offset: Offset(-10, -10),
            blurRadius: 10,
          ),
        ]
    );

    BoxDecoration nMboxInvert = BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: mCD,
        boxShadow: [
          BoxShadow(
              color: mCL,
              offset: Offset(3, 3),
              blurRadius: 3,
              spreadRadius: -3
          ),
        ]
    );

    BoxDecoration nMboxInvertActive = nMboxInvert.copyWith(color: mCC);

    BoxDecoration nMbtn = BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: mC,
        boxShadow: [
          BoxShadow(
            color: mCD,
            offset: Offset(2, 2),
            blurRadius: 2,
          )
        ]
    );
    return Scaffold(
      backgroundColor: Color(0xff2c2c2c),
      body: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          height: 400,
          child: Column(
            children: <Widget>[
              Container(
                color: Colors.white,
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: TextField(
                      controller: _channelController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person),
                        suffixIcon: IconButton(icon: Icon(Icons.clear), onPressed: ()=> _channelController.clear()),
                        errorText:    _validateError ? 'Channel name is mandatory' : null,
                        border: OutlineInputBorder(
                          borderSide: BorderSide(width: 1),
                        ),
                      ),
                    ))
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: new RaisedButton(
                  color: Colors.blueGrey,
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.all(new Radius.circular(15.0))),
                  onPressed: onJoin,
                  child: Container(
                    height: 50.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blueGrey,
                    ),
                    child: new Center(
                      child: new Text(
                        "Ligar".toUpperCase(),
                        style: new TextStyle(color: Colors.blue, fontSize: 18.0),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> onJoin() async {
    // update input validation
    setState(() {
      _channelController.text.isEmpty
          ? _validateError = true
          : _validateError = false;
    });
    if (_channelController.text.isNotEmpty) {
      // await for camera and mic permissions before pushing video page
      await _handleCameraAndMic();
      // push video page with given channel name
      await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CallPage(
            channelName: _channelController.text,
          ),
        ),
      );
    }
  }

  Future<void> _handleCameraAndMic() async {
    await PermissionHandler().requestPermissions(
      [PermissionGroup.camera, PermissionGroup.microphone],
    );
  }
}
