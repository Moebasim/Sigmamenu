import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sigmamenu/constaints.dart';
import 'package:sigmamenu/language/logic/ProjectLanguage.dart';
import 'package:sigmamenu/models/product.dart';
import 'package:sigmamenu/style/AssetsManager.dart';
import 'package:sigmamenu/style/CommonUI.dart';
import 'package:sigmamenu/style/ScreenUtil.dart';
import '../../../style/Style.dart';

class ItemCardRectangle extends StatefulWidget {
  final Product product;
  // final bool isWithFavorite;
  // final bool isFavoriteScreen;
  ItemCardRectangle({
    Key? key,
    required this.product,
    // this.isWithFavorite = false,
    // this.isFavoriteScreen = false,
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
        margin: EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(24),
            bottomRight: Radius.circular(24),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 9,
              offset: Offset(1, 9),
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
                    height: 12,
                  ),
                  CommonUI.text(
                    context: context,
                    text: ProjectLanguage.isLTR()
                        ? widget.product.nameEn
                        : widget.product.nameAr,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    style: FontStyle.normal(
                        context: context,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  SizedBox(height: 6),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CommonUI.text(
                          context: context,
                          text: 'JOD ',
                          textAlign: TextAlign.center,
                          style: FontStyle.normal(
                              context: context,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                      CommonUI.text(
                          context: context,
                          text: widget.product.price.toString(),
                          textAlign: TextAlign.center,
                          style: FontStyle.normal(
                              context: context,
                              fontWeight: FontWeight.bold,
                              color: Colors.red)),
                    ],
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  CommonUI.text(
                    context: context,
                    text: ProjectLanguage.isLTR()
                        ? widget.product.descriptionEn
                        : widget.product.descriptionAr,
                    textAlign: TextAlign.start,
                    maxLines: 3,
                    style: FontStyle.smaller(
                        context: context,
                        fontWeight: FontWeight.bold,
                        color: Colors.black.withOpacity(0.7)),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  bool _fromTop = true;

  _animationDialog(context) {
    showGeneralDialog(
      barrierDismissible: true,
      barrierLabel: "Product Animation",
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: Duration(milliseconds: 600),
      context: context,
      pageBuilder: (context, anim1, anim2) {
        return Dismissible(
          direction: DismissDirection.vertical,
          onDismissed: (_) {
            Navigator.of(context).pop();
          },
          key: Key("key"),
          child: SafeArea(
            child: SizedBox.expand(
              child: Stack(
                children: [
                  Center(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              child: Stack(
                                children: <Widget>[
                                  Container(
                                    width: Responsive.isDesktop(context)
                                        ? Responsive.width(context) / 2
                                        : Responsive.width(context),
                                    padding: EdgeInsets.only(
                                        top: kDefaultPaddin * 2,
                                        left: kDefaultPaddin,
                                        right: kDefaultPaddin,
                                        bottom: kDefaultPaddin),
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
                                                          fontWeight:
                                                              FontWeight.bold,
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
                                                              color:
                                                                  Colors.black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(height: 40),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      width: Responsive
                                                              .isDesktop(
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
                                                                text:
                                                                    "Description\n",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        15,
                                                                    color: Colors
                                                                        .black,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold)),
                                                            TextSpan(
                                                                text: ProjectLanguage
                                                                        .isLTR()
                                                                    ? "${widget.product.descriptionEn}"
                                                                    : "${widget.product.descriptionAr}",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        14,
                                                                    color: Colors
                                                                        .black)),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                        height:
                                                            kDefaultPaddin * 2)
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
                  // Align(
                  //   alignment: Alignment.bottomCenter,
                  //   child: Container(
                  //     width: 60,
                  //     height: 60,
                  //     child: FloatingActionButton(
                  //       onPressed: () => Navigator.of(context).pop(),
                  //       child: Icon(Icons.close),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
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
