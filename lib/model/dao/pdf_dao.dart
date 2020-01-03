import 'package:flutter/cupertino.dart';

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
}