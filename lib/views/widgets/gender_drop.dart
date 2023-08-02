import 'package:forall_driver/shared/localization/trans.dart';


class KGenderModel {
  final String gender;
  final String slug;

  KGenderModel({required this.gender, required this.slug});

  static List<KGenderModel> genders = [
    KGenderModel(gender: Tr.get.female, slug: "female"),
    KGenderModel(gender: Tr.get.male, slug: "male"),
  ];
  static KGenderModel bySlug(String slug) {
    if (slug == 'male') {
      return genders.last;
    } else {
      return genders.first;
    }
  }
}
