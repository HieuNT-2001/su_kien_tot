import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:su_kien_tot/pages/transaction_history/date_range_select.dart';

class SelectDate extends StatefulWidget {
  final int? selectedIndex;
  final DateTime? fromDate;
  final DateTime? toDate;

  const SelectDate({super.key, this.selectedIndex, this.fromDate, this.toDate});

  @override
  SelectDateState createState() => SelectDateState();
}

class SelectDateState extends State<SelectDate> {
  late int selectedIndex = widget.selectedIndex ?? 0;
  late DateTime fromDate = widget.fromDate ?? DateTime(2000);
  late DateTime toDate = widget.toDate ?? DateTime.now();

  Widget _buildSelectDateButton(String label, int index) {
    bool isSelected = selectedIndex == index;

    return ElevatedButton(
      onPressed: () => setState(() => selectedIndex = index),
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.black,
        backgroundColor: isSelected
            ? const Color(0xFFF28F8F)
            : Colors.grey[200],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        padding: const EdgeInsets.symmetric(horizontal: 12),
      ),
      child: Text(label),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 800,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const SizedBox(width: 16),
              const Icon(Icons.calendar_month_outlined),
              const SizedBox(width: 8),
              const Text('Chọn thời gian'),
              const Spacer(),
              IconButton(
                icon: const Icon(Icons.close_rounded, size: 28),
                onPressed: () => context.pop(),
              ),
            ],
          ),
          const Divider(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Thời gian',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 12,
                    runSpacing: 8,
                    children: [
                      _buildSelectDateButton('Tất cả', 0),
                      _buildSelectDateButton('1 tháng', 1),
                      _buildSelectDateButton('3 tháng', 2),
                      _buildSelectDateButton('6 tháng', 3),
                      _buildSelectDateButton('Chọn thời gian cụ thể', 4),
                    ],
                  ),
                  const SizedBox(height: 8),
                  if (selectedIndex == 4) ...[
                    DateRangeSelect(
                      selectFromDate: (value) => fromDate = value,
                      selectToDate: (value) => toDate = value,
                    ),
                  ],
                  const Spacer(),
                  ElevatedButton(
                    onPressed: () => context.pop({
                      'selectedIndex': selectedIndex,
                      'fromDate': fromDate,
                      'toDate': toDate,
                    }),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: const Color(0xFFF28F8F),
                      minimumSize: const Size(double.infinity, 50),
                      disabledBackgroundColor: Colors.grey,
                    ),
                    child: const Text(
                      'Xác nhận',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
