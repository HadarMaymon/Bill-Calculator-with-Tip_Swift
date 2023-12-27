//
//  ResultsViewController - Tipsy

import UIKit

class ResultsViewController: UIViewController {
    
    var formattedResult = "0"
    var numberOfPeople = 2
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateResults()
    }
    
    func configure(formattedResult: String, numberOfPeople: Int) {
        self.formattedResult = formattedResult
        self.numberOfPeople = numberOfPeople
    }
    
    private func updateResults() {
        totalLabel.text = formattedResult
        settingsLabel.text = "Split between \(numberOfPeople) people with the chosen tip"
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
