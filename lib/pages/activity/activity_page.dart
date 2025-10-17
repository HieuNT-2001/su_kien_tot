import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:su_kien_tot/models/tab_item.dart';
import 'package:su_kien_tot/widgets/custom_tab_bar.dart';
import 'package:su_kien_tot/widgets/empty_item.dart';

class ActivityPage extends StatefulWidget {
  const ActivityPage({super.key});

  @override
  State<ActivityPage> createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {
  bool _isLoading = true;
  List<String> _activities = [];

  @override
  void initState() {
    super.initState();
    _refreshData();
  }

  Future<void> _refreshData() async {
    setState(() => _isLoading = true);
    await Future.delayed(const Duration(seconds: 2)); // giả lập call API
    _activities = ['hoạt động 1'];
    // bạn có thể thử: ["Hoạt động 1", "Hoạt động 2"]
    setState(() => _isLoading = false);
  }

  Future<void> _emptyData() async {
    setState(() => _isLoading = true);
    await Future.delayed(const Duration(seconds: 2)); // giả lập call API
    _activities = [];

    setState(() => _isLoading = false);
  }

  Widget _buildDataSection() {
    int length = _isLoading ? 4 : _activities.length;
    if (length == 0) return const EmptyItem(title: 'Chưa có hoạt động');

    return Skeletonizer(
      enabled: _isLoading,
      child: Column(
        children: List.generate(length, (index) {
          return Card(
            color: Colors.white,
            child: ListTile(
              title: Text(
                'Hoạt động ${index + 1}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Mô tả hoạt động ${index + 1}'),
                  const SizedBox(height: 4),
                  const Text('10/10/2025'),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _refreshData,
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Hoạt động',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                CustomTabBar(
                  tabs: [
                    TabItem(title: 'Tất cả', onTap: _refreshData),
                    TabItem(title: 'Đang tìm', onTap: _emptyData),
                    TabItem(title: 'Đang tiến hành', onTap: _refreshData),
                    TabItem(title: 'Đặt lại', onTap: _refreshData),
                  ],
                ),
                const SizedBox(height: 16),
                _buildDataSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
