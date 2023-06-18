import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/home_controller.dart';

class InputPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find<HomeController>();

    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: GetBuilder<HomeController>(
            init: controller,
            builder: (_) {
              return Column(
                children: [
                  Image.asset(
                    'lib/assets/img/profile.png',
                    width: 150.0,
                    height: 150.0,
                  ),
                  SizedBox(height: 16.0),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Nama',
                      hintText: 'Wajib diisi',
                    ),
                    onChanged: (value) => controller.setName(value),
                  ),
                  SizedBox(height: 16.0),
                  TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Usia',
                      hintText: 'Wajib diisi',
                    ),
                    onChanged: (value) => controller.setAge(int.parse(value)),
                  ),
                  SizedBox(height: 16.0),
                  TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Berat (kg)',
                      hintText: 'Wajib diisi',
                    ),
                    onChanged: (value) => controller.setWeight(double.parse(value)),
                  ),
                  SizedBox(height: 16.0),
                  TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Tinggi (cm)',
                      hintText: 'Wajib diisi',
                    ),
                    onChanged: (value) => controller.setHeight(double.parse(value)),
                  ),
                  SizedBox(height: 16.0),
                  Visibility(
                    visible: !controller.isAllInputFilled,
                    child: Text(
                      'Harap isi semua data',
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (controller.isAllInputFilled) {
                        controller.calculateBMI();
                        Get.toNamed('/result');
                      } else {
                        Get.snackbar(
                          'Peringatan',
                          'Harap isi semua data sebelum menghitung BMI',
                          backgroundColor: Colors.red,
                          colorText: Colors.white,
                        );
                      }
                    },
                    child: Text('Hitung BMI'),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
