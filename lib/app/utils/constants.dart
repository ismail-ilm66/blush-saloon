import 'package:intl/intl.dart';

final baseUrl = "https://jsapi.maxbitz.com/api";

String mapToString(Map<String, dynamic> x) {
  String e = '';
  var y = x.entries.map((e) => e.value);
  for (String str in y) {
    e = e + ' $str';
  }
  return e;
}

String timeFormatter(String date) {
  // Parse the datetime string to a DateTime object
  DateTime datetime = DateTime.parse(date);

  // Format the DateTime object to get only the time part
  String formattedTime = DateFormat('h:mm a').format(datetime);
  return formattedTime;
}
