import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  final String title;
  final IconData? icon;
  final VoidCallback? onTap;

  const MenuItem({
    super.key,
    required this.title,
    this.icon = Icons.menu,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(child: Icon(icon)),
      title: Text(title),
      trailing: const Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }
}
