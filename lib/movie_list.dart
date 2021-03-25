import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:list_movie/constant.dart';
import 'package:list_movie/movielist_viewmodel.dart';
import 'package:stacked/stacked.dart';

class MovieList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MovieListViewmodel>.reactive(
        onModelReady: (model) {
          model.fetchData();
        },
        builder: (context, model, child) => Scaffold(
              backgroundColor: Color(0xff14192d),
              appBar: AppBar(
                backgroundColor: Color(0xff14192d),
                elevation: 0,
                title: Text('Movies'),
                actions: [
                  CircleAvatar(
                    backgroundImage: NetworkImage('https://images.unsplash.com/photo-1500648767791-00dcc994a43e?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MXx8cG9ydHJhaXR8ZW58MHx8MHw%3D&ixlib=rb-1.2.1&w=1000&q=80'),
                  ),
                  SizedBox(width: 8.0,)
                ],
              ),
              body: model.isLoading
                  ? Center(child: CircularProgressIndicator())
                  : Container(
                      padding: EdgeInsets.all(8.0),
                      child: Column(children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                                child: Text(
                              'New Videos',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            )),
                            SizedBox(
                              height: 8.0,
                            ),
                            Container(
                              height: 140,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: model.movieList.length,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      margin: EdgeInsets.symmetric(
                                          vertical: 8, horizontal: 8),
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                child: Image.network(
                                                  imageUrl +
                                                      model.movieList[index]
                                                          .imagePath,
                                                          fit: BoxFit.cover,
                                                  height: 100,
                                                  width: 150,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              model.movieList[index].movieName,
                                              style: TextStyle(fontSize: 16,color: Colors.white),
                                            ),
                                            Text(model.movieList[index].year,style: TextStyle(color: Colors.white),)
                                          ]),
                                    );
                                  }),
                            ),
                          ],
                        )
                      ]),
                    ),
            ),
        viewModelBuilder: () => MovieListViewmodel());
  }
}
