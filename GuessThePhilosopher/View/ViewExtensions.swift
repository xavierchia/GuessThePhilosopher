import UIKit

// Borders and shadows
extension UIButton {
    
    func authorDefaultStyling() {
        
        self.layer.borderWidth = 3
        self.layer.cornerRadius = 20
        self.layer.borderColor = #colorLiteral(red: 0.6862745098, green: 0.6862745098, blue: 0.6862745098, alpha: 1)
        self.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)

    }
    
    func buttonSelectedStyling() {
        self.layer.borderColor = #colorLiteral(red: 0.1176470588, green: 0.6431372549, blue: 1, alpha: 1)
        self.layer.shadowColor = #colorLiteral(red: 0.1180284048, green: 0.6430098675, blue: 1, alpha: 1)
        self.backgroundColor = #colorLiteral(red: 0.1180284048, green: 0.6430098675, blue: 1, alpha: 0.1040774829)
    }
}

// Disabled UI button
class CheckButton: UIButton {
    open override var isEnabled: Bool{
        didSet {
            if self.isEnabled {
                self.backgroundColor = #colorLiteral(red: 0.3450980392, green: 0.8, blue: 0.007843137255, alpha: 1)
                self.layer.shadowColor = #colorLiteral(red: 0.2786974716, green: 0.643254283, blue: 0.01059799502, alpha: 1)
                self.layer.shadowRadius = 0.0
                self.layer.shadowOffset = CGSize(width: 0, height: 5)
                self.layer.shadowOpacity = 1.0
            } else {
                self.backgroundColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
                self.layer.shadowColor = #colorLiteral(red: 0.3465779424, green: 0.6556648612, blue: 0.005139762536, alpha: 0)
            }
        }
    }
}
