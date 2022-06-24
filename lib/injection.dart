

import 'package:dellyshop/core/network/http_helper.dart';
import 'package:dellyshop/core/network/http_helper_imp.dart';
import 'package:dellyshop/screens/brand_detail/bloc/items_bloc.dart';
import 'package:dellyshop/screens/cart/bloc/cart_bloc.dart';
import 'package:dellyshop/screens/home/bloc/homepage_bloc.dart';
import 'package:dellyshop/screens/register/bloc/register_bloc.dart';

import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/repository/repository.dart';
import 'core/repository/repository_imp.dart';
import 'core/use_case/use_case.dart';





final sl = GetIt.instance;

Future iniGetIt() async {

     sl.registerFactory(
    () => HomepageBloc(sl(),sl(),sl()
     
    ),
  );
     sl.registerFactory(
    () => ItemsBloc(sl(),
     sl()
    ),
  );
       sl.registerFactory(
    () => RegisterBloc(sl(),
    
    ),
  );

      sl.registerLazySingleton(
    () => CartBloc(sl(),
     sl()
    ),
  );




  //data
SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => Client());
  sl.registerLazySingleton<HttpHelper>(() => HttpHelperImp(sl()));
  sl.registerLazySingleton<Repository>(() => RepositoryImp(sl()));
  sl.registerLazySingleton<UseCase>(() => UseCaseImp(sl(),));


}