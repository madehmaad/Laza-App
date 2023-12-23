import 'package:flutter/material.dart';
import 'package:laza_app/Config/Theme.dart';
import 'package:laza_app/Screens/Global/methods.dart';
import 'package:laza_app/Service/PostData.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  late TextEditingController title;
  late TextEditingController description;
  late TextEditingController brand;
  late bool valTitle;
  late bool valDescription;
  late bool valBrand;

  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  void initState() {
    title = TextEditingController();
    description = TextEditingController();
    brand = TextEditingController();
    valTitle = false;
    valDescription = false;
    valBrand = false;
    super.initState();
  }

  @override
  void dispose() {
    title.dispose();
    description.dispose();
    brand.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 105),
                child: Text(
                  'Add Your Product',
                  style: TextStyle(
                    color: Color(0xFF1D1E20),
                    fontSize: 28,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  'Please enter your Product details to continue',
                  style: TextStyle(
                    color: Color(0xFF8F959E),
                    fontSize: 15,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Form(
                autovalidateMode: AutovalidateMode.always,
                key: formkey,
                child: Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 100, right: 40, left: 40),
                      child: SizedBox(
                        width: 400,
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty || value == '') {
                              valTitle = false;
                              return "You must enter your Product title";
                            } else {
                              valTitle = true;
                              return null;
                            }
                          },
                          controller: title,
                          decoration: InputDecoration(
                            labelText: 'Product Title',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 20, right: 40, left: 40),
                      child: SizedBox(
                        width: 400,
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty || value == '') {
                              valDescription = false;
                              return "You must enter your Product description";
                            } else {
                              valDescription = true;
                              return null;
                            }
                          },
                          controller: description,
                          decoration: InputDecoration(
                            labelText: 'Product description',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 20, right: 40, left: 40),
                      child: SizedBox(
                        width: 400,
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty || value == '') {
                              valBrand = false;
                              return "You must enter your Product brand";
                            } else {
                              valBrand = true;
                              return null;
                            }
                          },
                          controller: brand,
                          decoration: InputDecoration(
                            labelText: 'Product brand',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50, right: 40, left: 40),
                child: InkWell(
                  onTap: () {
                    if (valBrand && valDescription && valTitle) {
                      addProduct(title.text, description.text, brand.text);

                      AddedProduct(context);
                    } else {
                      ValidateAddProduct(context);
                    }
                  },
                  child: Container(
                    width: 287,
                    height: 59,
                    decoration: ShapeDecoration(
                      color: ThemeColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'Add Product',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                          height: 0,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
