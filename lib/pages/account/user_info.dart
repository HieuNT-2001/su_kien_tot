import 'package:flutter/material.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Row(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundImage: AssetImage('assets/images/user.png'),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Nguyễn Trung Hiếu',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Row(
                  children: [
                    Icon(Icons.error, color: Colors.red, size: 16),
                    SizedBox(width: 4),
                    Text(
                      'Xác minh tài khoản',
                      style: TextStyle(color: Colors.red),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Icon(Icons.chevron_right, size: 36),
        ],
      ),
    );
  }
}
