import 'package:flutter/material.dart';

import '../../my_bills.dart';

class PaymentProofText extends StatelessWidget {
  const PaymentProofText({super.key});

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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
              ),
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
