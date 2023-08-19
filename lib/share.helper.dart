import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

class ShareHelper {
  static string(String text) async {
    final bool isTablet = Get.context!.isTablet;
    final Size size = Get.mediaQuery.size;
    final bool isIOS = GetPlatform.isIOS;

    // check if ios and is table to fix issue that
    // happened in share dialog on ios tablet
    final Rect? sharePositionOrigin = isTablet && isIOS
        ? Rect.fromLTWH(0, 0, size.width, size.height / 2)
        : null;

    await Share.share(
      text,
      sharePositionOrigin: sharePositionOrigin,
    );
  }

  static shareFile(
    BuildContext context,
    List<XFile> files, {
    String? subject,
    String? text,
  }) async {
    final bool isTablet = context.isTablet;
    final Size size = Get.mediaQuery.size;
    final bool isIOS = GetPlatform.isIOS || GetPlatform.isMacOS;

    // share file
    await Share.shareXFiles(
      files,
      subject: subject,
      text: text,
      sharePositionOrigin: isTablet && isIOS
          ? Rect.fromLTWH(0, 0, size.width, size.height / 2)
          : null,
    );
  }
}
