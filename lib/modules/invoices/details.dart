import "package:flutter/material.dart";

import '../../models/invoice.dart';

class Details extends StatelessWidget {
  Details({super.key, this.invoice, Object? message});

  Invoice? invoice;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Child moments"),
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
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 20),
                  height: 150,
                  child: Column(children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: invoice != null
                          ? AssetImage(invoice!.kid.avatar.toString())
                          : const AssetImage("assets/logos/logo.png"),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: invoice != null
                          ? Text(invoice!.kid.firstName.toString())
                          : const Text("No Name provided"),
                    ),
                  ]),
                ),
                const Divider(),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: invoice != null
                      ? Text(invoice!.id.toString())
                      : const Text("No Id provided"),
                ),
                const Divider(),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: invoice != null
                      ? Text(invoice!.dueDate.toString())
                      : const Text("No Due Date provided"),
                ),
                const Divider(),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: invoice != null
                      ? Text(invoice!.amount.toString())
                      : const Text("No Specific Amount provided"),
                ),
                const Divider(),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: invoice != null
                      ? Text(invoice!.total.toString())
                      : const Text("No Total price provided"),
                ),
                const Divider(),
                InkWell(
                  onTap: () {},
                  child: Container(
                    margin: const EdgeInsets.only(top: 10),
                    child: invoice != null
                        ? Text(invoice!.paymentMethod.toString())
                        : const Text("No Payment method provided"),
                  ),
                ),
                const Divider(),
                IconButton(onPressed: () {}, icon: const Icon(Icons.file_copy))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
