import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BelajarAppBar(),
    );
  }
}

class BelajarAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 3,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: 200.0,
                floating: false,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Text("Belajar Silver AppBar",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25.0,
                      )),
                  background: Image(
                    image: NetworkImage('https://i.postimg.cc/sf7HzP6V/33dd67bb430ffb8d8908b6b713c66ff1-0.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SliverPersistentHeader(
                pinned: true,
                delegate: _SliverAppBarDelegate(
                  TabBar(
                    labelColor: Colors.black87,
                    unselectedLabelColor: Colors.grey,
                    tabs: [
                      new Tab(icon: new Icon(Icons.audiotrack), text: "Songs"),
                      new Tab(icon: new Icon(Icons.collections), text: "Gallery"),
                      new Tab(icon: new Icon(Icons.favorite), text: "Favorite"),
                    ],
                  ),
                ),
              ),
            ];
          },
          body: TabBarView(
            children: <Widget>[
              Songs(),
              Gallery(),
              SongsFavorite()
            ],
          ),
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(
      child: _tabBar,
      color: Colors.white,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}

class Songs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.audiotrack),
            title: Text("Troye Sivan - Angel Baby"),
          ),
          ListTile(
            leading: Icon(Icons.audiotrack),
            title: Text("JKT48 - Fortune Cookie"),
          ),
          ListTile(
            leading: Icon(Icons.audiotrack),
            title: Text("Irwansyah - Perempuanku"),
          ),
          ListTile(
            leading: Icon(Icons.audiotrack),
            title: Text("Raffa Affar - Cinta Sampai Mati"),
          ),
          ListTile(
            leading: Icon(Icons.audiotrack),
            title: Text("Im Falling in Love - Melly Goeslaw"),
          ),
          ListTile(
            leading: Icon(Icons.audiotrack),
            title: Text("Cinta Sejati - Bunga Citra Lestari"),
          ),
          ListTile(
            leading: Icon(Icons.audiotrack),
            title: Text("Coboy Junior - Demam Unyu Unyu"),
          ),
          ListTile(
            leading: Icon(Icons.audiotrack),
            title: Text("Merasa Indah - Tiara Andini"),
          ),
          ListTile(
            leading: Icon(Icons.audiotrack),
            title: Text("Janji Kita - Mahalini"),
          ),
          ListTile(
            leading: Icon(Icons.audiotrack),
            title: Text("Love Story - Taylor Swift"),
          ),
          ListTile(
            leading: Icon(Icons.audiotrack),
            title: Text("Aku Yang Salah - Mahalini"),
          ),
          ListTile(
            leading: Icon(Icons.audiotrack),
            title: Text("Blank Space - Taylor Swift"),
          ),
          ListTile(
            leading: Icon(Icons.audiotrack),
            title: Text("Noah - Yang Terdalam"),
          ),
          ListTile(
            leading: Icon(Icons.audiotrack),
            title: Text("Meghan Trainor - Title"),
          ),
        ],
      ),
    );
  }
}

class Gallery extends StatelessWidget {
  final List images = [
    "assets/images/img01.jpg",
    "assets/images/img02.jpg",
    "assets/images/img03.jpg",
    "assets/images/img04.jpg",
    "assets/images/img05.jpg",
    "assets/images/img06.jpg",
    "assets/images/img07.jpg",
    "assets/images/img08.jpg",
    "assets/images/img09.jpg",
    "assets/images/img10.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: 10,
        itemBuilder: (context, index) {
          if (index > 0) {
            return Padding(
              padding: const EdgeInsets.all(3.0),
              child: Image.asset(images[index % 15]),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.all(5.0),
              child: Image.asset(images[index]),
            );
          }
        },
      ),
    );
  }
}

class SongsFavorite extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.audiotrack),
            title: Text("Noah - Yang Terdalam"),
          ),
          ListTile(
            leading: Icon(Icons.audiotrack),
            title: Text("Coboy Junior - Demam Unyu Unyu"),
          ),
          ListTile(
            leading: Icon(Icons.audiotrack),
            title: Text("Troye Sivan - Angel Baby"),
          ),
          ListTile(
            leading: Icon(Icons.audiotrack),
            title: Text("Aku Yang Salah - Mahalini"),
          ),
        ],
      ),
    );
  }
}
