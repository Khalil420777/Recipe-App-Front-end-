class Dietmodel{
  String name ;
  String iconPath;
  String level;
  String duration;
  String calories;
  bool viewIsSelected;

  Dietmodel({
    required this.name,
    required this.iconPath,
    required this.level,
    required this.duration,
    required this.calories,
    required this.viewIsSelected


  });

  get boxColor => null;
  static List<Dietmodel>getDiets(){
  List<Dietmodel>diet=[];
  diet.add(
    Dietmodel(name: "Honey pancake", iconPath: "assets/icons/pancakes.png", level: "Easy", duration: "30mins", calories: "180kCal", viewIsSelected: true
  )
  );
   diet.add(
    Dietmodel(name: "Canai bread", iconPath: "assets/icons/roti-canai.png", level: "Easy", duration: "20mins", calories: "230kCal", viewIsSelected: false
  )
  );
return diet;

  }

}
