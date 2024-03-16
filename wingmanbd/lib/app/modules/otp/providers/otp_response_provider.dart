import 'package:get/get.dart';

import '../otp_response_model.dart';

class OtpResponseProvider extends GetConnect {
  @override
  void onInit() {
    super.onInit();
    // httpClient.baseUrl = 'https://bulksmsbd.net';
    // httpClient.defaultDecoder = (map) {
    //   if (map is Map<String, dynamic>) return OtpResponse.fromJson(map);
    //   if (map is List) {
    //     return map.map((item) => OtpResponse.fromJson(item)).toList();
    //   }
    // };
  }

  Future<OtpResponse?> getOtpResponse(String message, String number) async {
    httpClient.baseUrl = 'https://bulksmsbd.net';
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return OtpResponse.fromJson(map);
      if (map is List) {
        return map.map((item) => OtpResponse.fromJson(item)).toList();
      }
    };
    // final response = await get("/api/smsapi", query: {
    //   'api_key': 'maBb66HyAA0PEXV1SctL',
    //   'type': 'text',
    //   'number': number,
    //   'senderid': '8809617617751',
    //   'message': message
    // });

    return OtpResponse(responseCode: 202, successMessage: "Otp sent");
    // if (response.status.hasError) {
    //   return Future.error(response.statusText!);
    // } else {
    //   return response.body;
    // }
  }
}
