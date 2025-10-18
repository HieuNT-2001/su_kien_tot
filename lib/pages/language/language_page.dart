import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:su_kien_tot/models/language_option.dart';
import 'package:su_kien_tot/providers/app_state.dart';
import 'package:su_kien_tot/utils/flag_utils.dart';

class LanguagePage extends StatefulWidget {
  const LanguagePage({super.key});

  @override
  LanguagePageState createState() => LanguagePageState();
}

class LanguagePageState extends State<LanguagePage> {
  final List<LanguageOption> allLanguages = [
    LanguageOption('English', 'GB'),
    LanguageOption('Tiếng Việt', 'VN'),
    LanguageOption('français', 'FR'),
    LanguageOption('Filipino', 'PH'),
    LanguageOption('Русский', 'RU'),
    LanguageOption('简体中文', 'CN'),
    LanguageOption('繁体中文', 'TW'),
    LanguageOption('日本語', 'JP'),
    LanguageOption('한국인', 'KR'),
  ];

  List<LanguageOption> filteredLanguages = [];
  final TextEditingController _searchController = TextEditingController();
  String _searchText = '';

  @override
  void initState() {
    super.initState();
    filteredLanguages = allLanguages;
    _searchController.addListener(_filterLanguages);
  }

  @override
  void dispose() {
    _searchController.removeListener(_filterLanguages);
    _searchController.dispose();
    super.dispose();
  }

  void _filterLanguages() {
    final query = _searchController.text.toLowerCase();

    setState(() {
      _searchText = query;
      if (_searchText.isEmpty) {
        filteredLanguages = allLanguages;
      } else {
        filteredLanguages = allLanguages.where((languageOption) {
          final languageName = languageOption.language.toLowerCase();
          return languageName.contains(_searchText);
        }).toList();
      }
    });
  }

  Widget _buildLanguageSection(String language, String countryCode) {
    bool isSelected = context.watch<AppState>().languague == language;

    return GestureDetector(
      onTap: () => context.read<AppState>().setLanguage(language),
      child: ListTile(
        leading: Text(
          countryCode.toFlagEmoji,
          style: const TextStyle(fontSize: 20),
        ),
        title: Text(
          language,
          style: TextStyle(
            color: isSelected ? const Color(0xFFF28F8F) : Colors.black,
            fontWeight: isSelected ? FontWeight.bold : null,
          ),
        ),
        trailing: isSelected
            ? const Icon(Icons.check, size: 16, color: Color(0xFFF28F8F))
            : null,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Ngôn ngữ',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.keyboard_arrow_down_rounded, size: 32),
          onPressed: () => context.pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            SearchBar(
              controller: _searchController,
              hintText: 'Tìm kiếm',
              leading: const Icon(Icons.search),
              elevation: const WidgetStatePropertyAll(0),
              backgroundColor: WidgetStatePropertyAll(Colors.grey[200]),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: filteredLanguages.length,
                itemBuilder: (context, index) {
                  final option = filteredLanguages[index];
                  return _buildLanguageSection(
                    option.language,
                    option.countryCode,
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
