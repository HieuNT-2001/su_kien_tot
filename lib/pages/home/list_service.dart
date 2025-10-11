import 'package:flutter/material.dart';
import 'package:su_kien_tot/pages/home/bottom_model.dart';
import 'package:su_kien_tot/widgets/service_item.dart';

class ListService extends StatelessWidget {
  const ListService({super.key});

  void _showPopupModel(BuildContext context) {
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(),
      context: context,
      builder: (context) => const PopupModel(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 240,
      child: Scrollbar(
        child: GridView.count(
          scrollDirection: Axis.horizontal,
          crossAxisCount: 2,
          children: <Widget>[
            ServiceItem(
              icon: 'assets/images/vendor.png',
              title: 'Chú hề',
              subtitle: '5 dịch vụ',
              onTap: () => _showPopupModel(context),
            ),
            ServiceItem(
              icon: 'assets/images/vendor.png',
              title: 'Mascot',
              subtitle: '3 dịch vụ',
              onTap: () => _showPopupModel(context),
            ),
            ServiceItem(
              icon: 'assets/images/vendor.png',
              title: 'MC',
              subtitle: '3 dịch vụ',
              onTap: () => _showPopupModel(context),
            ),
            ServiceItem(
              icon: 'assets/images/vendor.png',
              title: 'Nghệ nhân truyền thống',
              subtitle: '4 dịch vụ',
              onTap: () => _showPopupModel(context),
            ),
            ServiceItem(
              icon: 'assets/images/vendor.png',
              title: 'PG',
              subtitle: '6 dịch vụ',
              onTap: () => _showPopupModel(context),
            ),
            ServiceItem(
              icon: 'assets/images/vendor.png',
              title: 'Photographer',
              subtitle: '5 dịch vụ',
              onTap: () => _showPopupModel(context),
            ),
            ServiceItem(
              icon: 'assets/images/vendor.png',
              title: 'Quay chụp',
              subtitle: '6 dịch vụ',
              onTap: () => _showPopupModel(context),
            ),
            ServiceItem(
              icon: 'assets/images/vendor.png',
              title: 'Trình diễn dân gian',
              subtitle: '0 dịch vụ',
              onTap: () => _showPopupModel(context),
            ),
            ServiceItem(
              icon: 'assets/images/vendor.png',
              title: 'Trình diễn sân khấu',
              subtitle: '2 dịch vụ',
              onTap: () => _showPopupModel(context),
            ),
          ],
        ),
      ),
    );
  }
}
