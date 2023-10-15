import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  Color bottomAppBarColor = Colors.amber;
  Icon icon = Icon(Icons.beach_access);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            bottomNavigationBar: BottomAppBar(
                color: bottomAppBarColor,
                child: Column(
                  children: [
                    IconButton(
                        onPressed: () {
                          setState(() {
                            if (bottomAppBarColor ==
                                Colors.amber)
                              bottomAppBarColor =
                                  Colors.blue;
                            else
                              bottomAppBarColor =
                                  Colors.amber;
                            if (icon.icon ==
                                Icons.beach_access)
                              icon = const Icon(Icons
                                  .bluetooth_searching);
                            else
                              icon = const Icon(
                                  Icons.beach_access);
                          });
                        },
                        icon: icon),
                    IconButton(
                        onPressed: () {
                          setState(() {
                            if (bottomAppBarColor ==
                                Colors.amber)
                              bottomAppBarColor =
                                  Colors.blue;
                            else
                              bottomAppBarColor =
                                  Colors.amber;
                            if (icon.icon ==
                                Icons.beach_access)
                              icon = const Icon(Icons
                                  .bluetooth_searching);
                            else
                              icon = const Icon(
                                  Icons.beach_access);
                          });
                        },
                        icon: icon),
                    IconButton(
                        onPressed: () {
                          setState(() {
                            if (bottomAppBarColor ==
                                Colors.amber)
                              bottomAppBarColor =
                                  Colors.blue;
                            else
                              bottomAppBarColor =
                                  Colors.amber;
                            if (icon.icon ==
                                Icons.beach_access)
                              icon = const Icon(Icons
                                  .bluetooth_searching);
                            else
                              icon = const Icon(
                                  Icons.beach_access);
                          });
                        },
                        icon: icon),
                  ],
                )),
            body: const Column(
              children: [Text("GNSHS")],
            )));
  }
}
