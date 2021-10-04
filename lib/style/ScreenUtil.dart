import 'package:flutter/material.dart';

//~~ Zuhair
// to choose what screen type we have
class ScreenUtil extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;

  /// to know screens type if it mobile, tablet, web
  const ScreenUtil({
    Key? key,
    required this.mobile,
    required this.tablet,
    required this.desktop,
  }) : super(key: key);

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 650;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < 1100 &&
      MediaQuery.of(context).size.width >= 650;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1100;

  static double height(BuildContext context) =>
      MediaQuery.of(context).size.height;
  static double width(BuildContext context) =>
      MediaQuery.of(context).size.width;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= 1100) {
          return desktop;
        } else if (constraints.maxWidth >= 600) {
          return tablet;
        } else {
          return mobile;
        }
      },
    );
  }
}

// to convarte Row to column depends on screen size
class ScreenRowColumn extends StatelessWidget {
  final List<Widget>? children;
  final MainAxisAlignment? mainAxisAlignment;
  final CrossAxisAlignment? crossAxisAlignment;

  /// This widget convert the Row to Column based on your Screen Size (Desktop or Mobile)
  const ScreenRowColumn(
      {Key? key,
      this.children,
      this.mainAxisAlignment,
      this.crossAxisAlignment})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (ScreenUtil.isDesktop(context)) {
      return Row(
        mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
        crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.center,
        children: children!,
      );
    } else {
      return Column(
        crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.center,
        mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
        children: children!,
      );
    }
  }
}

// to convarte List view uilder to grid view builder also depends on sizeScreen
class ListGridLayout extends StatelessWidget {
  final int itemCount;
  final Widget Function(BuildContext, int) itemBuilder;
  final double childAspectRatio;
  final int crossAxisCount;
  final double maxCrossAxisExtent;

  const ListGridLayout(
      {Key? key,
      required this.itemCount,
      required this.itemBuilder,
      this.childAspectRatio = 1,
      this.crossAxisCount = 2,
      this.maxCrossAxisExtent = 200})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (ScreenUtil.isDesktop(context)) {
      return GridView.builder(
        itemCount: itemCount,
        itemBuilder: itemBuilder,
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          childAspectRatio: childAspectRatio,
          maxCrossAxisExtent: maxCrossAxisExtent,
        ),
      );
    } else {
      return ListView.builder(
        shrinkWrap: true,
        itemCount: itemCount,
        itemBuilder: itemBuilder,
      );
    }
  }
}

class ListForWebGridForMobileLayout extends StatelessWidget {
  final int itemCount;
  final Widget Function(BuildContext, int) itemBuilder;
  final double childAspectRatio;
  final int crossAxisCount;
  final double maxCrossAxisExtent;
  final ScrollPhysics? physics;

  /// to convarte List view builder to grid view builder also depends on sizeScreen
  const ListForWebGridForMobileLayout(
      {Key? key,
      required this.itemCount,
      required this.itemBuilder,
      this.childAspectRatio = 1,
      this.crossAxisCount = 2,
      this.maxCrossAxisExtent = 200,
      this.physics})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (ScreenUtil.isMobile(context)) {
      return GridView.builder(
        itemCount: itemCount,
        itemBuilder: itemBuilder,
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          childAspectRatio: childAspectRatio,
          maxCrossAxisExtent: maxCrossAxisExtent,
        ),
      );
    } else {
      return ListView.builder(
          shrinkWrap: true,
          itemCount: itemCount,
          itemBuilder: itemBuilder,
          scrollDirection: Axis.horizontal,
          physics: physics);
    }
  }
}
