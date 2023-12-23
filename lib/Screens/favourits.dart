import 'package:flutter/material.dart';
import 'package:laza_app/Config/Theme.dart';
import 'package:laza_app/Screens/OneProduct.dart';

class favourits extends StatefulWidget {
  const favourits({super.key});

  @override
  State<favourits> createState() => _favouritsState();
}

class _favouritsState extends State<favourits> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Container(
            height: 350,
            width: double.maxFinite,
            child: GridView.builder(
              itemCount: FavouritsProducts.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 0.8,
                  mainAxisSpacing: 15,
                  crossAxisCount: 2,
                  crossAxisSpacing: 15),
              itemBuilder: (context, index) => Container(
                decoration: ShapeDecoration(
                  color: Color(0xFFF5F6FA),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 230,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Hero(
                        tag: index,
                        child: Image.network(
                          FavouritsProducts[index].thumbnail,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Text(
                      FavouritsProducts[index].title,
                      style: TextStyle(
                        color: Color(0xFF1D1E20),
                        fontSize: 15,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      '\$' + FavouritsProducts[index].price.toString(),
                      style: TextStyle(
                          color: ThemeColor,
                          fontSize: 16,
                          fontFamily: 'Bahnschrift',
                          fontWeight: FontWeight.w700),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          FavouritsProducts.remove(FavouritsProducts[index]);
                          
                        });
                      },
                      child: Center(
                          child: Icon(
                        Icons.remove_circle_outline_rounded,
                        color: Colors.red,
                      )),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
