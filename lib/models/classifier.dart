import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';



  pickImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    if (image == null) return null;
    var res= await classifyImage(image);
    print(res);
  }

  classifyImage(File image) async {
    var output = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 2,
      threshold: 0.5,
      imageMean: 127.5,
      imageStd: 127.5,
    );
    return output;
  }

  loadModel() async {
    await Tflite.loadModel(
      model: "assets/tflite_model/model_unquant.tflite",
      labels: "assets/tflite_model/labels.txt",
    );
  }

  @override
  void dispose() {
    Tflite.close();
  }
