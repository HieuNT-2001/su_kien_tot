import 'package:su_kien_tot/pages/verification/back_alert_dialog.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'dart:math' as math;

class FrontIdCardCapture extends StatefulWidget {
  const FrontIdCardCapture({super.key});

  @override
  State<FrontIdCardCapture> createState() => _FrontOfIdCardCaptureState();
}

class _FrontOfIdCardCaptureState extends State<FrontIdCardCapture> {
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
          'title': 'Chụp mặt trước của giấy tờ',
          'imagePath': image.path,
          'next': () => context.push('/back-id-card-capture'),
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
          title: const Text('Chụp mặt trước của giấy tờ', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_rounded, size: 20),
            onPressed: () => showDialog(context: context, builder: (context) => const BackAlertDialog()),
          ),
        ),
        body: Column(
          children: [
            Stack(
              children: [
                Container(
                  color: Colors.black,
                  width: double.infinity,
                  height: 640,
                  child: (isCameraInitialized && _controller != null) ? CameraPreview(_controller!) : null,
                ),
                Positioned.fill(
                  child: Padding(
                    padding: const EdgeInsets.all(32),
                    child: AspectRatio(
                      aspectRatio: 5 / 8,
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Center(
                    child: Transform.rotate(
                      angle: math.pi / 2, // xoay 90° ngược chiều kim đồng hồ
                      child: const Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Chụp mặt trước của giấy tờ',
                            style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Đặt tài liệu của bạn vào trong khung và nhấn chụp',
                            style: TextStyle(color: Colors.white70),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
            const Text('Xoay ngang để chụp', style: TextStyle(color: Colors.black)),
            const SizedBox(height: 8),
            Container(
              alignment: AlignmentGeometry.center,
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
              child: IconButton(icon: const Icon(Icons.camera_alt, size: 28), onPressed: previewImage),
            ),
          ],
        ),
      ),
    );
  }
}
