import 'package:flutter/material.dart';
import 'package:flutter_spotify_ui/data/data.dart';


class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
    Container(
      width: 280,
      color: Theme.of(context).primaryColor,
      height: double.infinity,
      child: Column(
        children: [
          Row(
             children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image.asset('assets/spotify_logo.png' ,
                height: 55,
                filterQuality: FilterQuality.high,),
              ),
            ],
          ),
            sidebar(iconData: Icons.home,title: 'Home', onTap: () {}, ),
            sidebar(iconData: Icons.search,title: 'Search', onTap: () {}, ),
            sidebar(iconData: Icons.audiotrack,title: 'Radio', onTap: () {}, ),
            const SizedBox(height: 12,),
            LibraryPlaylist()



    ],
      ),
    );
  }
}

class sidebar extends StatelessWidget {
  final String title ;
  final IconData iconData;
  final VoidCallback onTap;

  const sidebar({
    Key? key, required this.title , required this.iconData , required this.onTap
  }) : super(key: key );

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(iconData,
      color: Theme.of(context).iconTheme.color,
      size: 28 ,),
      title: Text(title,
        style: Theme.of(context).textTheme.bodyText1,
        overflow: TextOverflow.ellipsis,
      ),
      onTap: onTap,
    );
  }
}

class LibraryPlaylist extends StatefulWidget {
  const LibraryPlaylist({Key? key}) : super(key: key);

  @override
  _LibraryPlaylistState createState() => _LibraryPlaylistState();
}



class _LibraryPlaylistState extends State<LibraryPlaylist> {

  ScrollController? scrollController ;
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    scrollController = ScrollController();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    scrollController?.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Expanded(

      child: Scrollbar(
        isAlwaysShown: true,
       controller:scrollController ,


        child: ListView(
          controller: scrollController ,
          padding: const EdgeInsets.symmetric(vertical: 12),
          physics: const ClampingScrollPhysics(),
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Text('YOUR LIBRARY',
                    style: Theme.of(context).textTheme.headline4,
                    overflow: TextOverflow.ellipsis,),
                ),
                ...yourLibrary.map((e) => ListTile(
                  dense: true,
                  title: Text(e ,
                    style: Theme.of(context).textTheme.bodyText2,
                    overflow: TextOverflow.ellipsis,),
                  onTap: () {},
                ))
              ],
            ),
            SizedBox(height: 28,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Text('PLAYLISTS',
                    style: Theme.of(context).textTheme.headline4,
                    overflow: TextOverflow.ellipsis,),
                ),
                ...playlists.map((e) => ListTile(
                  dense: true,
                  title: Text(e ,
                    style: Theme.of(context).textTheme.bodyText2,
                    overflow: TextOverflow.ellipsis,),
                  onTap: () {},
                ))
              ],
            )
          ],
        ),
      ),
    );
  }
}





