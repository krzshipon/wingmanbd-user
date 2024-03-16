class OtpResponse {
  int? responseCode;
  String? successMessage;
  String? errorMessage;

  OtpResponse({this.responseCode, this.successMessage, this.errorMessage});

  OtpResponse.fromJson(Map<String, dynamic> json) {
    responseCode = json['response_code'];
    successMessage = json['success_message'];
    errorMessage = json['error_message'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['response_code'] = responseCode;
    data['success_message'] = successMessage;
    data['error_message'] = errorMessage;
    return data;
  }
}
