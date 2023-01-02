import 'dart:html';

import 'package:flutter/gestures.dart';
import 'package:flutter_with_mvvm_acrhiecture/data/response/status.dart';

class ApiResponse<T> {
  Status? status;
  T? data;
  String? message;
  ApiResponse(this.data, this.message, this.status);
  ApiResponse.loading() : status = Status.LOADING;
  ApiResponse.completed() : status = Status.COMPLETED;

  ApiResponse.error() : status = Status.ERROR;
  @override
  String toString() {
    return "Status :$status \n Message :$message \n Message :$data \n Message";
  }
}
