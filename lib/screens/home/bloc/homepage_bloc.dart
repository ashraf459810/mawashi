import 'package:bloc/bloc.dart';
import 'package:dellyshop/core/use_case/use_case.dart';
import 'package:dellyshop/screens/home/models/categories_response_model.dart';
import 'package:dellyshop/screens/home/models/top_rating_response_model.dart';
import 'package:meta/meta.dart';

part 'homepage_event.dart';
part 'homepage_state.dart';

class HomepageBloc extends Bloc<HomepageEvent, HomepageState> {
 final UseCase getCategoies;
 final UseCase getTopRatingItems;
  HomepageBloc(this.getCategoies, this.getTopRatingItems) : super(HomepageInitial()) {
    on<HomepageEvent>((event, emit)  async {
     if (event is GetCategoriesEvent){
       print("here from bloc");
       emit (LoadingCategoryState());
       var response  = await getCategoies.getUsecase("/index.php?route=extension/mstore/category&limit=100&lang=ar", ([response]) => categoriesResponseModelFromJson(response!));
       response.fold((l) => emit(Error(l.message)), (r) => emit(GetCategoriesState(r)));
     }

      if (event is GetTopRatingItemsEvent){
       print("here from bloc");
       emit (LoadingCategoryState());
       var response  = await getTopRatingItems.postUsecase("/index.php?route=extension/mstore/product/index&sort=rating&order=DESC", ([response]) => topRatingResponseModelFromJson(response!),{});
       print(response);
       response.fold((l) => emit(Error(l.message)), (r) => emit(GetTopRatingItemsState(r)));
     }
    });
  }
}
