class Appexceptions implements Exception{
  final _prefix;
  final _message;
  Appexceptions([this._message,this._prefix]);

  String toString() {
    return '$_prefix$_message';
  }
}
class InternetExceptions extends Appexceptions{
  InternetExceptions([String? message]):super(message, 'No Internet');
}

class RequestTimeoutExceptions extends Appexceptions{
  RequestTimeoutExceptions([String? message]):super(message, "Request Timeout");
}

class ServerExceptions extends Appexceptions{
  ServerExceptions([String? message]):super(message, "Server Exception");
}