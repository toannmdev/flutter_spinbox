import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinbox_example/number_formatter.dart';
import 'package:flutter_spinbox_fork_1224/cupertino.dart';

void main() => runApp(
      CupertinoApp(
        debugShowCheckedModeBanner: false,
        home: CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(
            middle: Text('CupertinoSpinBox for Flutter'),
          ),
          child: CupertinoTabScaffold(
            tabBar: CupertinoTabBar(
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.ellipsis),
                  label: 'Horizontal',
                ),
                BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.ellipsis),
                  label: 'Vertical',
                ),
              ],
            ),
            tabBuilder: (BuildContext context, int index) =>
                index == 0 ? HorizontalSpinBoxPage() : VerticalSpinBoxPage(),
          ),
        ),
      ),
    );

class HorizontalSpinBoxPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final caption = TextStyle(fontWeight: FontWeight.bold);
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: CupertinoScrollbar(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    child: Text('Basic', style: caption),
                    padding: const EdgeInsets.only(left: 16, top: 12),
                  ),
                  CupertinoSpinBox(
                    value: 10,
                    numOfDecimals: 1,
                    inputWidget: (controller, focusNode) {
                      return CupertinoTextField(
                        controller: controller,
                        keyboardType:
                            TextInputType.numberWithOptions(decimal: true),
                        textAlign: TextAlign.center,
                        inputFormatters: [
                          NumericTextFormatter(
                            numOfInteger: 3,
                            decimals: 1,
                          )
                        ],
                        prefix: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: Icon(
                                null,
                              ),
                            ),
                          ],
                        ),
                        suffix: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: Icon(
                                null,
                              ),
                            ),
                          ],
                        ),
                        padding: EdgeInsets.zero,
                        focusNode: focusNode,
                        onTap: () {
                          controller.selection = TextSelection.fromPosition(
                              TextPosition(offset: controller.text.length));
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class VerticalSpinBoxPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoScrollbar(
      child: Center(
        child: ListView(
          shrinkWrap: true,
          children: [
            Center(
              child: Container(
                width: 128,
                child: CupertinoSpinBox(
                  min: -50,
                  max: 50,
                  value: 15,
                  spacing: 24,
                  inputWidget: (controller, focusNode) {
                    return CupertinoTextField(
                      controller: controller,
                      focusNode: focusNode,
                      style: TextStyle(fontSize: 48),
                      padding: const EdgeInsets.all(24),
                      inputFormatters: [
                          NumericTextFormatter(
                            numOfInteger: 2,
                            decimals: 1,
                          )
                        ],
                      decoration: BoxDecoration(
                        color: CupertinoDynamicColor.withBrightness(
                          color: CupertinoColors.white,
                          darkColor: CupertinoColors.black,
                        ),
                        border: Border.all(
                          color: CupertinoDynamicColor.withBrightness(
                            color: Color(0x33000000),
                            darkColor: Color(0x33FFFFFF),
                          ),
                          style: BorderStyle.solid,
                          width: 0.0,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      ),
                    );
                  },
                  direction: Axis.vertical,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
