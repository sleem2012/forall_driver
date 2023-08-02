import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

class Tr {
  static final BuildContext _context = Get.context!;

  static AppLocalizations get get {
    return AppLocalizations.of(_context)!;
  }


  static const _local = <String, Map<String, String>>{
    'en': {
      "per": "per {0} years",
      "success": "success",
      "failed": "failed",
      "looking_for_rider": "Looking for riders",
      "on_way": "On way",
      "arrived_vendor": "Arrived Vendor",
      "rider_verify_code": "Rider verify code",
      "on_delivering": "On delivering",
      "arrived_client": "Arrived client",
      "completed_code": "Completed verify code",
      "completed": "Completed",
      "canceled": "Canceled",
      "open": "Open",
      "closed": "Closed",
      "beginner": "Beginner",
      "junior": "Junior",
      "intermediate": "Intermediate",
      "senior": "Senior",
      "team_leader": "Team Leader",
      "project_manager": "project_manager",
      "full-time": "Full Time",
      "part-time": "Part",
      "project": "project",
      "remotely": "remotely",
      "office": "office",
      "high_school": "high school",
      "elementary_school": "elementary school",
      "post_secondary_certificate_or_diploma": "post secondary certificate or diploma",
      "trade_or_vocational_school": "trade or vocational school",
      "bachelor_Degree": "bachelor Degree",
      "professional_or_doctorate": "professional or doctorate",
      "master_Degree": "master Degree",
      "pending": "Pending",
      "in progress": "In progress",
      "in_progress": "In progress",
      "saturday": "Saturday",
      "sunday": "Sunday",
      "monday": "Monday",
      "tuesday": "Tuesday",
      "wednesday": "Wednesday",
      "thursday": "Thursday",
      "friday": "Friday",
      "sar": "SAR",
            "delivery": "Delivery",
      "taxi": "Taxi",
      "outsource_vendor": "Outsource Vendor",
      "take_tour": "Take Tour",
    },
    'ar': {
      "per": "لمدة {0} سنة",
      "success": "العملية ناجحة",
      "failed": "العملية فاشلة",
      "looking_for_rider": "البحث عن سائقين",
      "on_way": "في طريقه الي مقدم الخدمه",
      "arrived_vendor": "وصل الي مقدم الخدمه",
      "rider_verify_code": "التحقق من السائق",
      "on_delivering": "قيد التوصيل",
      "arrived_client": "وصل الي العميل",
      "completed_code": "التحقق من السائق",
      "completed": "مكتمل",
      "canceled": "ملغي",
      "beginner": "مبتدأ",
      "junior": "خبرة قليلة",
      "intermediate": "متوسط الخبرة",
      "senior": "خبير",
      "team_leader": "قائد الفريق",
      "project_manager": "مدير المشروع",
      "company_edit": "تعديل بيانات الشركة",
      "full-time": "دوام كامل",
      "part-time": "دوام جزئي",
      "project": "مشروع",
      "remotely": "عن بعد",
      "office": "من المكتب",
      "high_school": "المدرسة الثانوية",
      "elementary_school": "مدرسة ابتدائية",
      "post_secondary_certificate_or_diploma": "شهادة ما بعد الثانوية أو دبلوم",
      "trade_or_vocational_school": "التجارة أو مدرسة مهنية",
      "bachelor_Degree": "درجة البكالوريوس",
      "professional_or_doctorate": "دكتوراة",
      "master_Degree": "ماجستير",
      "pending": "قيد الانتظار",
      "in progress": "قيد التَقَدم",
      "in_progress": "قيد التَقَدم",
      "saturday": "السبت",
      "sunday": "الأحد",
      "monday": "الأثنين",
      "tuesday": "الثلاثاء",
      "wednesday": "الأربعاء",
      "thursday": "الخميس",
      "friday": "الجمعة",
      "sar": "ريال سعودي",
            "delivery": "توصيل",
      "taxi": "سيارة أجرة",
      "outsource_vendor": "بائع خارجي",
      "take_tour": "خذ جولة",
    }
  };



  static String get2({required String key, required List<String> value}) {
    RegExp reg_x = RegExp(r'{\w+}');
    String pattern = _local[get.localeName]![key].toString();
    int i = 0;
    for (var match in reg_x.allMatches(_local[get.localeName]![key].toString())) {
      if (value.length > i) {
        pattern = pattern.replaceFirst(match[0].toString(), value[i]);
      }
      i++;
    }
    return pattern;
  }

  static AppLocalizations of(BuildContext context) {
    return AppLocalizations.of(context)!;
  }

  static bool get isAr => get.localeName == 'ar';

  static List<LocalizationsDelegate> delegates = <LocalizationsDelegate<dynamic>>[
    AppLocalizations.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  static List<Locale> supportedLocales = const [
    Locale('ar'),
    Locale('en'),
  ];
}
