import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Image_Searched.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

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
          child: SingleChildScrollView(

            child: Column(
              children: [
                Center( // 사진 입력구간
                  child: Container(
                    margin: EdgeInsets.all(20),
                    width: 300, height: 100, padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(50),
                      ),
                      border: Border.all(
                        color: Colors.grey,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          '사진을 통해 레시피 찾기',
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'Sunflower',
                            color: Colors.black,
                          ),
                        ),
                        IconButton(
                            onPressed: (){
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => Image_Searched()));
                            },// 이미지 업로드 구간
                            icon: Icon(Icons.add))
                      ],
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('오늘의 추천 레시피'),
                    Container( // 추천레시피 5종 보여주는 공간
                      height: 300,
                      child: ListView.builder(
                          padding: EdgeInsets.all(10),
                          itemCount: recipe_name.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Flexible(child: Icon(Icons.image), flex: 2,),
                                  Flexible(
                                    flex: 7,
                                    child: TextButton(
                                      onPressed: (){},
                                      child: Text(recipe_name[index]),
                                    ),
                                  ),
                                  Flexible(
                                    child: IconButton(
                                      onPressed: (){
                                        if (isfavorite[index]) {
                                          isfavorite[index] = false;
                                        }
                                        else {
                                          isfavorite[index] = true;
                                        }
                                      },
                                      icon: Icon(
                                        isfavorite[index] ? Icons.favorite : Icons.favorite_border,
                                        color: isfavorite[index] ? Colors.red : null,
                                        ),
                                      ),
                                  ),
                                ],
                              ),
                            );
                        }
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
      ),
    );
  }



}
