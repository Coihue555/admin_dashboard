part of 'categories_bloc.dart';

@immutable
class CategoriesState {

 final List<Categoria> categorias;

 CategoriesState({
   List<Categoria>? categorias,
 }) : categorias = categorias ?? [];


CategoriesState copyWith({
  List<Categoria>? categorias,
}) => 
    CategoriesState(
      categorias: categorias ?? this.categorias,
    );


}
