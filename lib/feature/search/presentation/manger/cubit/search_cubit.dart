import 'package:bloc/bloc.dart';
import 'package:book_app/core/utils/errors/failure.dart';
import 'package:book_app/feature/home/data/models/book_model/item.dart';
import 'package:book_app/feature/search/data/repo/search_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchRepo) : super(SearchInitial());
  final  SearchRepo searchRepo;
  Future<void>searchResult(String query)async{
    emit(SearchLoading());
  Either<Failure,List<Item>>data= await  searchRepo.searchBook(query);
  return data.fold((failure)=>emit(SearchFailure(errorMessage: failure.errorMessage)), (book)=>emit(SearchSuccess(book)));
  }
}
