import 'package:assignment10/model/UserPost.dart';
import 'package:flutter/material.dart';
import 'package:flutter_reaction_button/flutter_reaction_button.dart';

class Assignment11_6 extends StatefulWidget {
  const Assignment11_6({Key? key}) : super(key: key);

  @override
  _Assignment11_6State createState() => _Assignment11_6State();
}

class _Assignment11_6State extends State<Assignment11_6> {
  List<UserPost> entries = [
    UserPost('Post 1','https://cdn.pixabay.com/photo/2016/05/05/02/37/sunset-1373171_960_720.jpg',false),
    UserPost('Post 2','https://cdn.pixabay.com/photo/2016/05/05/02/37/sunset-1373171_960_720.jpg',false),
    UserPost('Post 3','https://cdn.pixabay.com/photo/2016/05/05/02/37/sunset-1373171_960_720.jpg',false),
    UserPost('Post 4','https://cdn.pixabay.com/photo/2016/05/05/02/37/sunset-1373171_960_720.jpg',false)

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
       title: Text('Flutter reaction button'),
       actions: [
         FlutterReactionButton(
           boxItemsSpacing: 20,
           boxPadding: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
           boxColor: Colors.black.withOpacity(0.7),
           boxRadius: 5,
           onReactionChanged: (reaction, index) {
             print('reaction selected index: $index');
           },
           reactions: <Reaction>[
             Reaction(
               previewIcon: Column(
                 children: [
                   Text('Flag',style: TextStyle(color: Colors.white),),
                   Icon(Icons.flag_outlined,color: Colors.white,)
                 ],
               ),
               icon:
                   Icon(Icons.flag_outlined)
               ,
             ),
             Reaction(
               previewIcon: Column(
                 children: [
                   Text('Bike',style: TextStyle(color: Colors.white),),
                   Icon(Icons.motorcycle_rounded,color: Colors.white,)
                 ],
               ),
               icon:
               Icon(Icons.motorcycle_rounded)
               ,
             ),
             Reaction(
               previewIcon: Column(
                 children: [
                   Text('health',style: TextStyle(color: Colors.white),),
                   Icon(Icons.business_center,color: Colors.white,)
                 ],
               ),
               icon:
               Icon(Icons.business_center)
               ,
             ),
             Reaction(
               previewIcon: Column(
                 children: [
                   Text('Bus',style: TextStyle(color: Colors.white),),
                   Icon(Icons.directions_bus_rounded,color:Colors.white)
                 ],
               ),
               icon:
               Icon(Icons.directions_bus_rounded)
               ,
             ),
             Reaction(
               previewIcon: Column(
                 children: [
                   Text('Car',style: TextStyle(color: Colors.white),),
                   Icon(Icons.directions_car,color: Colors.white)
                 ],
               ),
               icon:
               Icon(Icons.directions_car)
               ,
             ),
           ],
           initialReaction: Reaction(
             previewIcon: Row(
               children: [
                 Text('English',style: TextStyle(color: Colors.white),),
                 Icon(Icons.flag_outlined)
               ],
             ),
             icon:
             Icon(Icons.flag_outlined)
             ,
           ),
         )
       ],

     ),

      body: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: entries.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              semanticContainer: true,
              child:
                Column(
                  children: [
                    Image.network('${entries[index].image}',),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [

                        TextButton.icon(onPressed: (){
                        setState(() {
                          entries[index].like = !entries[index].like;
                        });
                        }, icon: entries[index].like ? Icon(Icons.thumb_up):Icon(Icons.thumb_up_alt_outlined), label: Text('Like')),
                        TextButton.icon(onPressed: (){}, icon: Icon(Icons.comment), label: Text('Comment')),
                        TextButton.icon(onPressed: (){}, icon: Icon(Icons.share), label: Text('Share'))
                      ],
                    )
                  ],
                ),


            );
          }
      ),
    );
  }
}
