import 'package:dartz/dartz.dart';
import 'package:starter_project/src/features/profiles/data/models/user_account_model.dart';
import 'package:starter_project/src/features/profiles/domain/entities/user_account.dart';

import '../../domain/domain.dart';
import '../data.dart';


class ProfileRepositoryImpl implements ProfileRepository {
  @override
  Future<Either<String,UserAccount>> getAccount(int id) async{
    Either<String, UserAccountModel> result= await RemoteDataSourceImpl().getAccount(id: id);
    var output;
    bool iserror=false;

    print('extracting from repo....');
    result.fold(
            (error)=>iserror=true,
            (data)=>output=UserAccount(data.id, data.firstName, data.lastName, data.email, data.createdDateTime)
    );

    if(iserror){
      return Left('Extraction failed');
    }else{
      return Right(output);
    }
  }



  @override
  Future<String> updateAccount(int id, String firstName, String lastName, String email) async {
    print('updating data...');
    String result= await RemoteDataSourceImpl().updateAccount(id: id, firstName: firstName, lastName: lastName, email: email);
    print('updated...');
    return result;
  }
}

