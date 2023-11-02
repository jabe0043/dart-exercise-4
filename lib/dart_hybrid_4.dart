import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class FetchClass {
// Fetch function
  Future<List<Map<String, dynamic>>> fetchUsers(int num) async {
    var url = Uri.parse('https://random-data-api.com/api/v2/users?size=$num');

    try {
      var res = await http.get(url);
      if (res.statusCode == 200) {
        final List<dynamic> data = convert.jsonDecode(res.body);
        return data.cast<Map<String, dynamic>>();
      } else {
        throw Exception('Fetch Error');
      }
    } catch (error) {
      throw Exception('ERROR: $error');
    }
  }

// Output function
  void printUsers(List<Map<String, dynamic>> users) {
    for (var user in users) {
      var firstName = user['first_name'];
      var lastName = user['last_name'];
      var uid = user['uid'];
      print('First Name: $firstName | Last Name: $lastName | UID: $uid');
    }
  }
}
