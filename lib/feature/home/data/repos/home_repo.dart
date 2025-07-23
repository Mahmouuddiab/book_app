import 'package:book_app/core/utils/errors/failure.dart';
import 'package:book_app/feature/home/data/models/book_model/item.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo{
 Future<Either<Failure,List<Item>>> fetchNewestBooks();
  Future<Either<Failure,List<Item>>>fetchFeaturedBooks();
  Future<Either<Failure,List<Item>>>fetchSimilarBooks({required String category});

}