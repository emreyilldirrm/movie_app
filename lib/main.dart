import 'package:flutter/material.dart';
import 'package:gridview_movie_app/movie.dart';
import 'package:gridview_movie_app/movie_details.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Movies App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<List<Movie>>bring_the_movie() async {
    var movie_list=<Movie>[];

    var mv1=Movie(1, "49", 12, "49.png");
    var mv2=Movie(2, "Avatar", 19, "Avatar.png");
    var mv3=Movie(3, "Black_Adam", 14, "black_man.png");
    var mv4=Movie(4, "Indiana_Jones", 6, "Indiana_Jones.png");
    var mv5=Movie(1, "KARAKOMİK", 10, "karakomik.png");
    var mv6=Movie(1, "Napolyon", 3, "napolyon.png");

    movie_list.add(mv1);
    movie_list.add(mv2);
    movie_list.add(mv3);
    movie_list.add(mv4);
    movie_list.add(mv5);
    movie_list.add(mv6);

    return movie_list;
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.movie_outlined),
        backgroundColor: Colors.red,
        title: Text(widget.title),
      ),
      body: FutureBuilder<List<Movie>>(
        future: bring_the_movie(),
        builder: (context, snapshot) {
          if(snapshot.hasData){
            var movie_list=snapshot.data;

            return GridView.builder(
              itemCount: movie_list!.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2 /4,
                ),
                itemBuilder: (context, index) {
                  var movie=movie_list![index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => MovieDetails(movie: movie),));
                    },
                    child: Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset("img/${movie.img_name}"),
                          Text(movie.name,style: TextStyle(fontSize: 20),),
                          Text(movie.price.toString()+ "\u{20BA}",style: TextStyle(color: Colors.red,fontSize: 15),),

                        ],
                      ),
                    ),
                  );

                },
            );
          }
          else{
            return Center();
          }
        },
      )
    );
  }
}
