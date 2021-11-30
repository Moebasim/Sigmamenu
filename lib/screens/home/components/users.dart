import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:sigmamenu/constaints.dart';
import 'package:sigmamenu/models/user.dart';
import 'package:sigmamenu/screens/home/components/usersCard.dart';
import 'package:sigmamenu/style/CommonUI.dart';
import 'package:sigmamenu/style/ScreenUtil.dart';

class Users extends StatelessWidget {
  const Users({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('users').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return CommonUI.error(snapshot.error.toString());
          }
          if (snapshot.connectionState == ConnectionState.waiting)
            return CommonUI.loading(context);
          List<DocumentSnapshot> shots = snapshot.data!.docs;
          List<AppUser> usersList = [];
          for (var item in shots) {
            usersList.add(AppUser.fromMap(item.data() as Map<String, dynamic>));
          }
          print("Users : " + usersList.toString());

          return Expanded(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
                child: GridView.builder(
                  itemCount: usersList.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      childAspectRatio: Responsive.isDesktop(context)
                          ? MediaQuery.of(context).size.width /
                              (MediaQuery.of(context).size.height / 3.5)
                          : MediaQuery.of(context).size.width /
                              (MediaQuery.of(context).size.height / 2.7)),
                  itemBuilder: (context, index) =>
                      UsersCard(data: usersList[index]),
                )),
          );
        });
  }
}