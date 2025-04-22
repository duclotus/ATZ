import 'dart:convert';
import 'package:flutter/foundation.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class PushNotificationCall {
  static Future<ApiCallResponse> call({
    String? contentEn = '',
    String? headingEn = '',
    String? subtitleEn = '',
    String? appId = '',
    String? externalId = '',
    String? sendAfter = '',
  }) async {
    final ffApiRequestBody = '''
{
  "target_channel": "push",
  "contents": {
    "en": "${contentEn}"
  },
  "headings": {
    "en": "${headingEn}"
  },
  "subtitle": {
    "en": "${subtitleEn}"
  },
  "app_id": "${appId}",
  "include_aliases": {
    "external_id": [
      "${externalId}"
    ]
  },
  "send_after": "${sendAfter}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'PushNotification',
      apiUrl: 'https://api.onesignal.com/notifications?c=push',
      callType: ApiCallType.POST,
      headers: {
        'accept': 'application/json',
        'content-type': 'application/json',
        'Authorization':
            'os_v2_app_ysuqprtcffdntmnmwox2joc6rsld3krbwl5efzvak6mxidngfelguodfay3nw33w6jg36we5tpesbmelt3v426hgqmabqzm3u5xjfeq',
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

class OnesignalNotificationCall {
  static Future<ApiCallResponse> call({
    String? contentEn = '',
    String? headingEn = '',
    String? appId = '',
    String? externalId = '',
    String? sendAfter = '',
    String? subtitleEn = '',
  }) async {
    final ffApiRequestBody = '''
{
  "target_channel": "push",
  "contents": {
    "en": "${escapeStringForJson(contentEn)}"
  },
  "headings": {
    "en": "${escapeStringForJson(headingEn)}"
  },
  "subtitle": {
    "en": "${escapeStringForJson(subtitleEn)}"
  },
  "app_id": "${escapeStringForJson(appId)}",
  "include_aliases": {
    "external_id": [
      "${escapeStringForJson(externalId)}"
    ]
  },
  "send_after": "${escapeStringForJson(sendAfter)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'OnesignalNotification',
      apiUrl: 'https://api.onesignal.com/notifications?c=push',
      callType: ApiCallType.POST,
      headers: {
        'accept': 'application/json',
        'content-type': 'application/json',
        'Authorization':
            'os_v2_app_ysuqprtcffdntmnmwox2joc6rtb3izmoibyupcvxx5m6ub36lgj7mfwplrmpzgs54jlmweob3xks5fdr4f6asg6p2xkezi5az7a5u6i',
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
