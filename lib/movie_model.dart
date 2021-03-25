

class MovieModel{

  String imagePath;
  String movieName;
  String year;

  MovieModel(Map jsonData){
    this.movieName = jsonData['title'];
    this.year = jsonData['release_date'].toString().substring(0,4);
    this.imagePath = jsonData['poster_path'];
  }
}