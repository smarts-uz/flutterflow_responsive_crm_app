import 'dart:convert';
import 'dart:typed_data';

import '../../flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start Drivers EDGE Group Code

class DriversEDGEGroup {
  static String baseUrl =
      'https://rftvbsvcljemoonofdhk.supabase.co/functions/v1';
  static Map<String, String> headers = {
    'apikey':
        'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJmdHZic3ZjbGplbW9vbm9mZGhrIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTU5MTYzNDQsImV4cCI6MjAxMTQ5MjM0NH0.X-GtVHCkph5RGu_3nijIMSSe-bFX7YxgvxJ8TfqO5E8',
    'Authorization':
        'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJmdHZic3ZjbGplbW9vbm9mZGhrIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTU5MTYzNDQsImV4cCI6MjAxMTQ5MjM0NH0.X-GtVHCkph5RGu_3nijIMSSe-bFX7YxgvxJ8TfqO5E8',
  };
  static GetDriversCall getDriversCall = GetDriversCall();
  static AddDriverCall addDriverCall = AddDriverCall();
  static UpdateDriverCall updateDriverCall = UpdateDriverCall();
  static DeleteDriverCall deleteDriverCall = DeleteDriverCall();
}

class GetDriversCall {
  Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'Get Drivers',
      apiUrl: '${DriversEDGEGroup.baseUrl}/read',
      callType: ApiCallType.GET,
      headers: {
        'apikey':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJmdHZic3ZjbGplbW9vbm9mZGhrIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTU5MTYzNDQsImV4cCI6MjAxMTQ5MjM0NH0.X-GtVHCkph5RGu_3nijIMSSe-bFX7YxgvxJ8TfqO5E8',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJmdHZic3ZjbGplbW9vbm9mZGhrIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTU5MTYzNDQsImV4cCI6MjAxMTQ5MjM0NH0.X-GtVHCkph5RGu_3nijIMSSe-bFX7YxgvxJ8TfqO5E8',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      );
  dynamic id(dynamic response) => getJsonField(
        response,
        r'''$.data[:].id''',
        true,
      );
  dynamic firstName(dynamic response) => getJsonField(
        response,
        r'''$.data[:].first_name''',
        true,
      );
  dynamic lastName(dynamic response) => getJsonField(
        response,
        r'''$.data[:].last_name''',
        true,
      );
  dynamic model(dynamic response) => getJsonField(
        response,
        r'''$.data[:].model''',
        true,
      );
  dynamic carNumber(dynamic response) => getJsonField(
        response,
        r'''$.data[:].car_number''',
        true,
      );
  dynamic color(dynamic response) => getJsonField(
        response,
        r'''$.data[:].color''',
        true,
      );
  dynamic createdAt(dynamic response) => getJsonField(
        response,
        r'''$.data[:].created_at''',
        true,
      );
}

class AddDriverCall {
  Future<ApiCallResponse> call({
    String? firstName = '',
    String? lastName = '',
    String? model = '',
    String? color = '',
    String? carNumber = '',
  }) {
    final ffApiRequestBody = '''
{
    "first_name": "${firstName}",
    "last_name": "${lastName}",
    "model": "${model}",
    "color": "${color}",
    "car_number": "${carNumber}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Add Driver',
      apiUrl: '${DriversEDGEGroup.baseUrl}/create',
      callType: ApiCallType.POST,
      headers: {
        'apikey':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJmdHZic3ZjbGplbW9vbm9mZGhrIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTU5MTYzNDQsImV4cCI6MjAxMTQ5MjM0NH0.X-GtVHCkph5RGu_3nijIMSSe-bFX7YxgvxJ8TfqO5E8',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJmdHZic3ZjbGplbW9vbm9mZGhrIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTU5MTYzNDQsImV4cCI6MjAxMTQ5MjM0NH0.X-GtVHCkph5RGu_3nijIMSSe-bFX7YxgvxJ8TfqO5E8',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.TEXT,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class UpdateDriverCall {
  Future<ApiCallResponse> call({
    int? id,
    String? firstName = '',
    String? lastName = '',
    String? model = '',
    String? color = '',
    String? carNumber = '',
  }) {
    final ffApiRequestBody = '''
{
    "id": ${id},
    "first_name": "${firstName}",
    "last_name": "${lastName}",
    "model": "${model}",
    "color": "${color}",
    "car_number": "${carNumber}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Update Driver',
      apiUrl: '${DriversEDGEGroup.baseUrl}/update',
      callType: ApiCallType.PUT,
      headers: {
        'apikey':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJmdHZic3ZjbGplbW9vbm9mZGhrIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTU5MTYzNDQsImV4cCI6MjAxMTQ5MjM0NH0.X-GtVHCkph5RGu_3nijIMSSe-bFX7YxgvxJ8TfqO5E8',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJmdHZic3ZjbGplbW9vbm9mZGhrIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTU5MTYzNDQsImV4cCI6MjAxMTQ5MjM0NH0.X-GtVHCkph5RGu_3nijIMSSe-bFX7YxgvxJ8TfqO5E8',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.TEXT,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class DeleteDriverCall {
  Future<ApiCallResponse> call({
    int? id,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Delete Driver',
      apiUrl: '${DriversEDGEGroup.baseUrl}/delete',
      callType: ApiCallType.DELETE,
      headers: {
        'apikey':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJmdHZic3ZjbGplbW9vbm9mZGhrIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTU5MTYzNDQsImV4cCI6MjAxMTQ5MjM0NH0.X-GtVHCkph5RGu_3nijIMSSe-bFX7YxgvxJ8TfqO5E8',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJmdHZic3ZjbGplbW9vbm9mZGhrIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTU5MTYzNDQsImV4cCI6MjAxMTQ5MjM0NH0.X-GtVHCkph5RGu_3nijIMSSe-bFX7YxgvxJ8TfqO5E8',
      },
      params: {
        'id': id,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

/// End Drivers EDGE Group Code

class SearchCustomersCall {
  static Future<ApiCallResponse> call({
    String? searchString = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Search Customers',
      apiUrl: 'https://rftvbsvcljemoonofdhk.supabase.co/rest/v1/customers',
      callType: ApiCallType.GET,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJmdHZic3ZjbGplbW9vbm9mZGhrIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTY5NTkxNjM0NCwiZXhwIjoyMDExNDkyMzQ0fQ.A_zMiZKDlo3wfHRlgM3nwImpWB-zXt93bqMbGis4zbA',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJmdHZic3ZjbGplbW9vbm9mZGhrIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTY5NTkxNjM0NCwiZXhwIjoyMDExNDkyMzQ0fQ.A_zMiZKDlo3wfHRlgM3nwImpWB-zXt93bqMbGis4zbA',
      },
      params: {
        'name': searchString,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
