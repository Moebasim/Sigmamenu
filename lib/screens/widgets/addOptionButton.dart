import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:sigmamenu/GeneralFunction/random_id_generator.dart';
import 'package:sigmamenu/style/CommonUI.dart';
import 'package:sigmamenu/style/ScreenUtil.dart';

class AddOptionButton extends StatefulWidget {
  @override
  State<AddOptionButton> createState() => _AddOptionButtonState();
}

class _AddOptionButtonState extends State<AddOptionButton> {
  String id = generateId();

  TextEditingController _optionNameController = TextEditingController();
  TextEditingController _optionOneKeyController = TextEditingController();
  TextEditingController _optionOneValueController = TextEditingController();

  TextEditingController _optionTwoKeyController = TextEditingController();
  TextEditingController _optionTwoValueController = TextEditingController();

  TextEditingController _optionThreeKeyController = TextEditingController();
  TextEditingController _optionThreeValueController = TextEditingController();

  TextEditingController _optionFourKeyController = TextEditingController();
  TextEditingController _optionFourValueController = TextEditingController();

  TextEditingController _optionFiveKeyController = TextEditingController();
  TextEditingController _optionFiveValueController = TextEditingController();

  TextEditingController _optionSixKeyController = TextEditingController();
  TextEditingController _optionSixValueController = TextEditingController();

  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 21),
        Align(
          alignment: Alignment.topLeft,
          child: Container(
            height: 40,
            child: TextButton.icon(
                onPressed: () {
                  showDialogWithFields();
                },
                icon: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                label: Text(
                  'Option ',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                )),
            decoration: BoxDecoration(
              color: Colors.green[600],
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ),
      ],
    );
  }

  bool option2 = false;
  bool option3 = false;
  bool option4 = false;
  bool option5 = false;
  bool option6 = false;

  void showDialogWithFields() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return FormBuilder(
              key: _formKey,
              child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.topCenter,
                children: [
                  AlertDialog(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.0)),
                    content: Container(
                      width: Responsive.isDesktop(context) ? 350 : 290,
                      padding: EdgeInsets.all(16.0),
                      margin: EdgeInsets.only(bottom: 20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(18),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.4),
                            spreadRadius: 1,
                            blurRadius: 6,
                            offset: Offset(1, 6),
                          ),
                        ],
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    // CommonUI.text(
                                    //     context: context,
                                    //     text: 'options',
                                    //     textAlign: TextAlign.center,
                                    //     style: FontStylee.normal(
                                    //         context: context,
                                    //         fontWeight: FontWeight.bold,
                                    //         color: Colors.black)),
                                    Container(
                                      width: 90,
                                      height: 40,
                                      child: CommonUI.optionTextField(
                                        context: context,
                                        name: "Options",
                                        hint: "Options",
                                        // isEdit: true,
                                        maxlines: 1,
                                        controller: _optionNameController,
                                        validate:
                                            FormBuilderValidators.compose([
                                          FormBuilderValidators.required(
                                              context),
                                        ]),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        SizedBox(width: 5),
                                        Icon(
                                          Icons.arrow_forward_ios_outlined,
                                          size: 15,
                                          color: Colors.orange[700],
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Column(
                              children: [
                                Center(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(24),
                                      color: Colors.grey.withOpacity(0.5),
                                    ),
                                    height: 1,
                                    width: double.maxFinite,
                                  ),
                                ),
                                Column(
                                  children: [
                                    Center(
                                      child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(24),
                                            color: Colors.grey.withOpacity(0.2),
                                          ),
                                          height: 1,
                                          width: double.maxFinite),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          width: 100,
                                          height: 40,
                                          child: CommonUI.optionTextField(
                                            context: context,
                                            name: "Key",
                                            hint: "Key",
                                            maxlines: 1,
                                            controller: _optionOneKeyController,
                                            validate:
                                                FormBuilderValidators.compose([
                                              FormBuilderValidators.required(
                                                  context),
                                            ]),
                                          ),
                                        ),
                                        Container(
                                          width: 100,
                                          height: 40,
                                          child: CommonUI.optionTextField(
                                            context: context,
                                            name: "Value",
                                            hint: "Value",
                                            maxlines: 1,
                                            controller:
                                                _optionOneValueController,
                                            validate:
                                                FormBuilderValidators.compose([
                                              FormBuilderValidators.required(
                                                  context),
                                            ]),
                                          ),
                                        ),
                                      ],
                                    ),
                                    option2
                                        ? Column(
                                            children: [
                                              Center(
                                                child: Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              24),
                                                      color: Colors.grey
                                                          .withOpacity(0.2),
                                                    ),
                                                    height: 1,
                                                    width: double.maxFinite),
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Container(
                                                    width: 100,
                                                    height: 40,
                                                    child: CommonUI
                                                        .optionTextField(
                                                      context: context,
                                                      name: "Key 2",
                                                      hint: "Key",
                                                      maxlines: 1,
                                                      controller:
                                                          _optionTwoKeyController,
                                                    ),
                                                  ),
                                                  Container(
                                                    width: 100,
                                                    height: 40,
                                                    child: CommonUI
                                                        .optionTextField(
                                                      context: context,
                                                      name: "Value 2",
                                                      hint: "Value",
                                                      maxlines: 1,
                                                      controller:
                                                          _optionTwoValueController,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          )
                                        : Container(),
                                    !option2
                                        ? GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                option2 = true;
                                              });
                                            },
                                            child: CircleAvatar(
                                              backgroundColor: Colors.green,
                                              radius: 20,
                                              child: Icon(
                                                Icons.add,
                                                color: Colors.white,
                                                size: 20,
                                              ),
                                            ),
                                          )
                                        : Container(),
                                    option3
                                        ? Column(
                                            children: [
                                              Center(
                                                child: Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              24),
                                                      color: Colors.grey
                                                          .withOpacity(0.2),
                                                    ),
                                                    height: 1,
                                                    width: double.maxFinite),
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Container(
                                                    width: 100,
                                                    height: 40,
                                                    child: CommonUI
                                                        .optionTextField(
                                                      context: context,
                                                      name: "Key 3",
                                                      hint: "Key",
                                                      maxlines: 1,
                                                      controller:
                                                          _optionThreeKeyController,
                                                    ),
                                                  ),
                                                  Container(
                                                    width: 100,
                                                    height: 40,
                                                    child: CommonUI
                                                        .optionTextField(
                                                      context: context,
                                                      name: "Value 3",
                                                      hint: "Value ",
                                                      maxlines: 1,
                                                      controller:
                                                          _optionThreeValueController,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          )
                                        : Container(),
                                    option2 && !option3
                                        ? GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                option3 = true;
                                              });
                                            },
                                            child: CircleAvatar(
                                              backgroundColor: Colors.green,
                                              radius: 20,
                                              child: Icon(
                                                Icons.add,
                                                color: Colors.white,
                                                size: 20,
                                              ),
                                            ),
                                          )
                                        : Container(),
                                    option4
                                        ? Column(
                                            children: [
                                              Center(
                                                child: Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              24),
                                                      color: Colors.grey
                                                          .withOpacity(0.2),
                                                    ),
                                                    height: 1,
                                                    width: double.maxFinite),
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Container(
                                                    width: 100,
                                                    height: 40,
                                                    child: CommonUI
                                                        .optionTextField(
                                                      context: context,
                                                      name: "Key 4",
                                                      hint: "Key",
                                                      maxlines: 1,
                                                      controller:
                                                          _optionFourKeyController,
                                                    ),
                                                  ),
                                                  Container(
                                                    width: 100,
                                                    height: 40,
                                                    child: CommonUI
                                                        .optionTextField(
                                                      context: context,
                                                      name: "Value 4",
                                                      hint: "Value",
                                                      maxlines: 1,
                                                      controller:
                                                          _optionFourValueController,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          )
                                        : Container(),
                                    option2 && option3 && !option4
                                        ? GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                option4 = true;
                                              });
                                            },
                                            child: CircleAvatar(
                                              backgroundColor: Colors.green,
                                              radius: 20,
                                              child: Icon(
                                                Icons.add,
                                                color: Colors.white,
                                                size: 20,
                                              ),
                                            ),
                                          )
                                        : Container(),
                                    option5
                                        ? Column(
                                            children: [
                                              Center(
                                                child: Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              24),
                                                      color: Colors.grey
                                                          .withOpacity(0.2),
                                                    ),
                                                    height: 1,
                                                    width: double.maxFinite),
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Container(
                                                    width: 100,
                                                    height: 40,
                                                    child: CommonUI
                                                        .optionTextField(
                                                      context: context,
                                                      name: "Key 5",
                                                      hint: "Key",
                                                      maxlines: 1,
                                                      controller:
                                                          _optionFiveKeyController,
                                                    ),
                                                  ),
                                                  Container(
                                                    width: 100,
                                                    height: 40,
                                                    child: CommonUI
                                                        .optionTextField(
                                                      context: context,
                                                      name: "Value 5",
                                                      hint: "Value",
                                                      maxlines: 1,
                                                      controller:
                                                          _optionFiveValueController,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          )
                                        : Container(),
                                    option2 && option3 && option4 && !option5
                                        ? GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                option5 = true;
                                              });
                                            },
                                            child: CircleAvatar(
                                              backgroundColor: Colors.green,
                                              radius: 20,
                                              child: Icon(
                                                Icons.add,
                                                color: Colors.white,
                                                size: 20,
                                              ),
                                            ),
                                          )
                                        : Container(),
                                    option6
                                        ? Column(
                                            children: [
                                              Center(
                                                child: Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              24),
                                                      color: Colors.grey
                                                          .withOpacity(0.2),
                                                    ),
                                                    height: 1,
                                                    width: double.maxFinite),
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Container(
                                                    width: 100,
                                                    height: 40,
                                                    child: CommonUI
                                                        .optionTextField(
                                                      context: context,
                                                      name: "Key 6",
                                                      hint: "Key",
                                                      maxlines: 1,
                                                      controller:
                                                          _optionSixKeyController,
                                                    ),
                                                  ),
                                                  Container(
                                                    width: 100,
                                                    height: 40,
                                                    child: CommonUI
                                                        .optionTextField(
                                                      context: context,
                                                      name: "Value 6",
                                                      hint: "Value",
                                                      maxlines: 1,
                                                      controller:
                                                          _optionSixValueController,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          )
                                        : Container(),
                                    option2 &&
                                            option3 &&
                                            option4 &&
                                            option5 &&
                                            !option6
                                        ? GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                option6 = true;
                                              });
                                            },
                                            child: CircleAvatar(
                                              backgroundColor: Colors.green,
                                              radius: 20,
                                              child: Icon(
                                                Icons.add,
                                                color: Colors.white,
                                                size: 20,
                                              ),
                                            ),
                                          )
                                        : Container(),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    actions: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                id = generateId();
                                _optionNameController.clear();
                                _optionOneKeyController.clear();
                                _optionOneValueController.clear();
                                _optionTwoKeyController.clear();
                                _optionTwoValueController.clear();
                                _optionThreeKeyController.clear();
                                _optionThreeValueController.clear();
                                _optionFourKeyController.clear();
                                _optionFourValueController.clear();
                                _optionFiveKeyController.clear();
                                _optionFiveValueController.clear();
                                _optionSixKeyController.clear();
                                _optionSixValueController.clear();
                                Navigator.pop(context);
                              },
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.white),
                              ),
                              child: Text(
                                'Cancel',
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                            SizedBox(width: 20),
                            ElevatedButton(
                              onPressed: () async {
                                if (_optionTwoKeyController.text == '' ||
                                    _optionTwoValueController.text == '') {
                                  _formKey.currentState!.save();
                                  if (_formKey.currentState!.validate()) {
                                    FocusScope.of(context).unfocus();
                                    await FirebaseFirestore.instance
                                        .collection('options')
                                        .doc(id)
                                        .set({
                                      'id': id,
                                      'options': {
                                        _optionNameController.text: {
                                          _optionOneKeyController.text:
                                              _optionOneValueController.text,

                                          // _optionTwoKeyController.text:
                                          //     _optionTwoValueController.text,

                                          // _optionThreeKeyController.text:
                                          //     _optionThreeValueController.text,
                                          // _optionFourKeyController.text:
                                          //     _optionFourValueController.text,
                                          // _optionFiveKeyController.text:
                                          //     _optionFiveValueController.text,
                                          // _optionSixKeyController.text:
                                          //     _optionSixValueController.text,
                                        }
                                      },
                                    }).whenComplete(() {
                                      id = generateId();
                                      _optionNameController.clear();
                                      _optionOneKeyController.clear();
                                      _optionOneValueController.clear();
                                      _optionTwoKeyController.clear();
                                      _optionTwoValueController.clear();
                                      _optionThreeKeyController.clear();
                                      _optionThreeValueController.clear();
                                      _optionFourKeyController.clear();
                                      _optionFourValueController.clear();
                                      _optionFiveKeyController.clear();
                                      _optionFiveValueController.clear();
                                      _optionSixKeyController.clear();
                                      _optionSixValueController.clear();

                                      Navigator.pop(context);

                                      CommonUI.successDialog(context,
                                          message: "Added Successfully");
                                    }).onError((error, stackTrrace) =>
                                            showDialog(
                                              context: context,
                                              builder: (_) {
                                                return AlertDialog(
                                                  content:
                                                      Text(error.toString()),
                                                );
                                              },
                                            ));
                                  }
                                } else if (_optionThreeKeyController.text ==
                                        '' ||
                                    _optionThreeValueController.text == '') {
                                  _formKey.currentState!.save();
                                  if (_formKey.currentState!.validate()) {
                                    FocusScope.of(context).unfocus();
                                    await FirebaseFirestore.instance
                                        .collection('options')
                                        .doc(id)
                                        .set({
                                      'id': id,
                                      'options': {
                                        _optionNameController.text: {
                                          _optionOneKeyController.text:
                                              _optionOneValueController.text,

                                          _optionTwoKeyController.text:
                                              _optionTwoValueController.text,

                                          // _optionThreeKeyController.text:
                                          //     _optionThreeValueController.text,
                                          // _optionFourKeyController.text:
                                          //     _optionFourValueController.text,
                                          // _optionFiveKeyController.text:
                                          //     _optionFiveValueController.text,
                                          // _optionSixKeyController.text:
                                          //     _optionSixValueController.text,
                                        }
                                      },
                                    }).whenComplete(() {
                                      id = generateId();
                                      _optionNameController.clear();
                                      _optionOneKeyController.clear();
                                      _optionOneValueController.clear();
                                      _optionTwoKeyController.clear();
                                      _optionTwoValueController.clear();
                                      _optionThreeKeyController.clear();
                                      _optionThreeValueController.clear();
                                      _optionFourKeyController.clear();
                                      _optionFourValueController.clear();
                                      _optionFiveKeyController.clear();
                                      _optionFiveValueController.clear();
                                      _optionSixKeyController.clear();
                                      _optionSixValueController.clear();

                                      Navigator.pop(context);

                                      CommonUI.successDialog(context,
                                          message: "Added Successfully");
                                    }).onError((error, stackTrrace) =>
                                            showDialog(
                                              context: context,
                                              builder: (_) {
                                                return AlertDialog(
                                                  content:
                                                      Text(error.toString()),
                                                );
                                              },
                                            ));
                                  }
                                } else if (_optionFourKeyController.text ==
                                        '' ||
                                    _optionFourValueController.text == '') {
                                  _formKey.currentState!.save();
                                  if (_formKey.currentState!.validate()) {
                                    FocusScope.of(context).unfocus();
                                    await FirebaseFirestore.instance
                                        .collection('options')
                                        .doc(id)
                                        .set({
                                      'id': id,
                                      'options': {
                                        _optionNameController.text: {
                                          _optionOneKeyController.text:
                                              _optionOneValueController.text,

                                          _optionTwoKeyController.text:
                                              _optionTwoValueController.text,

                                          _optionThreeKeyController.text:
                                              _optionThreeValueController.text,
                                          // _optionFourKeyController.text:
                                          //     _optionFourValueController.text,
                                          // _optionFiveKeyController.text:
                                          //     _optionFiveValueController.text,
                                          // _optionSixKeyController.text:
                                          //     _optionSixValueController.text,
                                        }
                                      },
                                    }).whenComplete(() {
                                      id = generateId();
                                      _optionNameController.clear();
                                      _optionOneKeyController.clear();
                                      _optionOneValueController.clear();
                                      _optionTwoKeyController.clear();
                                      _optionTwoValueController.clear();
                                      _optionThreeKeyController.clear();
                                      _optionThreeValueController.clear();
                                      _optionFourKeyController.clear();
                                      _optionFourValueController.clear();
                                      _optionFiveKeyController.clear();
                                      _optionFiveValueController.clear();
                                      _optionSixKeyController.clear();
                                      _optionSixValueController.clear();

                                      Navigator.pop(context);

                                      CommonUI.successDialog(context,
                                          message: "Added Successfully");
                                    }).onError((error, stackTrrace) =>
                                            showDialog(
                                              context: context,
                                              builder: (_) {
                                                return AlertDialog(
                                                  content:
                                                      Text(error.toString()),
                                                );
                                              },
                                            ));
                                  }
                                } else if (_optionFiveKeyController.text ==
                                        '' ||
                                    _optionFiveValueController.text == '') {
                                  _formKey.currentState!.save();
                                  if (_formKey.currentState!.validate()) {
                                    FocusScope.of(context).unfocus();
                                    await FirebaseFirestore.instance
                                        .collection('options')
                                        .doc(id)
                                        .set({
                                      'id': id,
                                      'options': {
                                        _optionNameController.text: {
                                          _optionOneKeyController.text:
                                              _optionOneValueController.text,

                                          _optionTwoKeyController.text:
                                              _optionTwoValueController.text,

                                          _optionThreeKeyController.text:
                                              _optionThreeValueController.text,
                                          _optionFourKeyController.text:
                                              _optionFourValueController.text,
                                          // _optionFiveKeyController.text:
                                          //     _optionFiveValueController.text,
                                          // _optionSixKeyController.text:
                                          //     _optionSixValueController.text,
                                        }
                                      },
                                    }).whenComplete(() {
                                      id = generateId();
                                      _optionNameController.clear();
                                      _optionOneKeyController.clear();
                                      _optionOneValueController.clear();
                                      _optionTwoKeyController.clear();
                                      _optionTwoValueController.clear();
                                      _optionThreeKeyController.clear();
                                      _optionThreeValueController.clear();
                                      _optionFourKeyController.clear();
                                      _optionFourValueController.clear();
                                      _optionFiveKeyController.clear();
                                      _optionFiveValueController.clear();
                                      _optionSixKeyController.clear();
                                      _optionSixValueController.clear();

                                      Navigator.pop(context);

                                      CommonUI.successDialog(context,
                                          message: "Added Successfully");
                                    }).onError((error, stackTrrace) =>
                                            showDialog(
                                              context: context,
                                              builder: (_) {
                                                return AlertDialog(
                                                  content:
                                                      Text(error.toString()),
                                                );
                                              },
                                            ));
                                  }
                                } else if (_optionSixKeyController.text == '' ||
                                    _optionSixValueController.text == '') {
                                  _formKey.currentState!.save();
                                  if (_formKey.currentState!.validate()) {
                                    FocusScope.of(context).unfocus();
                                    await FirebaseFirestore.instance
                                        .collection('options')
                                        .doc(id)
                                        .set({
                                      'id': id,
                                      'options': {
                                        _optionNameController.text: {
                                          _optionOneKeyController.text:
                                              _optionOneValueController.text,

                                          _optionTwoKeyController.text:
                                              _optionTwoValueController.text,

                                          _optionThreeKeyController.text:
                                              _optionThreeValueController.text,
                                          _optionFourKeyController.text:
                                              _optionFourValueController.text,
                                          _optionFiveKeyController.text:
                                              _optionFiveValueController.text,
                                          // _optionSixKeyController.text:
                                          //     _optionSixValueController.text,
                                        }
                                      },
                                    }).whenComplete(() {
                                      id = generateId();
                                      _optionNameController.clear();
                                      _optionOneKeyController.clear();
                                      _optionOneValueController.clear();
                                      _optionTwoKeyController.clear();
                                      _optionTwoValueController.clear();
                                      _optionThreeKeyController.clear();
                                      _optionThreeValueController.clear();
                                      _optionFourKeyController.clear();
                                      _optionFourValueController.clear();
                                      _optionFiveKeyController.clear();
                                      _optionFiveValueController.clear();
                                      _optionSixKeyController.clear();
                                      _optionSixValueController.clear();

                                      Navigator.pop(context);

                                      CommonUI.successDialog(context,
                                          message: "Added Successfully");
                                    }).onError((error, stackTrrace) =>
                                            showDialog(
                                              context: context,
                                              builder: (_) {
                                                return AlertDialog(
                                                  content:
                                                      Text(error.toString()),
                                                );
                                              },
                                            ));
                                  }
                                } else {
                                  _formKey.currentState!.save();
                                  if (_formKey.currentState!.validate()) {
                                    FocusScope.of(context).unfocus();
                                    await FirebaseFirestore.instance
                                        .collection('options')
                                        .doc(id)
                                        .set({
                                      'id': id,
                                      'options': {
                                        _optionNameController.text: {
                                          _optionOneKeyController.text:
                                              _optionOneValueController.text,
                                          _optionTwoKeyController.text:
                                              _optionTwoValueController.text,
                                          _optionThreeKeyController.text:
                                              _optionThreeValueController.text,
                                          _optionFourKeyController.text:
                                              _optionFourValueController.text,
                                          _optionFiveKeyController.text:
                                              _optionFiveValueController.text,
                                          _optionSixKeyController.text:
                                              _optionSixValueController.text,
                                        }
                                      },
                                    }).whenComplete(() {
                                      id = generateId();
                                      _optionNameController.clear();
                                      _optionOneKeyController.clear();
                                      _optionOneValueController.clear();
                                      _optionTwoKeyController.clear();
                                      _optionTwoValueController.clear();
                                      _optionThreeKeyController.clear();
                                      _optionThreeValueController.clear();
                                      _optionFourKeyController.clear();
                                      _optionFourValueController.clear();
                                      _optionFiveKeyController.clear();
                                      _optionFiveValueController.clear();
                                      _optionSixKeyController.clear();
                                      _optionSixValueController.clear();

                                      Navigator.pop(context);

                                      CommonUI.successDialog(context,
                                          message: "Added Successfully");
                                    }).onError((error, stackTrrace) =>
                                            showDialog(
                                              context: context,
                                              builder: (_) {
                                                return AlertDialog(
                                                  content:
                                                      Text(error.toString()),
                                                );
                                              },
                                            ));
                                  }
                                }
                              },
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.green),
                              ),
                              child: Text(
                                'Create',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  // Positioned(
                  //     top: 180,
                  //     child: CircleAvatar(
                  //       backgroundColor: Colors.green,
                  //       radius: 30,
                  //       child: Icon(
                  //         Icons.add,
                  //         color: Colors.white,
                  //         size: 30,
                  //       ),
                  //     )),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
