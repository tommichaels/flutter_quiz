import 'package:flutter/material.dart';
import 'package:flutter_quiz/constants.dart';
import 'package:flutter_quiz/controllers/question_controller.dart';
import 'package:get/get.dart';
import 'package:websafe_svg/websafe_svg.dart';

class ScoreScreen extends StatelessWidget {
  const ScoreScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    QuestionController _qnController = Get.put(QuestionController());
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
        WebsafeSvg.asset("assets/icons/bg.svg", fit: BoxFit.fill,
        width: MediaQuery.of(context).size.height,),
        Column(children: [
          const Spacer(flex: 3,),
          Text("Score", 
          style: Theme.of(context).textTheme.headline3!.copyWith(color: kSecondaryColor),
          ),
          const Spacer(),
          Text("${_qnController.correctAns * 10}/${_qnController.questions.length * 10}", 
          style: Theme.of(context).textTheme.headline4!.copyWith(color: kSecondaryColor),
          ),
          const Spacer(flex: 3,),
        ],
        ),
      ],
      ),
    );
  }
}