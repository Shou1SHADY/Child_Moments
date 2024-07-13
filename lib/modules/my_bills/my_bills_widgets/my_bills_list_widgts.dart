// import 'package:flutter/material.dart';
// import 'package:data_tables/data_tables.dart';
// import 'package:syncfusion_flutter_datagrid/datagrid.dart';
// import '../../../../models/bills.dart';
// import '../../admin_messages/admin_msg_widgets/msg_from_to_admin.dart';
// import 'my_bills_body.dart';
// import 'package:horizontal_data_table/horizontal_data_table.dart';

// class MyBillsListWidget extends StatefulWidget {
//   MyBillsListWidget({super.key});

//   @override
//   State<MyBillsListWidget> createState() => _MyBillsListWidgetState();
// }

// class _MyBillsListWidgetState extends State<MyBillsListWidget> {
//   // List<Bills> bill = [
//   //   Bills(
//   //       name: "Child Name",
//   //       total: "1200",
//   //       type: "One Time",
//   //       paymentMethod: "Bank"),
//   //   Bills(
//   //       name: "Child Name",
//   //       total: "1200",
//   //       type: "One Time",
//   //       paymentMethod: "Bank"),
//   //   Bills(
//   //       name: "Child Name",
//   //       total: "1200",
//   //       type: "One Time",
//   //       paymentMethod: "Bank"),
//   // ];

//   List<Bills> getBillsData() {
//     return [
//       Bills(
//           name: 'Child 1',
//           total: '1200',
//           DueDate: '20-10-2022',
//           type: 'one time',
//           paymentMethod: 'Bank'),
//       Bills(
//           name: 'Child 2',
//           total: '1200',
//           DueDate: '20-10-2022',
//           type: 'one time',
//           paymentMethod: 'Bank'),
//     ];
//   }

//   List<Bills> attendance = <Bills>[];
//   late BillsDataSource billsDataSource;

//   @override
//   void initState() {
//     attendance = getBillsData();
//     billsDataSource = BillsDataSource(employeeData: attendance);
//   }

//   // end date
//   final GlobalKey<SfDataGridState> _key = GlobalKey<SfDataGridState>();
//   Widget build(BuildContext context) {
//     return Container(
//       height: 500,
//       child: SfDataGrid(
//         key: _key,
//         allowFiltering: true,
//         allowColumnsResizing: true,
//         columnSizer: ColumnSizer(),
//         source: billsDataSource,
//         columnWidthMode: ColumnWidthMode.auto,
//         columns: <GridColumn>[
//           GridColumn(
//               columnName: 'Name',
//               label: Container(
//                   padding: EdgeInsets.all(8.0),
//                   alignment: Alignment.center,
//                   child: Text(
//                     'Name',
//                   ))),
//           GridColumn(
//               columnName: 'Total',
//               label: Container(
//                   padding: EdgeInsets.all(8.0),
//                   alignment: Alignment.center,
//                   child: Text('Total'))),
//           GridColumn(
//               columnName: 'Type',
//               label: Container(
//                   padding: EdgeInsets.all(8.0),
//                   alignment: Alignment.center,
//                   child: Text(
//                     'Type',
//                     overflow: TextOverflow.ellipsis,
//                   ))),
//           GridColumn(
//               columnName: 'Payment Method',
//               label: Container(
//                   padding: EdgeInsets.all(8.0),
//                   alignment: Alignment.center,
//                   child: Text('Payment Method'))),
//         ],
//       ),
//     );
//     // return Column(
//     //   children: [
//     //     Row(
//     //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//     //       children: [
//     //         Text("Name"),
//     //         Text("Total"),
//     //         Text("Type"),
//     //         Text("PayMethod"),
//     //       ],
//     //     ),
//     //     Divider(),
//     //     Padding(
//     //       padding: const EdgeInsets.only(bottom: 15, top: 15),
//     //       child: ListView.builder(
//     //         scrollDirection: Axis.vertical,
//     //         shrinkWrap: true,
//     //         itemCount: bill.length,
//     //         itemBuilder: (context, index) {
//     //           return InkWell(
//     //             onTap: () {
//     //               Navigator.of(context).push(
//     //                 MaterialPageRoute(
//     //                   builder: (_) {
//     //                     return MyBillsDetailedScreen();
//     //                   },
//     //                 ),
//     //               );
//     //             },
//     //             child: Row(
//     //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//     //               children: [
//     //                 Text(bill[index].name.toString()),
//     //                 Text(bill[index].total.toString()),
//     //                 Text(bill[index].type.toString()),
//     //                 Text(bill[index].paymentMethod.toString()),
//     //               ],
//     //             ),
//     //           );
//     //         },
//     //       ),
//     //     )
//     //   ],
//     // );
//   }
// }

// class BillsDataSource extends DataGridSource {
//   /// Creates the employee data source class with required details.
//   BillsDataSource({required List<Bills> employeeData}) {
//     _employeeData = employeeData
//         .map<DataGridRow>((e) => DataGridRow(cells: [
//               DataGridCell<String>(columnName: 'Name', value: e.name),
//               DataGridCell<String>(columnName: 'Total', value: e.total),
//               DataGridCell<String>(columnName: 'Type', value: e.type),
//               DataGridCell<String>(
//                   columnName: 'Payment Method', value: e.paymentMethod),
//             ]))
//         .toList();
//   }

//   List<DataGridRow> _employeeData = [];

//   @override
//   List<DataGridRow> get rows => _employeeData;

//   @override
//   DataGridRowAdapter buildRow(DataGridRow row) {
//     return DataGridRowAdapter(
//         cells: row.getCells().map<Widget>((e) {
//       return Container(
//         alignment: Alignment.center,
//         padding: EdgeInsets.all(8.0),
//         child: Text(e.value.toString()),
//       );
//     }).toList());
//   }
// }
