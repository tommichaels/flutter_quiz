import 'package:flutter/material.dart';
import 'package:flutter_quiz/constants.dart';
import 'package:flutter_quiz/screens/quiz/quiz_screen.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:websafe_svg/websafe_svg.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     
    return Scaffold(
      body: Stack(
        children: [
          (WebsafeSvg.asset("assets/icons/bg.svg",
          width: MediaQuery.of(context).size.height,
          fit: BoxFit.fill, 
          )
          ), 
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(flex: 2,),
                  Text("Let's Play Quiz,", 
                  style: Theme.of(context).textTheme.headline4!.copyWith(color: Colors.white, 
                  fontWeight: FontWeight.bold
                  ),
                  ),
                  const Text("Enter your information below"),
                  const Spacer(),
                  const TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xFF1C2341),
                      hintText: "Full Name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12),
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () => Get.to(const QuizScreen()),
                    child: Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(kDefaultPadding * .75),
                      decoration: const BoxDecoration(gradient: kPrimaryGradient, 
                      borderRadius: const BorderRadius.all(const Radius.circular(12),
                            ),
                          ),
                      child: Text("Start the Quiz!", 
                      style: Theme.of(context).textTheme.button!.copyWith(color: Colors.black),
                      ),
                    ),
                  ),
                  const Spacer(flex: 2,),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}