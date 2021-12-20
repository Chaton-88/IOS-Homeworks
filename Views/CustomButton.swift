
import UIKit

final class CustomButton: UIButton {
    
    var buttonAction: (() -> Void)?
    
    init(title: String, titleColor: UIColor) {
        super.init(frame: .zero)
        
        self.setTitle(title, for: .normal)
        self.setTitleColor(titleColor, for: .normal)
        

        self.layer.cornerRadius = 10
        self.clipsToBounds = true
        self.layer.shadowOffset.width = 4
        self.layer.shadowOffset.height = 4
        self.layer.shadowRadius = 4
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.7
        self.toAutoLayout()
        
        self.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc
    private func buttonTapped() {
        buttonAction?()
    }
}
