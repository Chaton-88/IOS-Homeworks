
import UIKit
import SnapKit

final class FeedView: UIView {
    
    let feedButton = CustomButton(title: "check", titleColor: .black)
    
    var onText: ((String) -> Void)?
    
    let feedTextField: UITextField = {
        var textField = UITextField()
        textField.textColor = .black
        let myColot = UIColor.green
        textField.layer.borderColor = myColot.cgColor
        textField.layer.borderWidth = 1.0
        textField.autocapitalizationType = .words
        textField.font = UIFont.systemFont(ofSize: 16)
        textField.placeholder = "Enter value"
        textField.toAutoLayout()
        return textField
    }()
    
    var someLabel: UILabel = {
        var someLabel = UILabel()
        someLabel.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        let myColot = UIColor.green
        someLabel.layer.borderColor = myColot.cgColor
        someLabel.layer.borderWidth = 1.0
        someLabel.toAutoLayout()
        return someLabel
    }()
    
    init() {
        super.init(frame: .zero)
        
        setupSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func fill (with modelWord: Bool) {
        if modelWord == true {
            someLabel.text = "The value is correct"
            someLabel.textColor = .green
        } else {
            someLabel.text = "The value is not true"
            someLabel.textColor = .red
        }
    }
    
    private func setupSubviews() {
        addSubviews(feedTextField,
                    feedButton,
                    someLabel)
        
        feedButton.backgroundColor = .green
        
        feedTextField.snp.makeConstraints { (make) in
            make.top.equalTo(250)
            make.leading.equalTo(50)
            make.trailing.equalTo(-50)
            make.height.equalTo(40)
        }
        
        someLabel.snp.makeConstraints { (make) in
            make.top.equalTo(feedTextField.snp.bottom).offset(20)
            make.leading.equalTo(50)
            make.trailing.equalTo(-50)
            make.height.equalTo(40)
        }
        
        feedButton.snp.makeConstraints { (make) in
            make.top.equalTo(someLabel.snp.bottom).offset(20)
            make.leading.equalTo(100)
            make.trailing.equalTo(-100)
            make.height.equalTo(40)
        }
    }
}
