class SettingsModel {
  bool? success;
  String? status;
  String? message;
  List<SettingsData>? data;

  SettingsModel({this.success, this.status, this.message, this.data});

  SettingsModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <SettingsData>[];
      json['data'].forEach((v) {
        data!.add(SettingsData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SettingsData {
  int? id;
  Logo? logo;
  String? name;
  String? defaultColor;
  IntroScreen? introScreen;
  DefaultLanguage? defaultLanguage;
  Title? termsAndConditions;
  TermsContent? termsContent;
  TermsContent? dashboard;
  Title? privacyPolicy;
  TermsContent? privacyContent;
  Title? shippingPolicy;
  Title? shippingContent;
  Title? refundPolicy;
  Title? refundContent;
  Title? slug;
  AppVersion? appVersion;
  String? video;
  bool? isLock;

  SettingsData(
      {this.id,
      this.logo,
      this.name,
      this.defaultColor,
      this.introScreen,
      this.defaultLanguage,
      this.termsAndConditions,
      this.termsContent,
      this.dashboard,
      this.privacyPolicy,
      this.privacyContent,
      this.shippingPolicy,
      this.shippingContent,
      this.refundPolicy,
      this.refundContent,
      this.slug,
      this.appVersion,
      this.video,
      this.isLock});

  SettingsData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    logo = json['logo'] != null ? Logo.fromJson(json['logo']) : null;
    name = json['name'];
    defaultColor = json['default_color'];
    introScreen = json['intro_screen'] != null ? IntroScreen.fromJson(json['intro_screen']) : null;
    defaultLanguage = json['default_language'] != null ? DefaultLanguage.fromJson(json['default_language']) : null;
    termsAndConditions = json['terms_and_conditions'] != null ? Title.fromJson(json['terms_and_conditions']) : null;
    termsContent = json['terms_content'] != null ? TermsContent.fromJson(json['terms_content']) : null;
    dashboard = json['dashboard'] != null ? TermsContent.fromJson(json['dashboard']) : null;
    privacyPolicy = json['privacy_policy'] != null ? Title.fromJson(json['privacy_policy']) : null;
    privacyContent = json['privacy_content'] != null ? TermsContent.fromJson(json['privacy_content']) : null;
    shippingPolicy = json['shipping_policy'] != null ? Title.fromJson(json['shipping_policy']) : null;
    shippingContent = json['shipping_content'];
    refundPolicy = json['refund_policy'] != null ? Title.fromJson(json['refund_policy']) : null;
    refundContent = json['refund_content'];
    slug = json['slug'] != null ? Title.fromJson(json['slug']) : null;
    appVersion = json['app_version'] != null ? AppVersion.fromJson(json['app_version']) : null;
    video = json['video'];
    isLock = json['is_lock'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (logo != null) {
      data['logo'] = logo!.toJson();
    }
    data['name'] = name;
    data['default_color'] = defaultColor;
    if (introScreen != null) {
      data['intro_screen'] = introScreen!.toJson();
    }
    if (defaultLanguage != null) {
      data['default_language'] = defaultLanguage!.toJson();
    }
    if (termsAndConditions != null) {
      data['terms_and_conditions'] = termsAndConditions!.toJson();
    }
    if (termsContent != null) {
      data['terms_content'] = termsContent!.toJson();
    }
    if (dashboard != null) {
      data['dashboard'] = dashboard!.toJson();
    }
    if (privacyPolicy != null) {
      data['privacy_policy'] = privacyPolicy!.toJson();
    }
    if (privacyContent != null) {
      data['privacy_content'] = privacyContent!.toJson();
    }
    if (shippingPolicy != null) {
      data['shipping_policy'] = shippingPolicy!.toJson();
    }
    data['shipping_content'] = shippingContent;
    if (refundPolicy != null) {
      data['refund_policy'] = refundPolicy!.toJson();
    }
    data['refund_content'] = refundContent;
    if (slug != null) {
      data['slug'] = slug!.toJson();
    }
    if (appVersion != null) {
      data['app_version'] = appVersion!.toJson();
    }
    data['video'] = video;
    data['is_lock'] = isLock;
    return data;
  }
}

class Logo {
  String? s16px;
  String? s32px;
  String? s64px;
  String? s128px;
  String? s256px;
  String? s512px;

  Logo({this.s16px, this.s32px, this.s64px, this.s128px, this.s256px, this.s512px});

  Logo.fromJson(Map<String, dynamic> json) {
    s16px = json['16px'];
    s32px = json['32px'];
    s64px = json['64px'];
    s128px = json['128px'];
    s256px = json['256px'];
    s512px = json['512px'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['16px'] = s16px;
    data['32px'] = s32px;
    data['64px'] = s64px;
    data['128px'] = s128px;
    data['256px'] = s256px;
    data['512px'] = s512px;
    return data;
  }
}

class IntroScreen {
  Screen? screen;
  Screen? screen0;

  IntroScreen({this.screen, this.screen0});

  IntroScreen.fromJson(Map<String, dynamic> json) {
    screen = json['screen'] != null ? Screen.fromJson(json['screen']) : null;
    screen0 = json['screen0'] != null ? Screen.fromJson(json['screen0']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (screen != null) {
      data['screen'] = screen!.toJson();
    }
    if (screen0 != null) {
      data['screen0'] = screen0!.toJson();
    }
    return data;
  }
}

class Screen {
  String? image;
  Title? title;
  Title? subTitle;
  Title? paragraph;

  Screen({this.image, this.title, this.subTitle, this.paragraph});

  Screen.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    title = json['title'] != null ? Title.fromJson(json['title']) : null;
    subTitle = json['sub_title'] != null ? Title.fromJson(json['sub_title']) : null;
    paragraph = json['paragraph'] != null ? Title.fromJson(json['paragraph']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['image'] = image;
    if (title != null) {
      data['title'] = title!.toJson();
    }
    if (subTitle != null) {
      data['sub_title'] = subTitle!.toJson();
    }
    if (paragraph != null) {
      data['paragraph'] = paragraph!.toJson();
    }
    return data;
  }
}

class Title {
  String? key;
  String? value;

  Title({this.key, this.value});

  Title.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['key'] = key;
    data['value'] = value;
    return data;
  }
}

class DefaultLanguage {
  int? id;
  String? symbols;
  Title? nameValues;

  DefaultLanguage({this.id, this.symbols, this.nameValues});

  DefaultLanguage.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    symbols = json['symbols'];
    nameValues = json['name_values'] != null ? Title.fromJson(json['name_values']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['symbols'] = symbols;
    if (nameValues != null) {
      data['name_values'] = nameValues!.toJson();
    }
    return data;
  }
}

class TermsContent {
  String? rider;
  String? client;
  String? vendor;
  String? sales;

  TermsContent({this.rider, this.client, this.vendor});

  TermsContent.fromJson(Map<String, dynamic> json) {
    rider = json['rider'].toString();
    client = json['client'].toString();
    vendor = json['vendor'].toString();
    sales = json['sales'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['rider'] = rider;
    data['client'] = client;
    data['vendor'] = vendor;
    data['sales'] = sales;
    return data;
  }
}

class AppVersion {
  int? delivery;

  AppVersion({
    this.delivery,
  });

  AppVersion.fromJson(Map<String, dynamic> json) {
    delivery = json['delivery'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['delivery'] = delivery;
    return data;
  }
}
