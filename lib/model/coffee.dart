class CoffeeTypes {
  List<Coffee> coffee;

  CoffeeTypes({this.coffee});

  CoffeeTypes.fromJson(Map<String, dynamic> json) {
    if (json['coffee'] != null) {
      coffee = new List<Coffee>();
      json['coffee'].forEach((v) {
        coffee.add(new Coffee.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.coffee != null) {
      data['coffee'] = this.coffee.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Coffee {
  String name;
  String description;
  String ratio;
  String cup;

  Coffee({this.name, this.description, this.ratio, this.cup});

  Coffee.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    ratio = json['ratio'];
    cup = json['cup'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['description'] = this.description;
    data['ratio'] = this.ratio;
    data['cup'] = this.cup;
    return data;
  }
}
