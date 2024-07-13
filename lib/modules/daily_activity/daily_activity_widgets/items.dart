import 'package:child_moments/models/child_info.dart';
import 'package:flutter/material.dart';

import 'activity_calender.dart';

class PersonalInfo extends StatelessWidget {
  PersonalInfo({super.key});

  var myChildInfo = ChildInfo(
      name: "name",
      age: "age",
      birthDay: "birthDay",
      gender: "gender",
      allegries: "allegries",
      medications: "medications",
      parent: "parent",
      email: "email",
      mobile: "mobile",
      address: "address");

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Row(
              children: [
                const Icon(Icons.cake),
                const SizedBox(
                  width: 5,
                ),
                const Text("Birthday"),
                const Spacer(),
                Text(myChildInfo.birthDay.toString()),
                const Spacer(),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 10),
            child: Row(
              children: [
                const Icon(Icons.female),
                const SizedBox(
                  width: 5,
                ),
                const Text("Gender"),
                const Spacer(),
                Text(myChildInfo.gender.toString()),
                const Spacer(),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 10),
            child: Row(
              children: [
                const Icon(Icons.do_not_touch),
                const SizedBox(
                  width: 5,
                ),
                const Text("Allergies"),
                const Spacer(),
                Text(myChildInfo.allegries.toString()),
                const Spacer(),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 10),
            child: Row(
              children: [
                const Icon(Icons.medication),
                const SizedBox(
                  width: 5,
                ),
                const Text("Medications"),
                const Spacer(),
                Text(myChildInfo.medications.toString()),
                const Spacer(),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 10),
            child: Row(
              children: [
                const Icon(Icons.man),
                const SizedBox(
                  width: 5,
                ),
                const Text("Parent"),
                const Spacer(),
                Text(myChildInfo.parent.toString()),
                const Spacer(),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 10),
            child: Row(
              children: [
                const Icon(Icons.email),
                const SizedBox(
                  width: 5,
                ),
                const Text("Email"),
                const Spacer(),
                Text(myChildInfo.email.toString()),
                const Spacer(),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 10),
            child: Row(
              children: [
                const Icon(Icons.mobile_friendly),
                const SizedBox(
                  width: 5,
                ),
                const Text("Mobile"),
                const Spacer(),
                Text(myChildInfo.mobile.toString()),
                const Spacer(),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 10),
            child: Row(
              children: [
                const Icon(Icons.location_city),
                const SizedBox(
                  width: 5,
                ),
                const Text("Address"),
                const Spacer(),
                Text(myChildInfo.address.toString()),
                const Spacer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DailyReport extends StatelessWidget {
  const DailyReport({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        // Text("1"),
        // Text("1"),
        // Text("1"),
        // Text("1"),
        // Text("1"),

        ActivityCalender(),
      ],
    );
  }
}
