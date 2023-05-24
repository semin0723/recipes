import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Image_Searched.dart';
import 'package:image_picker/image_picker.dart';
import 'package:camera/camera.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _Homestate createState() => _Homestate();
}
class _Homestate extends State<Home> {
  @override

  late Future<void>? _initializeControllerFuture;
  late CameraController _controller;

  Future<void> _initializeCamera() async{
    final cameras = await availableCameras();
    final firstCamera = cameras.first;

    late CameraController _controller = CameraController(firstCamera, ResolutionPreset.medium);
    late Future<void> _initializeControllerFuture = _controller.initialize();
    await _initializeControllerFuture;
  }

  @override
  void initState(){
    super.initState();
    _initializeControllerFuture = _initializeCamera();
  }

  @override
  void disponse(){
    _controller.dispose();
    super.dispose();
  }

  Future<void> _takePhoto() async{
    try {
      await _initializeControllerFuture;
      final image = await _controller.takePicture();

      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Image_Searched(images: image.path)
        ),
      );
    }
    catch(e){
      print("Error : $e");
    }
  }

  Widget build(BuildContext context) {



    var images;
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
                    width: double.infinity, height: 100, padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
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
                        Row(
                          children: [
                            IconButton(
                                onPressed: () async{
                                  var picker = ImagePicker();
                                  var image = await picker.pickImage(source: ImageSource.gallery);
                                  if(image != null){
                                    setState(() => images = File(image.path));
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => Image_Searched(images: images)));
                                  }
                                },
                                icon: Icon(Icons.add)),
                            IconButton(
                                icon: Icon(Icons.camera),
                              /*FutureBuilder<void>(
                                  future: _initializeControllerFuture,
                                    builder: (context, snapshot){
                                      if(snapshot.connectionState == ConnectionState.done){
                                        return Icon(Icons.camera);
                                      }
                                      else{
                                        return CircularProgressIndicator();
                                      }
                                    },
                                ),*/
                                onPressed: () async{
                                  var picker = ImagePicker();
                                  var image = await picker.pickImage(source: ImageSource.camera);
                                  if(image != null){
                                    setState(() => images = File(image.path));
                                    disponse();
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => Image_Searched(images: images)));
                                  }
                                },
                            )
                          ],
                        )
                        
                      ],
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('오늘의 추천 레시피'),
                    Container( // 추천레시피 5종 보여주는 공간
                      width: double.infinity,
                      height: 300,
                      child: ListView.builder(
                          padding: EdgeInsets.all(5),
                          itemCount: recipe_name.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
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
                                    flex: 1,
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


