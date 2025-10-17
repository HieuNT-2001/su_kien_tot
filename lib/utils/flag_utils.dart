extension FlagUtils on String {
  String get toFlagEmoji {
    // Chuyển mã quốc gia 2 chữ cái (ví dụ: 'US', 'VN') thành biểu tượng emoji cờ
    return toUpperCase().replaceAllMapped(
      RegExp(r'[A-Z]'),
      (match) => String.fromCharCode(match.group(0)!.codeUnitAt(0) + 127397),
    );
  }
}
