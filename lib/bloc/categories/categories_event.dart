part of 'categories_bloc.dart';

@immutable
abstract class CategoriesEvent {}

class OnGetCategoriesEvent extends CategoriesEvent{
  OnGetCategoriesEvent();
}

class OnNewCategoryEvent extends CategoriesEvent{
  final String name;
  OnNewCategoryEvent({ required this.name});
}

class OnUpdateCategoryEvent extends CategoriesEvent{
  final String name;
  final String id;
  OnUpdateCategoryEvent({ required this.id, required this.name});
}

class OnDeleteCategoryEvent extends CategoriesEvent{
  final String id;
  OnDeleteCategoryEvent({ required this.id,});
}