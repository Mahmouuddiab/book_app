import 'package:book_app/core/utils/api_services/api_service.dart';
import 'package:book_app/core/utils/errors/failure.dart';
import 'package:book_app/feature/home/data/models/book_model/book_model.dart';
import 'package:book_app/feature/home/data/models/book_model/item.dart';
import 'package:book_app/feature/home/data/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImplementation extends HomeRepo {
  ApiService apiService;
  HomeRepoImplementation(this.apiService);
  @override
  Future<Either<Failure, List<Item>>> fetchNewestBooks()async {
var data=await apiService.get(endpoint: 'volumes?Filtering=free-ebooks&Sorting=newest &q=computer science');

try{
  var bookModel=BookModel.fromJson(data);
 return right(bookModel.items??[]);
}catch(e){
if(e is DioException){
  return left(ServerFailure.fromDioException(e));
}
return left( ServerFailure(e.toString()));
}


  }

  @override
  Future<Either<Failure, List<Item>>> fetchFeaturedBooks()async {
    var data=await apiService.get(endpoint:'volumes?Filtering=free-ebooks&Sorting=relevance &q=subject:Programming');

try{
  var bookModel=BookModel.fromJson(data);
 return right(bookModel.items??[]);
}catch(e){
if(e is DioException){
  return left(ServerFailure.fromDioException(e));
}
return left( ServerFailure(e.toString()));
}

  }
  
  @override
  Future<Either<Failure, List<Item>>> fetchSimilarBooks({required String category}) async{
    var data=await apiService.get(endpoint:'volumes?Filtering=free-ebooks&Sorting=relevance &q=subject:Programming');

try{
  var bookModel=BookModel.fromJson(data);
 return right(bookModel.items??[]);
}catch(e){
if(e is DioException){
  return left(ServerFailure.fromDioException(e));
}
return left( ServerFailure(e.toString()));
}
  }
}


