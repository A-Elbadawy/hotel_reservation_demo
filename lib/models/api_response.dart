class APIResponse<T> {
  T? data;
  bool error;
  String? errorMessage;
  Map<String, dynamic>? errors;

  APIResponse({this.data, this.error = false, this.errorMessage, this.errors});
}
