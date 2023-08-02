
abstract class MeasurementsUnits {
  static const List<MeasurementsConversion> length = [
    MeasuredCm(),
    MeasuredMeter(),
    MeasuredKM(),

  ];
  static const List<MeasurementsConversion> weight = [
    MeasuredGram(),
    MeasuredKG(),
    MeasuredTon(),
  ];
  static const List<MeasurementsConversion> volume = [
    MeasuredML(),
    MeasuredLiter(),
  ];
  static const List<MeasurementsConversion> duration = [
    MeasuredMinute(),
    MeasuredHours(),
    MeasuredDay(),
    MeasuredWeek(),
    MeasuredMonth(),
    MeasuredYears()
  ];
}

abstract class MeasurementsConversion {
  int convert(double val);
  String get unit;
  const MeasurementsConversion();
}

///Durations =========================================

class MeasuredMinute extends MeasurementsConversion {
  @override
  int convert(double val) {
    return val.ceil();
  }

  @override
  String get unit => 'Minute';
  const MeasuredMinute();
}

class MeasuredHours extends MeasurementsConversion {
  @override
  int convert(double val) {
    return (val * 60).ceil();
  }

  @override
  String get unit => 'Hours';
  const MeasuredHours();
}

class MeasuredDay extends MeasurementsConversion {
  @override
  int convert(double val) {
    return (val * 60 * 24).ceil();
  }

  @override
  String get unit => 'Days';
  const MeasuredDay();
}

class MeasuredWeek extends MeasurementsConversion {
  @override
  int convert(double val) {
    return (val * 60 * 24 * 7).ceil();
  }

  @override
  String get unit => 'Week';
  const MeasuredWeek();
}

class MeasuredMonth extends MeasurementsConversion {
  @override
  int convert(double val) {
    return (val * 60 * 24 * 30).ceil();
  }

  @override
  String get unit => 'Month';
  const MeasuredMonth();
}

class MeasuredYears extends MeasurementsConversion {
  @override
  int convert(double val) {
    return (val * 60 * 24 * 365).ceil();
  }

  @override
  String get unit => "Years";
  const MeasuredYears();
}

///Volumes =========================================
class MeasuredML extends MeasurementsConversion {
  @override
  int convert(double val) {
    return (val).ceil();
  }

  @override
  String get unit => "ML";
  const MeasuredML();
}

class MeasuredLiter extends MeasurementsConversion {
  @override
  int convert(double val) {
    return (val * 1000).ceil();
  }

  @override
  String get unit => 'Liter';
  const MeasuredLiter();
}

///Weights ===========================================

class MeasuredGram extends MeasurementsConversion {
  @override
  int convert(double val) {
    return (val).ceil();
  }

  @override
  String get unit => "Gram";
  const MeasuredGram();
}

class MeasuredKG extends MeasurementsConversion {
  @override
  int convert(double val) {
    return (val * 1000).ceil();
  }

  @override
  String get unit => "KG";
  const MeasuredKG();
}

class MeasuredTon extends MeasurementsConversion {
  @override
  int convert(double val) {
    return (val * 1000000).ceil();
  }

  @override
  String get unit => "Ton";
  const MeasuredTon();
}

///Lengths ===========================================

class MeasuredCm extends MeasurementsConversion {
  @override
  int convert(double val) {
    return (val).ceil();
  }

  @override
  String get unit => "CM";
  const MeasuredCm();
}

class MeasuredMeter extends MeasurementsConversion {
  @override
  int convert(double val) {
    return (val * 100).ceil();
  }

  @override
  String get unit => "Meter";
  const MeasuredMeter();
}

class MeasuredKM extends MeasurementsConversion {
  @override
  int convert(double val) {
    return (val * 100000).ceil();
  }

  @override
  String get unit => "KM";
  const MeasuredKM();
}
