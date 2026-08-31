import 'dart:io';

import 'package:file_picker/file_picker.dart' as fp;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ChooseYourSpecialisationController extends GetxController {
  final ImagePicker _picker = ImagePicker();

  Rx<File?> selectedImage = Rx<File?>(null);

  RxString selectedSpecialization = ''.obs;

  // Text field controllers
  final locationController = TextEditingController();
  final descriptionController = TextEditingController();

  // File uploads
  final Rx<File?> driverLicense = Rx<File?>(null);
  final Rx<File?> certificate = Rx<File?>(null);
  final Rx<File?> governmentId = Rx<File?>(null);
 // final Rx<File?> marketplaceInsurance = Rx<File?>(null);
  final Rx<File?> additionalCertifications = Rx<File?>(null);

  Future<void> pickImage() async {
    final XFile? image = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );

    if (image != null) {
      selectedImage.value = File(image.path);
    }
  }

  void setSpecialization(String value) {
    selectedSpecialization.value = value;
  }

Future<void> pickFile(Rx<File?> target) async {
  final result = await fp.FilePicker.pickFiles(
    type: fp.FileType.any,
   // allowedExtensions: ['pdf', 'jpg', 'jpeg', 'png', 'doc', 'docx'],
  );
  print("file selected is ${result}");

  if (result != null && result.files.single.path != null) {
    target.value = File(result.files.single.path!);
  }
}

  void pickDriverLicense() => pickFile(driverLicense);
  void pickCertificate() => pickFile(certificate);
  void pickGovernmentId() => pickFile(governmentId);
  //void pickMarketplaceInsurance() => pickFile(marketplaceInsurance);
  void pickAdditionalCertifications() => pickFile(additionalCertifications);

  @override
  void onClose() {
    locationController.dispose();
    descriptionController.dispose();
    super.onClose();
  }
}
