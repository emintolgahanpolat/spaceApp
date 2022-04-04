class Resource<T> {
  StatusEnum status;
  T? data;
  String? message;
  Resource._(this.status, {this.data, this.message});
  static Resource<T> success<T>(T? data) {
    return Resource._(StatusEnum.success, data: data);
  }

  static Resource<T> error<T>(String msg, T? data) {
    return Resource._(StatusEnum.error, data: data, message: msg);
  }

  static Resource<T> loading<T>(T? data) {
    return Resource._(StatusEnum.loading, data: data);
  }
}

enum StatusEnum { success, error, loading }
