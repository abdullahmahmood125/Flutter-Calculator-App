// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calculator_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CalculatorState on _CalculatorState, Store {
  final _$userInputAtom = Atom(name: '_CalculatorState.userInput');

  @override
  String get userInput {
    _$userInputAtom.reportRead();
    return super.userInput;
  }

  @override
  set userInput(String value) {
    _$userInputAtom.reportWrite(value, super.userInput, () {
      super.userInput = value;
    });
  }

  final _$answerAtom = Atom(name: '_CalculatorState.answer');

  @override
  String get answer {
    _$answerAtom.reportRead();
    return super.answer;
  }

  @override
  set answer(String value) {
    _$answerAtom.reportWrite(value, super.answer, () {
      super.answer = value;
    });
  }

  final _$_CalculatorStateActionController =
      ActionController(name: '_CalculatorState');

  @override
  void clean() {
    final _$actionInfo = _$_CalculatorStateActionController.startAction(
        name: '_CalculatorState.clean');
    try {
      return super.clean();
    } finally {
      _$_CalculatorStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void delete() {
    final _$actionInfo = _$_CalculatorStateActionController.startAction(
        name: '_CalculatorState.delete');
    try {
      return super.delete();
    } finally {
      _$_CalculatorStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addUserInput(String inputChar) {
    final _$actionInfo = _$_CalculatorStateActionController.startAction(
        name: '_CalculatorState.addUserInput');
    try {
      return super.addUserInput(inputChar);
    } finally {
      _$_CalculatorStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
userInput: ${userInput},
answer: ${answer}
    ''';
  }
}
