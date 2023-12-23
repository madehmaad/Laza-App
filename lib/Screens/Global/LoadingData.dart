import 'package:flutter/material.dart';
import 'package:laza_app/Config/Theme.dart';
import 'package:laza_app/Model/ProductModel.dart';
import 'package:laza_app/Screens/OneProduct.dart';
import 'package:laza_app/Service/GetData.dart';

List<product_model> products = [];
List<product_model> SearchList = [];
Widget DataBuilder() {
  return FutureBuilder(
      future: getData(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          dynamic temp = snapshot.data;
          List<product_model> search_result = [];
          List<product_model> result = List.generate(
              temp.length, (index) => product_model.fromMap(temp[index]));

          products = result;
          SearchList = search_result;
          return searchScaffold(result: result, search_result: search_result);
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return SizedBox(
            height: 400,
            width: double.maxFinite,
            child: Center(child: CircularProgressIndicator()),
          );
        } else {
          return SizedBox(
            height: 400,
            width: double.maxFinite,
            child: Center(child: Text('Not Found')),
          );
        }
      });
}

class searchScaffold extends StatefulWidget {
  const searchScaffold({
    super.key,
    required this.result,
    required this.search_result,
  });

  final List<product_model> result;
  final List<product_model> search_result;

  @override
  State<searchScaffold> createState() => _searchScaffoldState();
}

class _searchScaffoldState extends State<searchScaffold> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            width: double.maxFinite,
            child: TextField(
              onChanged: (value) async {
                setState(() {
                  widget.search_result.clear();
                  widget.result.forEach((element) {
                    if (element.title.contains(value)) {
                      widget.search_result.add(element);
                    }
                  });
                });
              },
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Color.fromRGBO(245, 246, 250, 1),
                  hintText: ' Search..',
                  prefix: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  )),
            )),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Row(
            children: [
              Text(
                'Choose Brand',
                style: TextStyle(
                  color: Color.fromARGB(255, 47, 47, 48),
                  fontSize: 18,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                  height: 0.07,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 300,
                ),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      widget.search_result.clear();
                      widget.result.forEach((element) {
                        widget.search_result.add(element);
                      });
                    });
                  },
                  child: Container(
                    height: 30,
                    width: 70,
                    child: Center(
                      child: Text(
                        'View All',
                        style: TextStyle(
                          color: Color(0xFF8F959E),
                          fontSize: 13,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  BrandContainer('Apple'),
                  BrandContainer('Samsung'),
                  BrandContainer('Huawei'),
                  BrandContainer('Microsoft Surface'),
                  BrandContainer('Infinix'),
                  BrandContainer('HP Pavilion'),
                  BrandContainer('Royal_Mirage'),
                  BrandContainer('Fog Scent Xpressio'),
                  BrandContainer('Al Munakh'),
                  BrandContainer('Lord - Al-Rehab'),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: Container(
              height: 330,
              width: double.maxFinite,
              child: GridView.builder(
                itemCount: widget.search_result.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 0.8,
                    mainAxisSpacing: 15,
                    crossAxisCount: 2,
                    crossAxisSpacing: 15),
                itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OneProduct(
                          index: index,
                        ),
                      ),
                    );
                  },
                  child: Container(
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
                              widget.search_result[index].thumbnail,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Text(
                          widget.search_result[index].title,
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
                          '\$' + widget.search_result[index].price.toString(),
                          style: TextStyle(
                              color: ThemeColor,
                              fontSize: 16,
                              fontFamily: 'Bahnschrift',
                              fontWeight: FontWeight.w700),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget BrandContainer(
    String text,
  ) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          setState(() {
            widget.search_result.clear();
            widget.result.forEach((element) {
              if (element.brand.contains(text)) {
                widget.search_result.add(element);
              }
            });
          });
        },
        child: Container(
          width: 115,
          height: 50,
          decoration: ShapeDecoration(
            color: Color(0xFFF5F6FA),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(color: ThemeColor, width: 0.7)),
          ),
          child: Center(
            child: Text(
              text,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Color(0xFF1D1E20),
                fontSize: 15,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
