// import 'package:dartz/dartz.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:social_app/feature/login/data/model/user_data_model.dart';
// import 'package:social_app/feature/login/data/repos/login_repo.dart';

// import '../../../../core/errors/failure.dart';

// class LoginRepoImpl extends LoginRepo {
//   // final ApiService _apiService;

//   // LoginRepoImpl(this._apiService);
//   @override
//   Future<Either<Failure, UserDataModel>> loginUser(
    
//       {required String email, required String password}) async {
      
//        try {
//       final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
//         email: email,
//         password: password,
//       );
//       return 
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'user-not-found') {
//         emit(LoginFailureState(errorMessage: 'No user found for that email.'));
//         print('No user found for that email.');
//       } else if (e.code == 'wrong-password') {
//         emit(LoginFailureState(
//             errorMessage: 'Wrong password provided for that user.'));
//         print('Wrong password provided for that user.');
//       } else {
//         emit(LoginFailureState(errorMessage: e.message ?? 'error'));
//       }
//     } catch (e) {
//       log(e.toString());
//       emit(LoginFailureState(errorMessage: e.toString()));
//     }
//   //   try {
//   //     var data = await _apiService.post(endPoint: kLogin, data: {
//   //       'email': email,
//   //       'password': password,
//   //     });
//   //     return right(LoginModel.fromJson(data));
//   //   } catch (e) {
//   //     if (e is DioException) {
//   //       return left(ServerFailure.formDioError(e));
//   //     }
//   //     return left(ServerFailure(e.toString()));
//   //   }
//   // }
// }
