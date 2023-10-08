// Automatic FlutterFlow imports
import '/backend/supabase/supabase.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'dart:convert';

class SyncfusionFlutterDataGridCloud extends StatefulWidget {
  const SyncfusionFlutterDataGridCloud({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  final double? width;
  final double? height;

  @override
  _SyncfusionFlutterDataGridCloudState createState() =>
      _SyncfusionFlutterDataGridCloudState();
}

class _SyncfusionFlutterDataGridCloudState
    extends State<SyncfusionFlutterDataGridCloud> {
  late List<Customers> customers;
  late CustomersDataSource customersDataSource;
  final TextEditingController searchController = TextEditingController();
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      searchCustomers();
      customersDataSource = CustomersDataSource(customersData: customers);
    });
  }

  void searchCustomers([String searchString = '']) async {
    setState(() {
      isLoading = true;
    });
    final response = await SupaFlow.client
        .from('customers')
        .select()
        .textSearch('name', "'${searchString}'");
    customers = customersFromJson(response);
    setState(() {
      isLoading = false;
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 45,
            child: TextField(
              controller: searchController,
              onChanged: (value) {
                searchCustomers(value);
                setState(() {
                  customersDataSource =
                      CustomersDataSource(customersData: customers);
                });
              },
            ),
          ),
          isLoading
              ? CircularProgressIndicator()
              : SfDataGridTheme(
                  data: SfDataGridThemeData(
                    sortIcon: Builder(
                      builder: (context) {
                        Widget? icon;
                        String columnName = '';
                        context.visitAncestorElements((element) {
                          if (element is GridHeaderCellElement) {
                            columnName = element.column.columnName;
                          }
                          return true;
                        });
                        var column = customersDataSource.sortedColumns
                            .where((element) => element.name == columnName)
                            .firstOrNull;
                        if (column != null) {
                          if (column.sortDirection ==
                              DataGridSortDirection.ascending) {
                            icon = const Icon(Icons.arrow_upward_rounded,
                                size: 16);
                          } else if (column.sortDirection ==
                              DataGridSortDirection.descending) {
                            icon = const Icon(Icons.arrow_downward_rounded,
                                size: 16);
                          }
                        }
                        return icon ?? const SizedBox();
                      },
                    ),
                  ),
                  child: SfDataGrid(
                    source: customersDataSource,
                    allowSorting: true,
                    columns: <GridColumn>[
                      GridColumn(
                          columnName: 'id',
                          label: Container(
                              padding: EdgeInsets.all(16.0),
                              alignment: Alignment.center,
                              child: Text(
                                'ID',
                              ))),
                      GridColumn(
                          columnName: 'name',
                          columnWidthMode: ColumnWidthMode.lastColumnFill,
                          label: Container(
                              padding: EdgeInsets.all(8.0),
                              alignment: Alignment.center,
                              child: Text('Name'))),
                      GridColumn(
                          columnName: 'title',
                          label: Container(
                              padding: EdgeInsets.all(8.0),
                              alignment: Alignment.center,
                              child: Text('Title'))),
                      GridColumn(
                          columnName: 'company',
                          label: Container(
                              padding: EdgeInsets.all(8.0),
                              alignment: Alignment.center,
                              child: Text(
                                'Company',
                                overflow: TextOverflow.ellipsis,
                              ))),
                      GridColumn(
                          columnName: 'status',
                          label: Container(
                              padding: EdgeInsets.all(8.0),
                              alignment: Alignment.center,
                              child: Text('Status'))),
                    ],
                  ),
                ),
        ],
      ),
    );
  }
}

class CustomersDataSource extends DataGridSource {
  CustomersDataSource({required List<Customers> customersData}) {
    _customersData = customersData
        .map<DataGridRow>((e) => DataGridRow(cells: [
              DataGridCell<int>(columnName: 'id', value: e.id),
              DataGridCell<String>(columnName: 'name', value: e.name),
              DataGridCell<String>(columnName: 'title', value: e.title),
              DataGridCell<String>(columnName: 'company', value: e.company),
              DataGridCell<String>(columnName: 'status', value: e.status),
            ]))
        .toList();
  }

  List<DataGridRow> _customersData = [];

  @override
  List<DataGridRow> get rows => _customersData;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((e) {
      return Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(8.0),
        child: Text(e.value.toString()),
      );
    }).toList());
  }
}

List<Customers> customersFromJson(String str) =>
    List<Customers>.from(json.decode(str).map((x) => Customers.fromJson(x)));

String customersToJson(List<Customers> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Customers {
  final int id;
  final DateTime createdAt;
  final String name;
  final String title;
  final String company;
  final String status;
  final dynamic companyId;

  Customers({
    required this.id,
    required this.createdAt,
    required this.name,
    required this.title,
    required this.company,
    required this.status,
    required this.companyId,
  });

  factory Customers.fromJson(Map<String, dynamic> json) => Customers(
        id: json["id"],
        createdAt: DateTime.parse(json["created_at"]),
        name: json["name"],
        title: json["title"],
        company: json["company"],
        status: json["status"],
        companyId: json["company_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "created_at": createdAt.toIso8601String(),
        "name": name,
        "title": title,
        "company": company,
        "status": status,
        "company_id": companyId,
      };
}
