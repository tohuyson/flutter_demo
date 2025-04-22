enum ApiState { initial, loading, success, failure }

extension ApiStateX on ApiState {
  bool get isInitial => this == ApiState.initial;
  bool get isLoading => this == ApiState.loading;
  bool get isSuccess => this == ApiState.success;
  bool get isFailure => this == ApiState.failure;
  bool get showLoading => isLoading || isInitial;
}
