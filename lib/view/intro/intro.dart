import 'package:flutter/material.dart';

class _IntroPage extends StatelessWidget {
  const _IntroPage(
      this._title, this._details, this._btnText, this._img, this._onBtn,
      {super.key});
  final String _btnText;
  final String _details;
  final String _title;
  final String _img;
  final Function _onBtn;

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            const Expanded(
              flex: 1,
              child: SizedBox(
                width: 1,
              ),
            ),
            Expanded(
              flex: 6,
              child: Text(
                _title,
                style: TextStyle(
                    fontSize: 55,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.secondary),
              ),
            ),
            const Expanded(
                flex: 2,
                child: SizedBox(
                  width: 1,
                ))
          ],
        ),
        Row(
          children: [
            const Expanded(
              flex: 1,
              child: SizedBox(
                width: 1,
              ),
            ),
            Expanded(
              flex: 6,
              child: Text(
                _details,
                style: TextStyle(fontSize: 15, color: Colors.grey
                    //     fontWeight: FontWeight.bold,
                    //color: Theme.of(context).colorScheme.secondary
                    ),
              ),
            ),
            const Expanded(
                flex: 1,
                child: SizedBox(
                  width: 1,
                ))
          ],
        ),
        Row(mainAxisAlignment: MainAxisAlignment.end, children: [
          Image.asset(
            _img,
            height: mq.size.height * 0.3,
          ),
        ]),
        const Flexible(
            child: FractionallySizedBox(
          heightFactor: 0.6,
        )),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromRGBO(10, 200, 100, 1),
              minimumSize: Size(mq.size.width, 60)),
          child: Text(_btnText),
          onPressed: _onBtn as void Function(),
        )
      ],
    );
  }
}

class IntroView extends StatefulWidget {
  const IntroView({super.key});

  @override
  State<IntroView> createState() => _IntroViewState();
}

class _IntroViewState extends State<IntroView> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: SafeArea(
          child: Builder(builder: (context) {
            return Scaffold(
              backgroundColor: const Color(0xFF101213),
              body: Column(
                children: [
                  Expanded(
                      flex: 10,
                      child: TabBarView(children: [
                        _IntroPage(
                            "New Approach to your Finance",
                            "Now all your finances are in one place and under your control",
                            "Next",
                            'assets/images/intro_1.jpg', () {
                          DefaultTabController.of(context).animateTo(2);
                        }),
                        _IntroPage(
                            "Quick Analysis of All Expenses",
                            "All expenses by cards are reflected automatically in the application and analytics system helps to control them",
                            "Next",
                            'assets/images/intro_2.jpg',
                            () =>
                                DefaultTabController.of(context).animateTo(3)),
                        _IntroPage(
                            "Plan Out your spending",
                            "Now all your finances are in one place and under your control",
                            "Next",
                            'assets/images/intro_3.jpg',
                            () {})
                      ])),
                  Expanded(flex: 2, child: TabPageSelector(color: Colors.white))
                ],
              ),
            );
          }),
        ));
  }
}
