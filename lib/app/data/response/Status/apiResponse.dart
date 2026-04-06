import 'package:cleangetxproject/app/data/response/Status/status.dart';

class Apiresponse<T>{
  Status? status;
  T? data;
  String? message;
  Apiresponse({this.status,this.message,this.data});

  Apiresponse.loading():status = Status.LOADING;

  Apiresponse.completed(this.data):status = Status.COMPLETED;

  Apiresponse.error(this.message):status = Status.ERROR;

  @override
  String toString(){
    return "Status:$status \nMessage: $message \nData: $data";
  }
}