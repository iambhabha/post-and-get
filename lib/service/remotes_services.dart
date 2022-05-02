// import 'package:api_call/models/user.dart';
// import 'package:http/http.dart' as http;

// // class remoteservices {
// //   Future<User?> getusers() async {
// //     var client = http.Client();

// //     var uri =
// //         Uri.parse('http://192.168.29.169:80/matri/api/User/education_details');

// //     var response = await client.get(uri);

// //     if (response.statusCode == 200) {
// //       var json = response.body;
// //       return userFromJson(json);
// //     }
// //   }
// // }

// import 'dart:convert';
// import 'package:api_call/models/user.dart';
// import 'package:http/http.dart';

// class HttpService {
//   final String postsURL =
//       "http://192.168.29.169:80/matri/api/User/education_details";

//   Future<List<Datum>> getPosts() async {
//     Response res = await get(Uri.parse(postsURL));

//     if (res.statusCode == 200) {
//       List<dynamic> body = jsonDecode(res.body);

//       List<Datum> posts = body
//           .map(
//             (dynamic item) => Datum.fromJson(item),
//           )
//           .toList();

//       return posts;
//     } else {
//       throw "Unable to retrieve posts.";
//     }
//   }
// }

import 'package:api_call/models/user.dart';
import 'package:http/http.dart' as http;

class remoteservices {
  Future<List<User>?> getusers() async {
    var client = http.Client();

    var uri = Uri.parse(
        'http://192.168.29.169:80/matri/api/User/education_detailsdummy');

    var response = await client.get(uri);

    if (response.statusCode == 200) {
      var json = response.body;
      return userFromJson(json);
    }
  }
}
