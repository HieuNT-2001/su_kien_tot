import 'package:camera/camera.dart';
import 'package:flutter/widgets.dart';

mixin CameraUtils<T extends StatefulWidget> on State<T> {
  CameraController? cameraController;
  List<CameraDescription>? cameras;
  bool isCameraInitialized = false;

  /// Khởi tạo camera
  Future<void> initCamera() async {
    cameras = await availableCameras();
    if (cameras!.isNotEmpty) {
      cameraController = CameraController(cameras![0], ResolutionPreset.high, enableAudio: false);
      await cameraController!.initialize();
      if (!mounted) return;
      setState(() {
        isCameraInitialized = true;
      });
    }
  }

  /// Chụp hình và trả về path
  Future<String?> takePicture() async {
    if (cameraController != null && cameraController!.value.isInitialized) {
      final image = await cameraController!.takePicture();
      if (!mounted) return null;
      return image.path;
    }
    return null;
  }

  @override
  void dispose() {
    cameraController?.dispose();
    super.dispose();
  }
}
