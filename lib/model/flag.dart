class Flag {
  final String key;
  final String data;
  final String code;
  final int digits;

  Flag(
      {required this.key,
      required this.data,
      required this.code,
      required this.digits});

  @override
  String toString() {
    return 'Flag{key: $key, data: $data, code: $code, digits: $digits}';
  }
}
