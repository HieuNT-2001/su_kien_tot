import 'dart:typed_data';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_gallery_saver_plus/image_gallery_saver_plus.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:share_plus/share_plus.dart';

class ShareModel extends StatefulWidget {
  const ShareModel({super.key});

  @override
  State<ShareModel> createState() => _ShareModelState();
}

class _ShareModelState extends State<ShareModel> {
  final GlobalKey qrKey = GlobalKey();

  Future<void> share(BuildContext context) async {
    final url = 'https://sukientot.taiyo.space/';
    final message = 'Hãy tải ứng dụng Sự Kiện Tốt và nhập mã giới thiệu 89533 để nhận thưởng!\n$url';
    final box = context.findRenderObject() as RenderBox?;
    await SharePlus.instance.share(
      ShareParams(
        text: message,
        subject: 'Giới thiệu bạn bè cùng tham gia!',
        sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size,
      ),
    );
  }

  Future<void> _saveQrToGallery(GlobalKey key) async {
    final messenger = ScaffoldMessenger.of(context);
    await Future.delayed(const Duration(milliseconds: 100));
    try {
      RenderRepaintBoundary boundary = key.currentContext!.findRenderObject() as RenderRepaintBoundary;
      var image = await boundary.toImage(pixelRatio: 3.0);
      ByteData? byteData = await image.toByteData(format: ImageByteFormat.png);
      Uint8List pngBytes = byteData!.buffer.asUint8List();

      final result = await ImageGallerySaverPlus.saveImage(
        pngBytes,
        quality: 100,
        name: 'qr_code_${DateTime.now().millisecondsSinceEpoch}',
      );

      if (result['isSuccess'] == true) {
        messenger.showSnackBar(const SnackBar(content: Text('Đã lưu ảnh vào thư viện!')));
      } else {
        messenger.showSnackBar(const SnackBar(content: Text('Không thể lưu ảnh!')));
      }
    } catch (e) {
      messenger.showSnackBar(SnackBar(content: Text('Lỗi khi lưu ảnh: $e')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            RepaintBoundary(
              key: qrKey,
              child: QrImageView(
                data: 'https://sukientot.taiyo.space/',
                version: QrVersions.auto,
                size: 200.0,
                backgroundColor: Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            const Text('NGUYỄN VĂN A', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Mã giới thiệu: '),
                Text('89533', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 16),
            const Align(
              alignment: AlignmentGeometry.centerLeft,
              child: Text('Các bước thực hiện', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 8),
            const Text('Bạn bè cần trở thành thành viên và thực hiện đầy đủ các bước để bạn có thể nhận thưởng.'),
            const SizedBox(height: 8),
            const Row(
              children: [
                CircleAvatar(
                  radius: 15,
                  child: Text('1', style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                SizedBox(width: 8),
                Expanded(child: Text('Quét mã QR hoặc chia sẻ liên kết bên dưới để mời bạn bè tải app Sự Kiện Tốt.')),
              ],
            ),
            const SizedBox(height: 8),
            const Row(
              children: [
                CircleAvatar(
                  radius: 15,
                  child: Text('2', style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                SizedBox(width: 8),
                Expanded(child: Text('Nhập mã giới thiệu.')),
              ],
            ),
            const SizedBox(height: 8),
            const Row(
              children: [
                CircleAvatar(
                  radius: 15,
                  child: Text('3', style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                SizedBox(width: 8),
                Expanded(child: Text('Tổng số tiền thanh toán từ 400k.')),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => share(context),
                    child: const Text('Chia sẻ', style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ),
                const SizedBox(width: 16),
                InkWell(
                  onTap: () => _saveQrToGallery(qrKey),
                  child: const CircleAvatar(child: Icon(Icons.download_rounded)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
