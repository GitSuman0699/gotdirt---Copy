import 'dart:convert';

enum TimingMode {
  specificTime,
  openHours,
  separate,
  all,
  oneDay,
  multipleDays,
  multipleDates,
  unknown,
}

extension TM on TimingMode? {
  String? toStringValue() {
    switch (this) {
      case TimingMode.specificTime:
        return "specific_time";
      case TimingMode.openHours:
        return "open_hours";
      case TimingMode.separate:
        return "separate";
      case TimingMode.all:
        return "all";
      case TimingMode.oneDay:
        return "one_day";
      case TimingMode.multipleDays:
        return "multiple_days";
      case TimingMode.multipleDates:
        return "multiple_dates";
      case TimingMode.unknown:
        return null;
      case null:
        return null;
    }
  }
}

class ModelParser {
  static String? parseString(dynamic value) {
    if (value != null) {
      return "$value";
    }
    return null;
  }

  static int? parseInt(dynamic value) {
    if (value != null) {
      return int.tryParse("$value");
    }
    return null;
  }

  static double? parseDouble(dynamic value) {
    if (value != null) {
      return double.tryParse("$value");
    }
    return null;
  }

  static List? parseList(dynamic value) {
    if (value != null) {
      if (value is List) {
        return value;
      }
      return null;
    }
    return null;
  }

  static List<String>? parseListOfString(dynamic value) {
    if (value != null) {
      if (value is List) {
        return (value).map((e) => e.toString()).toList();
      }
      return null;
    }
    return null;
  }

  static bool? parseBool(dynamic value) {
    if (value != null) {
      if (value is bool) {
        return value;
      }
    }
    return null;
  }

  static Map? parseMap(dynamic value) {
    if (value != null) {
      if (value is Object) {
        return jsonDecode(value.toString());
      }
    }
    return null;
  }

  static TimingMode parseTimingMode(dynamic value) {
    switch (value) {
      case "separate":
        return TimingMode.separate;
      case "open_hours":
        return TimingMode.openHours;
      case "specific_time":
        return TimingMode.specificTime;
      case "all":
        return TimingMode.all;
      case "one_day":
        return TimingMode.oneDay;
      case "multiple_days":
        return TimingMode.multipleDays;
      case "multiple_dates":
        return TimingMode.multipleDates;
      default:
        return TimingMode.unknown;
    }
  }
}
