import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

void main() async {
  try {
    var randomUsers = await fetchUsers(10);
    if (randomUsers != null) {
      for (var user in randomUsers) {
        var firstName = user['first_name'];
        var lastName = user['last_name'];
        var uid = user['uid'];
        print('First Name: $firstName | Last Name: $lastName | UID: $uid');
      }
    }
  } catch (error) {
    print('ERROR: $error');
  }
}

// fetch function
Future<List<Map<String, dynamic>>> fetchUsers(int num) async {
  var url = Uri.parse('https://random-data-api.com/api/v2/users?size=$num');

  var res = await http.get(url);
  if (res.statusCode == 200) {
    final List<dynamic> data = convert.jsonDecode(res.body);
    return data.cast<Map<String, dynamic>>();
  } else {
    throw Exception('Fetch Error');
  }
}
