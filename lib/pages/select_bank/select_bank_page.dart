import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:su_kien_tot/models/bank.dart';
import 'package:http/http.dart' as http;
import 'package:su_kien_tot/providers/app_state.dart';

class SelectBankPage extends StatefulWidget {
  const SelectBankPage({super.key});

  @override
  State<SelectBankPage> createState() => _SelectBankPageState();
}

class _SelectBankPageState extends State<SelectBankPage> {
  final _searchController = TextEditingController();
  late Future<List<Bank>> _futureBanks;
  List<Bank> _allBanks = [];
  List<Bank> _filteredBanks = [];

  Future<List<Bank>> fetchBanks() async {
    final url = Uri.parse('https://api.vietqr.io/v2/banks');
    final res = await http.get(url);

    if (res.statusCode != 200) {
      throw Exception('Không thể tải danh sách ngân hàng');
    }

    final jsonData = jsonDecode(res.body);
    final List list = jsonData['data'];

    return list.map((e) => Bank.fromJson(e)).toList();
  }

  void _onSearchChanged() {
    final query = _searchController.text.toLowerCase().trim();

    setState(() {
      _filteredBanks = _allBanks.where((bank) {
        return bank.name.toLowerCase().contains(query) || bank.shortName.toLowerCase().contains(query);
      }).toList();
    });
  }

  @override
  void initState() {
    super.initState();
    _futureBanks = fetchBanks();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String selectedBank = context.read<AppState>().selectedBank;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Chọn ngân hàng', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        leading: IconButton(icon: const Icon(Icons.arrow_back_ios_rounded, size: 20), onPressed: () => context.pop()),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            SearchBar(
              controller: _searchController,
              hintText: 'Tìm kiếm',
              leading: const Icon(Icons.search),
              elevation: const WidgetStatePropertyAll(0),
              backgroundColor: WidgetStatePropertyAll(Colors.grey[200]),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: FutureBuilder<List<Bank>>(
                future: _futureBanks,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (snapshot.hasError) {
                    return Center(child: Text('Lỗi: ${snapshot.error}'));
                  }

                  if (_allBanks.isEmpty) {
                    _allBanks = snapshot.data!;
                    _filteredBanks = _allBanks;
                  }

                  return ListView.separated(
                    separatorBuilder: (context, index) => const SizedBox(height: 12),
                    itemCount: _filteredBanks.length,
                    itemBuilder: (context, index) {
                      final bank = _filteredBanks[index];
                      return ListTile(
                        onTap: () {
                          context.read<AppState>().setSelectedBank(bank.shortName);
                          context.pop();
                        },
                        contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.circular(16),
                          side: const BorderSide(color: Colors.grey),
                        ),
                        leading: Image.network(
                          bank.logo,
                          width: 40,
                          height: 40,
                          errorBuilder: (a, b, c) => const Icon(Icons.account_balance, size: 40),
                        ),
                        title: Text(bank.shortName),
                        subtitle: Text(bank.name),
                        trailing: selectedBank == bank.shortName ? const Icon(Icons.radio_button_checked) : null,
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
