import 'package:flutter/material.dart';
import "package:images_picker/images_picker.dart";

import '../../my_bills.dart';

class PaymentProofPhoto extends StatelessWidget {
  const PaymentProofPhoto({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20))),
      width: 300,
      height: 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Please provide a proof"),
          InkWell(
            onTap: () async {
              await getImage();
            },
            child: SizedBox(
              width: 100,
              height: 100,
              child: Image.asset("assets/images/camera.png"),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                    return const MyBills();
                  }));
                },
                child: const Text("Cancel"),
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text("Submit"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

Future getImage() async {
  List<Media>? res = await ImagesPicker.pick(
    count: 3,
    pickType: PickType.image,
  );
// Media
// .path
// .thumbPath (path for video thumb)
// .size (kb)
}
