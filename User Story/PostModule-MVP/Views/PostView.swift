
import UIKit
import SnapKit

class PostView: UIView {
    
    var textFieldAction: (() -> Void)?
    let postButton = CustomButton(title: "Показать", titleColor: .black)
    let imageButton = CustomButton(title: "Смотреть больше!", titleColor: .systemGroupedBackground)
    
    let textField: UITextField = {
        let field = UITextField()
        field.placeholder = "Наменование животного"
        field.addTarget(self, action: #selector(textEdited), for: .editingChanged)
        field.layer.cornerRadius = 8
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.lightGray.cgColor
        field.toAutoLayout()
        return field
    }()
    
    var resultLabel: UILabel = {
        var resultLabel = UILabel()
        resultLabel.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        resultLabel.toAutoLayout()
        return resultLabel
    }()
    
    let postImageView: UIImageView = {
        var imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.toAutoLayout()
        return imageView
    }()
    
    init() {
        super.init(frame: .zero)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        addSubviews(postButton,
                    textField,
                    resultLabel,
                    postImageView,
                    imageButton)
        
        postButton.backgroundColor = .systemMint
        imageButton.backgroundColor = .systemGroupedBackground
        
        textField.snp.makeConstraints { (make) in
            make.top.equalTo(150)
            make.leading.equalTo(50)
            make.trailing.equalTo(-50)
            make.height.equalTo(40)
        }
        
        postButton.snp.makeConstraints { (make) in
            make.top.equalTo(textField.snp.bottom).offset(10)
            make.leading.equalTo(65)
            make.trailing.equalTo(-65)
        }
        
        resultLabel.snp.makeConstraints { (make) in
            make.top.equalTo(postButton.snp.bottom).offset(10)
            make.leading.equalTo(65)
            make.trailing.equalTo(-65)
            make.height.equalTo(20)
        }
        
        postImageView.snp.makeConstraints { (make) in
            make.top.equalTo(resultLabel.snp.bottom).offset(10)
            make.height.equalTo(320)
            make.leading.equalTo(25)
            make.trailing.equalTo(-25)
        }
        
        imageButton.snp.makeConstraints { (make) in
            make.top.equalTo(postImageView.snp.bottom).offset(10)
            make.leading.equalTo(65)
            make.trailing.equalTo(-65)
        }
    }
    
    @objc
    private func textEdited() {
        textFieldAction?()
    }
}
