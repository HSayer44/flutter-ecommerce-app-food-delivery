class ResponseModel {
  //those are local variables
  bool _isSuccess;
  String _message;
  
  ResponseModel(this._isSuccess, this._message);

  //get are public fields
  String get message => _message;
  bool get isSuccess => _isSuccess;

}