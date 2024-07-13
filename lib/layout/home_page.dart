import 'package:child_moments/cubits/home/home_cubit.dart';
import 'package:child_moments/modules/auth/login_screen.dart';
import 'package:child_moments/modules/dashboard/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _passwordVisible = true;

  List<String> list = <String>['Egypt', 'Saudi Arabia', 'three', 'Four'];

  final _formKey = GlobalKey<FormState>();
  String dropdownValue = 'Egypt';
  final _controller1 = TextEditingController();

  final _controller2 = TextEditingController();
  final _controller3 = TextEditingController();
  final _controller4 = TextEditingController();

  final _controller5 = TextEditingController();

  final _controller6 = TextEditingController();
  final _controller7 = TextEditingController();
  final _controller8 = TextEditingController();
  final _controller9 = TextEditingController();
  Widget SchoolName() {
    return Container(
      margin: EdgeInsets.only(left: 30.w, right: 30.w, top: 20.h),
      child: TextFormField(
        //  autovalidateMode: AutovalidateMode.always,
        controller: _controller7,
        maxLines: 1,
        validator: ((value) {
          if (value!.isEmpty ||
              !(RegExp(r'^[a-z A-Z 0-9]+$').hasMatch(value))) {
            return "Enter Correct Name";
          } else {
            return null;
          }
        }),
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          hintText: "School Name",
          labelText: "School Name",
        ),
      ),
    );
  }

  Widget SchoolId() {
    return Container(
      margin: EdgeInsets.only(left: 30.w, right: 30.w),
      child: TextFormField(
        //  autovalidateMode: AutovalidateMode.always,
        controller: _controller8,
        maxLines: 1,
        validator: ((value) {
          if (value!.isEmpty ||
              !(RegExp(r'^[a-z A-Z 0-9]+$').hasMatch(value))) {
            return "Enter Correct ID";
          } else {
            return null;
          }
        }),
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          hintText: "School ID",
          labelText: "School ID",
        ),
      ),
    );
  }

  Widget email() {
    return Container(
      margin: EdgeInsets.only(
        left: 30.w,
        right: 30.w,
      ),
      child: TextFormField(
        //  autovalidateMode: AutovalidateMode.always,
        controller: _controller1,
        maxLines: 1,
        validator: ((value) {
          if (value!.isEmpty ||
              !(RegExp(
                      r'^[a-z A-Z]([\w]|-|[\.])*[@]{1}[a-z A-Z]{5,8}[\.]{1}[a-z A-Z]{2,3}$')
                  .hasMatch(value))) {
            return "Enter Correct Email";
          } else {
            return null;
          }
        }),
        decoration: InputDecoration(
          suffixIcon: Icon(
            Icons.mail,
            color: Theme.of(context).primaryColorDark,
          ),
          border: const OutlineInputBorder(),
          hintText: "Name@gmail.com",
          labelText: "Email",
        ),
      ),
    );
  }

  Widget City() {
    return Container(
      margin: EdgeInsets.only(left: 30.w, right: 30.w),
      child: TextFormField(
        //  autovalidateMode: AutovalidateMode.always,
        controller: _controller9,
        maxLines: 1,
        validator: ((value) {
          if (value!.isEmpty ||
              !(RegExp(r'^[a-z A-Z]{3,100}$').hasMatch(value))) {
            return "Enter Correct City";
          } else {
            return null;
          }
        }),
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          hintText: "Cairo",
          labelText: "City",
        ),
      ),
    );
  }

  Widget Address() {
    return Container(
      margin: EdgeInsets.only(left: 30.w, right: 30.w),
      child: TextFormField(
        //  autovalidateMode: AutovalidateMode.always,
        controller: _controller3,
        maxLines: 1,
        validator: ((value) {
          if (value!.isEmpty ||
              !(RegExp(r'^\d{1,5}\s\w.\s(\b\w*\b\s){1,2}\w*\$')
                  .hasMatch(value))) {
            return "Enter Correct Adress";
          } else {
            return null;
          }
        }),
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          hintText: "253 N. Cherry St.",
          labelText: "Address",
        ),
      ),
    );
  }

  Widget password() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30.w),
      child: TextFormField(
        validator: (value) {
          if (value!.isEmpty ||
              !(RegExp(r'^[a-z A-Z]{1}[\w]*$')).hasMatch(value)) {
            return ("Enter Correct Password");
          } else {
            return null;
          }
        },
        controller: _controller2,
        maxLines: 1,
        obscureText: _passwordVisible,
        // autovalidateMode: AutovalidateMode.always,
        decoration: InputDecoration(
          suffixIcon: IconButton(
            icon: Icon(
              // Based on passwordVisible state choose the icon
              _passwordVisible ? Icons.visibility_off : Icons.visibility,
              color: Theme.of(context).primaryColorDark,
            ),
            onPressed: () {
              // Update the state i.e. toogle the state of passwordVisible variable
              setState(() {
                _passwordVisible = !_passwordVisible;
              });
            },
          ),
          hintText: "Password",
          labelText: "Password",
          border: const OutlineInputBorder(),
          focusedBorder: const OutlineInputBorder(),
        ),
      ),
    );
  }

  Widget mobile() {
    return Container(
      margin: EdgeInsets.only(left: 30.w, right: 30.w, top: 10.h),
      child: TextFormField(
        //  autovalidateMode: AutovalidateMode.always,
        controller: _controller4,
        maxLines: 1,
        validator: ((value) {
          if (value!.isEmpty ||
              !(RegExp(r'^([+]\d{2})?\d{10}$').hasMatch(value))) {
            return "Enter Correct Mobile";
          } else {
            return null;
          }
        }),
        decoration: InputDecoration(
          suffixIcon: Icon(
            Icons.call,
            color: Theme.of(context).primaryColorDark,
          ),
          border: const OutlineInputBorder(),
          hintText: "+910123456789 or 0123456789",
          labelText: "Mobile",
        ),
      ),
    );
  }

  Widget FirstName() {
    return Container(
      margin: EdgeInsets.only(left: 30.w, right: 10.w),
      child: TextFormField(
        //  autovalidateMode: AutovalidateMode.always,
        controller: _controller5,
        maxLines: 1,
        validator: ((value) {
          if (value!.isEmpty || !(RegExp(r'^[a-z A-Z]+]$').hasMatch(value))) {
            return "Enter Correct Name";
          } else {
            return null;
          }
        }),
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          hintText: "Shady",
          labelText: "First Name",
        ),
      ),
    );
  }

  Widget LastName() {
    return Container(
      margin: EdgeInsets.only(left: 10.w, right: 30.w),
      child: TextFormField(
        //  autovalidateMode: AutovalidateMode.always,
        controller: _controller6,
        maxLines: 1,
        validator: ((value) {
          if (value!.isEmpty || !(RegExp(r'^[a-z A-Z]+]$').hasMatch(value))) {
            return "Enter Correct Name";
          } else {
            return null;
          }
        }),
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          hintText: "Osama",
          labelText: "Last Name",
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
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
        HomeCubit register = HomeCubit.get(context);
        return Scaffold(
          appBar: NewGradientAppBar(
            iconTheme: const IconThemeData(
              color: Colors.white,
            ),
            //  automaticallyImplyLeading: true,
            gradient: const LinearGradient(colors: [Colors.red, Colors.blue]),
            elevation: 4,
            title: const Text(
              "Child Moments",
              style: TextStyle(color: Colors.white),
            ),
          ),
          body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/photos/background.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 20.h),
                      height: 150.h,
                      width: 120.w,
                      child: Image.asset("assets/logos/logo.png"),
                    ),
                    Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      right: 30.w, left: 30.w, top: 20.h),
                                  child: Text(
                                    "School Information",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 20.sp),
                                  ),
                                ),
                                SchoolName(),
                                SizedBox(
                                  height: 10.h,
                                ),
                                SchoolId(),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Row(
                                  children: [
                                    Container(
                                      width: 187.w,
                                      padding: const EdgeInsets.all(5),
                                      decoration: const ShapeDecoration(
                                        shape: RoundedRectangleBorder(
                                          side: BorderSide(
                                              color: Colors.grey,
                                              width: 1.1,
                                              style: BorderStyle.solid),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5.0)),
                                        ),
                                      ),
                                      margin: EdgeInsets.only(left: 30.w),
                                      child: DropdownButtonHideUnderline(
                                        child: DropdownButton<String>(
                                          value: dropdownValue,
                                          icon:
                                              const Icon(Icons.arrow_downward),
                                          elevation: 16,
                                          style: const TextStyle(
                                              color: Colors.black),
                                          underline: Container(
                                            height: 2,
                                            color: Colors.black,
                                          ),
                                          onChanged: (String? value) {
                                            // This is called when the user selects an item.
                                            setState(() {
                                              dropdownValue = value!;
                                            });
                                          },
                                          items: list
                                              .map<DropdownMenuItem<String>>(
                                                  (String value) {
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: Text(value),
                                            );
                                          }).toList(),
                                        ),
                                      ),
                                    ),
                                    Expanded(child: City())
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Address(),
                                const SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                            const Divider(),
                            SizedBox(
                              height: 10.h,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      right: 30.w, left: 30.w, bottom: 20.h),
                                  child: Text(
                                    "School Information",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 20.sp),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Expanded(child: FirstName()),
                                    Expanded(child: LastName())
                                  ],
                                ),
                                mobile(),
                                const SizedBox(
                                  height: 10,
                                ),
                                email(),
                                const SizedBox(
                                  height: 10,
                                ),
                                password(),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Divider(),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                textStyle: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontStyle: FontStyle.normal),
                              ),
                              onPressed: () {
                                if (_controller1.toString().isNotEmpty) {
                                  register.RegisterUsers(
                                      _controller7,
                                      _controller1,
                                      _controller2,
                                      _controller8,
                                      dropdownValue,
                                      _controller9,
                                      _controller3,
                                      _controller5,
                                      _controller6,
                                      _controller4);
                                }
                              },
                              child: const Text('Sign Up'),
                            ),
                            TextButton(
                                onPressed: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => LoginScreen(),
                                      ));
                                },
                                child: const Text("Already Subscribed"))
                          ],
                        ))
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
