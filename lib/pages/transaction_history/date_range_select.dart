import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateRangeSelect extends StatefulWidget {
  final ValueChanged<DateTime> selectFromDate;
  final ValueChanged<DateTime> selectToDate;

  const DateRangeSelect({
    super.key,
    required this.selectFromDate,
    required this.selectToDate,
  });

  @override
  DateRangeSelectState createState() => DateRangeSelectState();
}

class DateRangeSelectState extends State<DateRangeSelect> {
  DateTime fromDate = DateTime.now();
  DateTime toDate = DateTime.now();
  bool _isSelectingFrom = true;
  DateTime pickerDate = DateTime.now();
  final DateFormat dateFormat = DateFormat('dd/MM/yyyy');

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: _isSelectingFrom
                      ? const Color(0xFFF28F8F)
                      : Colors.grey[200],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () => setState(() {
                  _isSelectingFrom = true;
                  pickerDate = fromDate;
                }),
                child: Text(dateFormat.format(fromDate)),
              ),
            ),
            const SizedBox(width: 8),
            const Text('Đến'),
            const SizedBox(width: 8),
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: !_isSelectingFrom
                      ? const Color(0xFFF28F8F)
                      : Colors.grey[200],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () => setState(() {
                  _isSelectingFrom = false;
                  pickerDate = toDate;
                }),
                child: Text(dateFormat.format(toDate)),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        RichText(
          text: const TextSpan(
            text: 'Chọn khoảng thời gian trong vòng 12 tháng',
            style: TextStyle(color: Colors.black, fontSize: 16),
            children: <TextSpan>[
              TextSpan(
                text: '*',
                style: TextStyle(color: Colors.red),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 200,
          child: CupertinoDatePicker(
            mode: CupertinoDatePickerMode.date,
            initialDateTime: pickerDate,
            minimumYear: 1990,
            maximumYear: DateTime.now().year,
            onDateTimeChanged: (DateTime newDate) => setState(() {
              pickerDate = newDate;
              if (_isSelectingFrom) {
                fromDate = newDate;
                widget.selectFromDate(fromDate);
              } else {
                toDate = newDate;
                widget.selectToDate(toDate);
              }
            }),
          ),
        ),
      ],
    );
  }
}
