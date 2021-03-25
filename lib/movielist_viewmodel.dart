

import 'package:list_movie/movie_model.dart';
import 'package:list_movie/network_function.dart';
import 'package:stacked/stacked.dart';

class MovieListViewmodel extends BaseViewModel{

  List<MovieModel> movieList = [];
  NetworkCall _networkCall = NetworkCall();
  bool isLoading = true;

  fetchData() async{
    CustomResposne response = await _networkCall.getRequest();
    response.body['results'].forEach((e){
      movieList.add(MovieModel(e));
    });
    isLoading = false;
    notifyListeners();
  }


}