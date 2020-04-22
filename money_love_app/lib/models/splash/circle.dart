class Circle {
  double _dX;
  double _dY;

  Circle(this._dX, this._dY);

  double get dY => _dY;

  set dY(double value) {
    _dY = value;
  }

  double get dX => _dX;

  set dX(double value) {
    _dX = value;
  }
}
