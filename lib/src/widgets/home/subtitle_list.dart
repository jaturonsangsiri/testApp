import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firstapp/src/models/log.dart';
import 'package:firstapp/src/widgets/utils/responsive.dart';

class SubtitleList extends StatelessWidget {
  const SubtitleList({super.key, required this.deviceInfo});
  final DeviceInfo? deviceInfo;

  @override
  Widget build(BuildContext context) {
    IconData batteryIcon() {
      if (deviceInfo!.log!.isEmpty) {
        return FontAwesomeIcons.batteryEmpty;
      } else if (deviceInfo!.log!.first.battery! > 80) {
        return FontAwesomeIcons.batteryFull;
      } else if (deviceInfo!.log!.first.battery! > 50) {
        return FontAwesomeIcons.batteryThreeQuarters;
      } else if (deviceInfo!.log!.first.battery! > 20) {
        return FontAwesomeIcons.batteryHalf;
      } else {
        return FontAwesomeIcons.batteryQuarter;
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(deviceInfo!.serial ?? "-", style: TextStyle(fontWeight: FontWeight.w500, fontSize: Responsive.isTablet ? 18 : 12)),
        Text(
          deviceInfo!.position ?? "-",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: Responsive.isTablet ? 18 : 12,
          ),
        ),
        const SizedBox(height: 4),
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            FaIcon(FontAwesomeIcons.temperatureHigh, size: Responsive.isTablet ? 22 : 16),
            const SizedBox(width: 2),
            Text(
              deviceInfo!.notification!.where((i) => i.message!.substring(0, 4) == "TEMP").toList().length.toString(),
              style: TextStyle(fontSize: Responsive.isTablet ? 20 : 14),
            ),
            const SizedBox(width: 5),
            FaIcon(FontAwesomeIcons.doorOpen, size: Responsive.isTablet ? 22 : 16),
            const SizedBox(width: 2),
            Text(
              deviceInfo!.notification!
                  .where((i) => i.message!.substring(0, 5) == "PROBE" && i.message!.substring(13, 15) == "ON")
                  .toList()
                  .length
                  .toString(),
              style: TextStyle(fontSize: Responsive.isTablet ? 20 : 14),
            ),
            const SizedBox(width: 5),
            FaIcon(FontAwesomeIcons.plug, size: Responsive.isTablet ? 22 : 16),
            const SizedBox(width: 2),
            Text(
              deviceInfo!.notification!.where((i) => i.message!.substring(0, 2) == "AC").toList().length.toString(),
              style: TextStyle(fontSize: Responsive.isTablet ? 20 : 14),
            ),
            const SizedBox(width: 5),
            FaIcon(FontAwesomeIcons.sdCard, size: Responsive.isTablet ? 22 : 16),
            const SizedBox(width: 2),
            Text(
              deviceInfo!.notification!.where((i) => i.message!.substring(0, 2) == "SD").toList().length.toString(),
              style: TextStyle(fontSize: Responsive.isTablet ? 20 : 14),
            ),
            const SizedBox(width: 5),
            FaIcon(batteryIcon(), size: Responsive.isTablet ? 22 : 16),
            const SizedBox(width: 2),
            Text(
              deviceInfo!.log!.isEmpty ? "0" : "${deviceInfo!.log![0].battery}",
              style: TextStyle(fontSize: Responsive.isTablet ? 20 : 14),
            ),
            const SizedBox(width: 7),
            Stack(
              alignment: Alignment.center,
              children: [
                DecoratedBox(
                  decoration: BoxDecoration(
                    color: deviceInfo!.online! ? Colors.green : Colors.red,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const SizedBox(width: 45, height: 18),
                ),
                Text(
                  deviceInfo!.online! ? "online" : "offline",
                  style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}