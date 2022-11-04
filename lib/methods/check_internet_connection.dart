import 'dart:io';

checkInternet(bool internetConnection) async {
  try {
    var result = await InternetAddress.lookup("google.com");
    if (result.isNotEmpty || result[0].rawAddress.isNotEmpty) {
      internetConnection = true;
      return true;
    }
  } on SocketException catch (_) {
    internetConnection = false;
    return false;
    
  }
  internetConnection = false;
  return false;
}
