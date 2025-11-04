import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:su_kien_tot/pages/profession/profession_header.dart';
import 'package:su_kien_tot/widgets/empty_item.dart';

class ProfessionPage extends StatefulWidget {
  const ProfessionPage({super.key});

  @override
  ProfessionPageState createState() => ProfessionPageState();
}

class ProfessionPageState extends State<ProfessionPage> {
  bool _isLoading = true;
  List<String> _professions = [];

  @override
  void initState() {
    super.initState();
    _refreshData();
  }

  Future<void> _refreshData() async {
    setState(() => _isLoading = true);
    await Future.delayed(const Duration(seconds: 2)); // giả lập call API
    _professions = [];
    // bạn có thể thử: ["nghiệp vụ 1", "nghiệp vụ 2"]
    setState(() => _isLoading = false);
  }

  Widget _buildDataSection() {
    int length = _isLoading ? 4 : _professions.length;
    if (length == 0) return const EmptyItem(title: 'Chưa có nghiệp vụ');

    return Skeletonizer(
      enabled: _isLoading,
      child: Column(
        children: List.generate(length, (index) {
          return Card(
            color: Colors.white,
            child: ListTile(
              title: Text(
                'Nghiệp vụ ${index + 1}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [Text('Mô tả Nghiệp vụ ${index + 1}')],
              ),
            ),
          );
        }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Nghiệp vụ',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_rounded, size: 20),
          onPressed: () => context.pop(),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: _refreshData,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Skeletonizer(
                enabled: _isLoading,
                child: const ProfessionHeader(),
              ),
              const SizedBox(height: 16),
              const Text(
                'Nghiệp vụ của bạn',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              _buildDataSection(),
            ],
          ),
        ),
      ),
    );
  }
}
