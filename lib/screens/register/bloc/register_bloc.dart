import 'package:bloc/bloc.dart';
import 'package:dellyshop/core/use_case/use_case.dart';
import 'package:dellyshop/screens/register/model/register_request_body.dart';
import 'package:dellyshop/screens/register/model/register_response_model.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/const/const.dart';
import '../../../injection.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
    final UseCase registerUser;
  RegisterBloc(this.registerUser) : super(RegisterInitial()) {
  
    on<RegisterEvent>((event, emit) async {
      if (event is RegisterNewUserEvent){
   print(event.registerRequestBody.toJson());
        // emit (Loading());
        var response= await registerUser.postUsecase("/index.php?route=extension/mstore/account/register", ([response]) => registerResponseModelFromJson(response!),event.registerRequestBody.toJson());
        response.fold((l) => emit(Error(l.message)), (r) {
          sl<SharedPreferences>().setString(User.token, r.customerId);
          emit (RegisterNewUserState(r));
        });
    }});
  }
}
