import 'package:flutter/material.dart';

import 'home_thread.dart';

class TimeInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
          length: 3,
          child: Scaffold(
            floatingActionButton: FloatingActionButton(
            backgroundColor: const Color(0xff26B893),
            onPressed: () {
              Navigator.of(context).push(PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) {
                return const HomeThread();
              }, transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                final tween = Tween(begin: 0.0, end: 2.0);
                return FadeTransition(
                  opacity: animation.drive(tween),
                  child: child,
                );
              }));
            },
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(55.0),
              child: AppBar(
                backgroundColor: Colors.white,
                elevation: 0,
                bottom: TabBar(
                  indicatorWeight: 0,
                    unselectedLabelColor: Colors.red,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.redAccent,
                    ),
                    tabs: [
                      Tab(
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(
                                  color: Colors.redAccent, width: 1)),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text("Test1"), 
                          ),
                        ),
                      ),
                      Tab(
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(
                                  color: Colors.redAccent, width: 1)),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text("Test2"),
                          ),
                        ),
                      ),
                      Tab(
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(
                                  color: Colors.redAccent, width: 1)),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text("Test3"),
                          ),
                        ),
                      ),
                    ]),
              ),
            ),
            body: TabBarView(children: [
              Icon(Icons.games),
              Icon(Icons.beach_access),
              Icon(Icons.cloud_download),
            ]),
          )),
    );
  }
}
