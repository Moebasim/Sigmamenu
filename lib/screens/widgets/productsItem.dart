import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:shop_app/GeneralFunction/firebase_uploader_web.dart';
import 'package:shop_app/models/product.dart';
import 'package:shop_app/style/AssetsManager.dart';
import 'package:shop_app/style/CommonUI.dart';
import 'package:shop_app/style/ScreenUtil.dart';
import 'package:shop_app/style/Style.dart';

class ProductsItemAdmin extends StatefulWidget {
  final Product data;
  ProductsItemAdmin(this.data);

  @override
  State<ProductsItemAdmin> createState() => _ProductsItemAdminState();
}

class _ProductsItemAdminState extends State<ProductsItemAdmin> {
  late TextEditingController _nameEnController =
      TextEditingController(text: _name);
  late TextEditingController _descriptionEnController =
      TextEditingController(text: _description);
  late TextEditingController _priceController =
      TextEditingController(text: _price.toString());
  late TextEditingController _imageController =
      TextEditingController(text: _image);
  ValueNotifier<String?> _imagevalue = ValueNotifier<String?>(null);
  // final _formKey = GlobalKey<FormBuilderState>();

  bool editText = false;

  late String _name;
  late String _description;
  late double _price;
  late String _image;

  @override
  void initState() {
    _name = widget.data.nameEn;
    _description = widget.data.descriptionEn;
    _price = widget.data.price;
    _image = widget.data.image;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Responsive.isDesktop(context)
          ? Row(
              children: [
                Container(
                    width: 120,
                    // height: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: CommonUI.cachedImage(
                        widget.data.image, ImageAssets.placeholder,
                        fit: BoxFit.cover)),
                SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //   // SizedBox(
                      //   //   height: 20,
                      //   // ),
                      Text(
                        widget.data.nameEn,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      // CommonUI.text(
                      //   context: context,
                      //   text: widget.data.nameEn,
                      //   // RhinoLanguage.isLTR()
                      //   //     ? product.nameEn
                      //   //     : product.nameAr,
                      //   textAlign: TextAlign.center,
                      //   style: FontStyle.normal(
                      //       context: context, fontWeight: FontWeight.bold),
                      // ),

                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        widget.data.descriptionEn,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 14),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        widget.data.price.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.w300,
                            // fontStyle: FontStyle.italic,
                            fontSize: 12),
                      ),
                      // CommonUI.text(
                      //   context: context,
                      //   text: widget.data.descriptionEn,
                      //   // RhinoLanguage.isLTR()
                      //   //     ? product.nameEn
                      //   //     : product.nameAr,
                      //   textAlign: TextAlign.center,
                      //   style: FontStyle.normal(
                      //     context: context,
                      //     // fontWeight: FontWeight.bold
                      //   ),
                      // ),

                      // SizedBox(
                      //   height: 4,
                      // ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          // CommonUI.text(
                          //   context: context,
                          //   text: widget.data.price.toString(),
                          //   // RhinoLanguage.isLTR()
                          //   //     ? product.nameEn
                          //   //     : product.nameAr,
                          //   textAlign: TextAlign.center,
                          //   style: FontStyle.normasl(
                          //       context: context, fontWeight: FontWeight.bold),
                          // ),
                          Container(
                            child: Row(
                              children: [
                                widget.data.isPublished == true
                                    ? IconButton(
                                        icon: Icon(
                                          Icons.toggle_on,
                                          color: Colors.green,
                                          size: 35,
                                        ),
                                        onPressed: () {
                                          FirebaseFirestore.instance
                                              .collection(widget.data.category)
                                              .doc(widget.data.id)
                                              .update({'isPublished': false});
                                        })
                                    : IconButton(
                                        icon: Icon(
                                          Icons.toggle_off,
                                          color: Colors.red,
                                          size: 35,
                                        ),
                                        onPressed: () {
                                          FirebaseFirestore.instance
                                              .collection(widget.data.category)
                                              .doc(widget.data.id)
                                              .update({'isPublished': true});
                                        }),
                                SizedBox(width: 20),
                                TextButton(
                                    onPressed: () {
                                      _showEditDialog(context);
                                    },
                                    child:
                                        Icon(Icons.edit, color: Colors.brown)),
                                TextButton(
                                    onPressed: () {
                                      _showDeleteDialog(context);
                                    },
                                    child:
                                        Icon(Icons.delete, color: Colors.red)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            )
          : Row(
              children: [
                Container(
                    width: 55,
                    height: 55,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: CommonUI.cachedImage(
                        widget.data.image, ImageAssets.placeholder,
                        fit: BoxFit.cover)),
                SizedBox(
                  width: 14,
                ),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 16),
                      CommonUI.text(
                        context: context,
                        text: widget.data.nameEn,
                        // RhinoLanguage.isLTR()
                        //     ? product.nameEn
                        //     : product.nameAr,
                        textAlign: TextAlign.center,
                        style: FontStyle.normal(
                            context: context, fontWeight: FontWeight.bold),
                      ),

                      // Text(
                      //   widget.data.nameEn,
                      //   overflow: TextOverflow.ellipsis,
                      //   maxLines: 1,
                      //   style: TextStyle(
                      //       fontWeight: FontWeight.bold, fontSize: 16),
                      // ),
                      SizedBox(
                        height: 3,
                      ),
                      // Text(
                      //   widget.data.descriptionEn,
                      //   overflow: TextOverflow.ellipsis,
                      //   maxLines: 2,
                      //   style: TextStyle(
                      //       fontWeight: FontWeight.w400, fontSize: 14),
                      // ),
                      // SingleChildScrollView(
                      // child:
                      CommonUI.text(
                        context: context,
                        text: widget.data.descriptionEn,
                        maxLines: 2,
                        // RhinoLanguage.isLTR()
                        //     ? product.nameEn
                        //     : product.nameAr,
                        textAlign: TextAlign.center,
                        style: FontStyle.normal(
                          context: context,
                          //  fontWeight: FontWeight.bold
                          // ),
                        ),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      // Text(
                      //   widget.data.price.toString(),
                      //   style: TextStyle(
                      //       fontWeight: FontWeight.w300,
                      //       // fontStyle: FontStyle.italic,
                      //       fontSize: 12),
                      // ),
                      CommonUI.text(
                        context: context,
                        text: widget.data.price.toString(),
                        // RhinoLanguage.isLTR()
                        //     ? product.nameEn
                        //     : product.nameAr,
                        textAlign: TextAlign.center,
                        style: FontStyle.normal(
                            context: context, fontWeight: FontWeight.bold),
                      ),
                      // SizedBox(height: 2),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          widget.data.isPublished == true
                              ? IconButton(
                                  icon: Icon(
                                    Icons.toggle_on,
                                    color: Colors.green,
                                    size: 30,
                                  ),
                                  onPressed: () {
                                    FirebaseFirestore.instance
                                        .collection(widget.data.category)
                                        .doc(widget.data.id)
                                        .update({'isPublished': false});
                                  })
                              : IconButton(
                                  icon: Icon(
                                    Icons.toggle_off,
                                    color: Colors.red,
                                    size: 30,
                                  ),
                                  onPressed: () {
                                    FirebaseFirestore.instance
                                        .collection(widget.data.category)
                                        .doc(widget.data.id)
                                        .update({'isPublished': true});
                                  }),

                          SizedBox(
                            width: 45,
                            child: TextButton(
                                onPressed: () {
                                  _showEditDialog(context);
                                },
                                child: Icon(Icons.edit, color: Colors.brown)),
                          ),
                          SizedBox(
                            width: 45,
                            child: TextButton(
                                onPressed: () {
                                  _showDeleteDialog(context);
                                },
                                child: Icon(Icons.delete, color: Colors.red)),
                          ),
                          // ),
                        ],
                      ),
                      // ),
                    ],
                  ),
                ),
                // )
              ],
            ),
    );
  }

  _showDeleteDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              'Delete',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
            ),
            content: Text('Are you sure you want to delete this product?'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();

                  FirebaseFirestore.instance
                      .collection(widget.data.category)
                      .doc(widget.data.id)
                      .delete();
                },
                child: Container(
                  // margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'YES',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                  // margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'NO',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
            ],
          );
        });
  }

  _showEditDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              "Edit",
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
            ),
            content: Container(
              height: 215,
              // WIDTH IS ALREADY DEFINED
              padding: EdgeInsets.all(16),
              margin: EdgeInsets.only(bottom: 26),
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: ValueListenableBuilder(
                      valueListenable: _imagevalue,
                      builder:
                          (BuildContext context, dynamic value, Widget? child) {
                        return InkWell(
                          onTap: () async {
                            _imageController.text =
                                await fireBaseUploadFileWeb(widget.data.id);
                          },
                          child: Container(
                            child: Column(children: [
                              value != null
                                  ? Stack(children: [
                                      Container(
                                        height: 180,
                                        width: 180,
                                        child: InteractiveViewer(
                                          child: Image.network(value,
                                              fit: BoxFit.fitWidth),
                                        ),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                            color: Color(0x4D303030)),
                                        height: 180,
                                        width: 180,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(top: 145),
                                        child: Container(
                                            height: 35,
                                            width: 180,
                                            decoration: BoxDecoration(
                                                color: Color(0x4D000000)),
                                            // child: Center(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  'Edit ',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                                Icon(Icons.edit,
                                                    color: Colors.white)
                                              ],
                                              // ),
                                            )),
                                      ),
                                    ])
                                  : Stack(children: [
                                      Container(
                                          height: 180,
                                          width: 180,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                          ),
                                          child: CommonUI.cachedImage(
                                              widget.data.image,
                                              ImageAssets.placeholder,
                                              fit: BoxFit.fitWidth)),
                                      Container(
                                        decoration: BoxDecoration(
                                            color: Color(0x4D303030)),
                                        height: 180,
                                        width: 180,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(top: 145),
                                        child: Container(
                                            height: 35,
                                            width: 180,
                                            decoration: BoxDecoration(
                                                color: Color(0x4D000000)),
                                            // child: Center(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  'Edit ',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                                Icon(Icons.edit,
                                                    color: Colors.white)
                                              ],
                                              // ),
                                            )),
                                      ),
                                    ]),
                            ]),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // editText
                            //     ? Text(
                            //         widget.data.nameEn,
                            //         overflow: TextOverflow.ellipsis,
                            //         maxLines: 1,
                            //         style: TextStyle(
                            //             fontWeight: FontWeight.bold,
                            //             fontSize: 21),
                            //       )
                            //     :
                            Container(
                              height: 50,
                              width: Responsive.isDesktop(context) ? 200 : 70,
                              child: CommonUI.textField(
                                isEdit: true,
                                context: context,
                                name: "Name",
                                controller: _nameEnController,
                                // hint: widget.data.nameEn,
                                validate: FormBuilderValidators.compose([
                                  FormBuilderValidators.required(context),
                                  // FormBuilderValidators.numeric(context),
                                ]),
                              ),
                            ),
                            // : TextFormField(
                            //     decoration: const InputDecoration(
                            //       icon: Icon(Icons.person),
                            //       hintText: 'What do people call you?',
                            //       labelText: 'Name *',
                            //     ),
                            // onSaved: (String? value) {
                            // This optional block of code can be used to run
                            // code when the user saves the form.
                            // },
                            // validator: (String? value) {
                            //   return (value != null &&
                            //           value.contains('@'))
                            //       ? 'Do not use the @ char.'
                            //       : null;
                            // },
                            // ),
                            // TextButton(
                            //     onPressed: () {
                            //       editText = true;
                            //     },
                            //     child: Icon(Icons.edit, color: Colors.brown)),
                          ],
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Text(
                            //   widget.data.descriptionEn,
                            //   overflow: TextOverflow.ellipsis,
                            //   maxLines: 2,
                            //   style: TextStyle(
                            //       fontWeight: FontWeight.w400, fontSize: 19),
                            // ),
                            Container(
                              height: 50,
                              width: Responsive.isDesktop(context) ? 200 : 70,
                              child: CommonUI.textField(
                                context: context,
                                isEdit: true,
                                name: "descriptionEn",
                                // label: widget.data.descriptionEn,
                                controller: _descriptionEnController,
                                // hint: widget.data.descriptionEn,
                                validate: FormBuilderValidators.compose([
                                  FormBuilderValidators.required(context),
                                  // FormBuilderValidators.numeric(context),
                                ]),
                              ),
                            ),
                            // TextButton(
                            //     onPressed: () {},
                            //     child: Icon(Icons.edit, color: Colors.brown)),
                          ],
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Text(
                            //   widget.data.price.toString(),
                            //   style: TextStyle(
                            //       fontWeight: FontWeight.w300,
                            //       // fontStyle: FontStyle.italic,
                            //       fontSize: 17),
                            // ),
                            Container(
                              height: 50,
                              width: Responsive.isDesktop(context) ? 200 : 70,
                              child: CommonUI.textField(
                                context: context,
                                name: "price",
                                isEdit: true,
                                // keyboardType: TextInputType(number),
                                controller: _priceController,
                                // hint: widget.data.price.toString(),
                                validate: FormBuilderValidators.compose([
                                  FormBuilderValidators.required(context),
                                  FormBuilderValidators.numeric(context),
                                ]),
                              ),
                            ),
                            // TextButton(
                            //     onPressed: () {},
                            //     child: Icon(Icons.edit, color: Colors.brown)),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  FirebaseFirestore.instance
                      .collection(widget.data.category)
                      .doc(widget.data.id)
                      .update({
                    'nameEn': _nameEnController
                        .text, // TextEditingController _nameEnController = TextEditingController();moh

                    'descriptionEn': _descriptionEnController.text,
                    'price': _priceController.text,
                    'image': _imageController.text
                  });
                  Navigator.of(context).pop();
                },
                child: Container(
                  // margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'Save',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                  // margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'Cancel',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
            ],
          );
        });
  }
}
