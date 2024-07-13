import 'package:child_moments/cubits/invoice/invoice_cubit.dart';
import 'package:child_moments/models/invoice.dart';
import 'package:child_moments/models/kid.dart';
import 'package:child_moments/modules/invoices/add_invoice.dart';
import 'package:child_moments/modules/invoices/invoice_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'package:no_context_navigation/no_context_navigation.dart';

import 'add_invoice2.dart';
import 'main_add.dart';

// import 'package:path_provider/path_provider.dart';
// import 'package:pspdfkit_flutter/pspdfkit.dart';

class Constants {
  static const String FirstItem = 'Details';
  static const String SecondItem = 'Mark as Paid';
  static const String ThirdItem = 'Mark as Void';
  static const String FourthItem = "Send Reminder";

  static const List<String> choices = <String>[
    FirstItem,
    SecondItem,
    ThirdItem,
    FourthItem,
  ];
}

choiceAction(String choice, List<Invoice> invoices, int index) {
  if (choice == Constants.FirstItem) {
    navService.pushNamed('/modules/invoices/details', args: 'From Home Screen');
  } else if (choice == Constants.SecondItem) {
    invoices[index].status = "PAID";
    Invoices.myChoice = true;
  } else if (choice == Constants.ThirdItem) {
  } else if (choice == Constants.FourthItem) {}
}

class Invoices extends StatefulWidget {
  const Invoices({super.key});

  static bool myChoice = false;

  @override
  State<Invoices> createState() => _InvoicesState();
}

class _InvoicesState extends State<Invoices> with TickerProviderStateMixin {
  @override
  void initState() {
    //CacheHelper.saveData(key: "Kids", value: kids);
    //rooms = CacheHelper.getData(key: "Kids");
    super.initState();
  }

  Kid kid1 = Kid(
      firstName: "shady",
      avatar:
          "assets/logos/female-gender-symbol-icon-men-and-women-outline.jpg");
  Kid kid2 = Kid(
      firstName: "osama",
      avatar:
          "assets/logos/female-gender-symbol-icon-men-and-women-outline.jpg");
  Kid kid3 = Kid(
      firstName: "wadeea",
      avatar:
          "assets/logos/female-gender-symbol-icon-men-and-women-outline.jpg");
  Kid kid4 = Kid(
      firstName: "shafick",
      avatar:
          "assets/logos/female-gender-symbol-icon-men-and-women-outline.jpg");

  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 2, vsync: this);
///////////////////////////////////////////////////////

    List<Invoice> invoices = <Invoice>[
      Invoice(
          kid: kid1,
          status: "invited",
          type: "ONE-TIME",
          packages: "الشهرية",
          currency: "SAR"),
      Invoice(type: "ONE-TIME", kid: kid2, status: "PID"),
      Invoice(type: "ONE-TIME", kid: kid3, status: "PAST DUE"),
      Invoice(type: "ONE-TIME", kid: kid4, status: "PAD")
    ];

    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.settings),
          onPressed: () {
            ///////////////////////////////////////////////////////////////////
            showDialog<String>(
              context: context,
              builder: (BuildContext context) => Dialog(
                child: Container(
                  height: 330.h,
                  margin: EdgeInsets.all(20.r),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 50,
                        child: TabBar(controller: tabController, tabs: const [
                          Tab(text: "Text"),
                          Tab(text: "Picture or file"),
                        ]),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      SizedBox(
                        height: 200,
                        child: TabBarView(controller: tabController, children: [
                          TextFormField(
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText:
                                    "Type your proof link / verification number"),
                          ),
                          ElevatedButton(
                            child: Row(
                              children: const [
                                Icon(Icons.file_copy_outlined),
                                Text("Pick File"),
                              ],
                            ),
                            onPressed: () async {},
                          ),
                        ]),
                      ),
                      Row(
                        children: [
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'Cancel'),
                            child: const Text('CANCEL'),
                          ),
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'OK'),
                            child: const Text('SUBMIT'),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
////////////////////////////////////////////////
          }),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(125.h),
        child: NewGradientAppBar(
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
          // bottom: ,
          flexibleSpace: Container(
            margin: EdgeInsets.only(top: 65.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    height: 70.h,
                    padding:
                        const EdgeInsets.only(right: 18.0, left: 18, top: 28),
                    child: InkWell(
                      onTap: () {
                        showSearch(
                            context: context,
                            //  delegate to customize the search bar
                            delegate:
                                CustomSearchDelegate3(invoices: invoices));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(right: 160.w),
                          child: const Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                        ),
                        /////////////////////////////////////
                        // onTap: () {
                        //   // method to show the search bar
                        //   showSearch(
                        //       context: context,
                        //       // delegate to customize the search bar
                        //       delegate: CustomSearchDelegate());
                        // },
                        ///////////////////////////////////////
                        // decoration: InputDecoration(
                        //     fillColor: Colors.white,
                        //     enabledBorder: OutlineInputBorder(
                        //       borderRadius: BorderRadius.circular(25.0),
                        //       borderSide: BorderSide(
                        //         color: Colors.white,
                        //         width: 2.0,
                        //       ),
                        //     ),
                        //     prefixIcon: Icon(
                        //       Icons.search,
                        //       color: Colors.white,
                        //     )),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 25.h, right: 10.w),
                  child: TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => MainAdd(invoices: invoices)));
                      },
                      child: const Text(
                        "+ Add new Invoice",
                        style: TextStyle(color: Colors.white),
                      )),
                )
              ],
            ),
          ),
          //actions: [],
        ),
      ),
      /////////////////////
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/photos/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(top: 15.h),
          child: ListView.builder(
            itemCount: invoices.length,
            itemBuilder: (<Invoice>(context, index) {
              return Column(
                children: [
                  Container(
                    child: ListTile(
                      title: BlocConsumer<InvoiceCubit, InvoiceState>(
                        listener: (context, state) {},
                        builder: (context, state) {
                          InvoiceCubit cubit = InvoiceCubit.get(context);
                          cubit.getChoice(Invoices.myChoice);
                          return state is Mychoice
                              ? invoices[index].status == "PAID"
                                  ? Text(
                                      invoices[index].kid.firstName.toString(),
                                      style: TextStyle(color: Colors.green),
                                    )
                                  : Text(
                                      invoices[index].kid.firstName.toString())
                              : Text(invoices[index].kid.firstName.toString());
                        },
                      ),
                      subtitle: Column(children: [
                        Text("type: ${invoices[index].type.toString()}",
                            style: TextStyle(fontSize: 12.sp)),
                        Text(
                          "Status: ${invoices[index].status.toString()}",
                          style: TextStyle(fontSize: 12.sp),
                        )
                      ]),
                      leading: CircleAvatar(
                          backgroundImage: AssetImage(
                              invoices[index].kid.avatar.toString())),
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
                                      // onPressed: didDownloadPDF
                                      //     ? null
                                      //     : () async {
                                      //         var tempDir =
                                      //             await getTemporaryDirectory();
                                      //         download(
                                      //             Dio(),
                                      //             "imageUrl",
                                      //             tempDir.path +
                                      //                 "C:\Users\Dell\Desktop");
                                      //       },
                                      child: const Text(
                                        "Preview",
                                        style: TextStyle(color: Colors.black45),
                                      )),
                                  // Text(
                                  //   progressString,
                                  // ),
                                  // TextButton(
                                  //   // Disable the button if no PDF is downloaded yet. Once the
                                  //   // PDF file is downloaded, you can then open it using PSPDFKit.
                                  //   onPressed: !didDownloadPDF
                                  //       ? null
                                  //       : () async {
                                  //           var tempDir =
                                  //               await getTemporaryDirectory();
                                  //           await Pspdfkit.present(tempDir.path +
                                  //               "C:\Users\Dell\Desktop");
                                  //         },
                                  //   child: Text(
                                  //       'Open the downloaded file using PSPDFKit'),
                                  //   ),
                                ],
                              ),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                const Padding(
                                    padding: EdgeInsets.only(top: 400)),
                                PopupMenuButton<String>(
                                  onSelected: (value) {
                                    choiceAction(value, invoices, index);
                                  },
                                  icon: const Icon(Icons.more),
                                  // onSelected: ,
                                  itemBuilder: (BuildContext context) {
                                    return Constants.choices
                                        .map((String choice) {
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
                  ),
                  const Divider(),
                ],
              );
            }),
          ),
        ),
      ),

      /////////////
    );
  }
}
