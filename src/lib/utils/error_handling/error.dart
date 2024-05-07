class Error {
  final String code;
  final String message;
  
  Error(this.code, this.message);

  static final Error none = Error('', '');
}