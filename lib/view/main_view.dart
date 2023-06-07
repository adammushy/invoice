import 'package:invoice/imports.dart';
import 'package:invoice/view/contact.dart';

class MainView extends StatefulWidget {
  final int initRoute;

  const MainView({Key? key, required this.initRoute}) : super(key: key);
  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int _currentIndex = 0;

  List<Widget> tabs = [Home(), 
  Invoice(),
   Payment(), Profile(),ContactScreen()];
  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initRoute;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: TextBuilder(
          text: 'Invoice Manager',
          color: Colors.black,
        ),
      ),
      drawer: Drawer(child: SideNav()),
      body: tabs[_currentIndex],
      // b 
    );
  }
}
