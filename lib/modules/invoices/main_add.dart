import 'package:child_moments/modules/Reports/student_status.dart';
import 'package:child_moments/modules/activities/activities.dart';
import 'package:child_moments/modules/attendance/attendance.dart';
import 'package:child_moments/modules/invoices/add_invoice.dart';
import 'package:child_moments/modules/invoices/add_invoice2.dart';
import "package:flutter/material.dart";
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';

import '../../models/invoice.dart';

class MainAdd extends StatelessWidget {
  List<Invoice> invoices;
  MainAdd({super.key, required this.invoices});

  Widget content(IconData icon, Color colors, String label) {
    return Container(
      height: 170.h,
      width: 170.w,
      decoration: BoxDecoration(
        color: colors,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 70.r,
            color: Colors.white,
          ),
          Text(
            label,
            style: TextStyle(
                fontSize: 20.sp,
                color: Colors.white,
                fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NewGradientAppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        //  automaticallyImplyLeading: true,
        gradient: const LinearGradient(colors: [Colors.red, Colors.blue]),
        title: const Text(
          "Add New Invoice",
          style: TextStyle(color: Colors.white),
        ),
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
        child: Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 30.h,
                  ),
                  InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => AddInvoice(
                                      invoices: invoices,
                                    )));
                      },
                      child:
                          content(Icons.alarm, Colors.blueAccent, "One Time")),
                  SizedBox(
                    height: 10.h,
                  ),
                  InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => AddInvoice2(
                                      invoices: invoices,
                                    )));
                      },
                      child: content(Icons.restart_alt,
                          const Color.fromARGB(255, 96, 240, 170), "Recuring")),
                  SizedBox(
                    height: 10.h,
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
