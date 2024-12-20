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
    "en": "$contentEn"
  },
  "headings": {
    "en": "$headingEn"
  },
  "subtitle": {
    "en": "$subtitleEn"
  },
  "app_id": "$appId",
  "include_aliases": {
    "external_id": [
      "$externalId"
    ]
  },
  "send_after": "$sendAfter"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'PushNotification',
      apiUrl: 'https://api.onesignal.com/notifications?c=push',
      callType: ApiCallType.POST,
      headers: {
        'accept': 'application/json',
        'content-type': 'application/json',
        'Authorization':
            'Basic MzgzZGYzZDEtMGU0MS00YzA3LTlkNDUtNmJiOGI3NThjZWZk',
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
