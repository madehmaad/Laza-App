import 'package:dio/dio.dart';

getData() async {
  Dio dio = Dio();

  Response response = await dio.get('https://dummyjson.com/products');
  if (response.statusCode == 200) {
    // print(response.data['products']);
    return response.data['products'];
  } else {
    return 'Error';
  }
}
