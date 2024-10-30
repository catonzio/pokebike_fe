class ApiResponse {
  final int? status;
  final String message;
  final dynamic data;
  final bool success;

  ApiResponse({
    this.status,
    required this.message,
    required this.data,
    required this.success,
  });

  factory ApiResponse.success({
    int? status,
    required String message,
    required dynamic data,
  }) {
    return ApiResponse(
      status: status,
      message: message,
      data: data,
      success: true,
    );
  }

  factory ApiResponse.error({
    int? status,
    required String message,
    required dynamic data,
  }) {
    return ApiResponse(
      status: status,
      message: message,
      data: data,
      success: false,
    );
  }
}
