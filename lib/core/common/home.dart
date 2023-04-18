import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Widget> screens = [
    const Center(child: Text('Wallet')),
    const Center(child: Text('Activity')),
    const Center(child: Text('Plan')),
    const Center(child: Text('More')),
  ];

  int _selectedIndex = 0;
  Widget _selectedScreen = const Center(child: Text('Wallet'));
  final PageStorageBucket bucket = PageStorageBucket();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageStorage(
          bucket: bucket,
          child: _selectedScreen,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          tooltip: 'Scan',
          backgroundColor: Theme.of(context).colorScheme.primary,
          child: const Icon(Icons.qr_code_scanner),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          color: const Color(0xFF101213),
          shape: const CircularNotchedRectangle(),
          child: SizedBox(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    MaterialButton(
                      onPressed: () {
                        setState(() {
                          _selectedIndex = 0;
                          _selectedScreen = screens[_selectedIndex];
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.account_balance_wallet,
                            color: _selectedIndex == 0
                                ? Colors.white
                                : Colors.grey,
                          ),
                          Text(
                            'Wallet',
                            style: TextStyle(
                              color: _selectedIndex == 0
                                  ? Colors.white
                                  : Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {
                        setState(() {
                          _selectedIndex = 1;
                          _selectedScreen = screens[_selectedIndex];
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.bar_chart,
                            color: _selectedIndex == 1
                                ? Colors.white
                                : Colors.grey,
                          ),
                          Text(
                            'Activity',
                            style: TextStyle(
                              color: _selectedIndex == 1
                                  ? Colors.white
                                  : Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    MaterialButton(
                      onPressed: () {
                        setState(() {
                          _selectedIndex = 2;
                          _selectedScreen = screens[_selectedIndex];
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.eco,
                            color: _selectedIndex == 2
                                ? Colors.white
                                : Colors.grey,
                          ),
                          Text(
                            'Plan',
                            style: TextStyle(
                              color: _selectedIndex == 2
                                  ? Colors.white
                                  : Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {
                        setState(() {
                          _selectedIndex = 3;
                          _selectedScreen = screens[_selectedIndex];
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.more_horiz,
                            color: _selectedIndex == 3
                                ? Colors.white
                                : Colors.grey,
                          ),
                          Text(
                            'More',
                            style: TextStyle(
                              color: _selectedIndex == 3
                                  ? Colors.white
                                  : Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
