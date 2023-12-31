import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'syncfusion_flutter_datagrid_widget.dart'
    show SyncfusionFlutterDatagridWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SyncfusionFlutterDatagridModel
    extends FlutterFlowModel<SyncfusionFlutterDatagridWidget> {
  ///  Local state fields for this page.

  List<CustomersRow> customers = [];
  void addToCustomers(CustomersRow item) => customers.add(item);
  void removeFromCustomers(CustomersRow item) => customers.remove(item);
  void removeAtIndexFromCustomers(int index) => customers.removeAt(index);
  void insertAtIndexInCustomers(int index, CustomersRow item) =>
      customers.insert(index, item);
  void updateCustomersAtIndex(int index, Function(CustomersRow) updateFn) =>
      customers[index] = updateFn(customers[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
