import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:su_kien_tot/pages/verification/back_alert_dialog.dart';
import 'package:su_kien_tot/pages/verification/confirm_dialog.dart';

class FaceIdCapture extends StatefulWidget {
  const FaceIdCapture({super.key});

  @override
  FaceIdCaptureState createState() => FaceIdCaptureState();
}

class FaceIdCaptureState extends State<FaceIdCapture> {
  CameraController? _controller;
  List<CameraDescription>? cameras;
  bool isCameraInitialized = false;

  Future<void> initCamera() async {
    cameras = await availableCameras(); // Lấy danh sách camera
    if (cameras!.isNotEmpty) {
      _controller = CameraController(
        cameras![0], // Chọn camera sau (hoặc trước)
        ResolutionPreset.high,
        enableAudio: false,
      );
      await _controller!.initialize();
      if (!mounted) return;
      setState(() {
        isCameraInitialized = true;
      });
    }
  }

  Future<void> previewImage() async {
    if (_controller != null && _controller!.value.isInitialized) {
      final image = await _controller!.takePicture();
      if (!mounted) return;
      context.push(
        '/id-card-preview',
        extra: {
          'title': 'Xác thực khuôn mặt',
          'imagePath': image.path,
          'next': () => showDialog(context: context, builder: (context) => const ConfirmDialog()),
          'isConfirm': true,
        },
      );
    }
  }

  @override
  void initState() {
    super.initState();
    initCamera();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (!didPop) await showDialog(context: context, builder: (_) => const BackAlertDialog());
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Xác thực khuôn mặt', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_rounded, size: 20),
            onPressed: () => showDialog(context: context, builder: (context) => const BackAlertDialog()),
          ),
        ),
        body: Container(
          color: Colors.grey,
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  'Lưu ý: Đây là hình làm việc của bạn mà khách hàng nhìn thấy, vui lòng mặc áo lịch sự.',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 80),
              Container(
                margin: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  shape: BoxShape.circle,
                ),
                child: Container(
                  margin: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.red),
                    shape: BoxShape.circle,
                  ),
                  child: ClipOval(
                    child: SizedBox(
                      width: 350, // kích thước vòng tròn
                      height: 350,
                      child: isCameraInitialized && _controller != null
                          ? CameraPreview(_controller!)
                          : Container(color: Colors.black),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 80),
              Container(
                alignment: AlignmentGeometry.center,
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                child: IconButton(icon: const Icon(Icons.camera_alt, size: 28), onPressed: previewImage),
              ),
              const Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  'Vui lòng đưa khuôn mặt vào vòng tròn nhấn chụp',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
