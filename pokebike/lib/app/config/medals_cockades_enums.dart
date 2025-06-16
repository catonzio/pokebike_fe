import 'dart:ui';
import 'package:get/get.dart';

enum Medals {
  none(0, 40, "none", "none", Color(0xFF434343)),
  bronzo(40, 120, "bronzo", "bronze", Color(0xFFb27e68)),
  argento(120, 180, "argento", "silver", Color(0xFFc0c0c0)),
  oro(180, 250, "oro", "gold", Color(0xFFffd700)),
  platino(250, 500, "platino", "platinum", Color(0xFFe5e4e2)),
  diamante(500, 973, "diamante", "diamond", Color(0xFFb9f2ff));

  final int lb;
  final int? ub;
  final String iconName;
  final Color color;
  final String name;
  const Medals(this.lb, this.ub, this.iconName, this.name, this.color);
}

enum Cockades {
  none(0, 10, "none", Color(0xFF434343)),
  bronzo(10, 20, "bronzo", Color(0xFFb27e68)),
  argento(20, 30, "argento", Color(0xFFc0c0c0)),
  oro(30, 45, "oro", Color(0xFFffd700)),
  platino(45, 70, "platino", Color(0xFFe5e4e2)),
  diamante(70, null, "diamante", Color(0xFFb9f2ff));

  final int lb;
  final int? ub;
  final String iconName;
  final Color color;
  const Cockades(this.lb, this.ub, this.iconName, this.color);

  Cockades get next {
    if (iconName == Cockades.none.iconName) {
      return Cockades.bronzo;
    }
    if (iconName == Cockades.bronzo.iconName) {
      return Cockades.argento;
    }
    if (iconName == Cockades.argento.iconName) {
      return Cockades.oro;
    }
    if (iconName == Cockades.oro.iconName) {
      return Cockades.platino;
    }
    if (iconName == Cockades.platino.iconName) {
      return Cockades.diamante;
    }
    if (iconName == Cockades.diamante.iconName) {
      return Cockades.diamante;
    }
    return Cockades.none;
  }
}
