import 'dart:html';

import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

enum HttpBodyPayloadType {
  NONE,
  JSON,
  WWW_FORM_URL_ENCOED,
}

class ReqBuilder {
  late String method;
  late String url;
  late dynamic bodyPayload;
  late HttpBodyPayloadType bodyPayloadType = HttpBodyPayloadType.NONE;
  ReqBuilder methodSet(String method) {
    this.method = method;
    return this;
  }

  ReqBuilder urlSet(String url) {
    this.url = url;
    return this;
  }

  ReqBuilder json(dynamic bodyPayload) {
    this.bodyPayload = bodyPayload;
    bodyPayloadType = HttpBodyPayloadType.JSON;
    return this;
  }

  http.Request build() {
    var url = Uri.dataFromString(this.url);
    var req = http.Request(
      method,
      url,
    );
    switch (bodyPayloadType) {
      case (HttpBodyPayloadType.JSON):
        var bodyEncoded = convert.jsonEncode(bodyPayload);
        req.body = bodyEncoded;
        break;
      case (HttpBodyPayloadType.WWW_FORM_URL_ENCOED):
        throw (Exception("TODO"));
      default:
        throw (Exception("BUG undefined http body payload type"));
    }

    return req;
  }
}
