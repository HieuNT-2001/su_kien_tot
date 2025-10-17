import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:su_kien_tot/widgets/empty_item.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  FavoritePageState createState() => FavoritePageState();
}

class FavoritePageState extends State<FavoritePage> {
  bool _isLoading = true;
  List<String> favorites = [];

  Future<void> _refreshData() async {
    setState(() => _isLoading = true);
    await Future.delayed(const Duration(seconds: 2)); // giả lập call API
    favorites = ['Yêu thích 1'];
    // bạn có thể thử: ["Yêu thích 1", "Yêu thích 2"]
    setState(() => _isLoading = false);
  }

  Widget _buildDataSection() {
    int length = _isLoading ? 4 : favorites.length;
    if (length == 0) return const EmptyItem(title: 'Chưa có yêu thích');

    return Skeletonizer(
      enabled: _isLoading,
      child: Column(
        children: List.generate(length, (index) {
          return Card(
            color: Colors.white,
            child: ListTile(
              leading: Image.asset('assets/images/user.png'),
              title: Text(
                'Yêu thích ${index + 1}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text('Mô tả yêu thích ${index + 1}'),
              trailing: const Icon(
                Icons.favorite_border_rounded,
                color: Colors.red,
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
    _refreshData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Yêu thích',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_rounded, size: 20),
          onPressed: () => context.pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(children: [_buildDataSection()]),
      ),
    );
  }
}
