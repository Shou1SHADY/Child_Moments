import 'package:child_moments/core/Local/shared_pref.dart';
import 'package:child_moments/modules/invoices/invoices.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../core/components/check_box.dart';
import '../../models/invoice.dart';

class AddInvoice extends StatefulWidget {
  List<Invoice> invoices;
  AddInvoice({super.key, required this.invoices});

  @override
  State<AddInvoice> createState() => _AddInvoiceState();
}

class _AddInvoiceState extends State<AddInvoice> {
  bool check1 = false;
  bool check2 = false;
  List<String> kidsNames = <String>[];
  String dropdownValue3 = "";
  String firstPackage = 'Customized';
  List<String> packages = <String>["Customized", "الشهرية"];
  String firstCurrency = "SAR";
  List<String> currencies = <String>["SAR", "EGP", "USD", "EUR"];

  TextEditingController dateInput = TextEditingController();

  @override
  void initState() {
    dateInput.text = "";
    for (int i = 0; i <= widget.invoices.length - 1; i++) {
      kidsNames.add(widget.invoices[i].kid.firstName!);
    }

    dropdownValue3 = widget.invoices.first.kid.firstName!;

    super.initState();
  }

  final _formKey = GlobalKey<FormState>();
  bool _visibility1 = true;
  final _confirmationMessageC = TextEditingController();
  final amountC = TextEditingController();
  final disC = TextEditingController();
  final VATc = TextEditingController();
  final descriptionC = TextEditingController();

  Widget RoomName(String hint, TextEditingController contr) {
    return Container(
      margin: EdgeInsets.only(right: 30.w, left: 30.w, top: 10.h),
      child: TextFormField(
        //  autovalidateMode: AutovalidateMode.always,
        controller: contr,
        maxLines: 1,
        validator: ((value) {
          if (value!.isEmpty ||
              !(RegExp(r'^[a-z A-Z 0-9]+$').hasMatch(value))) {
            return "Enter Correct Name";
          } else {
            return null;
          }
        }),
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          hintText: hint,
          labelText: hint,
        ),
      ),
    );
  }

  Widget TextF(
      String Label,
      String hint,
      String err,
      TextEditingController contro,
      double? left,
      double? right,
      double? top,
      String? suffix,
      String? reg,
      TextInputType? type) {
    reg ??= r'^[a-z A-Z 0-9]+$';
    left ??= 30;
    right ??= 30;
    top ??= 10;
    type ??= TextInputType.text;
    return Container(
      margin: EdgeInsets.only(left: left.w, right: right.w, top: top.h),
      child: TextFormField(
        keyboardType: type,
        //  autovalidateMode: AutovalidateMode.always,
        controller: contro,
        maxLines: 1,
        validator: ((value) {
          if (value!.isEmpty || !(RegExp(reg!).hasMatch(value))) {
            return err;
          } else {
            return null;
          }
        }),
        decoration: InputDecoration(
          suffixText: suffix ?? "",
          border: OutlineInputBorder(),
          hintText: hint,
          labelText: Label,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Widget DropDown(String Label, String dropdownValue, List<String> list) {

    // }

    //String dropdownValue = list.first;
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
              child: Column(children: [
            ///////////////////////////AppBar///////////////////////////////////
            Stack(
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
                    top: 50.h,
                    left: 130.w,
                    child: Text(
                      "Add New Invoice",
                      style: TextStyle(color: Colors.white, fontSize: 20.sp),
                    )),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                )
              ],
            ),

            ///////////////////////////AppBar///////////////////////////////////
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.w),
                    child: Text(
                      "Sent To",
                      style: TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 20.sp),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  FormField(
                    validator: ((value) {
                      if (value.toString().isEmpty) {
                        return "Required";
                      }
                    }),
                    builder: (FormFieldState<dynamic> field) {
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30.w),
                        child: InputDecorator(
                          decoration: InputDecoration(
                            labelText: 'Parent Of',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0.r)),
                            contentPadding: EdgeInsets.all(5.r),
                          ),
                          child: ButtonTheme(
                            materialTapTargetSize: MaterialTapTargetSize.padded,
                            child: DropdownButton<String>(
                              hint: const Text("Parent Of"),
                              isExpanded: true,
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
                              items: kidsNames.map<DropdownMenuItem<String>>(
                                  (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      );
                    },
                  ),

                  const Divider(),
                  //////////////
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.w),
                    child: Text(
                      "Basic Information",
                      style: TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 20.sp),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.w),
                    child: InputDecorator(
                      decoration: InputDecoration(
                        labelText: 'Package',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0.r)),
                        contentPadding: EdgeInsets.all(5.r),
                      ),
                      child: ButtonTheme(
                        materialTapTargetSize: MaterialTapTargetSize.padded,
                        child: DropdownButton<String>(
                          hint: const Text("Customized"),
                          isExpanded: true,
                          value: firstPackage,
                          elevation: 16,
                          underline: DropdownButtonHideUnderline(
                            child: Container(),
                          ),
                          onChanged: (String? newValue) {
                            setState(() {
                              firstPackage = newValue!;
                              if (firstPackage != "Customized") {
                                _visibility1 = false;
                              }
                            });
                          },
                          items: packages
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ),
                  ///////////////////////////
                  Visibility(
                      visible: _visibility1,
                      child: RoomName(
                          "Cumstomisation Message", _confirmationMessageC)),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(left: 30.w, top: 10.h),
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            //  autovalidateMode: AutovalidateMode.always,
                            controller: amountC,
                            maxLines: 1,
                            validator: ((value) {
                              if (value!.isEmpty ||
                                  !(RegExp(r'^[a-z A-Z 0-9]+$')
                                      .hasMatch(value))) {
                                return "Enter Correct Amount";
                              } else {
                                return null;
                              }
                            }),
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "Amount",
                              labelText: "Amount",
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                          child: Padding(
                        padding:
                            EdgeInsets.only(right: 30.w, left: 30, top: 10.h),
                        child: InputDecorator(
                          decoration: InputDecoration(
                            labelText: "Currency",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0.r)),
                            contentPadding: EdgeInsets.all(5.r),
                          ),
                          child: ButtonTheme(
                            materialTapTargetSize: MaterialTapTargetSize.padded,
                            child: DropdownButton<String>(
                              hint: Text("SAR"),
                              isExpanded: true,
                              value: firstCurrency,
                              elevation: 16,
                              underline: DropdownButtonHideUnderline(
                                child: Container(),
                              ),
                              onChanged: (String? newValue) {
                                setState(() {
                                  firstCurrency = newValue!;
                                });
                              },
                              items: currencies.map<DropdownMenuItem<String>>(
                                  (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ))

                      //  DropDown("Currency", firstCurrency, currencies))
                    ],
                  ),

                  Divider(),
                  Container(
                    margin: EdgeInsets.only(left: 30.w, right: 30.w, top: 10.h),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      //  autovalidateMode: AutovalidateMode.always,
                      controller: disC,
                      maxLines: 1,
                      validator: ((value) {
                        if (value!.isEmpty ||
                            !(RegExp(r'^[a-z A-Z 0-9]+$').hasMatch(value))) {
                          return "Enter Correct Percentage";
                        } else {
                          return null;
                        }
                      }),
                      decoration: const InputDecoration(
                        suffixText: "Discount %",
                        border: OutlineInputBorder(),
                        hintText: "0",
                        labelText: "Discount",
                      ),
                    ),
                  ),

                  TextF("VAT", "15", "Enter Correct VAT value", VATc, null,
                      null, null, "VAT %", null, TextInputType.number),
                  Divider(),
                  FormField(
                    validator: ((value) {
                      if (value == null) {
                        return "Required";
                      } else {
                        return null;
                      }
                    }),
                    builder: (FormFieldState<dynamic> field) {
                      return Column(
                        children: [
                          Container(
                              padding: const EdgeInsets.all(15),
                              height: MediaQuery.of(context).size.width / 3,
                              child: Center(
                                  child: TextField(
                                controller: dateInput,
                                //editing controller of this TextField
                                decoration: const InputDecoration(
                                    icon: Icon(Icons
                                        .calendar_today), //icon of text field
                                    labelText:
                                        "Enter Date" //label text of field
                                    ),
                                readOnly: true,
                                //set it true, so that user will not able to edit text
                                onTap: () async {
                                  DateTime? pickedDate = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(1950),
                                      //DateTime.now() - not to allow to choose before today.
                                      lastDate: DateTime(2100));

                                  if (pickedDate != null) {
                                    print(
                                        pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                                    String formattedDate =
                                        DateFormat('yyyy-MM-dd')
                                            .format(pickedDate);
                                    print(
                                        formattedDate); //formatted date output using intl package =>  2021-03-16
                                    setState(() {
                                      dateInput.text =
                                          formattedDate; //set output date to TextField value.
                                      field.didChange(dateInput.text);
                                    });
                                  } else {}
                                },
                              ))),
                          Text(field.errorText ?? '',
                              style: TextStyle(
                                color: Theme.of(context).errorColor,
                              ))
                        ],
                      );
                    },
                  ),

                  /////////////////////////////
                  const Divider(),
                  Padding(
                      padding:
                          EdgeInsets.only(right: 30.w, left: 30.w, top: 10.h),
                      child: Text(
                        "Payment Method",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 20.sp),
                      )),
                  SizedBox(
                    height: 15.h,
                  ),
                  FormField<bool>(
                    validator: ((value) {
                      if (check1 == false && check2 == false) {
                        return "Required";
                      } else {
                        return null;
                      }
                    }),
                    builder: (FormFieldState<bool> field) {
                      return Column(
                        children: [
                          LabeledCheckbox(
                            label: 'تحويل بنكي',
                            padding:
                                const EdgeInsets.symmetric(horizontal: 30.0),
                            value: check1,
                            onChanged: (bool newValue) {
                              setState(() {
                                check1 = newValue;
                                field.didChange(newValue);
                              });
                            },
                            subLabel: 'الانماء SA32100067890312567778',
                          ),
                          Text(field.errorText ?? '',
                              style: TextStyle(
                                color: Theme.of(context).errorColor,
                              ))
                        ],
                      );
                    },
                  ),
                  FormField<bool>(
                    validator: (value) {
                      if (check1 == false && check2 == false) {
                        return "Required";
                      } else {
                        return null;
                      }
                    },
                    builder: (FormFieldState<bool> field) {
                      return Column(
                        children: [
                          LabeledCheckbox(
                            label: ' رابط الدفع',
                            padding:
                                const EdgeInsets.symmetric(horizontal: 30.0),
                            value: check2,
                            onChanged: (bool newValue) {
                              setState(() {
                                check2 = newValue;
                                field.didChange(newValue);
                              });
                            },
                            subLabel: 'رابط الضغط على الرابط لإتمام',
                          ),
                          Text(field.errorText ?? '',
                              style: TextStyle(
                                color: Theme.of(context).errorColor,
                              ))
                        ],
                      );
                    },
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Padding(
                      padding:
                          EdgeInsets.only(right: 30.w, left: 30.w, top: 10.h),
                      child: Text(
                        "Other",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 20.sp),
                      )),
                  TextF(
                      "Other",
                      "Description",
                      "Enter description correctly",
                      descriptionC,
                      null,
                      null,
                      null,
                      null,
                      r'^[a-z A-Z 0-9]*$',
                      null),
                  SizedBox(
                    height: 10.h,
                  ),
                  Divider(),
                  Center(
                    child: Text(
                      "Total: ${amountC.text} ${firstCurrency}",
                      style: TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 20.sp),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Center(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.indigo,
                          textStyle: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontStyle: FontStyle.normal),
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            final snackbar = SnackBar(
                              content: Text("Invoice added successfully "),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackbar);
                          }
                        },
                        child: const Text("Add INVOICE")),
                  ),
                ],
              ),
            ),
          ]))),
    );
  }
}
