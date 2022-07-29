import 'package:cached_network_image/cached_network_image.dart';
import 'package:faruq_ui_work/constants.dart';
import 'package:flutter/material.dart';

//work
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: const ColorScheme.dark(),
      ),
      //home: ListScreen(),
      home: const DetailsScreen()
    );
  }
}

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        clipBehavior: Clip.hardEdge,
        children: [
          Positioned(
            left: 0,
            top: 0,
            right: 0,
            child: CachedNetworkImage(
              height: 210,
              fit: BoxFit.fill,
              imageUrl: kSecondDefaultImageUrl,
            ),
          ),
          Positioned(
            top: 155,
            left: 15,
            right: 0,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CachedNetworkImage(
                  imageUrl: kThirdDefault,
                  fit: BoxFit.cover,
                  height: 100,
                  placeholder: (c, s) => Container(width: 58,),
                ),
                const SizedBox(width: 10,),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Game of Thrones', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                          Text('Ended')
                        ],
                      ),
                      Container(
                        width: 35,
                        height: 35,
                        margin: const EdgeInsets.only(right: 10),
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: <Color>[
                              Color(0xff9a78fa),
                              Color(0xffdc6df9),
                            ],
                          ),
                          shape: BoxShape.circle
                        ),
                        child: Icon(Icons.check),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ListScreen extends StatelessWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Hobi'),),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index){
          return ListItem(
            imageUrl: kDefaultImageUrl,
            daysLeft: '23 left',
            title: 'Game of Thrones',
            season: 'S06E01 - The Red Woman',
            mark: '50/73',
            onPressEpisodeInfo: (){},
          );
        },
      ),
    );
  }
}


class ListItem extends StatelessWidget {
  const ListItem({
    Key? key,
    required this.title,
    required this.daysLeft,
    required this.mark,
    required this.onPressEpisodeInfo,
    required this.season,
    required this.imageUrl,
  }) : super(key: key);

  final String title, season, mark, daysLeft, imageUrl;
  final Function() onPressEpisodeInfo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              height: 120,
            ),
          ),
          const SizedBox(width: 10,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
                const SizedBox(height: 5,),
                Text(season, style: const TextStyle(color: Color(0xffc8cfca))),
                const SizedBox(height: 10,),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 8,
                        width: 200,
                        decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.topRight,
                              colors: [
                                Color(0xff8D79FD),
                                Color(0xfff168f9),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(5)
                        ),
                      ),
                    ),
                    const SizedBox(width: 10,),
                    Text(mark, style: const TextStyle(fontSize: 13, color: Color(0xffc8cfca)))
                  ],
                ),
                const SizedBox(height: 10,),
                Row(
                  children: [
                    SizedBox(
                      height: 37,
                      child: Material(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color(0xff282929),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: MaterialButton(
                            onPressed: onPressEpisodeInfo,
                            child: const Text('Episode Info'),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10,),
                    Text(daysLeft, style: const TextStyle(fontSize: 13, color: Color(0xffc8cfca)))
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
