// import 'package:badges/badges.dart';

// import 'package:flutter/material.dart';
// import 'package:syncfusion_flutter_datagrid/datagrid.dart';

// import '../../../../models/bills.dart';
// import '../../admin_messages/admin_msg_widgets/admin_msg_list.dart';
// import '../../admin_messages/admin_msg_widgets/admin_msg_search.dart';

// import '../../notification/notification.dart';
// import 'my_bills_body.dart';
// import 'my_bills_list_widgts.dart';

// class MyBillsList extends StatefulWidget {
//   const MyBillsList({super.key});

//   @override
//   State<MyBillsList> createState() => _MyBillsListState();
// }

// class _MyBillsListState extends State<MyBillsList> {
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

//   final GlobalKey<SfDataGridState> _key = GlobalKey<SfDataGridState>();
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       height: double.infinity,
//       decoration: const BoxDecoration(
//         image: DecorationImage(
//           image: AssetImage("assets/images/background.png"),
//           fit: BoxFit.cover,
//         ),
//       ),
//       child: Column(
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: [
//               Container(child: AdminMsgSearch(), width: 160),
//             ],
//           ),
//           Container(
//             child: SfDataGrid(
//               key: _key,
//               allowFiltering: true,
//               allowColumnsResizing: true,
//               columnSizer: ColumnSizer(),
//               source: billsDataSource,
//               columnWidthMode: ColumnWidthMode.auto,
//               columns: <GridColumn>[
//                 GridColumn(
//                     columnName: 'Name',
//                     label: Container(
//                         padding: EdgeInsets.all(8.0),
//                         alignment: Alignment.center,
//                         child: Text(
//                           'Name',
//                         ))),
//                 GridColumn(
//                     columnName: 'Total',
//                     label: Container(
//                         padding: EdgeInsets.all(8.0),
//                         alignment: Alignment.center,
//                         child: Text('Total'))),
//                 GridColumn(
//                     columnName: 'Type',
//                     label: Container(
//                         padding: EdgeInsets.all(8.0),
//                         alignment: Alignment.center,
//                         child: Text(
//                           'Type',
//                           overflow: TextOverflow.ellipsis,
//                         ))),
//                 GridColumn(
//                     columnName: 'Payment Method',
//                     label: Container(
//                         padding: EdgeInsets.all(8.0),
//                         alignment: Alignment.center,
//                         child: Text('Payment Method'))),
//               ],
//             ),
//             height: 500,
//           ),
//         ],
//       ),
//     );
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
