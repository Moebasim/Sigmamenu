import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:shop_app/Authentication/ProjectFirebaseAuth.dart';
import 'package:shop_app/animation/fadeAnimation.dart';
import 'package:shop_app/language/logic/ProjectLanguage.dart';
import 'package:shop_app/screens/home/components/SigningButton.dart';
import 'package:shop_app/screens/widgets/ForgotPassword.dart';
import 'package:shop_app/screens/widgets/vSpace.dart';
import 'package:shop_app/style/ScreenUtil.dart';
import 'package:shop_app/style/Style.dart';

class LoginForm extends StatefulWidget {
  final VoidCallback click;
  const LoginForm({Key? key, required this.click}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormBuilderState>();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  bool hidePassword = true;

  @override
  Widget build(BuildContext context) {
    void submit() async {
      _formKey.currentState!.save();
      // FocusScope.of(context).unfocus();
      if (_formKey.currentState!.validate()) {
        await ProjectFirebaseAuth()
            .login(email.text, password.text)
            .then((value) {
          if (value is UserCredential) {
            Navigator.pop(context);
          } else {
            showDialog(
                context: context,
                builder: (_) {
                  return AlertDialog(
                    content: Text(value.toString()),
                  );
                });
          }
        });
      }
    }

    return ProjectFadeIn(
      durationMS: 200,
      child: Column(
        children: [
          FormBuilder(
            key: _formKey,
            child: Column(
              children: [
                /// email TextField
                TextFormField(
                  controller: email,
                  onFieldSubmitted: (value) => submit(),
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(color: Colors.brown),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(color: Colors.brown),
                      ),
                      hintText: translate(
                        context,
                        "email",
                      ),
                      prefixIcon: Icon(Icons.email, color: Colors.brown),
                      hintStyle: FontStyle.normal(
                          context: context, color: Colors.brown)),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(context),
                    FormBuilderValidators.email(context),
                  ]),
                ),
                SizedBox(height: 16),

                /// password TextField
                TextFormField(
                  controller: password,
                  obscureText: hidePassword,
                  onFieldSubmitted: (valr) => submit(),
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            hidePassword = !hidePassword;
                          });
                        },
                        icon: Icon(
                            hidePassword
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.brown),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(color: Colors.brown),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(color: Colors.brown),
                      ),
                      hintText: translate(context, "password"),
                      prefixIcon: Icon(Icons.lock, color: Colors.brown),
                      hintStyle: FontStyle.normal(
                          context: context, color: Colors.brown)),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(context),
                    FormBuilderValidators.minLength(context, 6),
                  ]),
                ),

                FortgotPasswordButton(ctx: context),
              ],
            ),
          ),
          SizedBox(height: 16),
          SigningButton(
              text: translate(context, "login"),
              onPressed: () => submit(),
              textStyle: Responsive.isDesktop(context)
                  ? FontStyle.small(
                      context: context,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)
                  : null,
              color: Colors.brown,
              textColor: Colors.white),
          const SizedBox(height: 16),
          // GuestLogin(),
          const VSpace(),
          Wrap(
            spacing: 2,
            children: [
              Text(
                translate(
                  context,
                  "noAccount",
                ),
                style: FontStyle.normal(
                    context: context,
                    color: Colors.brown[300],
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(width: 8),
              InkWell(
                  onTap: widget.click,
                  child: Text(
                    translate(context, "signup"),
                    style: FontStyle.normal(
                        context: context,
                        fontWeight: FontWeight.bold,
                        color: Colors.brown),
                  ))
            ],
          )
        ],
      ),
    );
  }
}