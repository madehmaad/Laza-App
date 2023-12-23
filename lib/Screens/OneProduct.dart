import 'package:flutter/material.dart';
import 'package:laza_app/Config/Theme.dart';
import 'package:laza_app/Model/ProductModel.dart';
import 'package:laza_app/Screens/Global/LoadingData.dart';

bool fav = false;

class OneProduct extends StatefulWidget {
  OneProduct({super.key, required this.index});
  int index;
  @override
  State<OneProduct> createState() => _OneProductState();
}

class _OneProductState extends State<OneProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: Container(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Hero(
                    tag: widget.index,
                    child: SizedBox(
                      height: 380,
                      width: double.maxFinite,
                      child: Image.network(
                        SearchList[widget.index].thumbnail,
                        fit: BoxFit.fill,
                      ),
                    )),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: describtionProduct(
                    SearchList[widget.index].title,
                    22,
                    Color(0xFF1D1E20),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: describtionProduct(
                    SearchList[widget.index].brand,
                    18,
                    Color(0xFF1D1E20),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: describtionProduct(
                    '\$' + SearchList[widget.index].price.toString(),
                    22,
                    ThemeColor,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Center(
                    child: Container(
                      height: 100,
                      width: double.maxFinite,
                      child: GridView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: SearchList[widget.index].images.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 1,
                            mainAxisSpacing: 20,
                            crossAxisCount: 1,
                            crossAxisSpacing: 30),
                        itemBuilder: (context, ind) => Container(
                          decoration: ShapeDecoration(
                            color: Color(0xFFF5F6FA),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Container(
                            height: 20,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Image.network(
                              SearchList[widget.index].images[ind],
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Description',
                    style: TextStyle(
                      color: Color(0xFF1D1E20),
                      fontSize: 17,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, bottom: 90),
                  child: describtionProduct(
                    SearchList[widget.index].description,
                    13,
                    Color(0xFF8F959E),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: InkWell(
          onTap: () {
            setState(() {
              if (!FavouritsProducts.contains(SearchList[widget.index])) {
                FavouritsProducts.add(SearchList[widget.index]);

                fav = !fav;
              } else {
                FavouritsProducts.remove(SearchList[widget.index]);

                fav = !fav;
              }
            });
          },
          child: (FavouritsProducts.contains(SearchList[widget.index]))
              ? bottomFav(
                  'Added to favourites', Color.fromARGB(255, 17, 230, 21))
              : bottomFav('Add to favourites', ThemeColor)),
    );
  }

  Widget describtionProduct(String text, double size, Color color) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontFamily: 'Inter',
        fontWeight: FontWeight.w600,
      ),
    );
  }
}

List<product_model> FavouritsProducts = [];

Widget bottomFav(String txt, Color color) {
  return Container(
    width: double.maxFinite,
    height: 50,
    padding: const EdgeInsets.only(
      top: 15,
      left: 10,
      right: 10,
      bottom: 10,
    ),
    decoration: BoxDecoration(color: color),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Text(
            txt,
            style: TextStyle(
              color: Color(0xFFFEFEFE),
              fontSize: 17,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    ),
  );
}
