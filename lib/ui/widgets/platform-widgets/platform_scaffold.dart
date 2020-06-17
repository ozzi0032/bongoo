import 'platform_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PlatformScaffold extends PlatformWidget<CupertinoPageScaffold, Scaffold> {
  final bool isAppBar;
  final String title;
  final Widget child;
  final bool showBackButton;
  final String leadingTitle;
  final bool isLeadingIcon;
  final Widget leadingIcon;
  final bool isLeadingWidget;
  final Widget leadingWidget;
  final String trailingTitle;
  final bool isTrailingIcon;
  final Widget trailingIcon;
  final bool isTrailingWidget;
  final Widget trailingWidget;
  final String previousPageTitle;
  final bool isbottomNavigationBar;
  final Widget bottomNavigationBar;
  final bool isFloatingButton;
  final Widget floatingActionButton;

  PlatformScaffold(
      {this.title,
      this.child,
      this.isAppBar = false,
      this.showBackButton = false,
      this.leadingTitle,
      this.isLeadingIcon = false,
      this.leadingIcon,
      this.isLeadingWidget = false,
      this.leadingWidget,
      this.trailingTitle,
      this.isTrailingIcon = false,
      this.trailingIcon,
      this.isTrailingWidget = false,
      this.trailingWidget,
      this.previousPageTitle,
      this.isbottomNavigationBar = false,
      this.bottomNavigationBar,
      this.isFloatingButton = false,
      this.floatingActionButton});

  @override
  Scaffold createAndroidWidget(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: isAppBar
          ? AppBar(
              backgroundColor: Colors.white,
              automaticallyImplyLeading: showBackButton,
              bottomOpacity: 0.0,
              elevation: 0.0,
              brightness: Brightness.dark,
              centerTitle: true,
              iconTheme: IconThemeData(
                color: Colors.black87,
              ),
              title: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  title,
                  style: TextStyle(color: Colors.black87),
                ),
              ),
              actions: (isLeadingWidget || isTrailingWidget)
                  ? <Widget>[
                      leadingWidget != null ? leadingWidget : Container(),
                      isTrailingWidget ? trailingWidget : Container()
                    ]
                  : null,
              //backgroundColor: Colors.black12,
              leading: isLeadingIcon ? leadingIcon : null,
            )
          : null,
      floatingActionButton: isFloatingButton ? floatingActionButton : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: isbottomNavigationBar ? bottomNavigationBar : null,
      body: child,
    );
  }

  @override
  CupertinoPageScaffold createIosWidget(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        automaticallyImplyLeading: showBackButton,
        actionsForegroundColor: Colors.black87,
        middle: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.black87),
        ),
        backgroundColor: Colors.white,
        previousPageTitle: previousPageTitle,
        leading: isLeadingWidget ? leadingWidget : null,
        trailing: isTrailingWidget ? trailingWidget : null,
      ),
      child: child,
    );
  }
}
