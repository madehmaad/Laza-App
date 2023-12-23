import 'package:dio/dio.dart';
import 'package:laza_app/Model/AddProductModel.dart';

addProduct(
  String title,
  String description,
  String brand,
) async {
  Dio dio = Dio();
  Add_Product newProduct =
      Add_Product(title: title, description: description, brand: brand);

  Response response = await dio.post('https://dummyjson.com/products/add',
      data: newProduct.toJson());
  print(response.data);
}
