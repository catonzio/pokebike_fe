import 'dart:ui';

enum Medals {
  none(0, 0, "none", Color(0xFF434343)),
  bronzo(0, 40, "bronzo", Color(0xFFb27e68)),
  argento(40, 120, "argento", Color(0xFFc0c0c0)),
  oro(120, 180, "oro", Color(0xFFffd700)),
  platino(180, 250, "platino", Color(0xFFe5e4e2)),
  diamante(250, null, "diamante", Color(0xFFb9f2ff));

  final int lb;
  final int? ub;
  final String iconName;
  final Color color;
  const Medals(this.lb, this.ub, this.iconName, this.color);
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
