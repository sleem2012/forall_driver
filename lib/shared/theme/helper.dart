import 'package:flutter/material.dart';
import 'package:forall_driver/packages/multi_select_dialog/multi_helper.dart';
import 'package:forall_driver/shared/localization/trans.dart';
import 'package:forall_driver/shared/theme/colors.dart';
import 'package:forall_driver/shared/theme/text_theme.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';

import '../../logic/nav_enforcer/nav_enforcer_bloc.dart';
import '../../packages/shared/picker/data/country_search_model/address_result.dart';
import '../../packages/shared/picker/view/map.dart';

String get dummyNetImg => 'https://forall.sa/uploads/chat/files/2559b3404a907a7c5ff4215e75816b470e57b77d.jpg';

String get dummyNetLogo => 'https://forall.sa/assets/image/no-image.jpg';

abstract class KHelper {
  static _KHelperGetters of(BuildContext context) {
    return _KHelperGetters.of(context);
  }

  /// Icons Data =================*
  static const IconData activity = Icons.show_chart_outlined;
  static const IconData dashBoard = Icons.dashboard;
  static const IconData list = Icons.list_outlined;
  static const IconData store = Icons.storefront_outlined;
  static const IconData add = Icons.add_outlined;
  static const IconData person = Icons.person_outlined;
  static const IconData check = Icons.check_circle_outlined;
  static const IconData cancel = Icons.cancel_outlined;
  static const IconData delete = Icons.delete_forever_rounded;
  static const IconData chats = Icons.chat_outlined;
  static const IconData moreHoriz = Icons.more_horiz_outlined;
  static const IconData notifications = Icons.notifications_none_outlined;
  static const IconData expand = Icons.keyboard_arrow_down_outlined;
  static const IconData jobs = Icons.add_business_outlined;
  static const IconData expandSided = Icons.keyboard_arrow_right_outlined;
  static const IconData phone = Icons.phone_android_outlined;
  static const IconData email = Icons.email_outlined;
  static const IconData location = Icons.location_pin;
  static const IconData branches = Icons.map_outlined;
  static const IconData payment = Icons.payment_outlined;
  static const IconData subscription = Icons.payments_outlined;
  static const IconData lang = Icons.language_outlined;
  static const IconData passworrd = Icons.key_outlined;
  static const IconData report = Icons.report_outlined;
  static const IconData theme = Icons.dark_mode_outlined;
  static const IconData terms = Icons.file_copy_outlined;
  static const IconData privacyPolicy = Icons.privacy_tip_outlined;
  static const IconData contract = Icons.file_copy_outlined;
  static const IconData help = Icons.help_outline;
  static const IconData visibility = Icons.visibility_outlined;
  static const IconData visibilityOff = Icons.visibility_off_outlined;
  static const IconData logout = Icons.exit_to_app_outlined;
  static const IconData home = Icons.home_outlined;
  static const IconData money = Icons.attach_money_outlined;
  static const IconData chat = Icons.message_outlined;
  static const IconData share = Icons.share_outlined;
  static const IconData search = Icons.search;
  static const IconData social = Icons.social_distance;

  /// Constants =================*
  static const double cornerRadius = 8.0;
  static const double hPadding = 12.0;
  static const double hScaffoldPadding = 30.0;
  static const double iconSize = 18.0;
  static const double iconSize2 = 15.0;

  static double get height {
    return MediaQuery.of(Nav.navigator.currentContext!).size.height;
  }

  static double get width {
    return MediaQuery.of(Nav.navigator.currentContext!).size.width;
  }

  static Future<T?> showCustomDialog<T>({required Widget child, EdgeInsets? padding}) {
    return showDialog<T>(
      context: Nav.navigator.currentContext!,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: padding ?? EdgeInsets.zero,
          child: child,
        );
      },
    );
  }
  static String apiDateFormatter(DateTime date) {
    return DateFormat('yyyy-MM-dd kk:mm').format(date);
  }
  static Future<T?> showCustomBottomSheet<T>(Widget child, {bool? isScrollControlled}) async {
    return showModalBottomSheet(
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(15.0))),
      isScrollControlled: isScrollControlled ?? true,
      context: Nav.navigator.currentContext!,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        margin: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom, top: 30),
        color: of(Nav.navigator.currentContext!).filled.color,
        child: IntrinsicHeight(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: DecoratedBox(decoration: of(Nav.navigator.currentContext!).elevatedBox, child: const SizedBox(height: 8, width: 80)),
              ),
              Expanded(
                child: SingleChildScrollView(
                  primary: true,
                  child: child,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static showSnackBar(String msg, {bool? isTop}) {
    Get.closeAllSnackbars();
    Get.snackbar(
      '',
      '',
      snackPosition: isTop ?? true ? SnackPosition.TOP : SnackPosition.BOTTOM,
      barBlur: 10.0,
      //backgroundColor: Colors.black.withOpacity(.6),
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      duration: const Duration(seconds: 6),
      padding: const EdgeInsets.only(bottom: 30, left: 15, right: 15, top: 8),
      forwardAnimationCurve: Curves.decelerate,
      reverseAnimationCurve: Curves.decelerate,
      dismissDirection: DismissDirection.horizontal,
      //colorText: Colors.white,
      messageText: Text(
        msg,
        textAlign: TextAlign.center,
        // style: const TextStyle(color: Colors.white, fontSize: 14),
      ),
    );
  }

  Border get eBorder => Border.all(color: KColors.of(Nav.navigator.currentContext!).error, width: 1);

  static Future<AddressResult?> showMaps(BuildContext context, {Position? initLocation}) async {
    return await showGoogleMapLocationPicker(
      pinWidget: const Icon(Icons.location_pin, color: Colors.red, size: 40),
      pinColor: Colors.blue,
      context: context,
      addressPlaceHolder: 'move_the_map'.tr,
      addressTitle: 'single_address'.tr,
      apiKey: 'AIzaSyA4PY3RYKRShU07E-8rxSKnBMHY5UNUDjY',
      appBarTitle: Tr.get.choose_location,
      confirmButtonColor: KColors.of(context).accentColor,
      confirmButtonText: Tr.get.confirm_location,
      confirmButtonTextColor: Colors.white,
      country: "eg",
      language: "ar",
      searchHint: Tr.get.search_for_location,
      initialLocation: LatLng(
        initLocation?.latitude ?? 33.0515261234,
        initLocation?.longitude ?? 31.1952702387,
      ),
    );
  }
}

class _KHelperGetters {
  static BuildContext? _context;
  static _KHelperGetters? _instance;

  _KHelperGetters._internal() {
    _instance = this;
  }

  static _KHelperGetters of(BuildContext context) {
    _context = context;
    return _instance ?? _KHelperGetters._internal();
  }

  Border get eBorder => Border.all(color: KColors.of(Nav.navigator.currentContext!).error, width: 1);

  BoxDecoration get fillContainer {
    return BoxDecoration(
      color: KColors.of(_context!).fillContainer,
      borderRadius: BorderRadius.circular(KHelper.cornerRadius),
      boxShadow: [
        BoxShadow(blurRadius: 6.0, offset: const Offset(0, 3), color: KColors.of(_context!).shadow),
      ],
    );
  }

  BoxDecoration get shimmerBox {
    return BoxDecoration(
      color: KColors.of(_context!).elevatedBox.withOpacity(.2),
      borderRadius: BorderRadius.circular(KHelper.cornerRadius),
    );
  }

  BoxDecoration get errorBorder {
    return BoxDecoration(
      color: KColors.of(_context!).fillColor,
      borderRadius: BorderRadius.circular(50),
      border: Border.all(color: KColors.of(_context!).error, width: 1),
    );
  }

  BoxDecoration get roundedFields {
    return BoxDecoration(
      color: KColors.of(_context!).background,
      borderRadius: BorderRadius.circular(22),
    );
  }

  BoxDecoration get elevatedBox {
    return BoxDecoration(
      color: KColors.of(_context!).elevatedBox,
      borderRadius: BorderRadius.circular(KHelper.cornerRadius),
      boxShadow: [
        BoxShadow(
          blurRadius: 6.0,
          offset: const Offset(0, 3),
          color: KColors.of(_context!).shadow,
        ),
      ],
    );
  }

  BoxDecoration get transactionCard {
    return BoxDecoration(
      color: KColors.of(_context!).transactionCard,
      borderRadius: BorderRadius.circular(KHelper.cornerRadius),
      boxShadow: [
        BoxShadow(
          blurRadius: 6.0,
          offset: const Offset(0, 3),
          color: KColors.of(_context!).shadow,
        ),
      ],
    );
  }

  BoxDecoration get elevatedBox1st {
    return BoxDecoration(
      color: KColors.of(_context!).elevatedBox,
      borderRadius: const BorderRadius.only(topLeft: Radius.circular(KHelper.cornerRadius), topRight: Radius.circular(KHelper.cornerRadius)),
      boxShadow: [
        BoxShadow(
          blurRadius: 6.0,
          offset: const Offset(0, 3),
          color: KColors.of(_context!).shadow,
        ),
      ],
    );
  }

  BoxDecoration get msgBubble {
    return BoxDecoration(
      color: KColors.of(_context!).elevatedBox,
      borderRadius: BorderRadius.circular(KHelper.cornerRadius),
      boxShadow: [
        BoxShadow(blurRadius: 2.0, offset: const Offset(0, 2), color: KColors.of(_context!).shadow),
      ],
    );
  }

  BoxDecoration get elevatedBoxLast {
    return BoxDecoration(
      color: KColors.of(_context!).elevatedBox,
      borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(KHelper.cornerRadius), bottomRight: Radius.circular(KHelper.cornerRadius)),
      boxShadow: [
        BoxShadow(
          blurRadius: 6.0,
          offset: const Offset(0, 3),
          color: KColors.of(_context!).shadow,
        ),
      ],
    );
  }

  BoxDecoration get filled {
    return BoxDecoration(
      color: KColors.of(_context!).fillColor,
      borderRadius: BorderRadius.circular(50),
    );
  }

  BoxDecoration get outlineBorder {
    return BoxDecoration(color: KColors.of(_context!).fillColor, borderRadius: BorderRadius.circular(20), border: Border.all(color: KColors.of(_context!).accentColor, width: 1));
  }

  BoxDecoration get freeShiping {
    return BoxDecoration(
      color: KColors.of(_context!).freeShiping,
      borderRadius: BorderRadius.circular(KHelper.cornerRadius),
      boxShadow: [
        BoxShadow(blurRadius: 6.0, offset: const Offset(0, 3), color: KColors.of(_context!).shadow),
      ],
    );
  }

  BoxDecoration get outLined {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(5),
      border: Border.all(color: KColors.of(_context!).accentColor, width: 1),
    );
  }

  BoxDecoration get outlineCircle {
    return BoxDecoration(border: Border.all(color: KColors.of(_context!).accentColor, width: 1), shape: BoxShape.circle);
  }

  BoxDecoration circle(Color color) {
    return BoxDecoration(color: color, shape: BoxShape.circle);
  }

  DropdownMenuItem<T> dropdownItem<T>({required String itemText, required T value}) {
    return DropdownMenuItem<T>(
      value: value,
      child: Center(
        child: Text(
          itemText,
          style: KTextStyle.of(_context!).body,
        ),
      ),
    );
  }

  DropdownMenuItem<T> multiSelectChip<T>({required String text, required T value}) {
    return DropdownMenuItem<T>(
      value: value,
      child: Text(
        text,
        style: KTextStyle.of(_context!).body,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  MultiSelectorItem<T> itemView<T>({required String itemText, required T value, Widget? icon}) {
    return MultiSelectorItem<T>(
      value: value,
      searchValue: itemText,
      icon: icon,
      child: Text(
        itemText,
        style: KTextStyle.of(_context!).body,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
