import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio_v2/view_utils.dart';
import 'package:responsive_builder/responsive_builder.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
      ScreenTypeLayout(
        tablet: AboutPageLargeScreen(),
        mobile: AboutPageSmallScreen(),
      );
}

class AboutPageSmallScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AboutPageSmallScreenState();
}

class AboutPageSmallScreenState extends State<AboutPageSmallScreen> {
  @override
  Widget build(BuildContext context) =>
      Container(
        color: const Color(0xFFF5F5F5),
        child: Center(
          child: SingleChildScrollView(
            //scrollDirection: Axis.horizontal,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RoundedProfilePicture(
                      imageUrl: 'images/profile_picture.jpg',
                    ),
                    SizedBox(
                      height: 20,
                      width: 40,
                    ),
                    ProfileInformation(),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
}

class AboutPageLargeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
      Container(
        color: const Color(0xFFF5F5F5),
        child: Center(
          child: SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RoundedProfilePicture(
                      imageUrl: 'images/profile_picture.jpg',
                    ),
                    SizedBox(
                      height: 20,
                      width: 40,
                    ),
                    ProfileInformation(),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
}

class ProfileInformation extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
      Column(
        children: [
          SizedBox(
            height: 20,
            width: 20,
          ),
          Text(
            'Bruno Abe',
            textScaleFactor: 3.8,
          ),
          SizedBox(
            height: 20,
            width: 20,
          ),
          Text(
            'Android. Flutter. Movies. Comics.\nInto nerd stuff!',
            style: Theme
                .of(context)
                .textTheme
                .caption,
            textScaleFactor: 1.9,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SocialMediaItem(
                icon: FontAwesomeIcons.github,
                onTap: () {},
              ),
              SocialMediaItem(
                icon: FontAwesomeIcons.medium,
                onTap: () {},
              ),
              SocialMediaItem(icon: FontAwesomeIcons.linkedin, onTap: () {}),
            ],
          ),
        ],
      );
}

class SocialMediaItem extends StatelessWidget {
  const SocialMediaItem({@required this.icon, @required this.onTap})
      : assert(icon != null),
        assert(onTap != null);
  final IconData icon;
  final Function onTap;

  @override
  Widget build(BuildContext context) =>
      InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
          child: FaIcon(icon),
        ),
      );
}

