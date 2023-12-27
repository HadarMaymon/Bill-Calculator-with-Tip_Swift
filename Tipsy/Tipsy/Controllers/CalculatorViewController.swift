// CalculatorViewcController - Tipsy

import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPrecentButton: UIButton!
    @IBOutlet weak var tenPrecentButton: UIButton!
    @IBOutlet weak var fifteenPrecentButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tips = [0, 0.1, 0.15]
    let stepper = UIStepper()
    var numOfPeople = 2
    
    
    @IBAction func tipChanged(_ sender: UIButton) {
        zeroPrecentButton.isSelected = false
        tenPrecentButton.isSelected = false
        fifteenPrecentButton.isSelected = false
        
        sender.isSelected.toggle()
        billTextField.endEditing(true)
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        numOfPeople = Int(sender.value)
        updateSplitNumberLabel()
        billTextField.endEditing(true)
    }
    
    @IBAction func calculatorPressed(_ sender: UIButton) {
        calculateAndPerformSegue()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResults",
           let destinationVC = segue.destination as? ResultsViewController,
           let formattedResult = sender as? String {
            destinationVC.configure(formattedResult: formattedResult, numberOfPeople: numOfPeople)
        }
    }
    
    private func updateSplitNumberLabel() {
        splitNumberLabel.text = "\(numOfPeople)"
    }
    
    private func calculateAndPerformSegue() {
        if let billValue = Float(billTextField.text ?? ""),
           let selectedTipButton = [zeroPrecentButton, tenPrecentButton, fifteenPrecentButton].first(where: { $0.isSelected }),
           let selectedTipIndex = [zeroPrecentButton, tenPrecentButton, fifteenPrecentButton].firstIndex(of: selectedTipButton) {
            let tip = tips[selectedTipIndex]
            let result = (billValue * Float(tip) + billValue) / Float(numOfPeople)
            let formattedResult = String(format: "%.1f", result)
            performSegue(withIdentifier: "goToResults", sender: formattedResult)
        }
    }
}

