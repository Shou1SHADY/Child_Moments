import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ManagerProfile extends StatefulWidget {
  const ManagerProfile({super.key});

  @override
  State<ManagerProfile> createState() => _ManagerProfileState();
}

class _ManagerProfileState extends State<ManagerProfile> {
  final _formKey = GlobalKey<FormState>();
  bool _passwordVisible = true;
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
      margin: const EdgeInsets.only(left: 30, right: 30, top: 30),
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
      margin: const EdgeInsets.only(left: 30, right: 30),
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
      margin: const EdgeInsets.only(left: 30, right: 30, top: 30),
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
        decoration: const InputDecoration(
          suffixIcon: Icon(
            Icons.mail,
            color: Colors.blue,
          ),
          border: OutlineInputBorder(),
          hintText: "Name@gmail.com",
          labelText: "Email",
        ),
      ),
    );
  }

  Widget City() {
    return Container(
      margin: const EdgeInsets.only(left: 30, right: 30),
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
      margin: const EdgeInsets.only(left: 30, right: 30),
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
      margin: const EdgeInsets.symmetric(horizontal: 30),
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
      margin: const EdgeInsets.only(left: 30, right: 30),
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
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          hintText: "+910123456789 or 0123456789",
          labelText: "Mobile",
        ),
      ),
    );
  }

  Widget FirstName() {
    return Container(
      margin: const EdgeInsets.only(left: 30, right: 10, top: 20),
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
      margin: const EdgeInsets.only(left: 10, right: 30, top: 20),
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
    return Scaffold(
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
            child: Column(
          children: [
            SizedBox(
              height: 320.h,
              child: Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 120,
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        Colors.red,
                        Colors.indigo,
                      ],
                    )),
                  ),
                  Positioned(
                    top: 58.h,
                    left: 29.5.w,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      height: 230.h,
                      width: 300.w,
                      decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromARGB(255, 33, 45, 117),
                              offset: Offset(
                                0.0,
                                0.0,
                              ),
                              blurRadius: 5.0,
                              spreadRadius: 1.0,
                            ),
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 20.h),
                            height: 110.h,
                            width: 120.w,
                            decoration: BoxDecoration(
                                image: const DecorationImage(
                                    image: AssetImage(
                                        "assets/photos/6C983E0B-BA17-48B2-A38F-C148CED65EEF.jpeg"),
                                    fit: BoxFit.fill),
                                borderRadius: BorderRadius.circular(20)),
                            //       "assets/photos/6C983E0B-BA17-48B2-A38F-C148CED65EEF.jpeg"),
                          ),
                          const Text("data"),
                          const Divider(),
                          Row(
                            children: [
                              Column(
                                children: const [
                                  Text("1"),
                                  Text(
                                    "Students",
                                    style: TextStyle(color: Colors.grey),
                                  )
                                ],
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Container(
                                width: 1,
                                height: 50,
                                color: const Color.fromARGB(255, 199, 199, 199),
                              ),
                              SizedBox(
                                width: 15.w,
                              ),
                              Column(
                                children: const [
                                  Text("2"),
                                  Text(
                                    "Teachers",
                                    style: TextStyle(color: Colors.grey),
                                  )
                                ],
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Container(
                                width: 1,
                                height: 50,
                                color: const Color.fromARGB(255, 199, 199, 199),
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Column(
                                children: const [
                                  Text("1"),
                                  Text(
                                    "Room Name",
                                    style: TextStyle(color: Colors.grey),
                                  )
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                      child: IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ))
                ],
              ),
            ),

            ///////////////////////////////////////////////////////

            Form(
                key: _formKey,
                child: Column(
                  children: [
                    SchoolName(),
                    const SizedBox(
                      height: 10,
                    ),
                    SchoolId(),
                    const SizedBox(
                      height: 10,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Address(),
                    const SizedBox(
                      height: 10,
                    ),
                    mobile(),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(child: FirstName()),
                        Expanded(child: LastName())
                      ],
                    ),
                    email(),
                    const SizedBox(
                      height: 10,
                    ),
                    password(),
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        textStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontStyle: FontStyle.normal),
                      ),
                      onPressed: () {
                        //Navigator.push(context,
                        //    MaterialPageRoute(builder: (_) => Darshboard()));
                      },
                      child: const Text('Sign Up'),
                    ),
                    TextButton(
                        onPressed: () {},
                        child: const Text("Already Subscribed"))
                  ],
                ))
          ],
        )),
      ),
    );
  }
}
