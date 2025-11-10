import 'package:su_kien_tot/pages/verification/back_alert_dialog.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'dart:math' as math;

import 'package:su_kien_tot/utils/camera_utils.dart';

class IdCardCapture extends StatefulWidget {
  final String title;
  final VoidCallback onNext;

  const IdCardCapture({super.key, required this.title, required this.onNext});

  @override
  State<IdCardCapture> createState() => _FrontOfIdCardCaptureState();
}

class _FrontOfIdCardCaptureState extends State<IdCardCapture> with CameraUtils {
  Future<void> previewImage() async {
    final path = await takePicture();
    if (path == null) return;
    if (!mounted) return;
    context.push('/id-card-preview', extra: {'title': widget.title, 'imagePath': path, 'next': widget.onNext});
  }

  @override
  void initState() {
    super.initState();
    initCamera();
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
          title: Text(widget.title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
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
                  child: (isCameraInitialized && cameraController != null) ? CameraPreview(cameraController!) : null,
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
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            widget.title,
                            style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 8),
                          const Text(
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
