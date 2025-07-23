import 'package:book_app/core/utils/api_services/api_service.dart';
import 'package:book_app/core/utils/errors/failure.dart';
import 'package:book_app/feature/home/data/models/book_model/book_model.dart';
import 'package:book_app/feature/home/data/models/book_model/item.dart';
import 'package:book_app/feature/search/data/repo/search_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SearchRepoImpl  extends SearchRepo{
  SearchRepoImpl(this.apiService);
  ApiService apiService;
  @override
  Future<Either<Failure, List<Item>>> searchBook(String query) async{
    try {
  final data= await apiService.get(endpoint:'volumes?Filtering=free-ebooks&q=$query' );
    final bookModel= BookModel.fromJson(data);
    return right(bookModel.items??[]);
    }  catch (e) {
      if(e is DioException){
        return left(ServerFailure.fromDioException(e));
      }else{
       return left(ServerFailure(e.toString()));
      }
}
  
  
  }
}