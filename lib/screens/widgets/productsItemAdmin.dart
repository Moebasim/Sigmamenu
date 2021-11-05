import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:shop_app/GeneralFunction/firebase_uploader_web.dart';
import 'package:shop_app/models/product.dart';
import 'package:shop_app/style/AssetsManager.dart';
import 'package:shop_app/style/CommonUI.dart';
import 'package:shop_app/style/ScreenUtil.dart';

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
  final _formKey = GlobalKey<FormBuilderState>();

  late String _name;
  late String _description;
  late double _price;
  late String _image;
  late double _value; //= widget.data.weight.toDouble();

  @override
  void initState() {
    _name = widget.data.nameEn;
    _description = widget.data.descriptionEn;
    _price = widget.data.price;
    _image = widget.data.image;
    _value = widget.data.weight.toDouble();
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
        child:
            //  Responsive.isDesktop(context)
            // ?

            Row(
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
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
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
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
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
                      widget.data.weight >= 1
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
                                    .update({'weight': 0});
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
                                    .update({'weight': 1});
                              }),
                      SizedBox(width: 20),
                      TextButton(
                          onPressed: () {
                            setState(() {
                              _nameEnController = TextEditingController(
                                  text: widget.data.nameEn);
                              _descriptionEnController = TextEditingController(
                                  text: widget.data.descriptionEn);
                              _priceController = TextEditingController(
                                  text: widget.data.price.toString());
                              _imageController = TextEditingController(
                                  text: widget.data.image);
                              _value = widget.data.weight.toDouble();
                            });
                            _showEditDialog(context, widget.data);
                          },
                          child: Icon(Icons.edit, color: Colors.brown)),
                      TextButton(
                          onPressed: () {
                            _showDeleteDialog(context);
                          },
                          child: Icon(Icons.delete, color: Colors.red)),
                    ],
                  ),
                ],
              ),
            )
          ],
        )
        // : Row(
        //     children: [
        //       Container(
        //           width: 55,
        //           height: 55,
        //           decoration: BoxDecoration(
        //             borderRadius: BorderRadius.circular(4),
        //           ),
        //           child: CommonUI.cachedImage(
        //               widget.data.image, ImageAssets.placeholder,
        //               fit: BoxFit.cover)),
        //       SizedBox(
        //         width: 14,
        //       ),

        //       Expanded(
        //         child: Column(
        //           crossAxisAlignment: CrossAxisAlignment.start,
        //           children: [
        //             SizedBox(height: 16),
        //             CommonUI.text(
        //               context: context,
        //               text: widget.data.nameEn,
        //               // RhinoLanguage.isLTR()
        //               //     ? product.nameEn
        //               //     : product.nameAr,
        //               textAlign: TextAlign.center,
        //               style: FontStyle.normal(
        //                   context: context, fontWeight: FontWeight.bold),
        //             ),

        //             // Text(
        //             //   widget.data.nameEn,
        //             //   overflow: TextOverflow.ellipsis,
        //             //   maxLines: 1,
        //             //   style: TextStyle(
        //             //       fontWeight: FontWeight.bold, fontSize: 16),
        //             // ),
        //             SizedBox(
        //               height: 3,
        //             ),
        //             // Text(
        //             //   widget.data.descriptionEn,
        //             //   overflow: TextOverflow.ellipsis,
        //             //   maxLines: 2,
        //             //   style: TextStyle(
        //             //       fontWeight: FontWeight.w400, fontSize: 14),
        //             // ),
        //             // SingleChildScrollView(
        //             // child:

        //             // Text(
        //             //   widget.data.price.toString(),
        //             //   style: TextStyle(
        //             //       fontWeight: FontWeight.w300,
        //             //       // fontStyle: FontStyle.italic,
        //             //       fontSize: 12),
        //             // ),
        //             CommonUI.text(
        //               context: context,
        //               text: widget.data.price.toString(),
        //               // RhinoLanguage.isLTR()
        //               //     ? product.nameEn
        //               //     : product.nameAr,
        //               textAlign: TextAlign.center,
        //               style: FontStyle.normal(
        //                   context: context, fontWeight: FontWeight.bold),
        //             ),
        //             SizedBox(
        //               height: 3,
        //             ),
        //             CommonUI.text(
        //               context: context,
        //               text: widget.data.descriptionEn,
        //               maxLines: 2,
        //               // RhinoLanguage.isLTR()
        //               //     ? product.nameEn
        //               //     : product.nameAr,
        //               textAlign: TextAlign.center,
        //               style: FontStyle.normal(
        //                 context: context,
        //                 //  fontWeight: FontWeight.bold
        //                 // ),
        //               ),
        //             ),

        //             // SizedBox(height: 2),
        //             Row(
        //               mainAxisAlignment: MainAxisAlignment.end,
        //               children: [
        //                 widget.data.weight >= 1
        //                     ? IconButton(
        //                         icon: Icon(
        //                           Icons.toggle_on,
        //                           color: Colors.green,
        //                           size: 30,
        //                         ),
        //                         onPressed: () {
        //                           FirebaseFirestore.instance
        //                               .collection(widget.data.category)
        //                               .doc(widget.data.id)
        //                               .update({'weight': 0});
        //                         })
        //                     : IconButton(
        //                         icon: Icon(
        //                           Icons.toggle_off,
        //                           color: Colors.red,
        //                           size: 30,
        //                         ),
        //                         onPressed: () {
        //                           FirebaseFirestore.instance
        //                               .collection(widget.data.category)
        //                               .doc(widget.data.id)
        //                               .update({'weight': 2});
        //                         }),

        //                 SizedBox(
        //                   width: 45,
        //                   child: TextButton(
        //                       onPressed: () {
        //                         _showEditDialog(context, widget.data);
        //                       },
        //                       child: Icon(Icons.edit, color: Colors.brown)),
        //                 ),
        //                 SizedBox(
        //                   width: 45,
        //                   child: TextButton(
        //                       onPressed: () {
        //                         _showDeleteDialog(context);
        //                       },
        //                       child: Icon(Icons.delete, color: Colors.red)),
        //                 ),
        //                 // ),
        //               ],
        //             ),
        //             // ),
        //           ],
        //         ),
        //       ),
        //       // )
        //     ],
        //   ),
        );
  }
// =====  =====  ===== =====  =====  ===== =====  =====  ===== =====  =====  ===== =====  =====
// =====                                    DELETE                                        =====
// =====  =====  ===== =====  =====  ===== =====  =====  ===== =====  =====  ===== =====  =====

  _showDeleteDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              'Delete',
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
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
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'YES',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'NO',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
            ],
          );
        });
  }

// =====  =====  ===== =====  =====  ===== =====  =====  ===== =====  =====  ===== =====  =====
// =====                                    EDIT                                          =====
// =====  =====  ===== =====  =====  ===== =====  =====  ===== =====  =====  ===== =====  =====

  _showEditDialog(BuildContext context, Product product) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return FormBuilder(
            key: _formKey,
            child: AlertDialog(
              title: Text(
                "Edit",
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              ),
              content: SingleChildScrollView(
                child: Container(
                  width: Responsive.isDesktop(context) ? 350 : 290,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ValueListenableBuilder(
                        valueListenable: _imagevalue,
                        builder: (BuildContext context, dynamic value,
                            Widget? child) {
                          return InkWell(
                            onTap: () async {
                              _imageController.text =
                                  await fireBaseUploadFileWeb(widget.data.id);
                              _imagevalue.value = _imageController.text;
                            },
                            child: Center(
                              child: Container(
                                height: 180,
                                width: 180,
                                child: Column(children: [
                                  _imagevalue.value != null
                                      ? Stack(children: [
                                          Container(
                                            height: 180,
                                            width: 180,
                                            child: InteractiveViewer(
                                              child: Image.network(
                                                value,
                                                fit: BoxFit.fitWidth,
                                                loadingBuilder: (context, child,
                                                    loadingProgress) {
                                                  if (loadingProgress == null) {
                                                    return child;
                                                  }
                                                  return Center(
                                                    child:
                                                        CircularProgressIndicator(),
                                                  );
                                                },
                                              ),
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
                                                )),
                                          ),
                                        ]),
                                ]),
                              ),
                            ),
                          );
                        },
                      ),
                      SizedBox(height: 40),
                      Container(
                        child: CommonUI.textField(
                          context: context,
                          name: "Name",
                          hint: "Name",
                          isEdit: true,
                          minlines: 1,
                          controller: _nameEnController,
                          validate: FormBuilderValidators.compose([
                            FormBuilderValidators.required(context),
                          ]),
                        ),
                      ),
                      SizedBox(height: 4),
                      Container(
                        child: CommonUI.textField(
                          context: context,
                          name: "price",
                          hint: "Price",
                          isEdit: true,
                          keyboardtype: TextInputType.number,
                          controller: _priceController,
                          validate: FormBuilderValidators.compose([
                            FormBuilderValidators.required(context),
                            FormBuilderValidators.numeric(context),
                          ]),
                        ),
                      ),
                      product.weight != 0
                          ? Column(
                              children: [
                                SizedBox(height: 4),
                                Text(
                                  "Value ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                      color: Colors.brown[400]),
                                ),
                                SizedBox(height: 4),
                                StatefulBuilder(
                                  builder: (context, state) => Center(
                                    child: SliderTheme(
                                      data: SliderTheme.of(context).copyWith(
                                        activeTrackColor: Colors.brown[700],
                                        inactiveTrackColor: Colors.brown[100],
                                        trackShape:
                                            RectangularSliderTrackShape(),
                                        trackHeight: 4.0,
                                        thumbColor: Colors.brown[400],
                                        thumbShape: RoundSliderThumbShape(
                                            enabledThumbRadius: 12.0),
                                        overlayColor:
                                            Colors.brown.withAlpha(32),
                                        overlayShape: RoundSliderOverlayShape(
                                            overlayRadius: 28.0),
                                      ),
                                      child: Slider(
                                        value: _value,
                                        min: 1.0,
                                        max: 101.0,
                                        divisions: 2,
                                        onChanged: (value) {
                                          state(() {
                                            _value = value;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          : Container(),
                      SizedBox(height: 4),
                      Container(
                        child: CommonUI.textField(
                          context: context,
                          name: "Description",
                          hint: "Description",
                          maxlength: 600,
                          minlines: 2,
                          controller: _descriptionEnController,
                          validate: FormBuilderValidators.compose([
                            FormBuilderValidators.required(context),
                          ]),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () async {
                    _formKey.currentState!.save();
                    if (_formKey.currentState!.validate()) {
                      FocusScope.of(context).unfocus();
                      await FirebaseFirestore.instance
                          .collection(product.category)
                          .doc(product.id)
                          .update({
                        'nameEn': _nameEnController.text,
                        'descriptionEn': _descriptionEnController.text,
                        'price': _priceController.text,
                        'image': _imageController.text,
                        'weight': _value
                      }).whenComplete(() {
                        Navigator.of(context).pop();

                        CommonUI.successDialog(context,
                            message: "Saved successfully");
                      }).onError((error, stackTrrace) => showDialog(
                                context: context,
                                builder: (_) {
                                  return AlertDialog(
                                    content: Text(error.toString()),
                                  );
                                },
                              ));
                    }
                  },
                  child: Container(
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
                    setState(() {
                      _nameEnController =
                          TextEditingController(text: product.nameEn);
                      _descriptionEnController =
                          TextEditingController(text: product.descriptionEn);
                      _priceController =
                          TextEditingController(text: product.price.toString());
                      _imageController =
                          TextEditingController(text: product.image);
                    });

                    Navigator.of(context).pop();
                  },
                  child: Container(
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
            ),
          );
        });
  }
}
