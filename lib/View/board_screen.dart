import 'package:flutter/material.dart';
import 'package:xo/gen/assets.gen.dart';
import 'package:xo/my_color.dart';

class BoardScreen extends StatefulWidget {
  final String starter;
  const BoardScreen({Key? key, required this.starter}) : super(key: key);

  @override
  State<BoardScreen> createState() => _BoardScreenState();
}

class _BoardScreenState extends State<BoardScreen> {
  static const String playerX = 'x';
  static const String playerO = 'o';
  static String currentPlayer = playerX;
  late bool gameEnd;
  late List<String> occupied;

  @override
  void initState() {
    initializeGame();
    super.initState();
  }

  void initializeGame() {
    currentPlayer = widget.starter;
    gameEnd = false;
    occupied = [
      'assets/images/Null.png',
      'assets/images/Null.png',
      'assets/images/Null.png',
      'assets/images/Null.png',
      'assets/images/Null.png',
      'assets/images/Null.png',
      'assets/images/Null.png',
      'assets/images/Null.png',
      'assets/images/Null.png',
    ];
  }

  @override
  Widget build(Object context) {
    return Scaffold(
      backgroundColor: SolidColors.primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _headerText(),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
              child: _gameContainer(),
            ),
            InkWell(
              onTap: () {
                setState(
                  () {
                    initializeGame();
                  },
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: SolidColors.secondaryColor,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: SolidColors.primaryColor,
                        width: 5,
                      ),
                      color: SolidColors.secondaryColor,
                    ),
                    child: const Padding(
                      padding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                      child: Text(
                        'شروع مجدد',
                        style: TextStyle(
                            fontFamily: 'vazir',
                            fontSize: 25,
                            fontWeight: FontWeight.w700,
                            color: SolidColors.primaryColor),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _headerText() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(64, 0, 64, 0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            width: 5,
            color: SolidColors.secondaryColor,
          ),
          borderRadius: const BorderRadius.all(
              Radius.circular(20) //                 <--- border radius here
              ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ImageIcon(
              Image.asset(
                currentPlayer == 'x'
                    ? Assets.images.x.path
                    : Assets.images.o.path,
              ).image,
              color: SolidColors.winnerColor,
            ),
            Text(
              currentPlayer == 'x' ? " ایکسه " : " اوعه ",
              style: Theme.of(context).textTheme.headline2,
            ),
            Text(
              "نوبت ",
              style: Theme.of(context).textTheme.headline2,
            ),
          ],
        ),
      ),
    );
  }

  Widget _gameContainer() {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 2,
      width: MediaQuery.of(context).size.height / 2,
      child: GridView.builder(
        itemCount: 9,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          crossAxisCount: 3,
          childAspectRatio: 1,
        ),
        itemBuilder: (context, index) {
          return _box(index);
        },
      ),
    );
  }

  Widget _box(int index) {
    return InkWell(
      onTap: () {
        if (gameEnd || occupied[index] != 'assets/images/Null.png') {
          return;
        }
        setState(
          () {
            occupied[index] = currentPlayer == 'x'
                ? 'assets/images/X.png'
                : 'assets/images/O.png';
            changeTurn();
            checkForWinner();
            checkForDraw();
          },
        );
      },
      child: Card(
        elevation: 0,
        color: SolidColors.secondaryColor,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            occupied[index],
            color: SolidColors.primaryColor,
          ),
        ),
      ),
    );
  }

  void changeTurn() {
    currentPlayer == playerX
        ? currentPlayer = playerO
        : currentPlayer = playerX;
  }

  void checkForWinner() {
    List<List<int>> winnerList = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      //
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      //
      [0, 4, 8],
      [2, 4, 6],
    ];
    for (var winnerPos in winnerList) {
      String playerPos0 = '';
      if (occupied[winnerPos[0]] == 'assets/images/X.png') {
        playerPos0 = 'x';
      } else if (occupied[winnerPos[0]] == 'assets/images/O.png') {
        playerPos0 = 'o';
      } else {
        playerPos0 = '';
      }
      String playerPos1 = '';
      if (occupied[winnerPos[1]] == 'assets/images/X.png') {
        playerPos1 = 'x';
      } else if (occupied[winnerPos[1]] == 'assets/images/O.png') {
        playerPos1 = 'o';
      } else {
        playerPos1 = '';
      }
      String playerPos2 = '';
      if (occupied[winnerPos[2]] == 'assets/images/X.png') {
        playerPos2 = 'x';
      } else if (occupied[winnerPos[2]] == 'assets/images/O.png') {
        playerPos2 = 'o';
      } else {
        playerPos2 = '';
      }

      if (playerPos0.isNotEmpty) {
        if (playerPos0 == playerPos1 && playerPos0 == playerPos2) {
          showGameOverMassage('برد $playerPos0');
          gameEnd = true;
          return;
        }
      }
    }
  }

  void showGameOverMassage(String massage) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: SolidColors.secondaryColor,
        content: Text(
          massage != "!!مساوی شد که" ? "$massage بازی تمومه" : massage,
          style: const TextStyle(
              color: SolidColors.primaryColor,
              fontFamily: 'Vazir',
              fontSize: 25,
              fontWeight: FontWeight.w700),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  void checkForDraw() {
    if (gameEnd) {
      return;
    }
    bool draw = true;
    for (var occupiedPlayer in occupied) {
      if (occupiedPlayer == 'assets/images/Null.png') {
        draw = false;
      }
    }
    if (draw) {
      showGameOverMassage("!!مساوی شد که");
      gameEnd = true;
    }
  }
}
