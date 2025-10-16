import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:su_kien_tot/pages/search/service_section.dart';
import 'package:su_kien_tot/widgets/service_item.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  bool _isLoading = true;
  final TextEditingController _searchController = TextEditingController();

  // Dữ liệu gốc
  final Map<String, List<ServiceItem>> _allData = {
    'Chú hề': [
      const ServiceItem(
        icon: 'assets/images/vendor.png',
        title: 'Chú hề đa năng 2',
      ),
      const ServiceItem(
        icon: 'assets/images/vendor.png',
        title: 'Chú hề hoạt náo',
      ),
      const ServiceItem(
        icon: 'assets/images/vendor.png',
        title: 'Chú hề vặn bóng',
      ),
      const ServiceItem(
        icon: 'assets/images/vendor.png',
        title: 'Chú hề siêu diễn 2',
      ),
    ],
    'Mascot': [
      const ServiceItem(icon: 'assets/images/vendor.png', title: 'Doraemon'),
    ],
    'MC': [
      const ServiceItem(icon: 'assets/images/vendor.png', title: 'MC đám cưới'),
    ],
    'Nghệ nhân truyền thống': [
      const ServiceItem(
        icon: 'assets/images/vendor.png',
        title: 'Ông đồ thư pháp',
      ),
    ],
    'PG': [
      const ServiceItem(icon: 'assets/images/vendor.png', title: 'Tone Màu'),
    ],
    'Photographer': [
      const ServiceItem(icon: 'assets/images/vendor.png', title: 'Quay Chụp'),
    ],
    'Quay chụp': [
      const ServiceItem(icon: 'assets/images/vendor.png', title: 'Chụp'),
      const ServiceItem(icon: 'assets/images/vendor.png', title: 'Quay'),
    ],
    'Trình diễn dân gian': [
      const ServiceItem(icon: 'assets/images/vendor.png', title: 'Múa Lân'),
    ],
    'Trình diễn sân khấu': [
      const ServiceItem(icon: 'assets/images/vendor.png', title: 'Robot LED'),
    ],
  };

  // Dữ liệu hiển thị
  late Map<String, List<ServiceItem>> _filteredData;

  @override
  void initState() {
    super.initState();
    _filteredData = Map.from(_allData);
    _refreshData();

    // Lắng nghe thay đổi của SearchBar
    _searchController.addListener(() {
      _onSearchChanged(_searchController.text);
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  // Mô phỏng call API
  Future<void> _refreshData() async {
    setState(() => _isLoading = true);
    await Future.delayed(const Duration(seconds: 2));
    setState(() => _isLoading = false);
  }

  // Khi người dùng nhập tìm kiếm
  void _onSearchChanged(String keyword) async {
    _refreshData();
    // Thay the bang api khi co api tim kiem
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _refreshData,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Tìm kiếm dịch vụ',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          leading: IconButton(
            icon: const Icon(Icons.keyboard_arrow_down_rounded, size: 32),
            onPressed: () => context.go('/home-user'),
          ),
        ),
        body: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchBar(
                controller: _searchController,
                hintText: 'Tìm kiếm dịch vụ',
                leading: const Icon(Icons.search),
                elevation: const WidgetStatePropertyAll(0),
                backgroundColor: WidgetStatePropertyAll(Colors.grey[200]),
              ),
              const SizedBox(height: 24),
              ..._filteredData.entries.map(
                (item) => ServiceSection(
                  isLoading: _isLoading,
                  title: item.key,
                  items: item.value,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
