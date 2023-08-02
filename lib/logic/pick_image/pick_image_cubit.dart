import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';

part 'pick_image_state.dart';

class PickImageCubit extends Cubit<PickImageState> {
  PickImageCubit() : super(PickImageInitial());
  File? image;
  final ImagePicker imagePicker = ImagePicker();
  double? maxWidth = 720;
  double? maxHeight = 1280;
  int? imageQuality = 100;
  setter(double? maxWidth, double? maxHeight, int? imageQuality) {
    this.maxHeight = maxHeight ?? this.maxHeight;
    this.maxWidth = maxWidth ?? this.maxWidth;
    this.imageQuality = imageQuality ?? this.imageQuality;
  }

  get delImage {
    emit(PickImageLoading());
    image = null;
    emit(PickImageSuccess());
  }

  Future<File?> pickImage() async {
    try {
      final pickedFile = await imagePicker.pickImage(
        source: ImageSource.gallery,
        // imageQuality: imageQuality,
        maxHeight: maxHeight,
        maxWidth: maxWidth,
      );
      if (pickedFile != null) {
        emit(PickImageLoading());

        image = File(pickedFile.path);
        if (kDebugMode) {
          print('$image image1');
        }
        emit(PickImageSuccess());
      }
    } catch (e) {
      emit(PickImageError(error: e.toString()));
    }
    return image;
  }
}
