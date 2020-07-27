import 'package:flutter/material.dart';

//void main() {
//  runApp(
//  MaterialApp(
//    title: "My tile",
//    home: TutorialHome(),
//  )
//  );
//}

class MyAppbar extends StatelessWidget{
  MyAppbar({this.title});
  final Widget title;
   @override
  Widget build(BuildContext context) {
     return Container(
       height: 56.0, // in logical pixels
       padding: const EdgeInsets.symmetric(horizontal: 8.0),
       decoration: BoxDecoration(color: Colors.blue[500]),
       // Row is a horizontal, linear layout.
       child: Row(
         // <Widget> is the type of items in the list.
         children: <Widget>[
           IconButton(
             icon: Icon(Icons.menu),
             tooltip: 'Navigation menu',
             onPressed: null, // null disables the button
           ),
           // Expanded expands its child to fill the available space.
           Expanded(
             child: title,
           ),
           IconButton(
             icon: Icon(Icons.search),
             tooltip: 'Search',
             onPressed: null,
           ),
         ],
       ),
     );
  }

}

class MyScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Material is a conceptual piece of paper on which the UI appears.
    return Material(
      // Column is a vertical, linear layout.
      child: Column(
        children: <Widget>[
          MyAppbar(
            title: Text(
              'Example title',
              style: Theme.of(context).primaryTextTheme.headline6,
            ),
          ),
          Expanded(
            child: Center(
              child: Text('Hello, world!'),
            ),
          ),
        ],
      ),
    );
  }
}


class TutorialHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Scaffold is a layout for the major Material Components.
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          tooltip: 'Navigation menu',
          onPressed: null,
        ),
        title: Text('Example title'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            tooltip: 'Search',
            onPressed: null,
          ),
        ],
      ),
      // body is the majority of the screen.
      body: Center(
        child: Text('Hello, world!'),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Add', // used by assistive technologies
        child: Icon(Icons.add),
        onPressed: null,
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('MyButton was tapped!');
      },
      child: Container(
        height: 36.0,
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: Colors.lightGreen[500],
        ),
        child: Center(
          child: Text('Engage'),
        ),
      ),
    );
  }
}

