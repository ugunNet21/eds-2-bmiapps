import 'package:bionotes/pages/input_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashSceen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashSceen> {
  @override
  void initState() {
    super.initState();
    navigateToNextScreen();
  }

  void navigateToNextScreen() async {
    await Future.delayed(Duration(seconds: 5)); // Menunggu 2 detik
    Get.off(() => InputPage()); // Pindah ke InputPage dan menghapus SplashScreen dari tumpukan navigasi
  }

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'lib/assets/img/ic_launcher.png', // Ubah dengan path gambar Anda
              width: 200.0,
              height: 200.0,
            ),
            SizedBox(height: 10.0),
            Text("Salam Sehat Jiwa Raga"),
          ],
        ),
      ),
    );
  }
}





