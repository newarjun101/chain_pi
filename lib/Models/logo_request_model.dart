class LogoRequestModel {
  String _logoName;
  String _logoColor;
  String _logoDurationDay;
  String _logoDescription;

  LogoRequestModel(this._logoName, this._logoColor, this._logoDescription,this._logoDurationDay);

  LogoRequestModel.map(dynamic obj) {
    this._logoName = obj['logoName'];
    this._logoColor = obj['logoColor'];
    this._logoDescription = obj['logoDescription'];
    this._logoDurationDay = obj['logoDurationDay'];
  }

  String get logoDescription => _logoDescription;

  String get logoColor => _logoColor;

  String get logoName => _logoName;


  String get logoDurationDay => _logoDurationDay;

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map['logoName'] = _logoName;
    map['logoColor'] = _logoColor;
    map['logDescription'] = _logoDescription;
    map['logoDurationDay'] = _logoDurationDay;
    return map;
  }

  LogoRequestModel.fromMap(Map<String, dynamic> map) {
    this._logoName = map['logoName'];
    this._logoColor = map['logoColor'];
    this._logoDescription = map['logoDescription'];
    this._logoDurationDay = map['logoDurationDay'];
  }
}
