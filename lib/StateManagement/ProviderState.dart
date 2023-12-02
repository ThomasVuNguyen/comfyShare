import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UploadInformation extends ChangeNotifier{
  final Map<String, String> SpaceUploadInformation = {'comfy':'', 'md':'', 'gif':''};

  void UpdateSpaceInformation(String comfyPath, String mdPath, String gifPath){
    SpaceUploadInformation['comfy'] = comfyPath;
    SpaceUploadInformation['md'] = mdPath;
    SpaceUploadInformation['gif'] = gifPath;
    notifyListeners();
  }
}
