import 'package:flutter/material.dart';

import '../repository/settings_repository.dart' as settingRepo;

class App {
  BuildContext _context;
  double _height;
  double _width;
  double _heightPadding;
  double _widthPadding;

  App(_context) {
    this._context = _context;
    MediaQueryData _queryData = MediaQuery.of(this._context);
    _height = _queryData.size.height / 100.0;
    _width = _queryData.size.width / 100.0;
    _heightPadding = _height - ((_queryData.padding.top + _queryData.padding.bottom) / 100.0);
    _widthPadding = _width - (_queryData.padding.left + _queryData.padding.right) / 100.0;
  }

  double appHeight(double v) {
    return _height * v;
  }

  double appWidth(double v) {
    return _width * v;
  }

  double appVerticalPadding(double v) {
    return _heightPadding * v;
  }

  double appHorizontalPadding(double v) {
//    int.parse(settingRepo.setting.mainColor.replaceAll("#", "0xFF"));
    return _widthPadding * v;
  }
}

class ColorsApp {
  var cl=Colors.blue[800];
  var cl2=Colors.blue[900];
  Color mainColor(double opacity) {
    try {
      return cl.withOpacity(opacity);
    } catch (e) {
      return cl.withOpacity(opacity);
    }
  }

  Color secondColor(double opacity) {
    try {
      return cl2.withOpacity(opacity);
    } catch (e) {
      return cl2.withOpacity(opacity);
    }
  }

  Color mainDarkColor(double opacity) {
    try {
      return cl.withOpacity(opacity);
    } catch (e) {
      return cl.withOpacity(opacity);
    }
  }



}
