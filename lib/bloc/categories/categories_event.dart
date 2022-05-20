part of 'categories_bloc.dart';

@immutable
abstract class CategoriesEvent {}

class OnGetCategoriesEvent extends CategoriesEvent{
  OnGetCategoriesEvent();
}