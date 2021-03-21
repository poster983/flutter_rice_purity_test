import 'package:flutter/material.dart';
import 'package:flutter_rice_purity_test/types/Question.dart';
import 'package:flutter_rice_purity_test/views/ResultsView.dart';
import 'package:flutter_rice_purity_test/widgets/QuestionStack.dart';
import 'package:get/get.dart';
import 'package:simple_animations/simple_animations.dart';

class RicePurityTestStack extends StatefulWidget {
  List<Question> questions;

  RicePurityTestStack({Key key}) {
      final Widget tame = Container( decoration: BoxDecoration( gradient: LinearGradient( tileMode: TileMode.mirror, begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [ Color(0xff36f4a2), Color(0xff2196f3), ], stops: [ 0, 1, ], ), backgroundBlendMode: BlendMode.srcOver, ), child: PlasmaRenderer( type: PlasmaType.infinity, particles: 18, color: Color(0x44000000), blur: 1, size: 0.55, speed: 7.67, offset: 2.89, blendMode: BlendMode.srcOver, particleType: ParticleType.atlas, variation1: 0, variation2: 0, variation3: 0, rotation: 1.27, ), );
    questions = [
    new Question(question: "Held hands romantically?", severity: QuestionSeverity.tame),
    new Question(question: "Been on a date?", cardBackground: Image.network('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg'), severity: QuestionSeverity.tame),
    new Question(question: "Been in a relationship?", cardBackground: tame, severity: QuestionSeverity.tame),
    new Question(question: "Danced without leaving room for Jesus?", cardBackground: tame, severity: QuestionSeverity.tame),
    new Question(question: "Kissed a non-family member?", cardBackground: tame, severity: QuestionSeverity.tame),
    new Question(question: "Kissed a non-family member on the lips?", cardBackground: tame, severity: QuestionSeverity.tame),
    new Question(question: "French kissed?", cardBackground: tame, severity: QuestionSeverity.tame),
    new Question(question: "French kissed in public?", cardBackground: tame,severity: QuestionSeverity.tame),
    new Question(question: "Kissed on the neck?", severity: QuestionSeverity.tame),
    new Question(question: "Kissed horizontally?", severity: QuestionSeverity.tame),
    new Question(question: "Given or received a hickey?", severity: QuestionSeverity.tame),
    new Question(question: "Kissed or been kissed on the breast?", severity: QuestionSeverity.immoral), 
    new Question(question: "Kissed someone below the belt?", severity: QuestionSeverity.immoral), 
    new Question(question: "Kissed for more than two hours consecutively?", severity: QuestionSeverity.immoral), 
    new Question(question: "Played a game involving stripping?", severity: QuestionSeverity.immoral), 
    new Question(question: "Seen or been seen by another person in a sensual context?", severity: QuestionSeverity.immoral), 
    new Question(question: "Masturbated?", severity: QuestionSeverity.immoral), 
    new Question(question: "Masturbated to a picture or video?", severity: QuestionSeverity.immoral), 
    new Question(question: "Masturbated while someone else was in the room?", severity: QuestionSeverity.immoral), 
    new Question(question: "Been caught masturbating?", severity: QuestionSeverity.immoral), 
    new Question(question: "Masturbated with an inanimate object?", severity: QuestionSeverity.immoral), 
    new Question(question: "Seen or read pornographic material?", severity: QuestionSeverity.immoral), 
    new Question(question: "Massaged or been massaged sensually?", severity: QuestionSeverity.immoral), 
    new Question(question: "Gone through the motions of intercourse while fully dressed?", severity: QuestionSeverity.immoral), 
    new Question(question: "Undressed or been undressed by a MPS?", secondLine: "Member of the Preferred Sex", severity: QuestionSeverity.raunchy), 
    new Question(question: "Showered with a MPS?", secondLine: "Member of the Preferred Sex", severity: QuestionSeverity.raunchy), 
    new Question(question: "Fondled or had your butt cheeks fondled?", severity: QuestionSeverity.raunchy), 
    new Question(question: "Fondled or had your breasts fondled?", severity: QuestionSeverity.raunchy), 
    new Question(question: "Fondled or had your genitals fondled?", severity: QuestionSeverity.raunchy), 
    new Question(question: "Had or given “blue balls”?", severity: QuestionSeverity.raunchy), 
    new Question(question: "Had an orgasm due to someone else’s manipulation?", severity: QuestionSeverity.raunchy), 
    new Question(question: "Sent a sexually explicit text or instant message?", severity: QuestionSeverity.raunchy), 
    new Question(question: "Sent or received sexually explicit photographs?", severity: QuestionSeverity.raunchy), 
    new Question(question: "Engaged in sexually explicit activity over video chat?", severity: QuestionSeverity.raunchy), 
    new Question(question: "Cheated on a significant other during a relationship?", severity: QuestionSeverity.raunchy), 
    new Question(question: "Purchased contraceptives?", severity: QuestionSeverity.raunchy), 
    new Question(question: "Gave oral sex?", severity: QuestionSeverity.raunchy), 
    new Question(question: "Received oral sex?", severity: QuestionSeverity.raunchy), 
    new Question(question: "Ingested someone else’s genital secretion?", severity: QuestionSeverity.raunchy), 
    new Question(question: "Used a sex toy with a partner?", severity: QuestionSeverity.raunchy), 
    new Question(question: "Spent the night with a MPS?", secondLine: "Member of the Prefered Sex", severity: QuestionSeverity.raunchy), 
    new Question(question: "Been walked in on while engaging in a sexual act?", severity: QuestionSeverity.raunchy), 
    new Question(question: "Kicked a roommate out to commit a sexual act?", severity: QuestionSeverity.raunchy), 

    new Question(question: "Ingested alcohol in a non-religious context?", severity: QuestionSeverity.tame), 
    new Question(question: "Played a drinking game?", severity: QuestionSeverity.tame), 
    new Question(question: "Been drunk?", severity: QuestionSeverity.tame), 
    new Question(question: "Faked sobriety to parents or teachers?", severity: QuestionSeverity.tame), 
    new Question(question: "Had severe memory loss due to alcohol?", severity: QuestionSeverity.tame), 
    new Question(question: "Used tobacco?", severity: QuestionSeverity.tame), 
    new Question(question: "Used marijuana?", severity: QuestionSeverity.tame), 
    new Question(question: "Used a drug stronger than marijuana?", severity: QuestionSeverity.immoral), 
    new Question(question: "Used methamphetamine, crack cocaine, PCP, horse tranquilizers or heroin?", severity: QuestionSeverity.raunchy), 

    new Question(question: "Been sent to the office of a principal, dean or judicial affairs representative for a disciplinary infraction?", severity: QuestionSeverity.tame), 
    new Question(question: "Been put on disciplinary probation or suspended?", severity: QuestionSeverity.tame), 


    new Question(question: "Urinated in public?", secondLine: "People are watching", severity: QuestionSeverity.immoral), 
    new Question(question: "Gone skinny-dipping?", severity: QuestionSeverity.raunchy), 
    new Question(question: "Gone streaking?", severity: QuestionSeverity.raunchy), 
    new Question(question: "Seen a stripper?", severity: QuestionSeverity.immoral), 

    new Question(question: "Had the police called on you?", severity: QuestionSeverity.tame), 
    new Question(question: "Run from the police?", severity: QuestionSeverity.immoral), 
    new Question(question: "Had the police question you?", severity: QuestionSeverity.immoral), 
    new Question(question: "Had the police handcuff you?", severity: QuestionSeverity.immoral), 
    new Question(question: "Been arrested?", severity: QuestionSeverity.immoral), 
    new Question(question: "Been convicted of a crime?", severity: QuestionSeverity.raunchy), 
    new Question(question: "Been convicted of a felony?", severity: QuestionSeverity.scandlus), 
    new Question(question: "Committed an act of vandalism?", severity: QuestionSeverity.raunchy), 


    new Question(question: "Had sexual intercourse?", severity: QuestionSeverity.scandlus), 
    new Question(question: "Had sexual intercourse three or more times in one night?", severity: QuestionSeverity.scandlus), 
    new Question(question: " ", severity: QuestionSeverity.scandlus), //69
    new Question(question: "Had sexual intercourse 10 or more times?", severity: QuestionSeverity.scandlus), 
    new Question(question: "Had sexual intercourse in four or more positions?", severity: QuestionSeverity.scandlus), 
    new Question(question: "Had sexual intercourse with a stranger or person you met within 24 hours?", severity: QuestionSeverity.scandlus), 
    new Question(question: "Had sexual intercourse in a motor vehicle?", severity: QuestionSeverity.scandlus), 
    new Question(question: "Had sexual intercourse outdoors?", severity: QuestionSeverity.scandlus), 
    new Question(question: "Had sexual intercourse in public?", severity: QuestionSeverity.scandlus), 
    new Question(question: "Had sexual intercourse in a swimming pool or hot tub?", severity: QuestionSeverity.scandlus), 
    new Question(question: "Had sexual intercourse in a bed not belonging to you or your partner?", severity: QuestionSeverity.scandlus), 
    new Question(question: "Had sexual intercourse while you or your partner’s parents were in the same home?", severity: QuestionSeverity.scandlus), 
    new Question(question: "Had sexual intercourse with non-participating third party in the same room?", severity: QuestionSeverity.scandlus), 

    new Question(question: "Joined the mile high club?", severity: QuestionSeverity.raunchy), 
    new Question(question: "Participated in a “booty call” with a partner whom you were not in a relationship with?", severity: QuestionSeverity.raunchy), 
    new Question(question: "Traveled 100 or more miles for the primary purpose of sexual intercourse?", severity: QuestionSeverity.scandlus), 
    new Question(question: "Had sexual intercourse with a partner with a 3 or more year age difference?", severity: QuestionSeverity.scandlus), 
    new Question(question: "Had sexual intercourse with a virgin?", severity: QuestionSeverity.scandlus), 
    new Question(question: "Had sexual intercourse without a condom?", severity: QuestionSeverity.scandlus), 

    new Question(question: "Had a STI test due to reasonable suspicion?", severity: QuestionSeverity.tame), 
    new Question(question: "Had a STI?", severity: QuestionSeverity.tame), 
    new Question(question: "Had a threesome?", severity: QuestionSeverity.scandlus), 
    new Question(question: "Attended an orgy?", severity: QuestionSeverity.unspeakable), 

    new Question(question: "Had two or more distinct acts of sexual intercourse with two or more people within 24 hours?", severity: QuestionSeverity.scandlus), 
    new Question(question: "Had sexual intercourse with five or more partners?", severity: QuestionSeverity.raunchy), 
    new Question(question: "Been photographed or filmed during sexual intercourse by yourself or others?", severity: QuestionSeverity.raunchy), 
    new Question(question: "Had period sex?", severity: QuestionSeverity.scandlus), 
    new Question(question: "Had anal sex?", severity: QuestionSeverity.scandlus), 
    new Question(question: "Had a pregnancy scare?", severity: QuestionSeverity.immoral), 
    new Question(question: "Impregnated someone or been impregnated?", severity: QuestionSeverity.raunchy), 
    new Question(question: "Paid or been paid for a sexual act?", severity: QuestionSeverity.scandlus), 
    new Question(question: "Committed an act of voyeurism?", severity: QuestionSeverity.unspeakable), 
    new Question(question: "Committed an act of incest?", severity: QuestionSeverity.unspeakable), 
    new Question(question: "Engaged in bestiality?", severity: QuestionSeverity.unspeakable), 

  ];
  }

  

  

  @override
  State<StatefulWidget> createState() => _RicePurityTestStackState();
}

class _RicePurityTestStackState extends State<RicePurityTestStack> {
  @override
  Widget build(BuildContext context) {
    return QuestionStack(widget.questions, onEnd: (results) {
      results.forEach((element) {
          print(element.decision);
        });
        Get.off(() => ResultsView(testName: "Rice Purity Test", results: results,));
        //open results page
    });
  }
}
