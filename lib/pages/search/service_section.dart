import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:su_kien_tot/widgets/service_item.dart';

class ServiceSection extends StatelessWidget {
  final String title;
  final List<ServiceItem> items;
  final bool isLoading;

  const ServiceSection({
    super.key,
    required this.title,
    required this.items,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: isLoading,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          GridView.count(
            crossAxisCount: 3,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: items.map((item) {
              return ServiceItem(
                icon: 'assets/images/vendor.png',
                title: item.title,
                onTap: () => context.push(
                  '/service-page',
                  extra: {'title': item.title, 'image': item.icon},
                ),
              );
            }).toList(),
          ),
          Divider(color: Colors.grey[300], thickness: 4),
        ],
      ),
    );
  }
}
