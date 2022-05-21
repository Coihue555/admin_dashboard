import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:admin_dashboard/api/cafeApi.dart';
import 'package:admin_dashboard/models/category.dart';
import 'package:admin_dashboard/models/http/categories_response.dart';

part 'categories_event.dart';
part 'categories_state.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  CategoriesBloc() : super(CategoriesState()) {
    on<OnGetCategoriesEvent>(_onGetCategoriesEvent);
    on<OnNewCategoryEvent>(_onNewCategoryEvent);
    on<OnUpdateCategoryEvent>(_onUpdateCategoryEvent);
    on<OnDeleteCategoryEvent>(_onDeleteCategoryEvent);
    
  }

  Future<void> _onGetCategoriesEvent(OnGetCategoriesEvent event, Emitter emit) async {

      final List<Categoria> categorias;
      final resp = await CafeApi.httpGet('/categorias');
      final categoriesResp = CategoriesResponse.fromMap(resp);

      categorias = [...categoriesResp.categorias];

      emit( state.copyWith(
        categorias: categorias
      ));
  }

    Future<void> _onNewCategoryEvent(OnNewCategoryEvent event, Emitter emit) async {

      emit( state.copyWith(
        categorias: state.categorias
      ));

      final categorias = state.categorias;
      final data = { 'nombre': event.name};
      
      try {
        final json = await CafeApi.post('/categorias', data);
        final newCategory = Categoria.fromMap(json);

        categorias.add(newCategory);

      } catch (e) {
        throw 'Error al crear categoria';
      }


      emit( state.copyWith(
        categorias: categorias
      ));
  }

  Future<void> _onUpdateCategoryEvent(OnUpdateCategoryEvent event, Emitter emit) async {

      emit( state.copyWith(
        categorias: state.categorias
      ));

      List<Categoria> categorias = state.categorias;
      final String id = event.id;
      final data = { 'nombre': event.name, };
      
      try {
        await CafeApi.put('/categorias/$id', data);
        categorias = categorias.map(
          (category) {
            if(category.id != id) return category;
            category.nombre = event.name;
            return category;
          }).toList();

      } catch (e) {
        throw 'Error al actualizar categoria';
      }


      emit( state.copyWith(
        categorias: categorias
      ));
  }

  Future<void> _onDeleteCategoryEvent(OnDeleteCategoryEvent event, Emitter emit) async {

      emit( state.copyWith(
        categorias: state.categorias
      ));

      List<Categoria> categorias = state.categorias;
      final String id = event.id;
      
      try {
        await CafeApi.delete('/categorias/$id', {});
        
        categorias.removeWhere((categoria) => categoria.id == event.id);

      } catch (e) {
        throw 'Error al eliminar categoria';
      }


      emit( state.copyWith(
        categorias: categorias
      ));
  }


}
