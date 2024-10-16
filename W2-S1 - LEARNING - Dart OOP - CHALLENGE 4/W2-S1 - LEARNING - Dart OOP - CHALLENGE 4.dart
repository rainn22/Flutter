class Distance{

  final double _ms;

//named constructor
  const Distance.cms(double cms): _ms = cms * 0.01;
  const Distance.ms(double ms): _ms = ms;
  const Distance.kms(double kms): _ms = kms * 1000;

//getter
   double get toCms{
    return _ms * 100 ;
  }
    double get toMs{
    return _ms;
  }
  double get toKms{
    return _ms * 0.001;
  }

  Distance operator +(Distance other) {
    return Distance.ms(this._ms + other._ms);
  }
}

void main(){
  Distance d1 = Distance.cms(3.4);
  Distance d2 = Distance.ms(1000);
  Distance d3 = Distance.kms(4);
  print((d1 + d2).toKms);
  print(d3.toMs);
}