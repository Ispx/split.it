import 'package:flutter/material.dart';
import 'package:split_it/core/communs/formater.dart';
import 'package:split_it/core/text_style/app_text_style.dart';
import 'package:split_it/modules/event/models/personal_event_model.dart';
import 'package:split_it/modules/home/components/personal_image_widget.dart';

class PersonalDetailsWidget extends StatelessWidget {
  final PersonalEventModel? personalEventModel;
  const PersonalDetailsWidget({this.personalEventModel});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.all(0),
      leading: PersonalImageWidget(
        urlImage: this.personalEventModel!.urlImage!,
      ),
      title: Text(this.personalEventModel!.firstName! +
          ' ' +
          personalEventModel!.secondName!),
      subtitle: Text(
        Formater.currencyAmount(
          this.personalEventModel!.totalPay!,
        ),
        style: personalEventModel!.isSelected! == true
            ? AppTextStyle.instance.amountGreenTextEventDetailsPage
            : AppTextStyle.instance.amountRedTextEventDetailsPage,
      ),
      trailing: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color(
            personalEventModel!.isSelected! == true ? 0xFFE0F3ED : 0xFFF0F1F1,
          ),
        ),
        child: Center(
          child: Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                width: 2,
                color: personalEventModel!.isSelected! == true
                    ? Color(0xFF4FB28C)
                    : Color(
                        0xFFC0CCC9,
                      ),
              ),
              color: Color(
                personalEventModel!.isSelected! == true ? 0xFF4FB28C : 0xFFFFFF,
              ),
            ),
            child: personalEventModel!.isSelected! == true
                ? Center(
                    child: Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 18,
                    ),
                  )
                : Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white,
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
