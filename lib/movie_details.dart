import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gridview_movie_app/movie.dart';

class MovieDetails extends StatefulWidget {
 Movie movie;


 MovieDetails({ required this.movie});

  @override
  State<MovieDetails> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(widget.movie.name),
        centerTitle: true,
      ),
      body: Center(
          child:
          Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                    height: 450,
                    child: Image.asset("img/${widget.movie.img_name}")),
                    Text(widget.movie.price.toString()+ "\u{20BA}",style: TextStyle(color: Colors.red,fontSize: 25),),
                TextButton(
                    style: TextButton.styleFrom(backgroundColor:Colors.red),
                    onPressed: (){
                  print(widget.movie.name+" Kiralndı");
                }, child: Text("Kirala",style: TextStyle(color: Colors.white,fontSize: 25),))
              ]),
        ),
      );
  }
}
