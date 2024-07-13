import 'package:child_moments/models/kid.dart';
import 'package:flutter/material.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';

class StatusDetails extends StatefulWidget {
  Kid kidView;
  // List<Kid> views = <Kid>[
  //   Kid(avatar: "assets/photos/Bills-and-plans.510a8cba.png", name: "Name"),
  //   Kid(avatar: "assets/photos/Bills-and-plans.510a8cba.png", name: "Name"),
  //   Kid(avatar: "assets/photos/Bills-and-plans.510a8cba.png", name: "Name"),
  //   Kid(avatar: "assets/photos/Bills-and-plans.510a8cba.png", name: "Name"),
  // ];

  StatusDetails({super.key, required this.kidView});

  @override
  State<StatusDetails> createState() => _StatusDetailsState();
}

class _StatusDetailsState extends State<StatusDetails> {
  bool reportisNull = true;
  String firstReport = "All";
  String dropdownValue = "2022-10-13";
  Widget PersonalInfo(IconData icon, String title, String subtitle) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      subtitle: Text(subtitle),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<String> list = <String>[
      "2022-10-13",
      '2022-11-13',
      '2022-12-13',
      '2022-10-14',
      "2022-1-15",
      "2022-10-16",
      "2022-10-17"
    ];
    List<String> reports = <String>[
      "All",
      "Food",
      "Photo",
      "Video",
      "Naps",
      "Mood",
      "Potty",
      "Note",
      "Bottle",
      "Supplies",
      "Learning"
    ];

    //////////////////////////////////////////////////////////////
    List tabs = [
      SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 20),
              height: 150,
              child: Column(children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage(widget.kidView.avatar.toString()),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(widget.kidView.firstName.toString()),
              ]),
            ),
            const Divider(),
            PersonalInfo(
                Icons.cake, "Birthday", widget.kidView.birthday.toString()),
            PersonalInfo(Icons.man_outlined, "Age", "12"),

            PersonalInfo(Icons.date_range_sharp, "Beginning Date", "10-4-2020"),
            PersonalInfo(
                Icons.date_range_outlined, "End of Status", "10-4-2020"),
            PersonalInfo(Icons.family_restroom_sharp, "Parents",
                widget.kidView.parent!.firstName.toString()),
            PersonalInfo(
                Icons.email, "Email", widget.kidView.parent!.phone.toString()),
            PersonalInfo(Icons.mobile_friendly_outlined, "Mobile",
                widget.kidView.parent!.phone.toString()),
            PersonalInfo(Icons.location_city, "Address",
                widget.kidView.address.toString()),
            // Divider()
            //   Container(
            //     padding: EdgeInsets.only(top: 20),
            //     height: 150,
            //     child: Column(children: [
            //       CircleAvatar(
            //         radius: 40,
            //         backgroundColor: Colors.amberAccent,
            //       ),
            //       SizedBox(
            //         height: 10,
            //       ),
            //       Text("data"),
            //     ]),
            //   ),
            //   Expanded(
            //     child: ListView.builder(
            //       itemCount: kidView.length,
            //       itemBuilder: ((context, index) {
            //         return ListTile(
            //           leading: CircleAvatar(
            //             backgroundImage: AssetImage(views[index].avatar.toString()),
            //           ),
            //           title: Text(views[index].name.toString()),
            //         );
            //       }),
            //     ),
            //   ),
          ],
        ),
      ),
    ];
//////////////////////////////////////////////////////////////////

    return Scaffold(
        appBar: NewGradientAppBar(
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
          //  automaticallyImplyLeading: true,
          gradient: const LinearGradient(colors: [Colors.red, Colors.blue]),
          title: const Text(
            "Child moments",
            style: TextStyle(color: Colors.white),
          ),

          // title: Row(
          //   children: [
          //     CircleAvatar(
          //       backgroundColor: Colors.amberAccent,
          //     ),
          //     Text("data"),
          //   ],
          // ),
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
            child: Column(
              children: [...tabs.map((e) => e)],
            ),
          ),
        ));
  }
}
