import 'package:dart_hybrid_4/dart_hybrid_4.dart';

void main() async {
  var fetchClass = FetchClass();

  var randomUsers = await fetchClass.fetchUsers(10); //fetchUsers
  fetchClass.printUsers(randomUsers); //Output users
}
