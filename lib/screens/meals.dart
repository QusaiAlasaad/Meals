import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/meal_details.dart';
import 'package:meals/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({
    super.key,
    this.title,
    required this.meals,
    required this.color,
  });

  final String? title;
  final List<Meal> meals;
  final Color color;

  void selectMeal(BuildContext context, Meal meal) {
    Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
      return MealDetailsScreen(
        meal: meal,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    Widget bodyS = meals.isEmpty
        ? Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Sorry .... There is no Meals',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                ),
              ],
            ),
          )
        : ListView.builder(
            itemCount: meals.length,
            itemBuilder: (ctx, indx) {
              return MealItem(
                meal: meals[indx],
                onSelectMeal: (meal) {
                  selectMeal(context, meal);
                },
              );
            });
    if (title == null) return bodyS;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title!,
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: color.withOpacity(0.5),
      ),
      body: bodyS,
    );
  }
}
