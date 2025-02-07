
import 'dart:async';
import 'dart:io';

import 'package:bladi/utils/ColorBladi.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home/Home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 3),
          () => Navigator.pushReplacementNamed(context, '/home'),
    );
  }
  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 5),(){Get.to(()=>Home());
    });
    return Scaffold(
      backgroundColor: Colors.white,

      body:  Center(
        child: Column(
          mainAxisAlignment:MainAxisAlignment.center,
          children: [
            Image.asset('assets/img.png', height: 130,),
            const SizedBox(height: 30,),
            if(Platform.isIOS)
              const CupertinoActivityIndicator(
                radius:15,
              )
              else

            CircularProgressIndicator(
             color: ColorBladi.main2Color,
            )

          ],
        )
      ),
    );
  }
}
