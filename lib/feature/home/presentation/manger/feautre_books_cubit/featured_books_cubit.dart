import 'package:bloc/bloc.dart';
import 'package:book_app/feature/home/data/models/book_model/item.dart';
import 'package:book_app/feature/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this .homeRepo) : super(FeaturedBooksInitial());
final HomeRepo homeRepo;
Future<void>fetchFeaturedBooks()async{
  emit(FeaturedBooksSLoading());
  var result=await homeRepo.fetchFeaturedBooks();
  result.fold((failure){
    emit(FeaturedBooksFailure(errorMessage: failure.errorMessage));
  }, (books){
        print("✅ Books fetched: ${books.length}"); // 👈 ضيفي دي هنا

    emit(FeaturedBooksSuccess(books));
  });


}

}
