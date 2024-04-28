import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Instagram',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: InstagramHomePage(),
    );
  }
}

class InstagramHomePage extends StatelessWidget {
  final List<String> celebrityImages = [
    'https://www.bing.com/images/search?view=detailV2&ccid=M7lp%2beaN&id=F1BA3CC6AF87933AAA804A4154EE21B12BBF2E1A&thid=OIP.M7lp-eaNaTNBMZRkGRxvuAHaLI&mediaurl=https%3a%2f%2fi.pinimg.com%2foriginals%2f47%2f31%2f94%2f4731942427ec6653ab0cff8f241cb4ab.jpg&cdnurl=https%3a%2f%2fth.bing.com%2fth%2fid%2fR.33b969f9e68d693341319464191c6fb8%3frik%3dGi6%252fK7Eh7lRBSg%26pid%3dImgRaw%26r%3d0&exph=2400&expw=1596&q=c%c3%a9l%c3%a9brit%c3%a9+fran%c3%a7aise&simid=608025945160907071&FORM=IRPRST&ck=0F465EA9A22E1DE53F0526D0F269464E&selectedIndex=2&itb=0',
    'https://www.bing.com/images/search?view=detailV2&ccid=fJlPSpFk&id=0080475E979B71C9AF04770F124DA820C67FBE10&thid=OIP.fJlPSpFkDzCShmhvCiLY2QHaLG&mediaurl=https%3a%2f%2fi.pinimg.com%2foriginals%2fda%2f11%2f7f%2fda117fb8438398976da205cfb8975ad1.jpg&cdnurl=https%3a%2f%2fth.bing.com%2fth%2fid%2fR.7c994f4a91640f309286686f0a22d8d9%3frik%3dEL5%252fxiCoTRIPdw%26pid%3dImgRaw%26r%3d0&exph=2036&expw=1358&q=c%c3%a9l%c3%a9brit%c3%a9+fran%c3%a7aise&simid=608026215751510848&FORM=IRPRST&ck=FF497AB491127AD2620EAFDD1E355B9D&selectedIndex=13&itb=0',
    'https://www.bing.com/images/search?view=detailV2&ccid=Cyhia3iE&id=92A39F17D6052B45CBA4B83A59825A2F9F53F8E1&thid=OIP.Cyhia3iEkTvYl_BJ7SsQZAHaFF&mediaurl=https%3a%2f%2fafrikinfo.net%2fwp-content%2fuploads%2f2018%2f03%2fPatrice-Talon-pr%c3%a9sident.jpg&cdnurl=https%3a%2f%2fth.bing.com%2fth%2fid%2fR.0b28626b7884913bd897f049ed2b1064%3frik%3d4fhTny9aglk6uA%26pid%3dImgRaw%26r%3d0&exph=1820&expw=2652&q=Patrice+Talon&simid=608042042712154573&FORM=IRPRST&ck=46308BB9596730B9B8E1390AA3DD3CC5&selectedIndex=6&itb=0',
    // Ajoutez plus d'URLs d'images de célébrités ici
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Instagram'),
        actions: [
          IconButton(
            icon: Icon(Icons.message),
            onPressed: () {
              // Action à effectuer lors du clic sur l'icône de message
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 100.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10, // Nombre de stories
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    width: 80.0,
                    margin: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.blue,
                        width: 2.0,
                      ),
                      image: DecorationImage(
                        image: NetworkImage(celebrityImages[index %
                            celebrityImages.length]), // Image de la story
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Center(
                      child: Text('Story ${index + 1}'),
                    ),
                  );
                },
              ),
            ),
            Divider(),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 20, // Nombre de publications
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        height: 200.0,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(celebrityImages[index %
                                celebrityImages.length]), // Image de l'article
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        'Utilisateur ${index + 1}',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 4.0),
                      Text('Description de la publication'),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Accueil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Recherche',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Ajouter',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favoris',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}
