import 'dart:convert';
import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class AnalyzeInvoiceImageCall {
  static Future<ApiCallResponse> call({
    String? base64Image = '',
  }) async {
    final ffApiRequestBody = '''
{
  "contents": [
    {
      "parts": [
        {
          "text": "Analyze this image. Extract medicine names and quantities. Return output strictly as a raw JSON List. Do not wrap it in an object. Keys: 'name' (string), 'qty' (integer). Example: [{\\"name\\": \\"Paracetamol\\", \\"qty\\": 50}]. Do not use Markdown formatting."
        },
        {
          "inline_data": {
            "mime_type": "image/jpeg",
            "data": "${escapeStringForJson(base64Image)}"
          }
        }
      ]
    }
  ]
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'AnalyzeInvoiceImage',
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

class AnalyzeInvoicePDFCall {
  static Future<ApiCallResponse> call({
    String? base64Image = '',
  }) async {
    final ffApiRequestBody = '''
{
  "contents": [
    {
      "parts": [
        {
          "text": "Analyze this PDF document. Extract medicine names and quantities. Return output strictly as a raw JSON List. Do not wrap it in an object. Keys: 'name' (string), 'qty' (integer). Example: [{\\"name\\": \\"Paracetamol\\", \\"qty\\": 50}]. Do not use Markdown formatting."
        },
        {
          "inline_data": {
            "mime_type": "application/pdf",
            "data": "${escapeStringForJson(base64Image)}"
          }
        }
      ]
    }
  ]
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'AnalyzeInvoicePDF',
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

class AnalyzePrescriptionCall {
  static Future<ApiCallResponse> call({
    String? base64Image = '',
  }) async {
    final ffApiRequestBody = '''
{
  "contents": [
    {
      "parts": [
        {
          "text": "Analyze this prescription image. Extract a list of all medicine names mentioned (brand names or generic names). Ignore dosage (500mg), frequency (1-0-1), and doctor's notes. Return ONLY a raw JSON object with a single key 'medicines' containing a list of strings. Example: {\\"medicines\\": [\\"Dolo 650\\", \\"Pan-D\\", \\"Metformin\\"]}. Do not use Markdown."
        },
        {
          "inline_data": {
            "mime_type": "image/jpeg",
            "data": "\${base64Image}"
          }
        }
      ]
    }
  ]
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'AnalyzePrescription',
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
