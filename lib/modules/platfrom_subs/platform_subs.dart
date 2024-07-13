import 'dart:io';
import 'package:child_moments/models/invoice.dart';
import 'package:child_moments/models/kid.dart';
import 'package:child_moments/modules/invoices/invoice_search.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'package:no_context_navigation/no_context_navigation.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:pspdfkit_flutter/pspdfkit.dart';

class Constants {
  static const String FirstItem = 'Details';

  static const List<String> choices = <String>[
    FirstItem,
  ];
}

void choiceAction(String choice) {
  if (choice == Constants.FirstItem) {
    navService.pushNamed('/modules/invoices/details', args: 'From Home Screen');
  }
}

class PlatformS extends StatefulWidget {
  const PlatformS({super.key});

  @override
  State<PlatformS> createState() => _PlatformSState();
}

class _PlatformSState extends State<PlatformS> with TickerProviderStateMixin {
////////////////////////////////////////////////

  // // Track the progress of a downloaded file here.
  // double progress = 0;

  // // Track if the PDF was downloaded here.
  // bool didDownloadPDF = false;

  // // Show the progress status to the user.
  // String progressString = 'File has not been downloaded yet.';

  // // This method uses Dio to download a file from the given URL
  // // and saves the file to the provided `savePath`.
  // Future download(Dio dio, String url, String savePath) async {
  //   try {
  //     Response response = await dio.get(
  //       url,
  //       onReceiveProgress: updateProgress,
  //       options: Options(
  //           responseType: ResponseType.bytes,
  //           followRedirects: false,
  //           validateStatus: (status) {
  //             return status! < 500;
  //           }),
  //     );
  //     var file = File(savePath).openSync(mode: FileMode.write);
  //     file.writeFromSync(response.data);
  //     await file.close();

  //     // Here, you're catching an error and printing it. For production
  //     // apps, you should display the warning to the user and give them a
  //     // way to restart the download.
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  // // You can update the download progress here so that the user is
  // // aware of the long-running task.
  // void updateProgress(done, total) {
  //   progress = done / total;
  //   setState(() {
  //     if (progress >= 1) {
  //       progressString =
  //           '✅ File has finished downloading. Try opening the file.';
  //       didDownloadPDF = true;
  //     } else {
  //       progressString = 'Download progress: ' +
  //           (progress * 100).toStringAsFixed(0) +
  //           '% done.';
  //     }
  //   });
  // }
  //////////////////////////////////////////////////

  /////////////////////////////////////////////////
  @override
  void initState() {
    //CacheHelper.saveData(key: "Kids", value: kids);
    //rooms = CacheHelper.getData(key: "Kids");
    super.initState();
  }

  Widget header(int index) {
    if (index == 0) {
      return Container(
        padding: EdgeInsets.all(20.r),
        child: Column(children: [
          Container(
            padding: EdgeInsets.all(20.r),
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 255, 0, 0),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Text("All Students"),
                Text("Active Students"),
                Text("Inactive Students"),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(20.r),
            decoration: const BoxDecoration(
              color: Colors.redAccent,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Text("2"),
                Text("3"),
                Text("0"),
              ],
            ),
          )
        ]),
      );
    } else {
      return const SizedBox();
    }
  }

  String dropdownValue3 = "Oct 2022";
  List<String> list2 = <String>['Oct 2022', 'Sep 2022', 'July 2022', 'Four'];

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
      Invoice(kid: kid1, status: "invited", type: "ONE-TIME"),
      Invoice(type: "ONE-TIME", kid: kid2, status: "active"),
      Invoice(type: "ONE-TIME", kid: kid3, status: "invited"),
      Invoice(type: "ONE-TIME", kid: kid4, status: "inactive")
    ];

    Widget endButton(int index) {
      if (index == invoices.length - 1) {
        return FloatingActionButton(
            onPressed: () {
              showModalBottomSheet<void>(
                context: context,
                builder: (BuildContext context) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                          height: 330.h,
                          child: CustomScrollView(
                            primary: false,
                            slivers: <Widget>[
                              SliverPadding(
                                padding: const EdgeInsets.all(20),
                                sliver: SliverGrid.count(
                                  childAspectRatio: 2,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 10,
                                  crossAxisCount: 2,
                                  children: <Widget>[
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: const Color.fromRGBO(
                                            102, 187, 106, 1),
                                      ),
                                      padding: const EdgeInsets.all(8),
                                      child: const Center(child: Text('Plan')),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(20.r),
                                        color: const Color.fromRGBO(
                                            102, 187, 106, 1),
                                      ),
                                      child: const Center(child: Text('Price')),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: const Color.fromRGBO(
                                            102, 187, 106, 1),
                                      ),
                                      child: const Center(
                                        child:
                                            Text('الأساسية لكل طفل في الشهر'),
                                      ),
                                    ),
                                    Container(
                                        padding: const EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: const Color.fromRGBO(
                                              102, 187, 106, 1),
                                        ),
                                        child: const Center(
                                            child: Text("15 SAR"))),
                                  ],
                                ),
                              ),
                            ],
                          )),

                      // Column(
                      //   children: [
                      //     Row(
                      //       mainAxisAlignment:
                      //           MainAxisAlignment.spaceEvenly,
                      //       children: [Text("Plan"), Text("Price")],
                      //     ),
                      //     Row(
                      //       mainAxisAlignment:
                      //           MainAxisAlignment.spaceEvenly,
                      //       children: [
                      //         Text("الأساسية لكل طفل في الشهر"),
                      //         Text("15 SAR")
                      //       ],
                      //     )
                      //   ],
                      // ),
                      Expanded(
                        child: SizedBox(
                          height: 20.h,
                          width: 100.w,
                          child: ElevatedButton(
                            child: const Text('Close'),
                            onPressed: () => Navigator.pop(context),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              );
            },
            child: const Icon(
              Icons.price_check,
              color: Colors.white,
            ));
      } else {
        return const SizedBox();
      }
    }
/////////////////////////////////////////////////////////

    return Scaffold(
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
                          borderRadius: BorderRadius.circular(25.0.r),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(right: 190.w),
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
                  padding: EdgeInsets.only(right: 18.w),

                  child: Container(
                    padding: EdgeInsets.all(10.r),
                    margin: EdgeInsets.only(top: 25.h),
                    height: 45.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.0.r),
                        border: Border.all(color: Colors.white)),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: dropdownValue3,
                        elevation: 16,
                        underline: DropdownButtonHideUnderline(
                          child: Container(),
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownValue3 = newValue!;
                          });
                        },
                        items:
                            list2.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: const TextStyle(color: Colors.black),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),

                  // child: TextButton(
                  //     onPressed: () {},
                  //     child: Text(
                  //       "+ Add new Invoice",
                  //       style: TextStyle(color: Colors.white),
                  //     )),
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
            itemBuilder: (<Teacher>(context, index) {
              return Column(
                children: [
                  //////////////////////////////////////////
                  header(index),
                  ///////////////////////////////////////////
                  Container(
                    child: ListTile(
                      title: Text(invoices[index].kid.firstName.toString()),
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
                        width: 150.w,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              child: Column(
                                children: [
                                  TextButton(
                                      onPressed: () {
                                        showDialog<String>(
                                          context: context,
                                          builder: (BuildContext context) =>
                                              // DefaultTabController(
                                              // initialIndex: 1,
                                              //length: 3,
                                              Dialog(
                                            child: Container(
                                              height: 330.h,
                                              margin: EdgeInsets.all(20.r),
                                              child: Column(
                                                children: [
                                                  SizedBox(
                                                    height: 50,
                                                    child: TabBar(
                                                        controller:
                                                            tabController,
                                                        tabs: const [
                                                          Tab(text: "Text"),
                                                          Tab(
                                                              text:
                                                                  "Picture or file"),
                                                        ]),
                                                  ),
                                                  SizedBox(
                                                    height: 20.h,
                                                  ),
                                                  SizedBox(
                                                    height: 200,
                                                    child: TabBarView(
                                                        controller:
                                                            tabController,
                                                        children: [
                                                          TextFormField(
                                                            decoration: const InputDecoration(
                                                                border:
                                                                    OutlineInputBorder(),
                                                                hintText:
                                                                    "Type your proof link / verification number"),
                                                          ),
                                                          ElevatedButton(
                                                            child: Row(
                                                              children: const [
                                                                Icon(Icons
                                                                    .file_copy_outlined),
                                                                Text(
                                                                    "Pick File"),
                                                              ],
                                                            ),
                                                            onPressed:
                                                                () async {
                                                              final result =
                                                                  await FilePicker
                                                                      .platform
                                                                      .pickFiles(
                                                                          allowMultiple:
                                                                              true);
                                                              if (result ==
                                                                  null) return;

                                                              /////1/////
                                                              final file =
                                                                  result.files
                                                                      .first;

                                                              openFile(file);
///////////////////////////////////

                                                              final newFile =
                                                                  await saveFilePermanently(
                                                                      file);
                                                              ////////////
                                                              // openFiles(
                                                              //     result.files);
                                                            },
                                                          ),
                                                        ]),
                                                  ),
                                                  Row(
                                                    children: [
                                                      TextButton(
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                context,
                                                                'Cancel'),
                                                        child: const Text(
                                                            'CANCEL'),
                                                      ),
                                                      TextButton(
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                context, 'OK'),
                                                        child: const Text(
                                                            'SUBMIT'),
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                            // title:
                                            //     const Text('AlertDialog Title'),
                                            // content: const Text(
                                            //     'AlertDialog description'),
                                            // actions: <Widget>[

                                            // ],
                                          ),
                                        );
                                      },
                                      child: Text(
                                        "PROVEPAYMENT",
                                        style: TextStyle(
                                            color: Colors.black45,
                                            fontSize: 12.sp),
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
                                Padding(padding: EdgeInsets.only(top: 400.h)),
                                PopupMenuButton<String>(
                                  icon: const Icon(Icons.settings),
                                  onSelected: choiceAction,
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
                  endButton(index),
                ],
              );
            }),
          ),
        ),
      ),

      /////////////
    );
  }

  // void openFiles(List<PlatformFile> files) =>
  //    Navigator.of(context).push(MaterialPageRoute(
  //       builder: (context) => FilesPage(
  //             files: files,
  //             onOpenedFile: openFile,
  //           )));

  Future<File> saveFilePermanently(PlatformFile file) async {
    final appStorage = await getApplicationDocumentsDirectory();
    final newFile = File("${appStorage.path}/${file.name}");

    return File(file.path!).copy(newFile.path);
  }

  void openFile(PlatformFile file) {
    OpenFile.open(file.path!);
  }
}
