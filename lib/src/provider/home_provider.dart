import 'dart:async';
import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HomeProvider with ChangeNotifier, DiagnosticableTreeMixin {
  late List<dynamic> boxs;
  late int currentLevel, second;
  late Timer timer;
  late AnimationController pinkController, blueControllerl;
  bool userTapPink = false,
      userTapBlue = false,
      userTapPinkComplete = false,
      userTapBlueComplete = false;

  randomColor() {
    boxs = [];
    currentLevel = 0;
    second = 0;
    for (int i = 0; i < 9; i++) {
      if (Random().nextBool()) {
        boxs.add({
          'color': 'pink',
          'status': false,
        });
      } else {
        boxs.add({
          'color': 'blue',
          'status': false,
        });
      }
    }
    boxs.add({
      'color': 'purple',
      'status': false,
    });
    print(boxs);
  }

  tap(BuildContext context, String color) {
    if (boxs[currentLevel]['color'] == color) {
      boxs[currentLevel]['status'] = true;
      currentLevel++;
      notifyListeners();
    } else {
      notifyListeners();
    }
  }

  updaTime(BuildContext context, AnimationController controller, String color) {
    if (controller.status == AnimationStatus.completed) {
      controller.reset();
      if (color == 'blue') {
        userTapBlueComplete = true;
      } else {
        userTapBlueComplete = true;
      }
      if (userTapBlue &&
          userTapBlueComplete &&
          userTapPink &&
          userTapPinkComplete) {
        color = 'purple';
        tap(context, color);
      } else {
        tap(context, color);
      }
    }
  }

  onTapDown(String colorIsPink) {
    if (colorIsPink == 'pink') {
      userTapPink = true;
      pinkController.forward();
    } else {
      userTapBlue = true;
      blueControllerl.forward();
    }
  }

  onTapUp(String  colorIsPink) {
    if (colorIsPink == 'blue') {
      userTapPink = false;
      userTapPinkComplete = false;
      if (pinkController.status == AnimationStatus.forward) {
        pinkController.reverse();
      }
    } else {
      userTapBlue = false;
      userTapBlueComplete = false;
      if (blueControllerl.status == AnimationStatus.forward) {
        blueControllerl.reverse();
      }
    }
  }

  resetGame() {
    randomColor();
    notifyListeners();
  }

  showDialogEndGane(BuildContext context, String text) {
    showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('ระยะเวลาที่ใช้ '),
                content: Text('$second'),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('reset Game'))
                ],
              );
            },
            barrierDismissible: false)
        .then((value) => resetGame());
  }
}
