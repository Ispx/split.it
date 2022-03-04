import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:split_it/core/communs/formater.dart';
import 'package:split_it/core/models/user_model.dart';
import 'package:split_it/core/theme/theme_app.dart';
import 'package:split_it/main.dart';
import 'package:split_it/modules/event/models/event_model.dart';
import 'package:split_it/modules/home/components/personal_image_widget.dart';

import '../../../core/routes/app_routers.dart';
import '../widgets/text_button_widget.dart';

class CreatedSplitSplashPage extends StatelessWidget {
  final EventModel eventModel;
  const CreatedSplitSplashPage({Key? key, required this.eventModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: ThemeApp.config.primaryColor));
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: ThemeApp.config.primaryColor,
          gradient: ThemeApp.config.radialGradient,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              flex: 2,
              fit: FlexFit.loose,
              child: _titleSubtitleWidget(
                title: eventModel.title!,
                subitle: '${eventModel.totalFriends} pessoas',
              ),
            ),
            Flexible(
              flex: 2,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset('assets/images/Subtract_1.png'),
                  Image.asset('assets/images/Subtract.png'),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/money_split.png'),
                      _titleSubtitleWidget(
                        title: Formater.currencyAmount(
                            eventModel.splitTotalAmount),
                        subitle: 'para cada um',
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Flexible(fit: FlexFit.tight, child: _buildParticipantsWidget()),
          ],
        ),
      ), //#
      backgroundColor: Color(0Xff4FB38C),
      bottomNavigationBar: SizedBox(
        height: 60,
        child: Row(
          children: [
            Expanded(
              child: TextButtonWidget(
                onPressed: () => Navigator.of(context)
                    .pushReplacementNamed(AppRouters.stepsCreateSplit),
                title: 'CRIAR NOVO',
              ),
            ),
            Divider(
              color: Color.fromARGB(255, 31, 94, 69),
            ),
            Expanded(
              child: TextButtonWidget(
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed(AppRouters.home,
                      arguments: getIt<UserModel>());
                },
                title: 'OKAY :D',
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _titleSubtitleWidget(
          {required String title, required String subitle}) =>
      Text.rich(
        TextSpan(
          text: title + '\n',
          style: GoogleFonts.montserrat(
            fontSize: 30,
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
          children: [
            TextSpan(
              text: subitle,
              style: GoogleFonts.inter(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        textAlign: TextAlign.center,
      );

  Widget _buildParticipantsWidget() {
    return Container(
      height: 150,
      width: double.maxFinite,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Wrap(
            direction: Axis.horizontal,
            alignment: WrapAlignment.center,
            spacing: 16,
            children: [
              PersonalImageWidget(urlImage: getIt<UserModel>().photoUrl),
              ...eventModel.friends!.map(
                (e) => PersonalImageWidget(urlImage: e.urlImage),
              ),
            ],
          ),
          Text.rich(
            TextSpan(
              text: 'Você',
              children: [
                for (int i = 0; i < eventModel.friends!.length; i++)
                  TextSpan(
                    text: i == eventModel.friends!.length - 1
                        ? 'e ${eventModel.friends![i].fullname}'
                        : ', ${eventModel.friends![i].fullname} ',
                  ),
              ],
            ),
            style: GoogleFonts.inter(
                fontWeight: FontWeight.w400, color: Colors.white, fontSize: 16),
            textAlign: TextAlign.justify,
          )
        ],
      ),
    );
  }
}
