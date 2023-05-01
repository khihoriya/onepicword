import 'package:flutter/material.dart';

class c5 extends StatefulWidget {
  const c5({Key? key}) : super(key: key);

  @override
  State<c5> createState() => _c5State();
}

class _c5State extends State<c5> {
  List<Map> photos = [
    {
      "albumId": 1,
      "id": 1,
      "title": "accusamus beatae ad facilis cum similique qui sunt",
      "url": "http://placehold.it/600/92c952",
      "thumbnailUrl": "http://placehold.it/150/92c952"
    },
    {
      "albumId": 1,
      "id": 2,
      "title": "reprehenderit est deserunt velit ipsam",
      "url": "http://placehold.it/600/771796",
      "thumbnailUrl": "http://placehold.it/150/771796"
    },
    {
      "albumId": 1,
      "id": 3,
      "title": "officia porro iure quia iusto qui ipsa ut modi",
      "url": "http://placehold.it/600/24f355",
      "thumbnailUrl": "http://placehold.it/150/24f355"
    }
  ];

  @override
  void initState() {
    super.initState();
    myclass kk = myclass.fromjson(photos);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }

}

class myclass {
  List<Map> photu=[];

  myclass(this.photu);

  factory myclass.fromjson(List<Map> photos) {

    for(int i=0;i<photos.length;i++)
      {

        imagess tt = imagess.fromjsonn(photos[i]);
      }
    return myclass(photos);
    }
}

class imagess {

  int albumId;
  int id;
  String title;
  String url;
  String thumbnailUrl;


  imagess(this.albumId, this.id, this.title, this.url, this.thumbnailUrl);

  factory imagess.fromjsonn(Map photo) {

  return imagess(photo['albumId'], photo['id'], photo['title'], photo['url'], photo['thumbnailUrl']);
  }
}
