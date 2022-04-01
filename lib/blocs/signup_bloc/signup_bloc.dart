import 'package:bloc/bloc.dart';
import 'package:crowdfunding_mobile/data/models/signup_model.dart';
import 'package:crowdfunding_mobile/data/models/signup_response_model.dart';
import 'package:crowdfunding_mobile/data/repositories/signup_repository/signup_repository.dart';
import 'package:meta/meta.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
 

 final SignUpRepository signUpRepository;

  SignupBloc({required this.signUpRepository}) : super(SignupInitial()); 
  
  @override
  Stream<SignupState> mapEventToState(
    SignupEvent event) async* {
      print("in bloc");
    
    if(event is UserSignUpEvent){
      try{
        print("***started loading");
        yield SignUpLoadingState();
        var data = await signUpRepository.signUp(event.signUpModel);
        print("***Loaded");
        print(data);
        yield SignUpLoadedState(signUpResponseModel: data);
      }catch(e){
        print("***Catch started");
        yield SignUpErrorState(error: e.toString());
        print("e");
      }
    }
    }

}
