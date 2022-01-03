//clase que envia los diferentes estados para maximizar o minimizar un producto
class StateChange {
  int type;
  String change;
  StateChange({
    this.type,
    this.change,
  });
}

class Adjust {
  Adjust({
    this.codes,
    this.name,
    this.type,
    this.max,
    this.min,
  });
  int codes;
  String name;
  int type;
  int max;
  int min;
}
