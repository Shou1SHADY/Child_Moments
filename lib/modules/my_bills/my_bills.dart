import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../../../models/bills.dart';
import '../notification/notification.dart';
import 'my_bills_actions/my_bills_actions.dart';

class MyBills extends StatefulWidget {
  const MyBills({super.key});

  @override
  State<MyBills> createState() => _MyBillsState();
}

class _MyBillsState extends State<MyBills> {
  List<Bills> getBillsData() {
    return [
      Bills(
          name: 'Child 1',
          total: '1200',
          dueDate: '20-10-2022',
          type: 'one time',
          paymentMethod: 'Bank',
          amount: '200',
          actions: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.upload),
          )),
      Bills(
          name: 'Child 2',
          total: '1200',
          dueDate: '20-10-2022',
          type: 'one time',
          paymentMethod: 'Bank',
          amount: '300',
          actions: IconButton(
            icon: const Icon(Icons.upload),
            onPressed: () {},
          )),
    ];
  }

  List<Bills> attendance = <Bills>[];
  late BillsDataSource billsDataSource;

  @override
  void initState() {
    attendance = getBillsData();
    billsDataSource = BillsDataSource(attendance);
  }

  // final GlobalKey<SfDataGridState> _key = GlobalKey<SfDataGridState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Bills"),
        centerTitle: false,
        actions: [
          Badge(
            position: BadgePosition.topEnd(top: 10, end: 10),
            badgeContent: const Text("1"),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                  return NotificationScreen();
                }));
              },
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
            image: AssetImage("assets/images/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: SfDataGrid(
                // key: _key,
                allowFiltering: true,
                allowColumnsResizing: true,
                columnSizer: ColumnSizer(),
                source: billsDataSource,
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
                      columnName: 'Amount',
                      label: Container(
                          padding: const EdgeInsets.all(8.0),
                          alignment: Alignment.center,
                          child: const Text(
                            'Amount',
                          ))),
                  GridColumn(
                      columnName: 'Total',
                      label: Container(
                          padding: const EdgeInsets.all(8.0),
                          alignment: Alignment.center,
                          child: const Text('Total'))),
                  GridColumn(
                      columnName: 'Type',
                      label: Container(
                          padding: const EdgeInsets.all(8.0),
                          alignment: Alignment.center,
                          child: const Text(
                            'Type',
                            overflow: TextOverflow.ellipsis,
                          ))),
                  GridColumn(
                      columnName: 'Payment Method',
                      label: Container(
                          padding: const EdgeInsets.all(8.0),
                          alignment: Alignment.center,
                          child: const Text('Payment Method'))),
                  GridColumn(
                      columnName: 'Amount',
                      label: Container(
                          padding: const EdgeInsets.all(8.0),
                          alignment: Alignment.center,
                          child: const Text('Amount'))),
                  GridColumn(
                      columnName: 'Actions',
                      label: Container(
                          padding: const EdgeInsets.all(8.0),
                          alignment: Alignment.center,
                          child: const Text('Actions'))),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class BillsDataSource extends DataGridSource {
//   /// Creates the employee data source class with required details.
//   BillsDataSource({required List<Bills> employeeData}) {
//     _employeeData = employeeData
//         .map<DataGridRow>((e) => DataGridRow(cells: [
//               DataGridCell<String>(columnName: 'Name', value: e.name),
//               DataGridCell<String>(columnName: 'Amount', value: e.amount),
//               DataGridCell<String>(columnName: 'Total', value: e.total),
//               DataGridCell<String>(columnName: 'Type', value: e.type),
//               DataGridCell<String>(
//                   columnName: 'Payment Method', value: e.paymentMethod),
//               DataGridCell<String>(columnName: 'Due Date', value: e.dueDate),
//               DataGridCell<Widget>(columnName: 'Actions', value: e.actions),
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

class BillsDataSource extends DataGridSource {
  BillsDataSource(List<Bills> employees) {
    buildDataGridRow(employees);
  }

  void buildDataGridRow(List<Bills> employeeData) {
    dataGridRow = employeeData.map<DataGridRow>((employee) {
      return DataGridRow(cells: [
        DataGridCell<String>(columnName: 'Name', value: employee.name),
        DataGridCell<String>(columnName: 'Amount', value: employee.amount),
        DataGridCell<String>(columnName: 'Total', value: employee.total),
        DataGridCell<String>(columnName: 'Type', value: employee.type),
        DataGridCell<String>(
            columnName: 'Payment Method', value: employee.paymentMethod),
        DataGridCell<String>(columnName: 'Due Date', value: employee.dueDate),
        const DataGridCell<Widget>(columnName: 'button', value: null),
      ]);
    }).toList();
  }

  List<DataGridRow> dataGridRow = <DataGridRow>[];

  @override
  List<DataGridRow> get rows => dataGridRow.isEmpty ? [] : dataGridRow;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((dataGridCell) {
      return Container(
          alignment: Alignment.center,
          child: dataGridCell.columnName == 'button'
              ? LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                  return IconButton(
                    icon: const Icon(Icons.upload),
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (_) {
                        return const ActionsBills();
                      }));
                    },
                  );
                })
              : Text(dataGridCell.value.toString()));
    }).toList());
  }
}
