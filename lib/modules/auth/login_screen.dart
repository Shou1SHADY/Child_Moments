import 'package:child_moments/core/Local/shared_pref.dart';
import 'package:child_moments/cubits/auth/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../dashboard/dashboard.dart';
import 'login_screen_items.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _passC = TextEditingController();

  TextEditingController _emailC = TextEditingController();

  @override
  void dispose() {
    _passC.dispose();
    _emailC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is SuccessfulDataUsers) {
          Fluttertoast.showToast(
              msg: "data loaded successfully",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.green,
              textColor: Colors.white,
              fontSize: 16.0);
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) {
            return const Darshboard();
          }));
        }
        if (state is ErrorDataUsers) {
          Fluttertoast.showToast(
              msg: state.error,
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);
        }
      },
      builder: (context, state) {
        AuthCubit auth = AuthCubit.get(context);
        //   auth.getUsers(_emailC, _passC);
        //AuthCubit.get(context).getUsers(_emailC, _passC);
        return Scaffold(
            appBar: AppBar(
              title: const Text("Child Moments"),
              centerTitle: false,
              flexibleSpace: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: <Color>[Colors.purple, Colors.blue]),
                ),
              ),
            ),
            body: state is LoadingDataUsers
                ? Center(child: CircularProgressIndicator())
                : state is ErrorDataUsers
                    ? Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/background.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: LoginScreenWidgetsItems(
                          emailC: _emailC,
                          passC: _passC,
                        ),
                        /////////////////////////////////

                        //////////////////////
                      )
                    : Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/background.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: LoginScreenWidgetsItems(
                          emailC: _emailC,
                          passC: _passC,
                        ),
                        /////////////////////////////////

                        //////////////////////
                      ));
      },
    );
  }
}
