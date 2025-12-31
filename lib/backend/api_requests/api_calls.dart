import 'dart:convert';
import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class AnalyzeInvoiceCall {
  static Future<ApiCallResponse> call({
    String? base64Image = '',
  }) async {
    final ffApiRequestBody = '''
{
  "contents": [
    {
      "parts": [
        {
          "text": "Analyze this image. Extract medicine names and quantities. Return ONLY a raw JSON list. keys: 'name' (string), 'qty' (integer). Example: [{\\"name\\": \\"Paracetamol\\", \\"qty\\": 50}]. NO markdown."
        },
        {
          "inline_data": {
            "mime_type": "*/*",
            "data": "${escapeStringForJson(base64Image)}"
          }
        }
      ]
    }
  ]
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'AnalyzeInvoice',
      apiUrl:
          'https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash:generateContent?key=AIzaSyDAT2Ches-vkZRHU9W7Q7R-H3XIgsZhY04',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class FindGenericCall {
  static Future<ApiCallResponse> call({
    String? userQuery = '',
  }) async {
    final ffApiRequestBody = '''
{
  "contents": [
    {
      "parts": [
        {
          "text": "Role: You are an expert Pharmacist and Chemist. Task: I have a medicine brand name: \\"${escapeStringForJson(userQuery)}\\". Identify its primary generic chemical salt name. Constraints: 1. Return ONLY the generic name as a single string. 2. Do not write any sentences, explanations, or extra words. 3. If the input is already a generic name, return it as is. 4. If you cannot identify it with 100% certainty, return exactly \\"null\\". 5. Do not hallucinate or guess."
        }
      ]
    }
  ]
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'FindGeneric',
      apiUrl:
          'https://generativelanguage.googleapis.com/v1/models/gemini-1.0-pro:generateContent?key=AIzaSyDlMBh9sAAnIqmcRVboc4GsDbybdDXyA1M',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class AnalyzeTextCall {
  static Future<ApiCallResponse> call({
    String? queryText = '',
  }) async {
    final ffApiRequestBody = '''
{
  "contents": [
    {
      "parts": [
        {
          "text": "Extract medicine names and quantities from this text: \\"${escapeStringForJson(queryText)}\\". Output strictly in JSON format: [{\\"name\\": \\"MedicineName\\", \\"qty\\": 0}]. Correct spelling errors based on common medicine names. Ignore prices."
        }
      ]
    }
  ]
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'AnalyzeText',
      apiUrl:
          'https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash:generateContent?key=AIzaSyDAT2Ches-vkZRHU9W7Q7R-H3XIgsZhY04',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
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

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  return input
      .replaceAll('\\', '\\\\')
      .replaceAll('"', '\\"')
      .replaceAll('\n', '\\n')
      .replaceAll('\t', '\\t');
}
