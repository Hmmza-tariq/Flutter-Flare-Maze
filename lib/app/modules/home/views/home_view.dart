import 'package:flare_maze/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.deepPurple, Colors.orangeAccent],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/images/logo.png', height: 200.0, width: 200.0),
            const Text(
              'Welcome to Flare Maze!',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            const SizedBox(height: 20),
            const Text(
              'Click on the button below to start the maze!',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Get.toNamed(Routes.MAZE);
              },
              child: const Text('Start Maze'),
            ),
            ElevatedButton(
              onPressed: () {
                launchUrl(Uri.parse("https://github.com/Hmmza-tariq"));
              },
              child: const Text('Contact Us'),
            ),
          ],
        ),
      ),
    );
  }
}
