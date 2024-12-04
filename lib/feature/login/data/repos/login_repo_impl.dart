// import 'package:dartz/dartz.dart';
// import 'package:dio/dio.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:shopy_app/core/errors/failure.dart';
// import 'package:shopy_app/core/utils/api_service.dart';
// import 'package:shopy_app/core/utils/end_points.dart';
// import 'package:shopy_app/feature/login/data/model/login_model.dart';
// import 'package:shopy_app/feature/login/data/repos/login_repo.dart';

// class LoginRepoImpl extends LoginRepo {
//   final ApiService _apiService;

//   LoginRepoImpl(this._apiService);
//   @override
//   Future<Either<Failure, LoginModel>> loginUser(
    
//       {required String email, required String password}) async {
//         try {
//   final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
//     email: emailAddress,
//     password: password,
//   );
//   credential.user.
// } on FirebaseAuthException catch (e) {
//   if (e.code == 'weak-password') {
//     print('The password provided is too weak.');
//   } else if (e.code == 'email-already-in-use') {
//     print('The account already exists for that email.');
//   }
// } catch (e) {
//   print(e);
// }
//     try {
//       var data = await _apiService.post(endPoint: kLogin, data: {
//         'email': email,
//         'password': password,
//       });
//       return right(LoginModel.fromJson(data));
//     } catch (e) {
//       if (e is DioException) {
//         return left(ServerFailure.formDioError(e));
//       }
//       return left(ServerFailure(e.toString()));
//     }
//   }
// }
