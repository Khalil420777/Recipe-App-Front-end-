import 'package:first/Models/Category_model.dart';
import 'package:first/Models/Diet_model.dart';
import 'package:first/Models/Popular_model.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<CategoryModel> categories = [];
  List<Dietmodel> diets = [];
  List<PopularModel> popular = [];

  void getInitialInfos() {
    categories = CategoryModel.getCategories();
    diets = Dietmodel.getDiets();
    popular = PopularModel.getpopulars();
  }

  @override
  Widget build(BuildContext context) {
    getInitialInfos();
    return Scaffold(
      appBar: appBar(),
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          searchField(),
          const SizedBox(height: 40),
          categorySection(),
          const SizedBox(height: 40),
          recommendationSection(),
          const SizedBox(height: 15),
          dietList(),
          const SizedBox(height: 40),
          popularSection(),
          const SizedBox(height: 15),
          popularList(),
          const SizedBox(height: 40),
        ],
      ),
    );
  }

  Widget recommendationSection() {
    return const Padding(
      padding: EdgeInsets.only(left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Recommendation\nfor diet',
            style: TextStyle(
              color: Colors.black,
              fontSize: 25,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget popularSection() {
    return const Padding(
      padding: EdgeInsets.only(left: 20),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Popular',
            style: TextStyle(
              color: Colors.black,
              fontSize: 25,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget dietList() {
    return Container(
      height: 300,
      child: ListView.separated(
        itemBuilder: (context, index) {
          return dietItem(index);
        },
        separatorBuilder: (context, index) => const SizedBox(width: 25),
        itemCount: diets.length,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 20),
      ),
    );
  }

  Widget dietItem(int index) {
    return Container(
      width: 200,
      decoration: BoxDecoration(
        color: categories[index].boxColor.withOpacity(0.3),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            diets[index].iconPath,
            width: 100,
            height: 80,
          ),
          Text(
            diets[index].name,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.black,
              fontSize: 16,
            ),
          ),
          Text(
            '${diets[index].level} | ${diets[index].duration} | ${diets[index].calories}',
            style: const TextStyle(
              color: Color(0xff7B6f72),
              fontSize: 13,
              fontWeight: FontWeight.w400,
            ),
          ),
          Container(
            height: 45,
            width: 130,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: diets[index].viewIsSelected
                    ? [const Color(0xff9DCEFF), const Color(0xff92A3FD)]
                    : [Colors.transparent, Colors.transparent],
              ),
              borderRadius: BorderRadius.circular(50),
            ),
            child: Center(
              child: Text(
                'View',
                style: TextStyle(
                  color: diets[index].viewIsSelected
                      ? Colors.white
                      : const Color(0xffC58BF2),
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget popularList() {
    return ListView.separated(
      itemBuilder: (context, index) {
        return popularItem(index);
      },
      separatorBuilder: (context, index) => const SizedBox(height: 25),
      itemCount: popular.length,
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(horizontal: 20),
    );
  }

  Widget popularItem(int index) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: popular[index].viewIsSelected ? Colors.white : Colors.transparent,
        borderRadius: BorderRadius.circular(16),
        boxShadow: popular[index].viewIsSelected
            ? [
                BoxShadow(
                  color: const Color(0xff1D1617).withOpacity(0.07),
                  offset: const Offset(0, 10),
                  blurRadius: 40,
                ),
              ]
            : [],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            popular[index].iconPath,
            width: 65,
            height: 65,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                popular[index].name,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              Text(
                '${popular[index].level} | ${popular[index].duration} | ${popular[index].calories}',
                style: const TextStyle(
                  color: Color(0xff7B6f72),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          GestureDetector(
          
            child: Image.asset(
              'assets/icons/next-button.png',
              width: 30,
              height: 30,
            ),
          ),
        ],
      ),
    );
  }

  Widget categorySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            "Category",
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(height: 15),
        Container(
          height: 150,
          child: ListView.separated(
            itemCount: categories.length,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            separatorBuilder: (context, index) => const SizedBox(width: 25),
            itemBuilder: (context, index) {
              return categoryItem(index);
            },
          ),
        ),
      ],
    );
  }

  Widget categoryItem(int index) {
    return Container(
      width: 100,
      decoration: BoxDecoration(
        color: categories[index].boxColor.withOpacity(0.3),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                categories[index].iconPath,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            categories[index].name,
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              color: Colors.black,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget searchField() {
    return Container(
      margin: const EdgeInsets.only(top: 40, left: 20, right: 20),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.11),
            blurRadius: 40,
          ),
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.search, color: Colors.grey, size: 35),
          filled: true,
          fillColor: Colors.white,
          hintText: 'Search pancake',
          hintStyle: const TextStyle(color: Colors.grey, fontSize: 16),
          contentPadding: const EdgeInsets.all(15),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      title: const Text(
        'Breakfast',
        style: TextStyle(
          color: Colors.black,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: Colors.white,
      centerTitle: true,
      leading: const Icon(
        Icons.arrow_back,
        color: Colors.black,
      ),
    );
  }
}
