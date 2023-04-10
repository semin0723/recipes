import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final getsearchText = TextEditingController();

    return MaterialApp(
      home: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    flex: 8,
                    child: TextField(
                      keyboardType: TextInputType.text,
                      controller: getsearchText,
                      decoration: InputDecoration(
                        hintText: '검색',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(50),
                          ),
                        ),
                        suffixIcon: getsearchText.text.isNotEmpty ?
                            Container(
                              child: IconButton(
                                alignment: Alignment.centerRight,
                                icon: Icon(Icons.cancel),
                                onPressed: (){
                                  getsearchText.clear();
                                },
                              ),
                            ) : null,
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: IconButton(
                      onPressed: (){},
                      icon: Icon(Icons.search),
                    )
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
