import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sigmamenu/constaints.dart';
import 'package:sigmamenu/language/logic/ProjectLanguage.dart';
import 'package:sigmamenu/models/product.dart';
import 'package:sigmamenu/style/AssetsManager.dart';
import 'package:sigmamenu/style/CommonUI.dart';
import 'package:sigmamenu/style/ScreenUtil.dart';

class ItemCardRectangle extends StatefulWidget {
  final Product product;
  final bool isWithFavorite;
  final bool isFavoriteScreen;
  final Color? color;
  ItemCardRectangle({
    Key? key,
    required this.product,
    this.color,
    this.isWithFavorite = false,
    this.isFavoriteScreen = false,
  }) : super(key: key);

  @override
  State<ItemCardRectangle> createState() => _ItemCardRectangleState();
}

class _ItemCardRectangleState extends State<ItemCardRectangle> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _animationDialog(context);
      },
      child: Container(
        // padding: EdgeInsets.all(16),
        margin: EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            // topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
            // bottomLeft: Radius.circular(24),
            bottomRight: Radius.circular(24),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.4),
              spreadRadius: 2,
              blurRadius: 9,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
                width: Responsive.isDesktop(context)
                    ? 160
                    : Responsive.isTablet(context)
                        ? 155
                        : Responsive.isMobile(context)
                            ? 150
                            : 100,
                height: Responsive.isDesktop(context)
                    ? 160
                    : Responsive.isTablet(context)
                        ? 155
                        : Responsive.isMobile(context)
                            ? 150
                            : 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                ),
                child: CommonUI.cachedImage(
                    widget.product.image, ImageAssets.placeholder,
                    fit: BoxFit.cover)),
            SizedBox(
              width: 16,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    ProjectLanguage.isLTR()
                        ? widget.product.nameEn
                        : widget.product.nameAr,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),

                  // SizedBox(
                  //   height: 4,
                  // ),
                  // Text(
                  //   ProjectLanguage.isLTR()
                  //       ? widget.product.descriptionEn
                  //       : widget.product.descriptionAr,
                  //   overflow: TextOverflow.ellipsis,
                  //   maxLines: 2,
                  //   style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
                  // ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    "JOD " + widget.product.price.toString(),
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        // fontStyle: FontStyle.italic,
                        fontSize: 15),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
  // CommonUI.text(
  //   context: context,
  //   text: widget.product.descriptionEn,
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
  // Row(
  //   mainAxisAlignment: MainAxisAlignment.end,
  //   children: [
  //     // widget.product.weight >= 1
  //     //     ? IconButton(
  //     //         icon: Icon(
  //     //           Icons.toggle_on,
  //     //           color: Colors.green,
  //     //           size: 35,
  //     //         ),
  //     //         onPressed: () {
  //     //           // FirebaseFirestore.instance
  //     //           //     .collection(widget.product.category)
  //     //           //     .doc(widget.product.id)
  //     //           //     .update({'weight': 0});
  //     //         })
  //     //     : IconButton(
  //     //         icon: Icon(
  //     //           Icons.toggle_off,
  //     //           color: Colors.red,
  //     //           size: 35,
  //     //         ),
  //     //         onPressed: () {
  //     //           // FirebaseFirestore.instance
  //     //           //     .collection(widget.product.category)
  //     //           //     .doc(widget.product.id)
  //     //           //     .update({'weight': 1});
  //     //         }),
  //     SizedBox(width: 20),
  //     TextButton(
  //         onPressed: () {
  //           // setState(() {
  //           //   _nameEnController = TextEditingController(
  //           //       text: widget.product.nameEn);
  //           //   _descriptionEnController = TextEditingController(
  //           //       text: widget.product.descriptionEn);
  //           //   _priceController = TextEditingController(
  //           //       text: widget.product.price.toString());
  //           //   _imageController = TextEditingController(
  //           //       text: widget.product.image);
  //           //   _value = widget.product.weight.toDouble();
  //           // });
  //           // _showEditDialog(context, widget.product);
  //         },
  //         child: Icon(Icons.edit, color: Colors.brown)),
  //     TextButton(
  //         onPressed: () {
  //           // _showDeleteDialog(context);
  //         },
  //         child: Icon(Icons.delete, color: Colors.red)),
  //   ],
  // ),

  bool _fromTop = true;

  _animationDialog(context) {
    showGeneralDialog(
      barrierDismissible: true,
      barrierLabel: "Product Animation",
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: Duration(milliseconds: 600),
      context: context,
      pageBuilder: (context, anim1, anim2) {
        //  return    showDialog(
        // context: context,
        // builder: (BuildContext context) {
        return Stack(
          children: [
            Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      // SingleChildScrollView(
                      // child:

                      SizedBox(
                        child: Stack(
                          children: <Widget>[
                            // SingleChildScrollView(
                            // child:
                            Container(
                              width: Responsive.isDesktop(context)
                                  ? Responsive.width(context) / 2
                                  : Responsive.width(context),
                              padding: EdgeInsets.only(
                                  top: kDefaultPaddin * 2,
                                  left: kDefaultPaddin,
                                  right: kDefaultPaddin,
                                  bottom: kDefaultPaddin),
                              // height: size.height *1.5,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(24),
                                  topRight: Radius.circular(24),
                                  bottomLeft: Radius.circular(24),
                                  bottomRight: Radius.circular(24),
                                ),
                              ),
                              child: Column(
                                children: [
                                  Center(
                                    child: Hero(
                                      tag: "${widget.product.id}",
                                      child: Image.network(
                                        widget.product.image,
                                        width: 300,
                                        height: 250,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(width: 10),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          SizedBox(height: 18),
                                          Text(
                                            ProjectLanguage.isLTR()
                                                ? widget.product.nameEn
                                                : widget.product.nameAr,
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline4!
                                                .copyWith(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 24),
                                          ),
                                          SizedBox(height: 12),

                                          RichText(
                                            text: TextSpan(
                                              children: [
                                                TextSpan(text: "Price\n"),
                                                TextSpan(
                                                  text:
                                                      "\$${widget.product.price}",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headline4!
                                                      .copyWith(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(height: 40),
                                          // RichText(
                                          // text: TextSpan(
                                          // style: TextStyle(color: kTextColor),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              // SizedBox(height: 35),
                                              Container(
                                                width: Responsive.isDesktop(
                                                        context)
                                                    ? Responsive.width(
                                                            context) /
                                                        2.2
                                                    : Responsive.width(
                                                            context) /
                                                        1.35,
                                                child: RichText(
                                                  text: TextSpan(
                                                    children: [
                                                      TextSpan(
                                                          text: "Description\n",
                                                          style: TextStyle(
                                                              fontSize: 15,
                                                              color:
                                                                  Colors.black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold)),
                                                      TextSpan(
                                                          text: ProjectLanguage
                                                                  .isLTR()
                                                              ? "${widget.product.descriptionEn}"
                                                              : "${widget.product.descriptionAr}",
                                                          style: TextStyle(
                                                              fontSize: 14,
                                                              color: Colors
                                                                  .black)),
                                                    ],
                                                  ),
                                                ),
                                              ),

                                              SizedBox(
                                                  height: kDefaultPaddin * 2)
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Positioned(
            //   width: 50,
            //   height: 50,
            //   top: 10,
            //   left: 320,
            //   child: FloatingActionButton(
            //     onPressed: () => Navigator.of(context).pop(),
            //     child: Icon(Icons.close),
            //   ),
            // ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: 60,
                height: 60,
                child: FloatingActionButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Icon(Icons.close),
                  
                ),
              ),
            ),
          ],
        );
      },
      transitionBuilder: (context, anim1, anim2, child) {
        return SlideTransition(
          position:
              Tween(begin: Offset(0, _fromTop ? -1 : 1), end: Offset(0, 0))
                  .animate(anim1),
          child: child,
        );
      },
    );
  }
}
