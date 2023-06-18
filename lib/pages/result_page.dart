import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/home_controller.dart';
import 'package:url_launcher/url_launcher.dart';

class ResultPage extends StatelessWidget {
  final HomeController controller = Get.find<HomeController>();

  Future<void> launchUrl(String shareText) async {
    final Uri uri = Uri.parse('whatsapp://send?text=$shareText');
    if (await canLaunch(uri.toString())) {
      await launch(uri.toString());
    } else {
      throw 'Could not launch $uri';
    }
  }

  @override
  Widget build(BuildContext context) {
    String bmiStatus = controller.getBMIStatus();
    String bmiSuggestion = controller.getBMISuggestion();

    return Scaffold(
      appBar: AppBar(
        title: Text('Hasil BMI'),
        actions: [
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () async {
              String shareText =
                  'BMI Anda adalah ${controller.bmi.value.toStringAsFixed(2)}, dengan status $bmiStatus. Saran: $bmiSuggestion';
              await launchUrl(shareText);
            },
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'BMI Anda:',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            Obx(() => Text(
                  '${controller.bmi.value.toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 48.0, fontWeight: FontWeight.bold),
                )),
            SizedBox(height: 16.0),
            Text(
              'Status:',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
              bmiStatus,
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 16.0),
            Text(
              'Saran:',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
              bmiSuggestion,
              style: TextStyle(fontSize: 18.0),
            ),
          ],
        ),
      ),
    );
  }
}
