import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:main_menu_page/data_class.dart';
import 'register/signup_page.dart';

/* Ang mga link kay mag depende sa ip address, so basin kani ang mga link dili mo work sa inyo */
/* Mo work lang sad pud ang link kung naka npm run develop ang strapi */

//Register admin
Future<void> addAdmin(String adminUsername, String adminPassword) async {
  final addAdminResponse = await http.post(
    Uri.parse('http://10.10.10.58:1337/api/admins'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'admin_username': admin.adminUsername,
      'admin_password': admin.adminPassword,
    }),
  );
  print('Status code: ${addAdminResponse.statusCode}');
  print('Admin users: ${addAdminResponse.body}');

  // if (response.statusCode == 201) {
  //   return Admin.fromJson(jsonDecode(response.body));
  // } else {
  //   throw Exception('Failed to create admin user.');
  // }
}

//Post admin users
// Future<void> addAdmin() async {
//   final url = Uri.parse('http://10.10.10.58:1337/api/admins');
//   final headers = {"Content-type": "application/json"};
//   final json =
//       '{"admin_username": "clark_gonzales", "admin_password": "user123"}';
//   final response = await post(url, headers: headers, body: json);
//   print('Status code: ${response.statusCode}');
//   print('Admin users: ${response.body}');
// }

//Get student borrowers
Future<void> getStudentBorrowers() async {
  Response getStudentResponse = await http.get(
    Uri.parse('http://10.10.10.58:1337/api/student-borrowers'),
  );
  print('Status code: ${getStudentResponse.statusCode}');
  print('Headers: ${getStudentResponse.headers}');
  print('Student borrowers: ${getStudentResponse.body}');
}

//Get personnel borrowers
Future<void> getPersonnelBorrowers() async {
  Response getPersonnelResponse = await http.get(
    Uri.parse('http://10.10.10.58:1337/api/personnel-borrowers'),
  );
  print('Status code: ${getPersonnelResponse.statusCode}');
  print('Headers: ${getPersonnelResponse.headers}');
  print('Personnel borrowers: ${getPersonnelResponse.body}');
}

//Get items
Future<void> getItems() async {
  Response getItemsResponse = await http.get(
    Uri.parse('http://10.10.10.58:1337/api/items'),
  );
  print('Status code: ${getItemsResponse.statusCode}');
  print('Headers: ${getItemsResponse.headers}');
  print('Items: ${getItemsResponse.body}');
}

//Get borrowed items
Future<void> getBorrowedItems() async {
  Response getBorrowedResponse = await http.get(
    Uri.parse('http://10.10.10.58:1337/api/borrowed-items'),
  );
  print('Status code: ${getBorrowedResponse.statusCode}');
  print('Headers: ${getBorrowedResponse.headers}');
  print('Items: ${getBorrowedResponse.body}');
}

//Delete item
Future<void> deleteItem() async {
  Response deleteItemResponse = await http.delete(
    Uri.parse('http://10.10.10.58:1337/api/items/'), //edit filter
  );
  print('Status code: ${deleteItemResponse.statusCode}');
  print('Deleted item: ${deleteItemResponse.body}');
}

// //Update item
// //not yet working
// Future<void> updateItem() async {
//   final url = Uri.parse('$urlPrefix/posts/1');
//   final headers = {"Content-type": "application/json"};
//   final json = '{"title": "Hello", "body": "body text", "userId": 1}';
//   final response = await put(url, headers: headers, body: json);
//   print('Status code: ${response.statusCode}');
//   print('Body: ${response.body}');
// }

//Add item
Future<Item> addItem(
    String propertyNum,
    String description,
    String acquisitionDate,
    String estimatedLife,
    String officeDesignation,
    String serialNum) async {
  final response = await http.post(
    Uri.parse('http://10.10.10.58:1337/api/items/'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'property_no': propertyNum,
      'description': description,
      'acquisition_date': acquisitionDate,
      'estmated_life': estimatedLife,
      'office_description': officeDesignation,
      'brand_serial_no': serialNum,
    }),
  );

  if (response.statusCode == 201) {
    return Item.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to add item to inventory.');
  }
}
