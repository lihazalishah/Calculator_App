// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:calculator_app/component/colors.dart';
import 'package:calculator_app/provider/calculator_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:function_tree/function_tree.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:provider/provider.dart';

import 'component/widget.dart';

class CalculatorScreeen extends StatefulWidget {
  const CalculatorScreeen({super.key});

  @override
  State<CalculatorScreeen> createState() => _CalculatorScreeenState();
}

class _CalculatorScreeenState extends State<CalculatorScreeen> {
  bool errorFlag = false;
  var input = '';
  var result;

// for remove input on backspace icon
  void backSpaceCalculation() {
    //convert string input into array
    var inputarr = input.split('');
    try {
      //remove last element of list
      inputarr.removeLast();
      input = inputarr.join('');
    } catch (e) {
      if (kDebugMode) {
        print('list is empty');
      }
    }
  }

  bool badExpressionInput() {
    if (input.toString() == '%' ||
        input.toString() == 'sin(' ||
        input.toString() == 'cos(' ||
        input.toString() == 'tan(' ||
        input.toString() == 'log(' ||
        input.toString() == 'ln(' ||
        input.toString() == 'sqrt(' ||
        input.toString() == '(' ||
        input.toString() == '((' ||
        input.toString() == ')' ||
        input.toString() == '))' ||
        input.toString() == '^') {
      return true;
    } else {
      return false;
    }
  }

  bool validateInput() {
    if (input.contains('..') ||
        input.contains('++') ||
        input.contains('--') ||
        input.contains('//') ||
        input.contains('**') ||
        input.contains('+-') ||
        input.contains('+*') ||
        input.contains('+/') ||
        input.contains('-+') ||
        input.contains('-*') ||
        input.contains('-/') ||
        input.contains('*+') ||
        input.contains('*-') ||
        input.contains('*/') ||
        input.contains('/+') ||
        input.contains('/-') ||
        input.contains('/*') ||
        input.contains('.+') ||
        input.contains('.-') ||
        input.contains('.*') ||
        input.contains('./') ||
        input.contains('()') ||
        input.contains('(.)')) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final calculatorProvider =
        Provider.of<CalculatorProvider>(context, listen: false);
    var size = MediaQuery.of(context).size * 1;

    return Scaffold(
      backgroundColor: AppColors.backGroundColors,
      appBar: AppBar(
        title: const Text(
          'Calculator App',
          style: TextStyle(color: AppColors.inputTextColors),
        ),
        centerTitle: true,
        backgroundColor: AppColors.appBarColors,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Column(
              children: [
                //
                //input display code widget
                Padding(
                  padding: const EdgeInsets.only(
                      left: 2, right: 4, top: 5, bottom: 5),
                  child: Container(
                    width: double.infinity,
                    height: size.height * 0.1,
                    decoration: const BoxDecoration(color: Colors.transparent),
                    child: Consumer<CalculatorProvider>(
                      builder: (context, value, child) {
                        return Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: SizedBox(
                            height: size.height * 0.05,
                            child: AutoSizeText(
                              value.input,
                              textAlign: TextAlign.right,
                              style: const TextStyle(
                                  fontSize: 50,
                                  color: AppColors.inputTextColors),
                              presetFontSizes: const [50, 25, 20],
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                //
                //result display code widget
                Padding(
                  padding: const EdgeInsets.only(left: 2, right: 4, bottom: 5),
                  child: Container(
                    width: double.infinity,
                    height: size.height * 0.1,
                    decoration: const BoxDecoration(color: Colors.transparent),
                    child: Consumer<CalculatorProvider>(
                      builder: (context, value, child) {
                        return Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: AutoSizeText(
                            textAlign: TextAlign.right,
                            calculatorProvider.result.toString(),
                            maxLines: 1,
                            style: TextStyle(
                                fontSize: 50,
                                color: errorFlag
                                    ? AppColors.resultErrorTextColors
                                    : AppColors.resultTextColors),
                            presetFontSizes: const [50, 40, 30],
                            overflow: TextOverflow.ellipsis,
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
            Container(
              decoration:
                  const BoxDecoration(color: AppColors.buttonSlideColors),
              child: Column(children: [
                //
                //Trignometric function button code
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                          onTap: () {
                            input = '${input}sin(';
                            calculatorProvider.setInput(input);
                            calculatorProvider.setResult('');
                          },
                          child: trignometricSymbols('sin')),
                      InkWell(
                          onTap: () {
                            input = '${input}cos(';
                            calculatorProvider.setInput(input);
                            calculatorProvider.setResult('');
                          },
                          child: trignometricSymbols('cos')),
                      InkWell(
                          onTap: () {
                            input = '${input}tan(';
                            calculatorProvider.setInput(input);
                            calculatorProvider.setResult('');
                          },
                          child: trignometricSymbols('tan')),
                      InkWell(
                          onTap: () {
                            input = '${input}log(';
                            calculatorProvider.setInput(input);
                            calculatorProvider.setResult('');
                          },
                          child: trignometricSymbols('log')),
                      InkWell(
                          onTap: () {
                            input = '${input}ln(';
                            calculatorProvider.setInput(input);
                            calculatorProvider.setResult('');
                          },
                          child: trignometricSymbols('ln')),
                      InkWell(
                          onTap: () {
                            input = '${input}sqrt(';
                            calculatorProvider.setInput(input);
                            calculatorProvider.setResult('');
                          },
                          child: trignometricSymbols('√')),
                      InkWell(
                          onTap: () {
                            input = '$input^';
                            calculatorProvider.setInput(input);
                            calculatorProvider.setResult('');
                          },
                          child: trignometricSymbols('^')),
                      InkWell(
                          onTap: () {
                            input = '$input(';
                            calculatorProvider.setInput(input);
                            calculatorProvider.setResult('');
                          },
                          child: trignometricSymbols('(')),
                      InkWell(
                          onTap: () {
                            input = '$input)';
                            calculatorProvider.setInput(input);
                            calculatorProvider.setResult('');
                          },
                          child: trignometricSymbols(')')),
                    ],
                  ),
                ),
                //
                //clear arthimetic(/,*) and back icon code
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                        onTap: () {
                          input = '';
                          calculatorProvider.setInput(input);
                          calculatorProvider.setResult('');
                        },
                        child: symbolTextButton('c')),
                    InkWell(
                        onTap: () {
                          if (input.toString() == '') {
                          } else {
                            input = '$input/';
                            calculatorProvider.setInput(input);
                            calculatorProvider.setResult('');
                          }
                        },
                        child: symbolTextButton('÷')),
                    InkWell(
                        onTap: () {
                          if (input.toString() == '') {
                          } else {
                            input = '$input*';
                            calculatorProvider.setInput(input);
                            calculatorProvider.setResult('');
                          }
                        },
                        child: symbolTextButton('×')),
                    InkWell(
                      onTap: () {
                        backSpaceCalculation();
                        calculatorProvider.setInput(input);
                        calculatorProvider.setResult('');
                      },
                      child: const Icon(
                        Icons.backspace,
                        color: AppColors.appIconColors,
                        size: 35,
                      ),
                    ),
                  ],
                ),
                //
                //7 till 9 and - button code
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                          onTap: () {
                            input = '${input}7';
                            calculatorProvider.setInput(input);
                            calculatorProvider.setResult('');
                          },
                          child: numberButton('7')),
                      InkWell(
                          onTap: () {
                            input = '${input}8';
                            calculatorProvider.setInput(input);
                            calculatorProvider.setResult('');
                          },
                          child: numberButton('8')),
                      InkWell(
                          onTap: () {
                            input = '${input}9';
                            calculatorProvider.setInput(input);
                            calculatorProvider.setResult('');
                          },
                          child: numberButton('9')),
                      InkWell(
                          onTap: () {
                            if (input.toString() == '') {
                            } else {
                              input = '$input-';
                              calculatorProvider.setInput(input);
                              calculatorProvider.setResult('');
                            }
                          },
                          child: symbolTextButton('-')),
                    ],
                  ),
                ),
                //
                //4,5,6 and + button code
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                          onTap: () {
                            input = '${input}4';
                            calculatorProvider.setInput(input);
                            calculatorProvider.setResult('');
                          },
                          child: numberButton('4')),
                      InkWell(
                          onTap: () {
                            input = '${input}5';
                            calculatorProvider.setInput(input);
                            calculatorProvider.setResult('');
                          },
                          child: numberButton('5')),
                      InkWell(
                          onTap: () {
                            input = '${input}6';
                            calculatorProvider.setInput(input);
                            calculatorProvider.setResult('');
                          },
                          child: numberButton('6')),
                      InkWell(
                          onTap: () {
                            if (input.toString() == '') {
                            } else {
                              input = '$input+';
                              calculatorProvider.setInput(input);
                              calculatorProvider.setResult('');
                            }
                          },
                          child: symbolTextButton('+')),
                    ],
                  ),
                ),
                //
                //1,2,3 and = button code
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                          onTap: () {
                            input = '${input}1';
                            calculatorProvider.setInput(input);
                            calculatorProvider.setResult('');
                          },
                          child: numberButton('1')),
                      InkWell(
                          onTap: () {
                            input = '${input}2';
                            calculatorProvider.setInput(input);
                            calculatorProvider.setResult('');
                          },
                          child: numberButton('2')),
                      InkWell(
                          onTap: () {
                            input = '${input}3';
                            calculatorProvider.setInput(input);
                            calculatorProvider.setResult('');
                          },
                          child: numberButton('3')),
                      InkWell(
                          onTap: () {
                            if (input.toString() == '') {
                              //null check
                            } else {
                              var splitInput = input.split('');

                              if (badExpressionInput()) {
                                errorFlag = true;
                                calculatorProvider.setResult('Bad Expression');
                              } else if (validateInput()) {
                                errorFlag = true;
                                calculatorProvider.setResult('invalid input');
                              } else if (splitInput.last.toString() == '+' ||
                                  splitInput.last == '-' ||
                                  splitInput.last == '*' ||
                                  splitInput.last == '/') {
                                errorFlag = true;
                                calculatorProvider.setResult('invalid input');
                              } else if (input.contains('/0')) {
                                errorFlag = true;
                                calculatorProvider
                                    .setResult('Can not divide by 0');
                              } else {
                                try {
                                  errorFlag = false;
                                  calculatorProvider
                                      .setResult(input.interpret());
                                } catch (e) {
                                  errorFlag = true;
                                  calculatorProvider
                                      .setResult('Bad Expression');
                                }
                              }
                            }
                          },
                          child: symbolTextButton('=')),
                    ],
                  ),
                ),
                //
                //pi ,0 ,.(dot),and %(mode)
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                          onTap: () {
                            input = '${input}pi';
                            calculatorProvider.setInput(input);
                            calculatorProvider.setResult('');
                          },
                          child: numberButton('π')),
                      InkWell(
                          onTap: () {
                            input = '${input}0';
                            calculatorProvider.setInput(input);
                            calculatorProvider.setResult('');
                          },
                          child: numberButton('0')),
                      InkWell(
                          onTap: () {
                            input = '$input.';
                            calculatorProvider.setInput(input);
                            calculatorProvider.setResult('');
                          },
                          child: numberButton('.')),
                      InkWell(
                          onTap: () {
                            if (input.toString() == '') {
                            } else {
                              input = '$input%';
                              calculatorProvider.setInput(input);
                              calculatorProvider.setResult('');
                            }
                          },
                          child: numberButton('%')),
                    ],
                  ),
                ),
              ]),
            ),
          ]),
        ),
      ),
    );
  }
}
