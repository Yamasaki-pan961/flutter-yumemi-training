enum DioException {
  badRequest,
  badResponse,
  unknown,
}

String getDioExceptionMessage(DioException dioException) {
  if (dioException == DioException.badResponse) {
    return '不適切なデータを取得しました';
  }
  if (dioException == DioException.badRequest) {
    return 'パラメータが間違っています';
  }
  return '不明なエラーが発生しました';
}
