
import UIKit
import SnapKit

class ProfileHeaderView: UIView {
    
    let avatarImageView: UIImageView = {
        let avatarImageView = UIImageView()
        avatarImageView.layer.borderWidth = 3
        avatarImageView.layer.borderColor = UIColor.white.cgColor
        avatarImageView.layer.cornerRadius = 55
        avatarImageView.clipsToBounds = true
        avatarImageView.toAutoLayout()
        return avatarImageView
    }()
    
    let fullNameLabel: UILabel = {
        let fullNameLabel = UILabel()
        fullNameLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        fullNameLabel.textColor = .black
        fullNameLabel.toAutoLayout()
        return fullNameLabel
    }()
    
    let statusLabel: UILabel = {
        let statusLabel = UILabel()
        statusLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        statusLabel.textColor = .gray
        statusLabel.toAutoLayout()
        return statusLabel
    }()
    
    private let setStatusButton = CustomButton(title: "Show status", titleColor: .white)
    
    private let statusTextField: UITextField = {
        let statusTextField = UITextField()
        statusTextField.textColor = .black
        statusTextField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        statusTextField.placeholder = "Enter the status"
        statusTextField.addTarget(self, action: #selector(statusTextChanged(_ :)), for: .editingChanged)
        statusTextField.toAutoLayout()
        return statusTextField
    }()
    
    private let statusTextLabel: UIView = {
        let statusTextLabel = UIView()
        statusTextLabel.backgroundColor = .white
        statusTextLabel.layer.cornerRadius = 12
        statusTextLabel.layer.borderWidth = 1
        statusTextLabel.layer.borderColor = UIColor.black.cgColor
        statusTextLabel.clipsToBounds = true
        return statusTextLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubviews(avatarImageView, fullNameLabel, statusLabel, setStatusButton, statusTextLabel)
        statusTextLabel.addSubview(statusTextField)
        
        statusTextLabel.toAutoLayout()
        self.setStatusButton.backgroundColor = .blue
        
        avatarImageView.snp.makeConstraints { (make) in
            make.top.leading.equalTo(16)
            make.bottom.equalTo(setStatusButton.snp.top).offset(-40)
            make.width.height.equalTo(110)
        }
        
        fullNameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(27)
            make.bottom.equalTo(statusLabel.snp.top).offset(-45)
            make.leading.equalTo(150)
            make.trailing.equalTo(-16)
        }
        
        statusLabel.snp.makeConstraints { (make) in
            make.top.equalTo(fullNameLabel.snp.bottom).offset(45)
            make.leading.equalTo(150)
            make.trailing.equalTo(-16)
        }
        
        statusTextLabel.snp.makeConstraints { (make) in
            make.top.equalTo(statusLabel.snp.bottom).offset(10)
            make.bottom.equalTo(setStatusButton.snp.top).offset(-10)
            make.leading.equalTo(150)
            make.trailing.equalTo(-16)
        }
        
        statusTextField.snp.makeConstraints { (make) in
            make.top.equalTo(statusTextLabel.snp.top)
            make.bottom.equalTo(statusTextLabel.snp.bottom)
            make.leading.equalTo(statusTextLabel.snp.leading).offset(10)
            make.trailing.equalTo(statusTextLabel.snp.trailing)
        }
        
        setStatusButton.snp.makeConstraints { (make) in
            make.bottom.trailing.equalTo(-16)
            make.leading.equalTo(16)
            make.height.equalTo(50)
        }
        
        self.setStatusButton.buttonAction = {
            self.statusLabel.text = "\(self.statusText)"
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private var statusText: String = ""
    
    @objc func statusTextChanged(_ textField: UITextField) {
        statusText = statusTextField.text!
    }
}

