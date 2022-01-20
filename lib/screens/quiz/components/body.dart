import 'package:flutter/material.dart';
import 'package:flutter_quiz/constants.dart';
import 'package:flutter_quiz/controllers/question_controller.dart';
import 'package:flutter_quiz/models/Questions.dart';
import 'package:flutter_quiz/screens/quiz/components/progress_bar.dart';
import 'package:flutter_quiz/screens/quiz/components/question_card.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:websafe_svg/websafe_svg.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    QuestionController _questionController = Get.put(QuestionController());
    return Stack(
      children: [
        (WebsafeSvg.asset("assets/icons/bg.svg",
        width: MediaQuery.of(context).size.height,
        fit: BoxFit.fill,)
        ),
        SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: ProgressBar(),
            ),
            SizedBox(height: kDefaultPadding,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: Obx(()=> Text.rich(TextSpan(
                text: "Question ${_questionController.questionNumber}",
                style: Theme.of(context).textTheme.headline4!.copyWith(color: kSecondaryColor),
                children: [TextSpan(text: " of ${_questionController.questions.length}", 
                style: Theme.of(context).textTheme.headline5!.copyWith(color: kSecondaryColor),
                ),
                ],
              ),
              )),
            ),
            Divider(thickness: 1.5,),
            SizedBox(height: kDefaultPadding,),
            Expanded(child: PageView.builder(
              physics: NeverScrollableScrollPhysics(),
              controller: _questionController.pageController,
              onPageChanged: _questionController.updateTheQnNum,
              itemCount: _questionController.questions.length,
              itemBuilder: (context, index) => QuestionCard(question: _questionController.questions[index],),
            ),
            ),
          ],
          ),
        )
      ],
      );
  }
}




