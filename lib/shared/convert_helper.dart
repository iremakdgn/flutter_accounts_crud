class ConvertHelper {
  static DateTime? stringToDateTime(String str) {
    if (str == null || str.isEmpty) return null;
    if (str.length < 16) return null;

    var month = int.parse(str.substring(0, 2));
    var day = int.parse(str.substring(3, 5));
    var year = int.parse(str.substring(6, 10));

    var hour = int.parse(str.substring(11, 13));
    var minute = int.parse(str.substring(14, 16));
    var second = int.parse(str.substring(17, 19));

    return DateTime(year, month, day, hour, minute, second);
  }

  static DateTime? stringToTime(String str) {
    if (str == null || str.isEmpty) return null;
    if (str.length < 8) return null;

    var hour = int.parse(str.substring(0, 2));
    var minute = int.parse(str.substring(3, 5));
    var second = int.parse(str.substring(6, 8));

    return DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, hour, minute, second);
  }

  static double convertToDouble(String? text) {
    if (text == null) return 0;
    if (text.trim().length == 0) {
      return 0.0;
    } else {
      return double.parse(text);
    }
  }
}
