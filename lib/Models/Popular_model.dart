class PopularModel {
    String name ;
  String iconPath;
  String level;
  String duration;
  String calories;
  bool viewIsSelected;


PopularModel({
  required this.name,
    required this.iconPath,
    required this.level,
    required this.duration,
    required this.calories,
    required this.viewIsSelected
});
static List<PopularModel>getpopulars(){
  List<PopularModel>populars=[];
  populars.add(PopularModel(name: 'Blueberry pancake', iconPath: 'assets/icons/blue-pancakes.png',
   level: 'Medium', duration: "30mins", calories: "230kCal", viewIsSelected: true)
  );
  populars.add(PopularModel(name: 'Salmon Nigiri', iconPath: 'assets/icons/nigiri.png',
   level: 'Easy', duration: "20mins", calories: "120kCal", viewIsSelected: false)
  );

  return populars;
  

}




}