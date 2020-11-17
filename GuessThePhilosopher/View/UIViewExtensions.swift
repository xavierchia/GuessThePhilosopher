import UIKit

// Borders and shadows
extension UIView {
    
    func shadowMe() {
        self.layer.shadowRadius = 2.0
        self.layer.shadowOffset = CGSize(width: 2, height: 2)
        self.layer.shadowOpacity = 0.4
        self.layer.shadowColor = #colorLiteral(red: 0.05882352941, green: 0.2980392157, blue: 0.4588235294, alpha: 1)
    }
    
    func borderAndShadowMe() {
        self.layer.borderWidth = 3
        self.layer.cornerRadius = 20
        self.layer.borderColor = #colorLiteral(red: 0.05882352941, green: 0.2980392157, blue: 0.4588235294, alpha: 1)
        shadowMe()
    }
}


// Animate bottom card
extension UIView{
    func bottomCardShow(){
        UIView.animate(withDuration: 0.2) {
            self.center.y -= self.bounds.height
        }
    }
    func bottomCardHide(){
        UIView.animate(withDuration: 0.2) {
            self.backgroundColor = UIColor.clear
        } completion: { (complete: Bool) in
            self.center.y += self.bounds.height
            self.backgroundColor = UIColor.white
        }
    }
}
