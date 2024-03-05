// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class HomeService{
//   Future<void> fetchProductDetails() async {
//     final response =
//         await http.get(Uri.parse("https://fakestoreapi.com/products"));
//     if (response.statusCode == 200) {
//       final List<dynamic> data = json.decode(response.body);
//       setState(() {
//         productList = data.map((json) => Product.fromJson(json)).toList();
//       });
//     } else {
//       print("---------------Error------------------");
//     }
//   }
// }