import 'package:child_moments/core/Network/Constant.dart';
import 'package:child_moments/cubits/auth/auth_cubit.dart';
import 'package:child_moments/layout/home_page.dart';
import 'package:child_moments/modules/dashboard/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../core/components/Custom_button.dart';
import '../../../../core/components/Text_field.dart';
import '../../core/Network/Dio.dart';
import '../childlist/child_list_screen.dart';

class LoginScreenWidgetsItems extends StatelessWidget {
  TextEditingController passC = TextEditingController();
  TextEditingController emailC = TextEditingController();

  LoginScreenWidgetsItems({Key? key, required this.emailC, required this.passC})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 300,
              width: 200,
              child: Image.asset("assets/images/logo.png"),
            ),
            const Spacer(),
            CustomTextField(
              controller: emailC,
              hintText: "Email address",
              keyBoardType: TextInputType.emailAddress,
              labelText: "Email",
              myIcon: const Icon(
                Icons.mail,
                color: Colors.red,
              ),
            ),
            CustomTextField(
              controller: passC,
              hintText: "Password",
              keyBoardType: TextInputType.text,
              labelText: "Password",
              securedText: true,
              myIcon: const Icon(
                Icons.visibility,
                color: Colors.red,
              ),
            ),
            const Spacer(),
            Container(
              height: 40,
              decoration: BoxDecoration(
                  gradient: const LinearGradient(colors: [
                    Colors.blueAccent,

                    Colors.purpleAccent
                    //add more colors
                  ]),
                  borderRadius: BorderRadius.circular(40),
                  boxShadow: const <BoxShadow>[
                    BoxShadow(
                        color:
                            Color.fromRGBO(0, 0, 0, 0.57), //shadow for button
                        blurRadius: 5) //blur radius of shadow
                  ]),
              child: CustomButton(
                buttomText: "Login",
                buttomTextSize: 18,
                buttonSize: 200,
                borderSize: 40,
                onPressed: () {
                  //////////////////////////////////////////
                  AuthCubit auth = AuthCubit.get(context);
                  auth.getUsers(emailC, passC);
////////////////////////////////////////////////////////////////

                  // if (auth.state is SuccessfulDataUsers) {
                  // Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                  //   return const Darshboard();
                  // }));
                  // }
                },
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Spacer(),
                const Text(
                  "Forget Password?",
                  style: TextStyle(color: Colors.blueGrey),
                ),
                const SizedBox(width: 10),
                const Text(
                  "Don't have account?..",
                  style: TextStyle(color: Colors.blue),
                ),
                GestureDetector(
                  child: const Text(
                    "Register",
                    style: TextStyle(color: Colors.blueGrey),
                  ),
                  onTap: () {
                    print("asasajs");
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return const MyHomePage();
                    }));

                    //         AuthCubit auth = AuthCubit.get(context);

                    //auth.getUsers(emailC, passC);
                    //        if (state is SuccessfulDataUsers) {

                    // else {
                    //   return Center(child: CircularProgressIndicator());
                    // }
                  },
                ),
                const Spacer(),
              ],
            ),
            const Spacer(),
          ],
        ),
      ),
    ]);
  }
}
