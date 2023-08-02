import 'package:flutter/material.dart';

import '../../dynamic_ui/view/dynamic_ui_view.dart';
import '../../packages/shared/api_client/endpoints.dart';
import '../../shared/localization/trans.dart';
import '../../shared/theme/helper.dart';
import '../../shared/theme/logger.dart';
import '../../views/widgets/appbar.dart';
import '../../views/widgets/loading/loading_overlay.dart';
import '../../views/widgets/new_bg_img.dart';
import '../model/dynamic_ui_model.dart';

class DynamicTestView extends StatelessWidget {
  const DynamicTestView({super.key});
  get all_fields {
    List<DUIFieldModel> fields = [];
    List list = _json["data"] as List;
    for (var v in list) {
      fields.add(DUIFieldModel.fromJson(v));
    }

    return fields;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const KAppBar(),
      body: BgImg(
        child: KLoadingOverlay(
          isLoading: false,
          child: DynamicUi(
            padding: const EdgeInsets.symmetric(horizontal: KHelper.hPadding, vertical: 20),
            title: "Title",
            fields: all_fields,
            submitTitle: Tr.get.submit,
            onConfirm: (values, answer_col, grouped_a_col) {
              printMap(answer_col);
            },
          ),
        ),
      ),
    );
  }
}

final _json = {
  "success": true,
  "status": "success",
  "message": "the read process has success.",
  "data": [
    ///{
    ///   "id": 78678,
    ///   "key": "company_type",
    ///   "type": "ImageInput",
    ///   "keyboard": "avatar",
    ///   "placeholder": {"key": "placeholder", "value": "company type"},
    ///   "collections": [
    ///     {
    ///       "key": 2,
    ///       "value": {"key": "shopping", "value": "shopping"},
    ///       "icon": "https://forall.sa/uploads/companies/icon/c7c73ebb2daed05f1b66171577a44923e18ce640.svg"
    ///     },
    ///   ],
    ///   "format": {"validated": "required"},
    ///   "is_required": true,
    ///   "is_visible": true
    /// },
    /// {
    ///   "id": 1561,
    ///   "key": "company_mobile",
    ///   "type": "Measured",
    ///   "keyboard": "length",
    ///   "placeholder": {"key": "measured length", "value": "measured length"},
    ///   "collections": [],
    ///   "conditions": [],
    ///   "format": {"validated": "required"},
    ///   "is_required": true,
    ///   "has_multiple": false,
    ///   "is_visible": true
    /// },
    /// {
    ///   "id": 1562,
    ///   "key": "company_mobile",
    ///   "type": "Measured",
    ///   "keyboard": "weight",
    ///   "placeholder": {"key": "measured weight", "value": "measured weight"},
    ///   "collections": [],
    ///   "conditions": [],
    ///   "format": {"validated": "required"},
    ///   "is_required": true,
    ///   "has_multiple": false,
    ///   "is_visible": true
    /// },
    /// {
    ///   "id": 1563,
    ///   "key": "company_mobile",
    ///   "type": "Measured",
    ///   "keyboard": "duration",
    ///   "placeholder": {"key": "measured time", "value": "measured time"},
    ///   "collections": [],
    ///   "conditions": [],
    ///   "format": {"validated": "required"},
    ///   "is_required": true,
    ///   "has_multiple": false,
    ///   "is_visible": true
    /// },
    /// {
    ///   "id": 1564,
    ///   "key": "company_mobile",
    ///   "type": "Measured",
    ///   "keyboard": "volume",
    ///   "placeholder": {"key": "measured volume", "value": "measured volume"},
    ///   "collections": [],
    ///   "conditions": [],
    ///   "format": {"validated": "required"},
    ///   "is_required": true,
    ///   "has_multiple": false,
    ///   "is_visible": true
    /// },
    /// {
    ///   "id": 1,
    ///   "key": "account_number",
    ///   "type": "Tree",
    ///   "keyboard": "number",
    ///   "has_multiple": true,
    ///   "placeholder": {"key": "placeholder", "value": "Tree Placeholder"},
    ///   "collections": [],
    ///   "conditions": [],
    ///   "format": {"validated": "required"},
    ///   "is_required": true,
    ///   "is_visible": true,
    ///   "sub_fields": [
    ///     {
    ///       "id": 2,
    ///       "key": "company_type",
    ///       "type": "DropDownButton",
    ///       "keyboard": "name",
    ///       "placeholder": {"key": "placeholder", "value": "company type"},
    ///       "collections": [
    ///         {
    ///           "key": 1,
    ///           "value": {"key": "hr", "value": "human resources"},
    ///           "icon": "https://4all.ltd/uploads/companies/icon/7c9d6928db1127d94f6f1d11efed5a10552448c3.svg"
    ///         }
    ///       ],
    ///       "conditions": [],
    ///       "format": {"validated": "required"},
    ///       "is_required": true,
    ///       "is_visible": true
    ///     },
    ///     {
    ///       "id": 3,
    ///       "key": "company_mobile",
    ///       "type": "TextField",
    ///       "keyboard": "phone",
    ///       "placeholder": {"key": "company mobile", "value": "company mobile"},
    ///       "collections": [],
    ///       "conditions": [],
    ///       "format": {"validated": "required"},
    ///       "is_required": true,
    ///       "has_multiple": true,
    ///       "is_visible": true
    ///     },
    ///   ]
    /// },
    /// {
    ///   "id": 4,
    ///   "key": "company_mobile",
    ///   "type": "TextField",
    ///   "keyboard": "phone",
    ///   "placeholder": {"key": "company mobile", "value": "company mobile"},
    ///   "collections": [],
    ///   "conditions": [],
    ///   "format": {"validated": "required"},
    ///   "is_required": true,
    ///   "has_multiple": false,
    ///   "is_visible": true
    /// },

    /// {
    ///   "id": 87,
    ///   "key": "notification",
    ///   "type": "Notifications",
    ///   "keyboard": "notifications",
    ///   "has_multiple": true,
    ///   "placeholder": {"key": "placeholder", "value": "medicine id"},
    ///   "collections": [],
    ///   "format": {"validated": "nullable"},
    ///   "is_required": true,
    ///   "is_visible": true
    /// },
    /// {
    ///   "id": 67,
    ///   "key": "dateOfBirthGregorian",
    ///   "type": "DateTimePiker",
    ///   "keyboard": "date",
    ///   "placeholder": {"key": "placeholder", "value": "date of birth in gregorian"},
    ///   "collections": [],
    ///   "conditions": [
    ///     {
    ///       "id": 979,
    ///       "condition": "greater",
    ///       "action_true": "filter",
    ///       "action_false": "filter",
    ///       "conditional_id": 19,
    ///       "action_id": 190,
    ///     },
    ///   ],
    ///   "format": {
    ///     "max": "null",
    ///     "min": "null",
    ///     "init": "null",
    ///     "format": "g",
    ///     "date": "plus21",
    ///     "validated": "required_if:1,NV25GlPuOnQ=|date_format:Y-m-d",
    ///   },
    ///   "is_required": false,
    ///   "is_visible": true
    /// },
    /// {
    ///   "id": 19770,
    ///   "key": "dateOfBirthGregorian",
    ///   "type": "DateTimePiker",
    ///   "keyboard": "date",
    ///   "placeholder": {"key": "placeholder", "value": "date of birth in gregorian 2"},
    ///   "collections": [],
    ///   "conditions": [],
    ///   "has_multiple": true,
    ///   "format": {
    ///     "max": "null",
    ///     "min": "null",
    ///     "init": "null",
    ///     "format": "g",
    ///     "date": "plus21",
    ///     "validated": "required_if:1,NV25GlPuOnQ=|date_format:Y-m-d",
    ///   },
    ///   "is_required": true,
    ///   "is_visible": true
    /// },

    /// {
    ///   "id": 78687,
    ///   "key": "company_type",
    ///   "type": "DropDownButton",
    ///   "keyboard": "name",
    ///   "placeholder": {"key": "placeholder", "value": "company type"},
    ///   "collections": [
    ///     {
    ///       "key": 1,
    ///       "value": {"key": "hr", "value": "human resources"},
    ///       "icon": "https://4all.ltd/uploads/companies/icon/7c9d6928db1127d94f6f1d11efed5a10552448c3.svg"
    ///     }
    ///   ],
    ///   "conditions": [],
    ///   "format": {"validated": "required"},
    ///   "is_required": true,
    ///   "is_visible": true
    /// },
    /// {
    ///   "id": 24524,
    ///   "key": "company_type",
    ///   "type": "DropDownButton",
    ///   "keyboard": "name",
    ///   "placeholder": {"key": "placeholder", "value": "company type"},
    ///   "collections": [
    ///     {
    ///       "key": 2,
    ///       "value": {"key": "shopping", "value": "shopping"},
    ///       "icon": "https://forall.sa/uploads/companies/icon/c7c73ebb2daed05f1b66171577a44923e18ce640.svg"
    ///     },
    ///     {
    ///       "key": 3,
    ///       "value": {"key": "delivery", "value": "delivering"},
    ///       "icon": "https://forall.sa/uploads/companies/icon/e17ec61b4afa6bd797961bb6997f1a59721c1115.svg"
    ///     },
    ///     {
    ///       "key": 4,
    ///       "value": {"key": "medical_services", "value": "medical services"},
    ///       "icon": "https://forall.sa/uploads/companies/icon/91d9745df46719be2d495b47cc4e6498edddd84d.svg"
    ///     },
    ///     {
    ///       "key": 5,
    ///       "value": {"key": "hotels", "value": "hotels"},
    ///       "icon": "https://forall.sa/uploads/companies/icon/561cf070bdb4e559e425f7fd65976341d98d3cac.svg"
    ///     },
    ///     {
    ///       "key": 6,
    ///       "value": {"key": "flights", "value": "flights"},
    ///       "icon": "https://forall.sa/uploads/companies/icon/babce972b0121466fb525cc9de06fed9a37e0b0b.svg"
    ///     },
    ///     {
    ///       "key": 7,
    ///       "value": {"key": "eat_and_drink", "value": "eat and drink"},
    ///       "icon": "https://forall.sa/uploads/companies/icon/95e78e9982f82be242b7c483e05a1af26ebe1a29.svg"
    ///     },
    ///     {
    ///       "key": 8,
    ///       "value": {"key": "beauty_centers", "value": "beauty centers"},
    ///       "icon": "https://forall.sa/uploads/companies/icon/d953686c09933308078e808c35b5dc592a6ccfaa.svg"
    ///     },
    ///     {
    ///       "key": 9,
    ///       "value": {"key": "book_car", "value": "booking cars"},
    ///       "icon": "https://forall.sa/uploads/companies/icon/890d4e4f6c1e53d0bc91cc2af801d1b2c14c4b25.svg"
    ///     },
    ///     {
    ///       "key": 10,
    ///       "value": {"key": "dry_clean", "value": "dry cleaners"},
    ///       "icon": "https://forall.sa/uploads/companies/icon/f5ea8590bb5b208ed2ec032a279ef91504513f6e.svg"
    ///     },
    ///     {
    ///       "key": 11,
    ///       "value": {"key": "take_tour", "value": "take tours"},
    ///       "icon": "https://forall.sa/uploads/companies/icon/6a20eb9a3bed10f7b5f79ecafc669dc25a6a23d0.svg"
    ///     },
    ///     {
    ///       "key": 12,
    ///       "value": {"key": "cars", "value": "cars"},
    ///       "icon": "https://forall.sa/uploads/companies/icon/0145016b5e3fa0f40a07346ac5095e7858c55d21.svg"
    ///     },
    ///     {
    ///       "key": 13,
    ///       "value": {"key": "boat_and_yacht", "value": "boats and yachts"},
    ///       "icon": "https://forall.sa/uploads/companies/icon/ec16ee43ee028fbf81e58eceb53bef69360c821b.svg"
    ///     },
    ///     {
    ///       "key": 14,
    ///       "value": {"key": "motorbikes", "value": "motorbikes"},
    ///       "icon": "https://forall.sa/uploads/companies/icon/8d0c0c55af5f998b087b5fac1b71d58b6357b7e4.svg"
    ///     },
    ///     {
    ///       "key": 15,
    ///       "value": {"key": "bikes", "value": "bikes"},
    ///       "icon": "https://forall.sa/uploads/companies/icon/0b41981728699ca12809c07a3306534b31033429.svg"
    ///     },
    ///     {
    ///       "key": 16,
    ///       "value": {"key": "heavy_equipments", "value": "heavy equipments"},
    ///       "icon": "https://forall.sa/uploads/companies/icon/c00ae824ed97fe8febd4ae3468a96332442314e7.svg"
    ///     },
    ///     {
    ///       "key": 17,
    ///       "value": {"key": "car_care", "value": "car caress"},
    ///       "icon": "https://forall.sa/uploads/companies/icon/56faea1dcdb2f6daf551d447e6c47537e3fdab9d.svg"
    ///     },
    ///     {
    ///       "key": 18,
    ///       "value": {"key": "real_estates", "value": "real estates"},
    ///       "icon": "https://forall.sa/uploads/companies/icon/9d29b149df2f011c6601023cb97986ed51604f3a.svg"
    ///     },
    ///     {
    ///       "key": 19,
    ///       "value": {"key": "sports", "value": "sports"},
    ///       "icon": "https://forall.sa/uploads/companies/icon/3d1df9e4c0830448aceafeb21bd695646dc848e2.svg"
    ///     },
    ///     {
    ///       "key": 20,
    ///       "value": {"key": "e-mall", "value": "e-malls"},
    ///       "icon": "https://forall.sa/uploads/companies/icon/eea96aa1424942a29ffd64fa5973552e2c3fbdf6.svg"
    ///     },
    ///     {
    ///       "key": 22,
    ///       "value": {"key": "jobs", "value": "jobs"},
    ///       "icon": "https://forall.sa/uploads/companies/icon/e895b787e37c7f60aa6b8bba94ec8f9b3b261220.svg"
    ///     },
    ///     {
    ///       "key": 23,
    ///       "value": {"key": "ads", "value": "ads"},
    ///       "icon": "https://forall.sa/uploads/companies/icon/d8d8476a4389a8cb8740dea7f7cc1dc6be527fb4.svg"
    ///     },
    ///     {
    ///       "key": 24,
    ///       "value": {"key": "tourism_companies", "value": "tourism companies"},
    ///       "icon": "https://forall.sa/uploads/companies/icon/d08708ab9e6dc9ffc5247d374a7a32de0af0c94e.svg"
    ///     },
    ///     {
    ///       "key": 25,
    ///       "value": {"key": "name", "value": "animals"},
    ///       "icon": "https://forall.sa/uploads/companies/icon/4d5dbfd0bd75cd9df18a10000b25ce5dbf608bdd.svg"
    ///     },
    ///     {
    ///       "key": 26,
    ///       "value": {"key": "name", "value": "banks"},
    ///       "icon": "https://forall.sa/uploads/companies/icon/2881cf22cf7b3aae82f428b58d60ca96165083ac.svg"
    ///     },
    ///     {
    ///       "key": 27,
    ///       "value": {"key": "name", "value": "Your Private jet"},
    ///       "icon": "https://forall.sa/uploads/companies/icon/79e517be608b28b59cea55b2f8f65ce089705a22.svg"
    ///     }
    ///   ],
    ///   "conditions": [
    ///     {
    ///       "id": 7823,
    ///       "condition": "notequal",
    ///       "action_true": "filter",
    ///       "action_false": "inVisible",
    ///       "value": "2",
    ///       "conditional_id": 2,
    ///       "action_id": 78687,
    ///       "api_collections": "${KEndPoints.baseUrl}company/api/company_package?collection_company_type_id=",
    ///       "created_at": "2022-12-13T20:16:25.000000Z",
    ///       "updated_at": "2022-12-13T20:16:28.000000Z"
    ///     },
    ///     {
    ///       "id": 786766,
    ///       "condition": "notequal",
    ///       "action_true": "filter",
    ///       "action_false": "visible",
    ///       "value": "null",
    ///       "conditional_id": 2,
    ///       "action_id": 13,
    ///       "api_collections": "${KEndPoints.baseUrl}company/api/categories?collection_company_type_id=",
    ///       "created_at": "2022-12-13T20:16:25.000000Z",
    ///       "updated_at": "2022-12-13T20:16:28.000000Z"
    ///     }
    ///   ],
    ///   "format": {"validated": "required"},
    ///   "is_required": true,
    ///   "is_visible": true
    /// },

    /// {
    ///   "id": 1231,
    ///   "key": "company_type",
    ///   "type": "ImageInput",
    ///   "keyboard": "name",
    ///   "placeholder": {"key": "placeholder", "value": "company type"},
    ///   "collections": [
    ///     {
    ///       "key": 2,
    ///       "value": {"key": "shopping", "value": "shopping"},
    ///       "icon": "https://forall.sa/uploads/companies/icon/c7c73ebb2daed05f1b66171577a44923e18ce640.svg"
    ///     },
    ///     {
    ///       "key": 3,
    ///       "value": {"key": "delivery", "value": "delivering"},
    ///       "icon": "https://forall.sa/uploads/companies/icon/e17ec61b4afa6bd797961bb6997f1a59721c1115.svg"
    ///     },
    ///     {
    ///       "key": 4,
    ///       "value": {"key": "medical_services", "value": "medical services"},
    ///       "icon": "https://forall.sa/uploads/companies/icon/91d9745df46719be2d495b47cc4e6498edddd84d.svg"
    ///     },
    ///     {
    ///       "key": 5,
    ///       "value": {"key": "hotels", "value": "hotels"},
    ///       "icon": "https://forall.sa/uploads/companies/icon/561cf070bdb4e559e425f7fd65976341d98d3cac.svg"
    ///     },
    ///     {
    ///       "key": 6,
    ///       "value": {"key": "flights", "value": "flights"},
    ///       "icon": "https://forall.sa/uploads/companies/icon/babce972b0121466fb525cc9de06fed9a37e0b0b.svg"
    ///     },
    ///     {
    ///       "key": 7,
    ///       "value": {"key": "eat_and_drink", "value": "eat and drink"},
    ///       "icon": "https://forall.sa/uploads/companies/icon/95e78e9982f82be242b7c483e05a1af26ebe1a29.svg"
    ///     }
    ///   ],
    ///   "conditions": [
    ///     {
    ///       "id": 4399,
    ///       "condition": "notequal",
    ///       "action_true": "filter",
    ///       "action_false": "visible",
    ///       "value": "null",
    ///       "conditional_id": 2,
    ///       "action_id": 5,
    ///       "api_collections": "${KEndPoints.baseUrl}company/api/company_package?collection_company_type_id=",
    ///       "created_at": "2022-12-13T20:16:25.000000Z",
    ///       "updated_at": "2022-12-13T20:16:28.000000Z"
    ///     },
    ///     {
    ///       "id": 3690,
    ///       "condition": "notequal",
    ///       "action_true": "filter",
    ///       "action_false": "visible",
    ///       "value": "null",
    ///       "conditional_id": 2,
    ///       "action_id": 13,
    ///       "api_collections": "${KEndPoints.baseUrl}company/api/categories?collection_company_type_id=",
    ///       "created_at": "2022-12-13T20:16:25.000000Z",
    ///       "updated_at": "2022-12-13T20:16:28.000000Z"
    ///     }
    ///   ],
    ///   "format": {"validated": "required"},
    ///   "is_required": true,
    ///   "is_visible": true
    /// },
    /// {
    ///   "id": 74390,
    ///   "key": "packages_id",
    ///   "type": "DropDownButton",
    ///   "keyboard": "number",
    ///   "placeholder": {"key": "company packages", "value": "company packages type"},
    ///   "collections": [],
    ///   "conditions": [],
    ///   "format": {"validated": "required"},
    ///   "is_required": true,
    ///   "is_visible": true
    /// },
    /// {
    ///   "id": 28528,
    ///   "key": "category_id",
    ///   "type": "ImageInput",
    ///   "keyboard": "number",
    ///   "placeholder": {"key": "Company Categories", "value": "company categories"},
    ///   "collections": [
    ///     {
    ///       "key": 2,
    ///       "value": {"key": "shopping", "value": "shopping"},
    ///       "is_required": false,
    ///       "icon": "https://forall.sa/uploads/companies/icon/c7c73ebb2daed05f1b66171577a44923e18ce640.svg"
    ///     },
    ///     {
    ///       "key": 3,
    ///       "value": {"key": "delivery", "value": "delivering"},
    ///       "is_required": false,
    ///       "icon": "https://forall.sa/uploads/companies/icon/e17ec61b4afa6bd797961bb6997f1a59721c1115.svg"
    ///     },
    ///     {
    ///       "key": 4,
    ///       "value": {"key": "medical_services", "value": "medical services"},
    ///       "is_required": true,
    ///       "icon": "https://forall.sa/uploads/companies/icon/91d9745df46719be2d495b47cc4e6498edddd84d.svg"
    ///     },
    ///     {
    ///       "key": 5,
    ///       "value": {"key": "hotels", "value": "hotels"},
    ///       "is_required": true,
    ///       "icon": "https://forall.sa/uploads/companies/icon/561cf070bdb4e559e425f7fd65976341d98d3cac.svg"
    ///     },
    ///     {
    ///       "key": 6,
    ///       "value": {"key": "flights", "value": "flights"},
    ///       "is_required": true,
    ///       "icon": "https://forall.sa/uploads/companies/icon/babce972b0121466fb525cc9de06fed9a37e0b0b.svg"
    ///     },
    ///     {
    ///       "key": 7,
    ///       "value": {"key": "eat_and_drink", "value": "eat and drink"},
    ///       "icon": "https://forall.sa/uploads/companies/icon/95e78e9982f82be242b7c483e05a1af26ebe1a29.svg",
    ///       "is_required": true,
    ///     }
    ///   ],
    ///   "conditions": [],
    ///   "format": {"validated": "nullable"},
    ///   "is_required": false,
    ///   "is_visible": true
    /// },

    /// {
    ///   "id": 1003,
    ///   "key": "category_id",
    ///   "type": "FileInput",
    ///   "keyboard": "number",
    ///   "placeholder": {"key": "File Input", "value": "File Input"},
    ///   "collections": [
    ///     {
    ///       "key": 2,
    ///       "value": {"key": "shopping", "value": "shopping"},
    ///       "icon": "https://forall.sa/uploads/companies/icon/c7c73ebb2daed05f1b66171577a44923e18ce640.svg"
    ///     },
    ///     {
    ///       "key": 3,
    ///       "value": {"key": "delivery", "value": "delivering"},
    ///       "icon": "https://forall.sa/uploads/companies/icon/e17ec61b4afa6bd797961bb6997f1a59721c1115.svg"
    ///     },
    ///     {
    ///       "key": 4,
    ///       "value": {"key": "medical_services", "value": "medical services"},
    ///       "icon": "https://forall.sa/uploads/companies/icon/91d9745df46719be2d495b47cc4e6498edddd84d.svg"
    ///     },
    ///     {
    ///       "key": 5,
    ///       "value": {"key": "hotels", "value": "hotels"},
    ///       "icon": "https://forall.sa/uploads/companies/icon/561cf070bdb4e559e425f7fd65976341d98d3cac.svg"
    ///     },
    ///     {
    ///       "key": 6,
    ///       "value": {"key": "flights", "value": "flights"},
    ///       "icon": "https://forall.sa/uploads/companies/icon/babce972b0121466fb525cc9de06fed9a37e0b0b.svg"
    ///     },
    ///     {
    ///       "key": 7,
    ///       "value": {"key": "eat_and_drink", "value": "eat and drink"},
    ///       "icon": "https://forall.sa/uploads/companies/icon/95e78e9982f82be242b7c483e05a1af26ebe1a29.svg"
    ///     }
    ///   ],
    ///   "conditions": [],
    ///   "format": {"validated": "nullable"},
    ///   "is_required": true,
    ///   "is_visible": true
    /// },
    /// {
    ///   "id": 13,
    ///   "key": "gallery",
    ///   "type": "RadioButton",
    ///   "placeholder": {"key": "Switch", "value": "Gallery"},
    ///   "format": {"validated": "nullable", "max": 5},
    ///   "is_required": true,
    ///   "has_multiple": true,
    ///   "is_visible": true,
    /// },
    /// {
    ///   "id": 133,
    ///   "key": "gallery",
    ///   "type": "Gallery",
    ///   "placeholder": {"key": "Gallery ", "value": "Gallery 2"},
    ///   "format": {"validated": "nullable", "max": 5},
    ///   "is_required": true,
    ///   "has_multiple": true,
    ///   "is_visible": true,
    /// },
    {
      "id": 2,
      "key": "company_type",
      "type": "DropDownButton",
      "keyboard": "name",
      "placeholder": {"key": "placeholder", "value": "company type"},
      "collections": [
        {
          "key": 2,
          "value": {"key": "name", "value": "shopping"},
          "icon": "https://forallfa.org/uploads/companies/icon/58ace3b74e5e243eae14712c00621ba323bb75db.svg"
        },
        {
          "key": 4,
          "value": {"key": "name", "value": "medical services"},
          "icon": "https://forallfa.org/uploads/companies/icon/060a4ecb5b4ff177dd5a78c06cf4f3bc843a2c91.svg"
        },
        {
          "key": 5,
          "value": {"key": "name", "value": "hotels"},
          "icon": "https://forallfa.org/uploads/companies/icon/d3e20b4c71c80dcf675c14bb15eb29f9528feb91.svg"
        },
        {
          "key": 7,
          "value": {"key": "name", "value": "eat and drink"},
          "icon": "https://forallfa.org/uploads/companies/icon/57763cd0c9bfdf88623ab7dddbd2b49b476cb171.svg"
        },
        {
          "key": 8,
          "value": {"key": "name", "value": "beauty centers"},
          "icon": "https://forallfa.org/uploads/companies/icon/215bd755b2576c74a818dc6e8b8771962e74a438.svg"
        },
        {
          "key": 9,
          "value": {"key": "name", "value": "BOOK A CAR"},
          "icon": "https://forallfa.org/uploads/companies/icon/15a13b8f09832087057c9994b1e8675883c1d3a1.svg"
        },
        {
          "key": 10,
          "value": {"key": "name", "value": "dry cleans"},
          "icon": "https://forallfa.org/uploads/companies/icon/82d32ab8e3b0ab178cff21b041b0d22e7ec485a1.svg"
        },
        {
          "key": 12,
          "value": {"key": "name", "value": "cars"},
          "icon": "https://forallfa.org/uploads/companies/icon/bac0010ffa4fd50928e2414fce5a48f9fd132900.svg"
        },
        {
          "key": 13,
          "value": {"key": "name", "value": "boats and yachts"},
          "icon": "https://forallfa.org/uploads/companies/icon/aed09332ad42a10d12c680ffef2334f27a76b741.svg"
        },
        {
          "key": 14,
          "value": {"key": "name", "value": "motorbikes"},
          "icon": "https://forallfa.org/uploads/companies/icon/a6979a74c8f93dcf14ad8fde4f399bc5eeec033b.svg"
        },
        {
          "key": 15,
          "value": {"key": "name", "value": "bikes"},
          "icon": "https://forallfa.org/uploads/companies/icon/c265a45b6ed28397698be123748f7702ed685c6f.svg"
        },
        {
          "key": 16,
          "value": {"key": "name", "value": "heavy equipments"},
          "icon": "https://forallfa.org/uploads/companies/icon/8e9c2a983c2c5d17a457864495e39b10acbfe503.svg"
        },
        {
          "key": 17,
          "value": {"key": "name", "value": "car cares"},
          "icon": "https://forallfa.org/uploads/companies/icon/a2d8202d5bb5dbea9d9ddce221ea806f7acf2d80.svg"
        },
        {
          "key": 18,
          "value": {"key": "name", "value": "real estates"},
          "icon": "https://forallfa.org/uploads/companies/icon/51b0fbb37c06e8f717b8e871243f848dca366b7b.svg"
        },
        {
          "key": 19,
          "value": {"key": "name", "value": "Sport"},
          "icon": "https://forallfa.org/uploads/companies/icon/4f0c5ab71ffa89e23715aa27afd32b85cff90798.svg"
        },
        {
          "key": 24,
          "value": {"key": "name", "value": "tourism companies"},
          "icon": "https://forallfa.org/uploads/companies/icon/c02ba32e726a5f585b71b87500d7fd9d80eaf894.svg"
        },
        {
          "key": 25,
          "value": {"key": "name", "value": "animals"},
          "icon": "https://forallfa.org/uploads/companies/icon/953484eb250eab49d3e979f44581d6f9997f658d.svg"
        }
      ],
      "conditions": [
        /// {
        ///   "id": 1,
        ///   "condition": "notequal",
        ///   "action_true": "filter",
        ///   "action_false": "visible",
        ///   "value": "null",
        ///   "conditional_id": 2,
        ///   "action_id": 5,
        ///   "api_collections": "https://forallfa.org/company/api/company_package?collection_company_type_id=",
        ///   "created_at": "2022-12-13T20:16:25.000000Z",
        ///   "updated_at": "2022-12-13T20:16:28.000000Z"
        /// },
        /// {
        ///   "id": 2,
        ///   "condition": "notequal",
        ///   "action_true": "filter",
        ///   "action_false": "visible",
        ///   "value": "null",
        ///   "conditional_id": 2,
        ///   "action_id": 13,
        ///   "api_collections": "https://forallfa.org/company/api/categories?collection_company_type_id=",
        ///   "created_at": "2022-12-13T20:16:25.000000Z",
        ///   "updated_at": "2022-12-13T20:16:28.000000Z"
        /// },
        /// {
        ///   "id": 3,
        ///   "condition": "notequal",
        ///   "action_true": "visible",
        ///   "action_false": "invisible",
        ///   "value": "1",
        ///   "conditional_id": 2,
        ///   "action_id": 35,
        ///   "api_collections": null,
        ///   "created_at": "2022-12-13T20:16:25.000000Z",
        ///   "updated_at": "2022-12-13T20:16:25.000000Z"
        /// },
        /// {
        ///   "id": 4,
        ///   "condition": "notequal",
        ///   "action_true": "visible",
        ///   "action_false": "invisible",
        ///   "value": "1",
        ///   "conditional_id": 2,
        ///   "action_id": 36,
        ///   "api_collections": null,
        ///   "created_at": "2022-12-13T20:16:25.000000Z",
        ///   "updated_at": "2022-12-13T20:16:25.000000Z"
        /// },

        /// {
        ///   "id": 5,
        ///   "condition": "notequal",
        ///   "action_true": "invisible",
        ///   "action_false": "invisible",
        ///   "value": "1",
        ///   "conditional_id": 2,
        ///   "action_id": 5,
        ///   "api_collections": null,
        ///   "created_at": "2022-12-13T20:16:25.000000Z",
        ///   "updated_at": "2022-12-13T20:16:25.000000Z"
        /// },
        /// {
        ///   "id": 6,
        ///   "condition": "notequal",
        ///   "action_true": "visible",
        ///   "action_false": "invisible",
        ///   "value": "1",
        ///   "conditional_id": 2,
        ///   "action_id": 13,
        ///   "api_collections": null,
        ///   "created_at": "2022-12-13T20:16:25.000000Z",
        ///   "updated_at": "2022-12-13T20:16:25.000000Z"
        /// },

        /// {
        ///   "id": 8,
        ///   "condition": "equal",
        ///   "action_true": "filter",
        ///   "action_false": "filter",
        ///   "value": "name",
        ///   "conditional_id": 36834,
        ///   "action_id": 36834,
        ///   "api_collections": "${KEndPoints.baseUrl}auth/api/system_user?id=",
        ///   "created_at": "2023-01-25T12:30:10.000000Z",
        ///   "updated_at": "2023-01-25T12:30:12.000000Z"
        /// },
        /// {
        ///   "id": 7,
        ///   "condition": "notequal",
        ///   "action_true": "visible",
        ///   "action_false": "invisible",
        ///   "value": "1",
        ///   "conditional_id": 2,
        ///   "action_id": 37,
        ///   "api_collections": null,
        ///   "created_at": "2022-12-13T20:16:25.000000Z",
        ///   "updated_at": "2022-12-13T20:16:25.000000Z"
        /// },
        /// {
        ///   "id": 8,
        ///   "condition": "notequal",
        ///   "action_true": "visible",
        ///   "action_false": "invisible",
        ///   "value": "1",
        ///   "conditional_id": 2,
        ///   "action_id": 38,
        ///   "api_collections": null,
        ///   "created_at": "2022-12-13T20:16:25.000000Z",
        ///   "updated_at": "2022-12-13T20:16:25.000000Z"
        /// },
        /// {
        ///   "id": 9,
        ///   "condition": "notequal",
        ///   "action_true": "invisible",
        ///   "action_false": "invisible",
        ///   "value": "1",
        ///   "conditional_id": 2,
        ///   "action_id": 39,
        ///   "api_collections": null,
        ///   "created_at": "2022-12-13T20:16:25.000000Z",
        ///   "updated_at": "2022-12-13T20:16:25.000000Z"
        /// },
        /// {
        ///   "id": 10,
        ///   "condition": "notequal",
        ///   "action_true": "visible",
        ///   "action_false": "invisible",
        ///   "value": "1",
        ///   "conditional_id": 2,
        ///   "action_id": 40,
        ///   "api_collections": null,
        ///   "created_at": "2022-12-13T20:16:25.000000Z",
        ///   "updated_at": "2022-12-13T20:16:25.000000Z"
        /// },

        /// {
        ///   "id": 12,
        ///   "condition": "notequal",
        ///   "action_true": "visible",
        ///   "action_false": "invisible",
        ///   "value": "1",
        ///   "conditional_id": 2,
        ///   "action_id": 41,
        ///   "api_collections": null,
        ///   "created_at": "2022-12-13T20:16:25.000000Z",
        ///   "updated_at": "2022-12-13T20:16:25.000000Z"
        /// },
        /// {
        ///   "id": 13,
        ///   "condition": "equal",
        ///   "action_true": "visible",
        ///   "action_false": "invisible",
        ///   "value": "22",
        ///   "conditional_id": 2,
        ///   "action_id": 43,
        ///   "api_collections": null,
        ///   "created_at": "2023-03-20T21:52:40.000000Z",
        ///   "updated_at": "2023-03-20T21:52:43.000000Z"
        /// }
        {
          "id": 8,
          "condition": "equal",
          "action_true": "filter",
          "action_false": "filter",
          "value": "name",
          "action_id": 36834,
          "api_collections": "${KEndPoints.baseUrl}auth/api/system_user?id=",
          "created_at": "2023-01-25T12:30:10.000000Z",
          "updated_at": "2023-01-25T12:30:12.000000Z"
        },
      ],
      "format": {"validated": "nullable"},
      "is_required": true,
      "is_visible": true
    },

    /// {
    ///   "id": 36,
    ///   "key": "package_filed2",
    ///   "type": "label",
    ///   "keyboard": "name",
    ///   "placeholder": {"key": "1987 per years", "value": "1987 per year"},
    ///   "collections": [],
    ///   "conditions": [],
    ///   "format": {"validated": "nullable"},
    ///   "is_required": false,
    ///   "is_visible": false
    /// },
    /// {
    ///   "id": 35,
    ///   "key": "package_field",
    ///   "type": "label",
    ///   "keyboard": "name",
    ///   "placeholder": {"key": "placeholder", "value": "two years on you and two years on us"},
    ///   "collections": [],
    ///   "conditions": [],
    ///   "format": {"validated": "nullable"},
    ///   "is_required": false,
    ///   "is_visible": false
    /// },
    /// {
    ///   "id": 37,
    ///   "key": "package_field3",
    ///   "type": "label",
    ///   "keyboard": "name",
    ///   "placeholder": {"key": "placeholder", "value": " subscribe: 2555 SAR"},
    ///   "collections": [],
    ///   "conditions": [],
    ///   "format": {"validated": "nullable"},
    ///   "is_required": false,
    ///   "is_visible": false
    /// },
    /// {
    ///   "id": 38,
    ///   "key": "package_field4",
    ///   "type": "label",
    ///   "keyboard": "name",
    ///   "placeholder": {"key": "placeholder", "value": " Vat: 15%"},
    ///   "collections": [],
    ///   "conditions": [],
    ///   "format": {"validated": "nullable"},
    ///   "is_required": false,
    ///   "is_visible": false
    /// },
    /// {
    ///   "id": 39,
    ///   "key": "package_field5",
    ///   "type": "label",
    ///   "keyboard": "name",
    ///   "placeholder": {"key": "placeholder", "value": "Payment Gateway: 2.5% "},
    ///   "collections": [],
    ///   "conditions": [],
    ///   "format": {"validated": "nullable"},
    ///   "is_required": false,
    ///   "is_visible": false
    /// },
    /// {
    ///   "id": 40,
    ///   "key": "package_field6",
    ///   "type": "label",
    ///   "keyboard": "name",
    ///   "placeholder": {"key": "placeholder", "value": "Total Amount: 2938.25 SAR"},
    ///   "collections": [],
    ///   "conditions": [],
    ///   "format": {"validated": "nullable"},
    ///   "is_required": false,
    ///   "is_visible": false
    /// },
    {
      "id": 182,
      "key": "sales_id",
      "type": "TextField",
      "keyboard": "string",
      "placeholder": {"key": "Sales Id", "value": "Sales Id"},
      "conditions": [
        {
          "id": 8,
          "condition": "equal",
          "action_true": "filter",
          "action_false": "filter",
          "value": "name",
          "action_id": 36834,
          "api_collections": "${KEndPoints.baseUrl}auth/api/system_user?id=",
          "created_at": "2023-01-25T12:30:10.000000Z",
          "updated_at": "2023-01-25T12:30:12.000000Z"
        },

      ],
      "format": {"validated": "required"},
      "is_required": true,
      "is_visible": true,
    },
    {
      "id": 36834,
      "key": "package_field",
      "type": "label",
      "keyboard": "name",
      "placeholder": {
        "key": "placeholder",
        "value":
            """Hi :name , \nThe starting offer: \nTwo years on you and two years on us, at the :price Price , :announce per year. T{Subscribe:-:fixed_price} T{Vat:-:vat} T{Payment Gateway:-:payment_gateway_vat} T{Total Amount:-:total_price}"""
      },
      "collections": [],
      "conditions": [],
      "format": {
        "validated": "nullable",
        "initial": {
          "price": "2555 SAR",
          "announce": "1987 SAR",
          "fixed_price": "2555 SAR",
          "vat": "15 %",
          "payment_gateway_vat": "2.5 %",
          "total_price": "2938.25 SAR",
          "table": "2938.25 SAR",
          "name": "Saeed",
        },
      },
      "is_required": false,
      "is_visible": true
    },
  ]
};
