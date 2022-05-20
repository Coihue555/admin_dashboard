import 'package:admin_dashboard/models/category.dart';
import 'package:admin_dashboard/models/http/categories_response.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:admin_dashboard/api/cafeApi.dart';

part 'categories_event.dart';
part 'categories_state.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  CategoriesBloc() : super(CategoriesState()) {
    on<OnGetCategoriesEvent>(_onGetCategoriesEvent);
    
  }

  Future<void> _onGetCategoriesEvent(OnGetCategoriesEvent event, Emitter emit) async {

      final List<Categoria> categorias;

      final resp = await CafeApi.httpGet('/categorias');
      final categoriesResp = CategoriesResponse.fromMap(resp);

      categorias = [...categoriesResp.categorias];

      print(categorias);
  

    emit( state.copyWith(
      categorias: categorias


    ));
  }


}
