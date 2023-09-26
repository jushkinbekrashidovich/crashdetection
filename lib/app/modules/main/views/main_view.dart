import 'package:audioplayers/audioplayers.dart';
import 'package:crashdetection/app/const/theme/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/main_controller.dart';

class MainView extends GetView<MainController> {
  const MainView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.settings)),
        ],
        elevation: 0.4,
      ),
      drawer: Drawer(
        backgroundColor: AppColors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: AppColors.secondaryColor,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Jushkinbek Bekniyozov",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    "+998880189977",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(
                    height: 7,
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                // Add your code here for handling the Home option
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                // Add your code here for handling the Settings option
                Navigator.pop(context);
              },
            ),
            // Add more ListTiles for additional options
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Swipe to run the app",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
            ),
             TextButton(
            onPressed: () async {
              final player = AudioPlayer();
              player.play(AssetSource('assets/sos.mp3'));
            },
            child: Text("click me", style: TextStyle(color: AppColors.black),),
          ),
            SizedBox(
              height: 15,
            ),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
