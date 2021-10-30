import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/GeneralFunction/firebase_uploader_web.dart';
import 'package:shop_app/GeneralFunction/random_id_generator.dart';
import 'package:shop_app/screens/adminPanel.dart';

class AddBannerButton extends StatefulWidget {
  // final Stream<int> stream;

  // AddBannerButton(this.stream);

  @override
  State<AddBannerButton> createState() => _AddBannerButtonState();
}

class _AddBannerButtonState extends State<AddBannerButton> {
  String id = generateId();
  String imageURL = 'assets/images/placeholder.jpg';
  TextEditingController _nameBannerController = TextEditingController();
  TextEditingController _categoryBannerController = TextEditingController();
  TextEditingController _imageBannerController = TextEditingController();
  ValueNotifier<String?> _image = ValueNotifier<String?>(null);
  String _validatorText = "This field can't be empty";

  String category = categoriesList.elementAt(0);

  // @override
  // void initState() {
  //   super.initState();
  //   widget.stream.listen((index) {
  //     mySetState(index);
  //   });
  // }

  // void mySetState(int index) {
  //      if (!mounted) return;

  //   setState(() {
  //     category = categoriesList.elementAt(index);

  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 21),
        Align(
          alignment: Alignment.topLeft,
          child: TextButton.icon(
              onPressed: () {
                showDialogWithFields();
              },
              icon: Icon(Icons.add),
              label: Text('Banner')),
        ),
      ],
    );
  }

  void showDialogWithFields() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            // backgroundColor: Colors.brown,
            scrollable: true,
            title: Center(child: Text('Create a new Banner')),
            content: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ValueListenableBuilder(
                          valueListenable: _image,
                          builder: (BuildContext context, dynamic value,
                              Widget? child) {
                            return value != null
                                ? InkWell(
                                    onTap: () async {
                                      CircularProgressIndicator();
                                      _imageBannerController.text =
                                          await fireBaseUploadFileWeb(id);

                                      _image.value =
                                          _imageBannerController.text;
                                      // print(_imageController.text);
                                    },
                                    child: Container(
                                      height: 100,
                                      width: 180,
                                      child: InteractiveViewer(
                                        child: Image.network(value,
                                            fit: BoxFit.fitWidth),
                                      ),
                                    ),
                                  )
                                : InkWell(
                                    onTap: () async {
                                      CircularProgressIndicator();
                                      _imageBannerController.text =
                                          await fireBaseUploadFileWeb(id);

                                      _image.value =
                                          _imageBannerController.text;
                                      // print(_imageController.text);
                                    },
                                    child: Container(
                                      height: 100,
                                      width: 180,
                                      child: Image.asset(
                                        'assets/images/placeholder.jpg',
                                        fit: BoxFit.fitWidth,
                                      ),
                                    ),
                                  );
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.40,
                      child: TextFormField(
                        validator: (value) => value!.isEmpty
                            ? _validatorText
                            : null, // style: TextStyle(color: Colors.brown),
                        controller: _nameBannerController,
                        decoration: InputDecoration(
                          labelText: 'Banner Name',
                          icon: Icon(Icons.account_box),
                        ),
                      ),
                    ),
                    // SizedBox(
                    //   width: MediaQuery.of(context).size.width * 0.40,
                    //   child: TextFormField(
                    //     validator: (value) =>
                    //         value!.isEmpty ? _validatorText : null,
                    //     controller: _priceController,
                    //     decoration: InputDecoration(
                    //       labelText: 'Product Price',
                    //       icon: Icon(Icons.money),
                    //     ),
                    //   ),
                    // ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.40,
                      child: TextFormField(
                        validator: (value) =>
                            value!.isEmpty ? _validatorText : null,
                        controller: _categoryBannerController,
                        decoration: InputDecoration(
                          labelText: 'Banner Category',
                          icon: Icon(Icons.message),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            actions: [
              TextButton(
                  child: Center(child: Text("Create ")),
                  onPressed: () {
                    FirebaseFirestore.instance
                        .collection("Banner")
                        .doc(id)
                        .set({
                      'id': id,
                      'nameEn': _nameBannerController.text,
                      // 'nameAr': 'nameAr',
                      'category': _categoryBannerController.text,
                      // 'descriptionAr': 'descriptionAr',
                      // 'descriptionEn': _descriptionEnController.text,
                      'isPublished': true,
                      'image': _imageBannerController.text,
                      // 'price': _priceController.text,
                      // 'rate': 0,
                      // 'weight': 0,
                      //subCategory: ---
                    });
                    Navigator.of(context).pop();
                  })
            ],
          );
        });
  }
}