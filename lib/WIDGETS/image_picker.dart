import 'dart:io';

import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';

class SingleImageUpload extends StatefulWidget {
  @override
  _SingleImageUploadState createState() {
    return _SingleImageUploadState();
  }
}

class _SingleImageUploadState extends State<SingleImageUpload> {
  List<Object> images = List<Object>();
  Future<File> _imageFile;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      images.add("Add Image");
    });
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        debugShowCheckedModeBanner: false,
        home: new Scaffold(
          backgroundColor: Colors.white,
          body: Center(
            child: Container(
              color: Colors.white,
              height: MediaQuery.of(context).size.height * 0.20,
              width: MediaQuery.of(context).size.width * 0.40,
              child: Center(
                child: Wrap(
                    children: List.generate(images.length, (index) {
                  if (images[index] is ImageUploadModel) {
                    ImageUploadModel uploadModel = images[index];
                    return Stack(
                      children: <Widget>[
                        Image.file(
                          uploadModel.imageFile,
                          height: MediaQuery.of(context).size.height * 0.20,
                          width: MediaQuery.of(context).size.width * 0.40,
                          //color: Colors.black,
                        ),
                        Positioned(
                          right: 5,
                          top: 5,
                          child: InkWell(
                            child: Icon(
                              Icons.remove_circle,
                              size: 20,
                              color: Colors.red,
                            ),
                            onTap: () {
                              setState(() {
                                images.replaceRange(
                                    index, index + 1, ['Add Image']);
                              });
                            },
                          ),
                        ),
                      ],
                    );
                  } else {
                    return Container(
                      color: Colors.white,
                      width: MediaQuery.of(context).size.width * 0.39,
                      height: MediaQuery.of(context).size.height * 0.19,
                      child: IconButton(
                        icon: Column(
                          children: <Widget>[
                            Image.asset(
                              "images/image.png",
                              height: MediaQuery.of(context).size.height * 0.10,
                              //color: Colors.black54,
                            ),
                             Text("UPLOAD IMAGE")
                          ],
                        ),
                        onPressed: () {
                          _onAddImageClick(index);
                        },
                      ),
                    );
                  }
                })),
              ),
            ),
          ),
        ));
  }

  Future _onAddImageClick(int index) async {
    setState(() {
      _imageFile = ImagePicker.pickImage(source: ImageSource.gallery);
      getFileImage(index);
    });
  }

  void getFileImage(int index) async {
//    var dir = await path_provider.getTemporaryDirectory();

    _imageFile.then((file) async {
      setState(() {
        ImageUploadModel imageUpload = new ImageUploadModel();
        imageUpload.isUploaded = false;
        imageUpload.uploading = false;
        imageUpload.imageFile = file;
        imageUpload.imageUrl = '';
        images.replaceRange(index, index + 1, [imageUpload]);
        if (index == 0) {
          // stateManagmentData.setImageValue(file);
          // stateManagmentData.setImagePath(file.path);
          print(file.path);
          //print(stateManagmentData.image.path);
          // Uri uri=Uri.parse("http://142.93.219.45:8080/KyanCafe/kyancafe/register");
          //   MultipartRequest request=MultipartRequest("POST",uri);
          // List<int> imageByte=file.readAsBytesSync();
          // MultipartFile multipartFile=MultipartFile.fromBytes();
        }
      });
    });
  }
}

class ImageUploadModel {
  bool isUploaded;
  bool uploading;
  File imageFile;
  String imageUrl;

  ImageUploadModel({
    this.isUploaded,
    this.uploading,
    this.imageFile,
    this.imageUrl,
  });
}
