import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Home.dart';


class Image_Searched extends StatelessWidget {
  const Image_Searched({Key? key, required this.images}) : super(key: key);
  final images;
  @override
  Widget build(BuildContext context) {
    List<String> recipe_name = <String>['recipe1','recipe2','recipe3','recipe4','recipe5'];
    List<bool> isfavorite = <bool>[true, false, false, true, true];

    return MaterialApp(
      home: DefaultTextStyle(
        style: TextStyle(
          fontSize: 20,
          fontFamily: 'Sunflower',
          color: Colors.black,
        ),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            leading: IconButton(
              icon: Icon(Icons.arrow_back_rounded, color: Colors.black,),
              onPressed: (){ // 뒤로가기
                Navigator.pop(context);
              },
            ),
            actions: [
              IconButton(
                  onPressed: (){},
                  icon: Icon(Icons.search, color: Colors.black,)
              ),
              IconButton(
                  onPressed: (){},
                  icon: Icon(Icons.menu, color: Colors.black,)
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.fromLTRB(20, 20, 20, 60),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                      ),
                    ),
                    height: 100,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          flex: 5,
                          child:
                            Image.file(File(images)),
                        ),
                        Flexible(
                          flex: 5,
                          child: Container(
                            child: Center(
                              child: Column(
                                children: [
                                  Text('찾으신 레시피가 맞으신가요?'),
                                  TextButton(
                                     onPressed: (){
                                       Navigator.pop(context);
                                     },
                                     child: Text('다시 검색')
                                    ),
                                  ],
                                ),
                              ),
                            )
                        )
                      ],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                          '사진 검색 결과',
                          style: TextStyle(
                            fontSize: 40,
                          )
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        height: 100,
                        child: Row(
                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                           children: [
                             Flexible(child: Icon(Icons.image), flex: 2,),
                             Flexible(
                                flex: 7,
                                child: Container(
                                  child: Column(
                                    children: [
                                      TextButton(
                                        onPressed: (){},
                                        child: Text(
                                            '레시피 이름',
                                            style: TextStyle(
                                              fontSize: 20
                                            )
                                        ),
                                      ),
                                      Text('칼로리 : ???'),
                                    ],
                                  ),
                                ),
                             ),
                             Flexible(
                               flex: 1,
                               child: IconButton(
                                 onPressed: (){}, // 서버와 연동 되는 즐찾 기능
                                 icon: Icon(
                                   Icons.favorite,
                                   color: Colors.red,
                                 ),
                               ),
                             ),
                           ],
                         ),
                       ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

