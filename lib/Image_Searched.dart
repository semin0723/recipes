import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Image_Searched extends StatelessWidget {
  const Image_Searched({Key? key}) : super(key: key);

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
                            Image.asset('Images/testimage.jpg'),
                        ),
                        Flexible(
                          flex: 5,
                          child: Container(
                            child: Center(
                              child: Column(
                                children: [
                                  Text('찾으신 레시피가 맞으신가요?'),
                                  TextButton(
                                     onPressed: (){},
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
                          )),
                      Text(
                        '칼로리 : ???'
                      ),
                      Container( // 추천레시피 5종 보여주는 공간
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey,
                          ),
                        ),
                        height: 100,
                        child: Row(
                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                           children: [
                             Flexible(child: Icon(Icons.image), flex: 2,),
                             Flexible(
                                flex: 7,
                                child: TextButton(
                                onPressed: (){},
                                child: Text('레시피 이름'),
                                ),
                             ),
                             Flexible(
                               child: IconButton(
                                  onPressed: (){},
                                  icon: Icon(
                                  Icons.favorite,
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
