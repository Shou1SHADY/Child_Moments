import 'package:badges/badges.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import '../../models/activities_model.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';


class Activities extends StatefulWidget {
  const Activities({Key? key}) : super(key: key);

  @override
  State<Activities> createState() => _ActivitiesState();
}

class _ActivitiesState extends State<Activities> {
  final textController = TextEditingController();
  String _selectedDate = '';
  String _dateCount = '';
  String _range = '';
  String _rangeCount = '';


  List<ActivitiesModel> getActivityData() {
    return [
      ActivitiesModel(
        'name',
        'roomName',
        '1',
        '1',
        '1',
        '1',
        '1',
        '1',
        '1',
        '1',
        '1',
        '1',
      ),
      ActivitiesModel(
          'name', 'roomName', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
      ActivitiesModel(
          'name', 'roomName', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
      ActivitiesModel(
          'name', 'roomName', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
      ActivitiesModel(
          'name', 'roomName', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
      ActivitiesModel(
          'name', 'roomName', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
      ActivitiesModel(
          'name', 'roomName', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
      ActivitiesModel(
          'name', 'roomName', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
      ActivitiesModel(
          'name', 'roomName', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1'),

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
    setState(() {
      if (args.value is PickerDateRange) {
        _range = '${DateFormat('dd/MM/yyyy').format(args.value.startDate)} -'
            // ignore: lines_longer_than_80_chars
            ' ${DateFormat('dd/MM/yyyy').format(args.value.endDate ?? args.value.startDate)}';
      } else if (args.value is DateTime) {
        _selectedDate = args.value.toString();
      } else if (args.value is List<DateTime>) {
        _dateCount = args.value.length.toString();
      } else {
        _rangeCount = args.value.length.toString();
      }
    });
  }
  List<ActivitiesModel> activities = <ActivitiesModel>[];
  late ActivityDataSource activityDataSource;

  @override
  void initState() {
    super.initState();
    activities = getActivityData();
    activityDataSource = ActivityDataSource(employeeData: activities);
    formattedDate = DateFormat('d-MMM-yy').format(date);
  }

  // @override
  // void initState() {
  //   formattedDate = DateFormat('d-MMM-yy').format(date);
  // }
  // end date time

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Activity"),
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
                            formattedDate = DateFormat('d-MMM-yy').format(value);
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
              
              SizedBox(
                // height: MediaQuery.of(context).size.height * 0.25,
                height: 500,

                child:  SfDataGrid(
                  allowColumnsResizing: true,
                  allowFiltering: true,
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
                        columnName: 'Room Name',
                        label: Container(
                            padding: const EdgeInsets.all(8.0),
                            alignment: Alignment.center,
                            child: const Text('Room Name'))),
                    GridColumn(
                        columnName: 'Food',
                        label: Container(
                            padding: const EdgeInsets.all(8.0),
                            alignment: Alignment.center,
                            child: const Text(
                              'Food',
                              overflow: TextOverflow.ellipsis,
                            ))),
                    GridColumn(
                        columnName: 'Learning',
                        label: Container(
                            padding: const EdgeInsets.all(8.0),
                            alignment: Alignment.center,
                            child: const Text('Learning'))),
                    GridColumn(
                        columnName: 'Notes',
                        label: Container(
                            padding: const EdgeInsets.all(8.0),
                            alignment: Alignment.center,
                            child: const Text('Notes'))),
                    GridColumn(
                        columnName: 'Naps',
                        label: Container(
                            padding: const EdgeInsets.all(8.0),
                            alignment: Alignment.center,
                            child: const Text('Naps'))),
                    GridColumn(
                        columnName: 'Photos',
                        label: Container(
                            padding: const EdgeInsets.all(8.0),
                            alignment: Alignment.center,
                            child: const Text('Photos'))),
                    GridColumn(
                        columnName: 'Videos',
                        label: Container(
                            padding: const EdgeInsets.all(8.0),
                            alignment: Alignment.center,
                            child: const Text('Videos'))),
                    GridColumn(
                        columnName: 'Potty',
                        label: Container(
                            padding: const EdgeInsets.all(8.0),
                            alignment: Alignment.center,
                            child: const Text('Potty'))),
                    GridColumn(
                        columnName: 'Bottle',
                        label: Container(
                            padding: const EdgeInsets.all(8.0),
                            alignment: Alignment.center,
                            child: const Text('Bottle'))),
                    GridColumn(
                        columnName: 'Supplies',
                        label: Container(
                            padding: const EdgeInsets.all(8.0),
                            alignment: Alignment.center,
                            child: const Text('Supplies'))),
                    GridColumn(
                        columnName: 'Mood',
                        label: Container(
                            padding: const EdgeInsets.all(8.0),
                            alignment: Alignment.center,
                            child: const Text('Mood'))),
                  ],
                ),



                //working
                // child: ListView.builder(
                //   scrollDirection: Axis.vertical,
                //   shrinkWrap: true,
                //   itemCount: myActivity.length,
                //   itemBuilder: (context, index) {
                //     return Container(
                //       height: 500,
                //       width: double.infinity,
                //       child: ScalableDataTable(
                //         minWidth: 950,
                //         rowBuilder: (context, index) {
                //           final att = myActivity;
                //           return ScalableTableRow(
                //             children: [
                //               Text(att[index].name!.toString()),
                //               Text(att[index].roomName!.toString()),
                //               Text(att[index].food!.toString()),
                //               Text(att[index].learning!.toString()),
                //               Text(att[index].notes!.toString()),
                //               Text(att[index].naps!.toString()),
                //               Text(att[index].photos!.toString()),
                //               Text(att[index].videos!.toString()),
                //               Text(att[index].potty!.toString()),
                //               Text(att[index].bottle!.toString()),
                //               Text(att[index].supplies!.toString()),
                //               Text(att[index].mood!.toString()),
                //             ],
                //             columnWrapper: columnWrapper,
                //             color: MaterialStateColor.resolveWith((states) =>
                //                 (index % 2 == 0)
                //                     ? Colors.grey[200]!
                //                     : Colors.transparent),
                //           );
                //         },
                //         header: DefaultTextStyle(
                //           style: TextStyle(
                //             fontSize: 16,
                //             fontWeight: FontWeight.bold,
                //             color: Colors.grey[700],
                //           ),
                //           child: ScalableTableHeader(
                //             columnWrapper: columnWrapper,
                //             children: [
                //               Text(
                //                 'Name',
                //                 style: TextStyle(fontSize: 12),
                //               ),
                //               Text(
                //                 'Room',
                //                 style: TextStyle(fontSize: 12),
                //               ),
                //               Text(
                //                 'Food',
                //                 style: TextStyle(fontSize: 12),
                //               ),
                //               Text(
                //                 'Learning',
                //                 style: TextStyle(fontSize: 12),
                //               ),
                //               Text(
                //                 'Notes',
                //                 style: TextStyle(fontSize: 12),
                //               ),
                //               Text(
                //                 'Naps',
                //                 style: TextStyle(fontSize: 12),
                //               ),
                //               Text(
                //                 'Photos',
                //                 style: TextStyle(fontSize: 12),
                //               ),
                //               Text(
                //                 'Videos',
                //                 style: TextStyle(fontSize: 12),
                //               ),
                //               Text(
                //                 'Potty',
                //                 style: TextStyle(fontSize: 12),
                //               ),
                //               Text(
                //                 'Bottle',
                //                 style: TextStyle(fontSize: 12),
                //               ),
                //               Text(
                //                 'Supplies',
                //                 style: TextStyle(fontSize: 12),
                //               ),
                //               Text(
                //                 'Mood',
                //                 style: TextStyle(fontSize: 12),
                //               ),
                //             ],
                //           ),
                //         ),
                //         itemCount: myActivity.length,
                //         emptyBuilder: (p0) {
                //           return Text("Test");
                //         },
                //       ),
                //     );
                //   },
                // ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  //
  // Widget columnWrapper(BuildContext context, int columnIndex, Widget child) {
  //   const padding = EdgeInsets.symmetric(horizontal: 10);
  //   switch (columnIndex) {
  //     case 0:
  //       return Container(
  //         width: 60,
  //         padding: padding,
  //         child: child,
  //       );
  //     case 1:
  //       return Container(
  //         width: 90,
  //         padding: padding,
  //         child: child,
  //       );
  //     case 5:
  //       return Expanded(
  //         flex: 1,
  //         child: Container(
  //           padding: padding,
  //           child: child,
  //         ),
  //       );
  //     default:
  //       return Expanded(
  //         child: Container(
  //           padding: padding,
  //           child: child,
  //         ),
  //       );
  //   }
  // }
}

//
//
// DataTable _createDataTable() {
//     int? index;
//     return DataTable(columns: _createColumns(), rows: _createRows());
//   }
//
//   List<DataColumn> _createColumns() {
//     return [
//       DataColumn(label: Text('Name')),
//       DataColumn(label: Text('Room Name')),
//       DataColumn(label: Text('Check in')),
//       DataColumn(label: Text('Check Out')),
//       DataColumn(label: Text('Total Hours')),
//     ];
//   }
//
//   List<DataRow> _createRows() {
//     return [
//       DataRow(cells: [
//         DataCell(Text(myAttendance[0].name.toString())),
//         DataCell(Text('Flutter Basics')),
//         DataCell(Text('David John')),
//         DataCell(Text('David John')),
//         DataCell(Text('David John')),
//       ]),
//       // DataRow(cells: [
//       //   DataCell(Text('#100')),
//       //   DataCell(Text('Flutter Basics')),
//       //   DataCell(Text('David John')),
//       //   DataCell(Text('David John')),
//       //   DataCell(Text('David John')),
//       // ]),
//       // DataRow(
//       //   cells: [
//       //     DataCell(Text('#101')),
//       //     DataCell(Text('Dart Internals')),
//       //     DataCell(Text('Alex Wick')),
//       //     DataCell(Text('David John')),
//       //     DataCell(Text('David John')),
//       //   ],
//


class ActivityDataSource extends DataGridSource {
  /// Creates the employee data source class with required details.
  ActivityDataSource({required List<ActivitiesModel> employeeData}) {
    _employeeData = employeeData
        .map<DataGridRow>((e) => DataGridRow(cells: [
      DataGridCell<String>(columnName: 'Name', value: e.name),
      DataGridCell<String>(columnName: 'Room Name', value: e.roomName),
      DataGridCell<String>(columnName: 'Food', value: e.food),
      DataGridCell<String>(columnName: 'learning', value: e.learning),
      DataGridCell<String>(columnName: 'Notes', value: e.notes),
      DataGridCell<String>(columnName: 'naps', value: e.naps),
      DataGridCell<String>(columnName: 'photos', value: e.photos),
      DataGridCell<String>(columnName: 'videos', value: e.videos),
      DataGridCell<String>(columnName: 'potty', value: e.potty),
      DataGridCell<String>(columnName: 'Bottle', value: e.bottle),
      DataGridCell<String>(columnName: 'Supplies', value: e.supplies),
      DataGridCell<String>(columnName: 'mood', value: e.mood),
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
