import 'package:get/get.dart';

enum Gender { male, female }

class HomeController extends GetxController {
  RxString name = RxString('');
  Rx<Gender> gender = Rx<Gender>(Gender.female);
  RxInt age = RxInt(0);
  RxDouble weight = RxDouble(0.0);
  RxDouble height = RxDouble(0.0);
  RxDouble bmi = RxDouble(0.0);

  void setName(String value) {
    name.value = value;
  }

  void setGender(Gender value) {
    gender.value = value;
  }

  void setAge(int value) {
    age.value = value;
  }

  void setWeight(double value) {
    weight.value = value;
  }

  void setHeight(double value) {
    height.value = value;
  }

  void calculateBMI() {
    double heightInMeters = height.value / 100.0;
    bmi.value = weight.value / (heightInMeters * heightInMeters);
  }

  bool get isAllInputFilled {
    return name.value.isNotEmpty &&
        age.value != 0 &&
        weight.value != 0.0 &&
        height.value != 0.0;
  }

  String getBMIStatus() {
    if (bmi.value < 18.5) {
      return 'Berat Badan kurang';
    } else if (bmi.value >= 18.5 && bmi.value < 25.0) {
      return 'Berat normal';
    } else if (bmi.value >= 25.0 && bmi.value < 30.0) {
      return 'Kegemukan';
    } else {
      return 'Gendut sekali';
    }
  }

  String getBMISuggestion() {
    if (bmi.value < 18.5) {
      return 'Anda kurus. Pertimbangkan makan lebih banyak makanan bergizi.';
    } else if (bmi.value >= 18.5 && bmi.value < 25.0) {
      return 'Selamat! Anda memiliki berat badan normal.';
    } else if (bmi.value >= 25.0 && bmi.value < 30.0) {
      return 'Anda kelebihan berat badan. Pertimbangkan untuk berolahraga secara teratur.';
    } else {
      return 'Anda mengalami obesitas. Konsultasikan dengan profesional kesehatan.';
    }
  }
}
