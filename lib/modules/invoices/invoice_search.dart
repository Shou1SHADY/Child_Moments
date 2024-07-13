import 'package:child_moments/cubits/invoice/invoice_cubit.dart';
import 'package:child_moments/models/invoice.dart';
import "package:flutter/material.dart";
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:no_context_navigation/no_context_navigation.dart';

class Constants {
  static const String FirstItem = 'Details';
  static const String SecondItem = 'Mark as Paid';
  static const String ThirdItem = 'Mark as Unpaid';

  static const List<String> choices = <String>[
    FirstItem,
    SecondItem,
    ThirdItem,
  ];
}

void choiceAction(String choice) {
  if (choice == Constants.FirstItem) {
    navService.pushNamed('/modules/invoices/details', args: 'From Home Screen');
  } else if (choice == Constants.SecondItem) {
    print('I Second Item');
  } else if (choice == Constants.ThirdItem) {
    print('I Third Item');
  }
}

class CustomSearchDelegate3 extends SearchDelegate {
  // Demo list to show querying

  String ascending = "Ascending";
  String descending = "Descending";
  bool isAscending = false;
  // bool addValue = false;
  List<Invoice> invoices;
  // List<String> kidNames = [];
  CustomSearchDelegate3({required this.invoices});

  // first overwrite to

  Widget buttonAsc(int index) {
    if (index == 0) {
      return BlocConsumer<InvoiceCubit, InvoiceState>(
        listener: (context, state) {},
        builder: (context, state) {
          return ElevatedButton(
              style: ElevatedButton.styleFrom(),
              onPressed: () {
                isAscending = !isAscending;
                List<Invoice> reversed = invoices.reversed.toList();
                invoices = reversed;
                for (var fruit in invoices) {
                  print(fruit.kid.firstName);
                }
                for (var fruit in reversed) {
                  print(fruit.kid.firstName);
                }
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  isAscending ? Text(descending) : Text(ascending),
                  SizedBox(width: 10.w),
                  Image.asset(
                    "assets/logos/sort.png",
                    height: 25.h,
                    width: 15.w,
                  )
                ],
              ));
        },
      );
    } else {
      return SizedBox(
        height: 0.1.h,
      );
    }
  }

  // clear the search text
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  // second overwrite to pop out of search menu
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  // third overwrite to show query result
  @override
  Widget buildResults(BuildContext context) {
    List<Invoice> matchQuery = [];
    for (var fruit in invoices) {
      if (fruit.kid.firstName!.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      } else if (fruit.status!.toString().contains(query)) {
        matchQuery.add(fruit);
      } else if (fruit.type!.toString().contains(query)) {
        matchQuery.add(fruit);
      }
    }

    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/photos/background.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: BlocConsumer<InvoiceCubit, InvoiceState>(
        listener: (context, state) {},
        builder: (context, state) {
          return ListView.builder(
            itemCount: matchQuery.length,
            itemBuilder: (<Invoice>(context, index) {
              return Column(
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  buttonAsc(index),
                  SizedBox(
                    height: 10.h,
                  ),
                  ListTile(
                    title: Text(invoices[index].kid.firstName.toString()),
                    subtitle: Column(children: [
                      Text("Email: ${invoices[index].status.toString()}",
                          style: TextStyle(fontSize: 12.sp)),
                      Text(
                        "Status: ${invoices[index].type.toString()}",
                        style: TextStyle(fontSize: 12.sp),
                      )
                    ]),
                    leading: CircleAvatar(
                        backgroundImage:
                            AssetImage(invoices[index].kid.avatar.toString())),
                    trailing: SizedBox(
                      width: 150,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            child: Column(
                              children: [
                                TextButton(
                                    onPressed: () {},

                                    //       },
                                    child: const Text(
                                      "Preview",
                                      style: TextStyle(color: Colors.black45),
                                    )),
                              ],
                            ),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              const Padding(padding: EdgeInsets.only(top: 400)),
                              PopupMenuButton<String>(
                                icon: const Icon(Icons.settings),
                                onSelected: choiceAction,
                                itemBuilder: (BuildContext context) {
                                  return Constants.choices.map((String choice) {
                                    return PopupMenuItem<String>(
                                      value: choice,
                                      child: Text(choice),
                                    );
                                  }).toList();
                                },
                              ),
                            ],
                          )

                          // IconButton(
                          //     onPressed: () {
                          //       // Navigator.push(
                          //       //     context,
                          //       //     MaterialPageRoute(
                          //       //         builder: (_) =>
                          //       //             TeacherInfo(teacher: invoices[index])));
                          //     },
                          //     icon: Icon(Icons.more_horiz_outlined)),
                        ],
                      ),
                    ),
                  ),
                  const Divider(),
                ],
              );
            }),
          );
        },
      ),
    );

//////////////////////////////////////
  }

  // last overwrite to show the
  // querying process at the runtime
  @override
  Widget buildSuggestions(BuildContext context) {
    List<Invoice> matchQuery = [];

    // if (addValue == false) {
    //   for (var fruit in invoices) {
    //     if (fruit.kid.name! != null) {
    //       kidNames.add(fruit.kid.name!);
    //     }
    //   }
    // }
    // addValue = true;
    // kidNames.sort();

    // Invoice temp;
    // for (int i = 0; i < invoices.length; i++) {
    //   for (int j = 0; j < kidNames.length; j++) {
    //     if (invoices[i].kid.name!.contains(kidNames[j])) {
    //       temp = invoices[i];
    //       invoices[i] = invoices[j];
    //       invoices[j] = temp;
    //     }
    //   }
    // }

    Widget buttonAsc(int index) {
      if (index == 0) {
        return BlocConsumer<InvoiceCubit, InvoiceState>(
          listener: (context, state) {},
          builder: (context, state) {
            return ElevatedButton(
                style: ElevatedButton.styleFrom(),
                onPressed: () {
                  isAscending = !isAscending;
                  List<Invoice> reversed = invoices.reversed.toList();
                  invoices = reversed;
                  // for (var fruit in invoices) {
                  //   print(fruit.kid.name);
                  // }
                  // for (var fruit in reversed) {
                  //   print(fruit.kid.name);
                  // }
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    isAscending ? Text(descending) : Text(ascending),
                    SizedBox(width: 10.w),
                    Image.asset(
                      "assets/logos/sort.png",
                      height: 25.h,
                      width: 15.w,
                    )
                  ],
                ));
          },
        );
      } else {
        return SizedBox(
          height: 0.1.h,
        );
      }
    }

    for (var fruit in invoices) {
      if (fruit.kid.firstName!.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      } else if (fruit.status!.toString().contains(query)) {
        matchQuery.add(fruit);
      } else if (fruit.type!.toString().contains(query)) {
        matchQuery.add(fruit);
      }
    }

    // for (var fruit in invoices) {
    //   print(fruit.kid.name);
    // }

    //print(kidNames);

/////////////////////////////////////
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/photos/background.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: BlocConsumer<InvoiceCubit, InvoiceState>(
        listener: (context, state) {},
        builder: (context, state) {
          return ListView.builder(
            itemCount: matchQuery.length,
            itemBuilder: (<Invoice>(context, index) {
              return Column(
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  buttonAsc(index),
                  SizedBox(
                    height: 10.h,
                  ),
                  ListTile(
                    title: Text(invoices[index].kid.firstName.toString()),
                    subtitle: Column(children: [
                      Text("Email: ${invoices[index].status.toString()}",
                          style: TextStyle(fontSize: 12.sp)),
                      Text(
                        "Status: ${invoices[index].type.toString()}",
                        style: TextStyle(fontSize: 12.sp),
                      )
                    ]),
                    leading: CircleAvatar(
                        backgroundImage:
                            AssetImage(invoices[index].kid.avatar.toString())),
                    trailing: SizedBox(
                      width: 150,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            child: Column(
                              children: [
                                TextButton(
                                    onPressed: () {},

                                    //       },
                                    child: const Text(
                                      "Preview",
                                      style: TextStyle(color: Colors.black45),
                                    )),
                              ],
                            ),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              const Padding(padding: EdgeInsets.only(top: 400)),
                              PopupMenuButton<String>(
                                icon: const Icon(Icons.settings),
                                onSelected: choiceAction,
                                itemBuilder: (BuildContext context) {
                                  return Constants.choices.map((String choice) {
                                    return PopupMenuItem<String>(
                                      value: choice,
                                      child: Text(choice),
                                    );
                                  }).toList();
                                },
                              ),
                            ],
                          )

                          // IconButton(
                          //     onPressed: () {
                          //       // Navigator.push(
                          //       //     context,
                          //       //     MaterialPageRoute(
                          //       //         builder: (_) =>
                          //       //             TeacherInfo(teacher: invoices[index])));
                          //     },
                          //     icon: Icon(Icons.more_horiz_outlined)),
                        ],
                      ),
                    ),
                  ),
                  const Divider(),
                ],
              );
            }),
          );
        },
      ),
    );
  }
}
