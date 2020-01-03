import 'package:flutter/cupertino.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../service/net/netManager.dart';
import 'package:path_provider/path_provider.dart';

class PdfDao{
  static downloadPdf() async{
    final fileDirectory = await getTemporaryDirectory();
    final filePath = fileDirectory.path+"/read.pdf";
    NetManager().download(
        "http://118.25.180.89:17005/titiduiFile/downLoadFile?uuid=40b05ec6-815e-438a-819e-b01c043c3bcc",
        filePath,
      success: (dynamic){
        debugPrint("download ok");
      },
      downloadProgress: (int count, int total){
        debugPrint("$count/$total");
      },
      error: (error){
        debugPrint("download error");
      }
    );
  }

  static uploadPdf() async{
    FormData data = FormData.fromMap({
      "name": "wendux",
      "age": 25,
      "file": await MultipartFile.fromFile("./text.txt",filename: "upload.txt"),
      "files": [
        await MultipartFile.fromFile("./text1.txt", filename: "text1.txt"),
        await MultipartFile.fromFile("./text2.txt", filename: "text2.txt"),
      ]
    });

    NetManager().upload("http", data,
      success: (dynamic){
        debugPrint("upload ok");
      },
      uploadProgress: (int count, int total){
        debugPrint("$count/$total");
      },
      error: (error){
        debugPrint("upload error");
      }
    );
  }

  static Future<bool> hasDownload() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.get("loadPdf") as bool;
  }

  static setDownload(bool value) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("loadPdf", value);
  }
}