import 'package:forall_driver/shared/localization/trans.dart';




class KSlugModel {
  String translated;
  String slug;

  KSlugModel({required this.translated, required this.slug});

  ///Find Model By Slug
  static KSlugModel? of(String? slug) {
    switch (slug) {
      case _male:
        return KSlugModel(translated: Tr.get.male, slug: _male);
      case _saturday:
        return KSlugModel(translated: 'Saturday', slug: _saturday);
      case _sunday:
        return KSlugModel(translated: 'Sunday', slug: _sunday);
      case _monday:
        return KSlugModel(translated: 'Monday', slug: _monday);
      case _tuesday:
        return KSlugModel(translated: 'Tuesday', slug: _tuesday);
      case _wednesday:
        return KSlugModel(translated: 'Wednesday', slug: _wednesday);
      case _thursday:
        return KSlugModel(translated: 'Thursday', slug: _thursday);
      case _friday:
        return KSlugModel(translated: 'Friday', slug: _friday);

      case _female:
        return KSlugModel(translated: Tr.get.female, slug: _female);
      default:
        return null;
    }
  }

  static List<KSlugModel> get days => [
        KSlugModel(translated: "Saturday", slug: _saturday),
        KSlugModel(translated: 'Sunday', slug: _sunday),
        KSlugModel(translated: 'Monday', slug: _monday),
        KSlugModel(translated: 'Tuesday', slug: _tuesday),
        KSlugModel(translated: 'Wednesday', slug: _wednesday),
        KSlugModel(translated: 'Thursday', slug: _thursday),
        KSlugModel(translated: 'Friday', slug: _friday),
      ];

  ///Lists of Slugs & Trans
  static List<KSlugModel> get genders => [
        KSlugModel(translated: Tr.get.male, slug: KSlugModel._male),
        KSlugModel(translated: Tr.get.female, slug: KSlugModel._female),
      ];

  static List<KSlugModel> get DeliveringOrderState => [
    KSlugModel(translated: Tr.get.neww, slug: neww),
    KSlugModel(translated: Tr.get.status, slug: pending),
    KSlugModel(translated: Tr.get.history, slug: completed),
  ];

  ///Const String Slugs
  ///
  static const String _male = "male";
  static const String _female = "female";
  static const String _saturday = "Saturday";
  static const String _sunday = "Sunday";
  static const String _monday = "Monday";
  static const String _tuesday = "Tuesday";
  static const String _wednesday = "Wednesday";
  static const String _thursday = "Thursday";
  static const String _friday = "Friday";


  //order update state
  static const String lookingForRider = "looking_for_rider";//vendor
  static const String lookingForDriver = "looking_for_driver";

  static const String accident = "accident";//rider
  static const String canceled = "canceled";//client
  static const String onWay = "on_way";//rider
  static const String arrivedVendor = "arrived_vendor";//rider
  static const String riderVerifyCode = "rider_verify_code";//vendor
  static const String onDelivering = "on_delivering";//system
  static const String arrivedClient = "arrived_client";//rider
  static const String completedCode = "completed_code";//client
  static const String completed = "completed";//system
  static const String inPayment = "in_payment";
  static const String pending = "pending";
  static const String neww = "new";
  static const String refund = "refund";
  static const String order = "order";
  static const String rider = "rider";
  static const String vendor = "vendor";
  static const String userNotFound = 'user_not_found';
  static const String paymentNeeded = 'payment_needed';
  static const String waitingDriver = 'waiting_driver';
  static const String waitingUser = 'waiting_user';
  //Equality
  @override
  String toString() => slug;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is KSlugModel && other.translated == translated && other.slug == slug;
  }

  @override
  int get hashCode => translated.hashCode ^ slug.hashCode;
}
