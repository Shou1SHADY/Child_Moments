import 'package:badges/badges.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

import '../../models/attendance_model.dart';

// External package imports
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:syncfusion_flutter_datagrid_export/export.dart';

// Local import
import 'helper/save_file_mobile.dart'
    if (dart.library.html) '../../helper/save_file_web.dart' as helper;

class Attendance extends StatefulWidget {
  const Attendance({Key? key}) : super(key: key);

  @override
  State<Attendance> createState() => _AttendanceState();
}

class _AttendanceState extends State<Attendance> {
  final textController = TextEditingController();

  List<AttendanceModel> getAttendanceData() {
    return [
      AttendanceModel(
        name: 'Ahmed',
        roomName: 'Room1',
        checkIn: 1,
        checkOut: 1,
        totalHours: 22,
      ),
      AttendanceModel(
        name: 'Mo',
        roomName: 'Room2',
        checkIn: 2,
        checkOut: 2,
        totalHours: 23,
      ),
      AttendanceModel(
        name: 'Ahmed',
        roomName: 'Room1',
        checkIn: 1,
        checkOut: 1,
        totalHours: 22,
      ),
      AttendanceModel(
        name: 'Ahmed',
        roomName: 'Room1',
        checkIn: 1,
        checkOut: 1,
        totalHours: 22,
      ),
    ];
  }

  //date time
  var date = DateTime.now();
  late var formattedDate;
  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    /// The argument value will return the changed date as [DateTime] when the
    /// widget [SfDateRangeSelectionMode] set as single.
    ///
    /// The argument value will return the changed dates as [List<DateTime>]
    /// when the widget [SfDateRangeSelectionMode] set as multiple.
    ///
    /// The argument value will return the changed range as [PickerDateRange]
    /// when the widget [SfDateRangeSelectionMode] set as range.
    ///
    /// The argument value will return the changed ranges as
    /// [List<PickerDateRange] when the widget [SfDateRangeSelectionMode] set as
    /// multi range.
    // setState(() {
    //   if (args.value is PickerDateRange) {
    //     _range = '${DateFormat('dd/MM/yyyy').format(args.value.startDate)} -'
    //     // ignore: lines_longer_than_80_chars
    //         ' ${DateFormat('dd/MM/yyyy').format(args.value.endDate ?? args.value.startDate)}';
    //   } else if (args.value is DateTime) {
    //     _selectedDate = args.value.toString();
    //   } else if (args.value is List<DateTime>) {
    //     _dateCount = args.value.length.toString();
    //   } else {
    //     _rangeCount = args.value.length.toString();
    //   }
    // });
  }

  List<AttendanceModel> attendance = <AttendanceModel>[];
  late AttendanceDataSource activityDataSource;

  @override
  void initState() {
    attendance = getAttendanceData();
    activityDataSource = AttendanceDataSource(employeeData: attendance);
    formattedDate = DateFormat('d-MMM-yy').format(date);
  }

  // end date
  final GlobalKey<SfDataGridState> _key = GlobalKey<SfDataGridState>();

  Future<void> _exportDataGridToPdf() async {
    final PdfDocument document =
        _key.currentState!.exportToPdfDocument(fitAllColumnsInOnePage: true);

    final List<int> bytes = document.saveSync();
    await helper.saveAndLaunchFile(bytes, 'Attendance.pdf');
    document.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Attendance"),
        actions: [
          Badge(
            position: BadgePosition.topEnd(top: 10, end: 10),
            badgeContent: const Text("1"),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.add_alert_outlined),
            ),
          ),
        ],
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: <Color>[Colors.purple, Colors.blue]),
          ),
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 16),
                    child: Text('From'),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(formattedDate.toString()),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: ElevatedButton.icon(
                      onPressed: () async {
                        await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2022),
                          lastDate: DateTime(2023),
                        ).then((value) {
                          if (value != null) {
                            formattedDate =
                                DateFormat('d-MMM-yy').format(value);
                          }
                        });
                        setState(() {});
                      },
                      icon: const Icon(Icons.add_chart),
                      label: const Text('Advanced'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    MaterialButton(
                      color: Colors.blue,
                      onPressed: _exportDataGridToPdf,
                      child: const Center(
                        child: Text(
                          'Export',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                // height: MediaQuery.of(context).size.height * 0.25,
                height: 500,

                child: SfDataGrid(
                  key: _key,
                  allowFiltering: true,
                  allowColumnsResizing: true,
                  columnSizer: ColumnSizer(),
                  source: activityDataSource,
                  columnWidthMode: ColumnWidthMode.auto,
                  columns: <GridColumn>[
                    GridColumn(
                        columnName: 'Name',
                        label: Container(
                            padding: const EdgeInsets.all(8.0),
                            alignment: Alignment.center,
                            child: const Text(
                              'Name',
                            ))),
                    GridColumn(
                        columnName: 'RoomName',
                        label: Container(
                            padding: const EdgeInsets.all(8.0),
                            alignment: Alignment.center,
                            child: const Text('Room Name'))),
                    GridColumn(
                        columnName: 'Checkin',
                        label: Container(
                            padding: const EdgeInsets.all(8.0),
                            alignment: Alignment.center,
                            child: const Text(
                              'Check in',
                              overflow: TextOverflow.ellipsis,
                            ))),
                    GridColumn(
                        columnName: 'Checkout',
                        label: Container(
                            padding: const EdgeInsets.all(8.0),
                            alignment: Alignment.center,
                            child: const Text('Check out'))),
                    GridColumn(
                        columnName: 'TotalHrs',
                        label: Container(
                            padding: const EdgeInsets.all(8.0),
                            alignment: Alignment.center,
                            child: const Text('Total Hours'))),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AttendanceDataSource extends DataGridSource {
  /// Creates the employee data source class with required details.
  AttendanceDataSource({required List<AttendanceModel> employeeData}) {
    _employeeData = employeeData
        .map<DataGridRow>((e) => DataGridRow(cells: [
              DataGridCell<String>(columnName: 'Name', value: e.name),
              DataGridCell<String>(columnName: 'RoomName', value: e.roomName),
              DataGridCell<String>(
                  columnName: 'Checkin', value: e.checkIn.toString()),
              DataGridCell<String>(
                  columnName: 'Checkout', value: e.checkOut.toString()),
              DataGridCell<String>(
                  columnName: 'TotalHrs', value: e.totalHours.toString()),
            ]))
        .toList();
  }

  List<DataGridRow> _employeeData = [];

  @override
  List<DataGridRow> get rows => _employeeData;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((e) {
      return Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8.0),
        child: Text(e.value.toString()),
      );
    }).toList());
  }
}
