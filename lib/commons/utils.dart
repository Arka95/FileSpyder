import 'dart:math';

import 'package:flutter_file_manager/flutter_file_manager.dart';
import 'package:path_provider/path_provider.dart';


List<String> generateNames() {
  return ["Arka_-_Bhowmik_Tears_on_Guitar(128kbps).mp3","Arka_-_Bhowmik_Tears_on_Guitar(128kbps).mp3","Arka_-_Bhowmik_Tears_on_Guitar(128kbps).mp3"];
}


Future  searchWithRegex() async{
  var root = await getExternalStorageDirectory();
  var fm = FileManager(
    root: root,
  );
  var founds = (await fm
      .search(
    // search keyword
    "android",
    searchFilter:
    SimpleFileFilter(allowedExtensions: ['mp3'], fileOnly: true),
    sortedBy: FileManagerSorting.Size,
  ).toList());
  print(founds);
  return founds;
}


void bulkDelete(List<String> list_Of_names) async{

}


List<String> modifyNames(List<String> list_of_filenames){
  List<String> queries = ['r,_-_,-','r,_, ','d,(128kbps)'];
  List<String> modifiedStrings = new List<String>(list_of_filenames.length);
  for (int j=0;j<list_of_filenames.length;j++) {
    String current = list_of_filenames[j];
    for (int i = 0; i < queries.length; i++) {
      List<String> x = queries[i].split(',');
      if (x[0] == 'r') //replace
        current = current.replaceAll(x[1], x[2]);
      else
        current = current.replaceAll(x[1], "");
    }
    modifiedStrings[j] = current;
  }
  return modifiedStrings;
}

main(){
  List<String> list_of_names = generateNames();
  List<String> x = modifyNames(list_of_names);
  x.forEach((element)=>print(element));
}