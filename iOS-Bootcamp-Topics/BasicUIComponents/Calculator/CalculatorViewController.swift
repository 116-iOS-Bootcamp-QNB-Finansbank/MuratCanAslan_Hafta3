//
//  CalculatorViewController.swift
//  BasicUIComponents
//
//  Created by Semih Emre ÜNLÜ on 11.09.2021.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    let viewModel = CalculatorViewControllerViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
    }
    
    
    @IBAction func digitButtonTapped(_ sender: UIButton) {
        let number = String(sender.tag)
        viewModel.runningNumber += number
        resultLabel.text = viewModel.runningNumber
    }
    
    @IBAction func squareButtonTapped(_ sender: UIButton) {
        viewModel.operate(with: .square)
    }
    
    @IBAction func equalButtonTapped(_ sender: Any) {
        viewModel.operate(with: viewModel.type)
    }
    
    
    @IBAction func sumButtonTapped(_ sender: Any) {
        viewModel.operate(with: .sum)
    }
    
    @IBAction func exButtonTapped(_ sender: Any) {
        viewModel.operate(with: .substract)
    }
    
    
    @IBAction func mulButtonTapped(_ sender: Any) {
        viewModel.operate(with: .multiplaction)
    }
    
    @IBAction func divButtonTapped(_ sender: Any) {
        viewModel.operate(with: .divide)
    }
    
    @IBAction func clearButtonTapped(_ sender: UIButton) {
        clear()
    }
    
    func clear() {
        viewModel.type = .null
        viewModel.runningNumber = ""
        viewModel.resultNumber = 0
        resultLabel.text = "0"
    }
}

extension CalculatorViewController: CalculatorViewControllerViewModelDelegate {
    func update(with number: Int) {
        resultLabel.text = String(number)
    }
}
