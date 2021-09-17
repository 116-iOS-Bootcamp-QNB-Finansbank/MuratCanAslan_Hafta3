//
//  CalculatorViewControllerViewModel.swift
//  BasicUIComponents
//
//  Created by Murat Can ASLAN on 16.09.2021.
//

import Foundation

enum CalculatorType {
    case sum, substract, multiplaction, divide, square, null
}

protocol CalculatorViewControllerViewModelDelegate: class {
    func update(with number: Int)
}

class CalculatorViewControllerViewModel {
    
    var firstNumber = 0
    var secondNumber = 0
    var resultNumber = 0
    var runningNumber = ""
    var type: CalculatorType = .null
    var isTyping: Bool = false
    weak var delegate: CalculatorViewControllerViewModelDelegate?
    
    func operate(with type: CalculatorType) {
        if type != .null {
            if runningNumber != "" {
                secondNumber = Int(runningNumber) ?? 0
                runningNumber = ""
                switch type {
                case .sum:
                    resultNumber = (firstNumber ) + (secondNumber)
                    self.delegate?.update(with: resultNumber)
                case .substract:
                    resultNumber = (firstNumber ) - (secondNumber)
                    self.delegate?.update(with: resultNumber)
                case .multiplaction:
                    resultNumber = (firstNumber ) * (secondNumber)
                    self.delegate?.update(with: resultNumber)
                case .divide:
                    resultNumber = (firstNumber ) / (secondNumber)
                    self.delegate?.update(with: resultNumber)
                case .square:
                    resultNumber = Int(sqrt(Double(firstNumber)))
                    self.delegate?.update(with: resultNumber)
                case .null:
                    break
                }
                firstNumber = resultNumber
                self.delegate?.update(with: resultNumber)
            }
            self.type = type
            
        } else {
            runningNumber = ""
        }
        

    }
}
