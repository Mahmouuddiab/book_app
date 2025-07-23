import 'package:book_app/core/utils/errors/failure.dart';
import 'package:book_app/feature/home/data/models/book_model/item.dart';
import 'package:dartz/dartz.dart';

abstract class SearchRepo{
  Future<Either<Failure,List<Item>>>searchBook(String query);

}