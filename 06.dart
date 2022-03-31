//

import '05_class.dart';

class Orbiter extends Spacecraft{
  double altitude;

  Orbiter(String name,DateTime launchDate,this.altitude)
  :super(name,launchDate);
}

