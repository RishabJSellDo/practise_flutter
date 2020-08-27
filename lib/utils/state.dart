import 'package:flutter/widgets.dart';

class EventState<T> {

  //methods for verifying state
  bool isLoading() => this is Progress;
  bool isError() => this is Error;
  Exception getError() => (this as Error).exception;
  bool isSuccess() => this is Success;
  T getData() => (this as Success).data;

  //consuming state to render Widget
  Widget consumeState(
      Widget Function() onDefaultState,
      Widget Function() onLoading,
      Widget Function(T data) onSuccess,
      Widget Function(Exception exception) onError) {
    if (this is Progress) {
      //progress
      return onLoading();
    } else if (this is Success) {
      //success
      return onSuccess(getData());
    } else if (this is Error) {
      //error
      return onError(getError());
    } else {
      return onDefaultState();
    }
  }
}

//State representing loading
class Progress<T> extends EventState<T> {}

//State representing success
class Success<T> extends EventState<T> {
  T data;

  Success(this.data);
}

//State representing error
class Error<T> extends EventState<T> {
  Exception exception;

  Error(this.exception);
}

//State representing default
class Default<T> extends EventState<T> {}
