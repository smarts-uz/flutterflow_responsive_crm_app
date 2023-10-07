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

class SyncfusionFlutterDataGrid extends StatefulWidget {
  const SyncfusionFlutterDataGrid({
    Key? key,
    this.width,
    this.height,
    this.customers,
  }) : super(key: key);

  final double? width;
  final double? height;
  final List<CustomersRow>? customers;

  @override
  _SyncfusionFlutterDataGridState createState() =>
      _SyncfusionFlutterDataGridState();
}

class _SyncfusionFlutterDataGridState extends State<SyncfusionFlutterDataGrid> {
  late List<CustomersRow> customers;
  late CustomersDataSource customersDataSource;

  @override
  void initState() {
    super.initState();
    customers = widget.customers ?? [];
    customersDataSource = CustomersDataSource(customersData: customers);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      child: SfDataGridTheme(
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
                if (column.sortDirection == DataGridSortDirection.ascending) {
                  icon = const Icon(Icons.arrow_upward_rounded, size: 16);
                } else if (column.sortDirection ==
                    DataGridSortDirection.descending) {
                  icon = const Icon(Icons.arrow_downward_rounded, size: 16);
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
    );
  }
}

class CustomersDataSource extends DataGridSource {
  CustomersDataSource({required List<CustomersRow> customersData}) {
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
