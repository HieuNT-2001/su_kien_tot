import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:su_kien_tot/widgets/empty_item.dart';

class InvitedFriends extends StatefulWidget {
  const InvitedFriends({super.key});

  @override
  InvitedFriendsState createState() => InvitedFriendsState();
}

class InvitedFriendsState extends State<InvitedFriends> {
  bool _isLoading = true;
  List<String> _invitedFriends = [];

  Future<void> refreshData() async {
    setState(() => _isLoading = true);
    await Future.delayed(const Duration(seconds: 2)); // giả lập call API
    _invitedFriends = ['Bạn bè 1'];
    // bạn có thể thử: ["Bạn bè 1", "Bạn bè 2"]
    setState(() => _isLoading = false);
  }

  Widget _buildDataSection() {
    int length = _isLoading ? 4 : _invitedFriends.length;
    if (length == 0) return const EmptyItem(title: 'Chưa có bạn bè nào được mời');

    return Skeletonizer(
      enabled: _isLoading,
      child: Column(
        children: List.generate(length, (index) {
          return Card(
            color: Colors.white,
            child: ListTile(
              title: Text('Bạn bè ${index + 1}', style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [Text('thông tin bạn bè ${index + 1}'), const SizedBox(height: 4), const Text('10/10/2025')],
              ),
            ),
          );
        }),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    refreshData();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          Row(
            children: [
              const Text('Đã giới thiệu: (0 bạn)', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
                height: 40,
                child: PopupMenuButton<String>(
                  onSelected: (value) => refreshData(),
                  child: const Row(
                    children: [
                      Text(
                        'Bộ lọc',
                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
                      ),
                      Icon(Icons.filter_alt_outlined, color: Colors.blue),
                    ],
                  ),
                  itemBuilder: (context) => [
                    const PopupMenuItem(value: 'all', child: Text('Tất cả (0)')),
                    const PopupMenuItem(value: 'done', child: Text('Đã hoàn thành (0)')),
                    const PopupMenuItem(value: 'pending', child: Text('Chưa hoàn thành (0)')),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          TabBar(
            onTap: (value) => refreshData(),
            tabs: const [
              Tab(text: 'Người làm sự kiện (0)'),
              Tab(text: 'Khách hàng (0)'),
            ],
            dividerHeight: 0,
            indicatorSize: TabBarIndicatorSize.tab,
            indicator: BoxDecoration(color: const Color(0xFFF28F8F), borderRadius: BorderRadius.circular(10)),
            labelStyle: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            unselectedLabelStyle: const TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 8),
          _buildDataSection(),
        ],
      ),
    );
  }
}
