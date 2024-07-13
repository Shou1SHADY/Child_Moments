import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

import 'dart:io';
import 'package:image_picker/image_picker.dart';

import '../../../models/profile_model.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  File? _image;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = File(pickedFile!.path);
    });
  }

  final oldpassword = TextEditingController();
  final newPassword = TextEditingController();
  final confirmNewPassword = TextEditingController();
  bool isVisiableOldPass = true;
  bool isVisiableNewPass = true;
  bool isVisiableConfirmNewPass = true;

  void showPassword(bool obsecureText) {
    setState(() {
      obsecureText = !obsecureText;
    });
  }

  var profile = ProfileModel('email', 'address', 'phone');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text("Profile"),
        actions: [
          Badge(
            position: BadgePosition.topEnd(top: 10, end: 10),
            badgeContent: const Text("1"),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.add_alert_outlined),
            ),
          ),
        ],
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: <Color>[Colors.purple, Colors.blue]),
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 320,
              child: Stack(
                children: [
                  Positioned(
                    left: MediaQuery.of(context).size.width / 8,
                    top: MediaQuery.of(context).size.width / 1.5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [],
                    ),
                  ),
                  Container(
                    height: 100,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: <Color>[Colors.purple, Colors.blue]),
                    ),
                  ),
                  Positioned(
                    right: MediaQuery.of(context).size.width / 8,
                    top: 30,
                    child: Container(
                      height: 150,
                      width: 300,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(30),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Stack(
                            children: [
                              CircleAvatar(
                                radius: 50,
                                backgroundImage: _image != null
                                    ? Image.file(
                                        _image!,
                                        fit: BoxFit.cover,
                                      ).image
                                    : const AssetImage(
                                        'assets/images/child.png'),
                              ),
                              Positioned(
                                right: -10,
                                bottom: -7,
                                child: IconButton(
                                    onPressed: () async {
                                      await getImage();
                                    },
                                    icon: const Icon(Icons.camera_enhance)),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text('Name'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 1,
            ),
            const Text('Basic Information',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
            Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: SizedBox(
                height: 50,
                width: 300,
                child: Opacity(
                  opacity: 0.5,
                  child: ListTile(
                    leading: const Icon(Icons.email),
                    title: Text(profile.email.toString()),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: SizedBox(
                height: 50,
                width: 300,
                child: Opacity(
                  opacity: 0.5,
                  child: ListTile(
                    leading: const Icon(Icons.location_pin),
                    title: Text(profile.address.toString()),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: SizedBox(
                height: 50,
                width: 300,
                child: Opacity(
                  opacity: 1,
                  child: ListTile(
                    leading: const Icon(Icons.phone),
                    title: Text(profile.phone.toString()),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text('Privacy',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
            SizedBox(
              height: 100,
              width: 300,
              child: ListTile(
                leading: const Icon(Icons.lock),
                title: const Text('My Password'),
                trailing: InkWell(
                    onTap: () {
                      newMethod(context);
                    },
                    child: const Icon(Icons.edit)),
              ),
            ),
            ElevatedButton.icon(
              style:
                  ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent),
              onPressed: () {},
              icon: const Icon(Icons.lock, color: Colors.white),
              label: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }

  void newMethod(BuildContext context) {
    final oldpassword = TextEditingController();
    final newPassword = TextEditingController();
    final confirmNewPassword = TextEditingController();
    bool isVisiableOldPass = true;
    bool isVisiableNewPass = true;
    bool isVisiableConfirmNewPass = true;
    bool passCorrect = false;

    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: const Text("Update Password"),
              content: SingleChildScrollView(
                child: ListBody(
                  children: [
                    Visibility(
                        visible: passCorrect,
                        child: const Text(
                          'New Password not same',
                          style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        )),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        obscureText: isVisiableOldPass,
                        controller: oldpassword,
                        decoration: InputDecoration(
                          hintText: 'Current Password',
                          suffixIcon: IconButton(
                            icon: isVisiableOldPass
                                ? const Icon(Icons.visibility_off)
                                : const Icon(Icons.visibility),
                            onPressed: () {
                              setState(() {
                                isVisiableOldPass = !isVisiableOldPass;
                              });
                            },
                          ),
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        obscureText: isVisiableNewPass,
                        controller: newPassword,
                        decoration: InputDecoration(
                          hintText: 'New Password',
                          suffixIcon: IconButton(
                            icon: isVisiableNewPass
                                ? const Icon(Icons.visibility_off)
                                : const Icon(Icons.visibility),
                            onPressed: () {
                              setState(() {
                                isVisiableNewPass = !isVisiableNewPass;
                              });
                            },
                          ),
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        obscureText: isVisiableConfirmNewPass,
                        controller: confirmNewPassword,
                        decoration: InputDecoration(
                          hintText: 'Confirm Password',
                          suffixIcon: IconButton(
                            icon: isVisiableConfirmNewPass
                                ? const Icon(Icons.visibility_off)
                                : const Icon(Icons.visibility),
                            onPressed: () {
                              setState(() {
                                isVisiableConfirmNewPass =
                                    !isVisiableConfirmNewPass;
                              });
                            },
                          ),
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("Cancel"),
                ),
                TextButton(
                  onPressed: () {
                    if (newPassword == confirmNewPassword) {
                      print('Correct');

                      setState(() {
                        passCorrect = false;
                      });
                    } else {
                      print('Not Same');
                      setState(() {
                        passCorrect = true;
                      });
                    }
                  },
                  child: const Text("Save"),
                ),
              ],
            );
          },
        );
      },
    );
    // showDialog(
    //   context: context,
    //   builder: (BuildContext context) {
    //     return AlertDialog(
    //       title: Text('Update Password'),
    //       content: SingleChildScrollView(
    //         child: ListBody(
    //           children: [
    //             Padding(
    //               padding: const EdgeInsets.all(8.0),
    //               child: TextFormField(
    //                 obscureText: isVisiableOldPass,
    //                 controller: oldpassword,
    //                 decoration: InputDecoration(
    //                   hintText: 'Current Password',
    //                   suffixIcon: IconButton(
    //                     icon: isVisiableOldPass
    //                         ? Icon(Icons.visibility_off)
    //                         : Icon(Icons.visibility),
    //                     onPressed: () {
    //                       showPassword(isVisiableOldPass);
    //                     },
    //                   ),
    //                   border: OutlineInputBorder(
    //                     borderRadius: BorderRadius.all(
    //                       Radius.circular(20),
    //                     ),
    //                   ),
    //                 ),
    //               ),
    //             ),
    //             Padding(
    //               padding: const EdgeInsets.all(8.0),
    //               child: TextFormField(
    //                 controller: newPassword,
    //                 decoration: InputDecoration(
    //                   hintText: 'New Password',
    //                   suffixIcon: Icon(Icons.visibility_off),
    //                   border: OutlineInputBorder(
    //                     borderRadius: BorderRadius.all(
    //                       Radius.circular(20),
    //                     ),
    //                   ),
    //                 ),
    //               ),
    //             ),
    //             Padding(
    //               padding: const EdgeInsets.all(8.0),
    //               child: TextFormField(
    //                 controller: confirmNewPassword,
    //                 decoration: InputDecoration(
    //                   hintText: 'Confirm Password',
    //                   suffixIcon: Icon(Icons.visibility_off),
    //                   border: OutlineInputBorder(
    //                     borderRadius: BorderRadius.all(
    //                       Radius.circular(20),
    //                     ),
    //                   ),
    //                 ),
    //               ),
    //             ),
    //           ],
    //         ),
    //       ),
    //       actions: [
    //         ElevatedButton(
    //           child: new Text('Reset'),
    //           onPressed: () {
    //             Navigator.of(context).pop();
    //           },
    //         ),
    //         ElevatedButton(
    //           child: new Text('Ok'),
    //           onPressed: () {
    //             Navigator.of(context).pop();
    //           },
    //         ),
    //       ],
    //     );
    //   },
    // );
  }
}
