import 'package:flutter/material.dart';
import 'package:xo/View/board_screen.dart';
import 'package:xo/gen/assets.gen.dart';
import 'package:xo/my_color.dart';
import 'package:xo/my_string.dart';

class SelectedSide extends StatefulWidget {
  const SelectedSide({Key? key}) : super(key: key);

  @override
  State<SelectedSide> createState() => _SelectedSideState();
}

var selectedSide = "x";

class _SelectedSideState extends State<SelectedSide> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: SolidColors.primaryColor,
      body: Center(
        child: Padding(
          padding:
              EdgeInsets.fromLTRB(size.width / 10, 64, size.width / 10, 64),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 32),
                child: Text(
                  MyString.chooseSide,
                  style: Theme.of(context).textTheme.headline2,
                ),
              ),
              Expanded(
                child: InkWell(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: selectedSide == 'x'
                          ? SolidColors.secondaryColor
                          : SolidColors.primaryColor,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(40),
                      child: Image.asset(
                        Assets.images.x.path,
                        color: selectedSide == 'x'
                            ? SolidColors.primaryColor
                            : SolidColors.secondaryColor,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      selectedSide = 'x';
                    });
                  },
                ),
              ),
              const SizedBox(height: 32),
              Expanded(
                child: InkWell(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: selectedSide == 'o'
                          ? SolidColors.secondaryColor
                          : SolidColors.primaryColor,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(40),
                      child: Image.asset(
                        Assets.images.o.path,
                        color: selectedSide == 'o'
                            ? SolidColors.primaryColor
                            : SolidColors.secondaryColor,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                  onTap: () {
                    setState(
                      () {
                        selectedSide = 'o';
                      },
                    );
                  },
                ),
              ),
              const SizedBox(height: 32),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => BoardScreen(starter: selectedSide),
                    ),
                  );
                },
                child: Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height / 8,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: SolidColors.secondaryColor),
                  child: Center(
                    child: Text(
                      MyString.startGame,
                      style: Theme.of(context).textTheme.headline1,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
