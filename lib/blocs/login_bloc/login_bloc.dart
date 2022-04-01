import 'package:bloc/bloc.dart';
import 'package:crowdfunding_mobile/data/models/login_model.dart';
import 'package:crowdfunding_mobile/data/models/login_response_model.dart';
import 'package:crowdfunding_mobile/data/repositories/login_repository/login_repository.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepository loginRepository;
  LoginBloc({required this.loginRepository}) : super(LoginInitial());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginUserEvent) {
      try {
        yield LoginLoadingState();
        var data = await loginRepository.loginUser(loginModel:
            event.loginModel);
            await loginRepository.persistToken(data);
        yield LoginLoadedState(loginResponseModel: data);
      } catch (e) {
        yield LoginErrorState(error: e.toString());
      }
    }

    if(event is AuthenticateUserFromLocalEvent){
      await loginRepository.getTokenFromStorage();
      print(await loginRepository.getTokenFromStorage());
    }
  }
}
