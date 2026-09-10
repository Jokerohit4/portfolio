import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:nimbus/presentation/layout/adaptive.dart';
import 'package:nimbus/presentation/pages/home/sections/header_section/widgets.dart';
import 'package:nimbus/presentation/widgets/buttons/nimbus_button.dart';
import 'package:nimbus/presentation/widgets/content_area.dart';
import 'package:nimbus/presentation/widgets/spaces.dart';
import 'package:nimbus/values/values.dart';
import 'package:url_launcher/url_launcher.dart';

const double bodyTextSizeSm = 14.0;
const double socialTextSizeSm = 14.0;
const double sidePadding = Sizes.PADDING_16;

/// Mobile header.
///
/// The decorative rotating globe and the offset portrait used to sit in a
/// Stack *behind* this text. At phone widths they overlapped the paragraph
/// and made it unreadable, and the portrait only ever showed as a clipped
/// sliver, so on mobile the header is now a plain vertical stack.
class HeaderSectionMobile extends StatelessWidget {
  const HeaderSectionMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final double headerIntroTextSize = Sizes.TEXT_SIZE_24;
    final double contentWidth = widthOfScreen(context) - (sidePadding * 2);

    final TextStyle? bodyTextStyle =
        textTheme.bodyLarge?.copyWith(fontSize: bodyTextSizeSm);
    final TextStyle? socialTitleStyle =
        textTheme.labelLarge?.copyWith(fontSize: socialTextSizeSm);

    return ContentArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: sidePadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SpaceH40(),
            AvailabilityBadge(fontSize: 12.0),
            SpaceH20(),
            AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText(
                  StringConst.INTRO,
                  speed: const Duration(milliseconds: 60),
                  textStyle: textTheme.displayMedium?.copyWith(
                    fontSize: headerIntroTextSize,
                  ),
                ),
              ],
              onTap: () {},
              isRepeatingAnimation: true,
              totalRepeatCount: 5,
            ),
            AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText(
                  StringConst.POSITION,
                  speed: const Duration(milliseconds: 80),
                  textStyle: textTheme.displayMedium?.copyWith(
                    fontSize: headerIntroTextSize,
                    color: AppColors.primaryColor,
                    height: 1.2,
                  ),
                ),
              ],
              onTap: () {},
              isRepeatingAnimation: true,
              totalRepeatCount: 5,
            ),
            SpaceH20(),
            SelectableText(
              StringConst.ABOUT_DEV,
              style: bodyTextStyle?.copyWith(height: 1.6),
            ),
            SpaceH30(),
            Wrap(
              spacing: 28,
              runSpacing: 16,
              children: [
                _contactPair(
                  label: "${StringConst.EMAIL}:",
                  value: StringConst.DEV_EMAIL_2,
                  labelStyle: socialTitleStyle,
                  valueStyle: bodyTextStyle,
                ),
                _contactPair(
                  label: "${StringConst.PHONE_ME}:",
                  value: StringConst.PHONE_NUMBER,
                  labelStyle: socialTitleStyle,
                  valueStyle: bodyTextStyle,
                ),
              ],
            ),
            SpaceH36(),
            Wrap(
              spacing: 16,
              runSpacing: 12,
              children: [
                CvButton(
                  width: 150,
                  height: 48,
                  buttonTitle: StringConst.DOWNLOAD_CV,
                  onPressed: () {
                    launchUrl(Uri.parse(StringConst.CV_LINK));
                  },
                ),
                CvButton(
                  width: 150,
                  height: 48,
                  buttonTitle: StringConst.HIRE_ME_NOW,
                  opensUrl: true,
                  url: StringConst.EMAIL_URL,
                ),
              ],
            ),
            SpaceH30(),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: buildSocialIcons(context, Data.socialData),
            ),
            SpaceH40(),
            Column(
              children: buildCardRow(
                context: context,
                data: Data.nimbusCardData,
                width: contentWidth,
                isHorizontal: false,
                hasAnimation: false,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _contactPair({
    required String label,
    required String value,
    required TextStyle? labelStyle,
    required TextStyle? valueStyle,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        SelectableText(label, style: labelStyle),
        SpaceH8(),
        SelectableText(value, style: valueStyle),
      ],
    );
  }
}
