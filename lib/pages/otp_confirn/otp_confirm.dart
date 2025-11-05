import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';

class OtpConfirm extends StatefulWidget {
  const OtpConfirm({super.key});

  @override
  OtpConfirmPageState createState() => OtpConfirmPageState();
}

class OtpConfirmPageState extends State<OtpConfirm> {
  bool _isResendOtpEnabled = false;
  final _otpController = TextEditingController();
  final _countDownController = CountDownController();

  @override
  void dispose() {
    super.dispose();
    _otpController.dispose();
  }

  void _onOtpCompleted(String otp) {
    context.go('/home-user');
  }

  void _resendOtp() {
    setState(() => _isResendOtpEnabled = false);
    _countDownController.restart(duration: 30);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trở lại', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        leading: IconButton(icon: const Icon(Icons.arrow_back_ios_rounded, size: 20), onPressed: () => context.pop()),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text('Nhập OTP', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
              const SizedBox(height: 8),
              const Text(
                'Nhập mã OTP được gửi về số điện thoại\ncủa bạn',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              Pinput(
                length: 6,
                controller: _otpController,
                obscuringWidget: const Icon(Icons.circle, size: 12),
                keyboardType: TextInputType.number,
                onCompleted: _onOtpCompleted,
                defaultPinTheme: PinTheme(
                  width: 48,
                  height: 48,
                  textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF5F6FA),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              CircularCountDownTimer(
                duration: 30,
                initialDuration: 0,
                controller: _countDownController,
                width: 60,
                height: 60,
                ringColor: Colors.blue,
                fillColor: Colors.grey[200]!,
                backgroundColor: Colors.white,
                strokeWidth: 6.0,
                strokeCap: StrokeCap.round,
                textFormat: CountdownTextFormat.MM_SS,
                textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                isReverse: true,
                onComplete: () => setState(() => _isResendOtpEnabled = true),
              ),
              const SizedBox(height: 24),
              const Text('Không nhận được OTP?', style: TextStyle(fontSize: 18)),
              TextButton(
                onPressed: _isResendOtpEnabled ? _resendOtp : null,
                child: const Text('Gửi lại mã', style: TextStyle(fontSize: 18)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
