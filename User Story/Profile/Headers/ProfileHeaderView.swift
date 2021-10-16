
import UIKit

class ProfileHeaderView: UIView {
    
    private let avatarImageView: UIImageView = {
        let avatarImageView = UIImageView(image: #imageLiteral(resourceName: "Incognito"))
        avatarImageView.layer.borderWidth = 3
        avatarImageView.layer.borderColor = UIColor.white.cgColor
        avatarImageView.layer.cornerRadius = 55
        avatarImageView.clipsToBounds = true
        avatarImageView.toAutoLayout()
        return avatarImageView
    }()
    
    private let fullNameLabel: UILabel = {
        let fullNameLabel = UILabel()
        fullNameLabel.text = "Incognito"
        fullNameLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        fullNameLabel.textColor = .black
        fullNameLabel.toAutoLayout()
        return fullNameLabel
    }()
    
    private let statusLabel: UILabel = {
        let statusLabel = UILabel()
        statusLabel.text = "Waiting for something..."
        statusLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        statusLabel.textColor = .gray
        statusLabel.toAutoLayout()
        return statusLabel
    }()
    
    private let setStatusButton: UIButton = {
        let setStatusButton = UIButton()
        setStatusButton.setTitle("Show status", for: .normal)
        setStatusButton.setTitleColor(.white, for: .normal)
        setStatusButton.backgroundColor = .blue
        setStatusButton.layer.cornerRadius = 14
        setStatusButton.layer.shadowOffset.width = 4
        setStatusButton.layer.shadowOffset.height = 4
        setStatusButton.layer.shadowRadius = 4
        setStatusButton.layer.shadowColor = UIColor.black.cgColor
        setStatusButton.layer.shadowOpacity = 0.7
        setStatusButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        setStatusButton.toAutoLayout()
        return setStatusButton
    }()
    
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
        
        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            avatarImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            avatarImageView.bottomAnchor.constraint(equalTo: setStatusButton.topAnchor, constant: -40),
            avatarImageView.widthAnchor.constraint(equalToConstant: 110),
            avatarImageView.heightAnchor.constraint(equalTo: avatarImageView.widthAnchor),
            
            fullNameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 27),
            fullNameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 150),
            fullNameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            fullNameLabel.bottomAnchor.constraint(equalTo: statusLabel.topAnchor, constant: -45),
            
            statusLabel.topAnchor.constraint(equalTo: fullNameLabel.bottomAnchor, constant: 45),
            statusLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 150),
            statusLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            
            statusTextLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 150),
            statusTextLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            statusTextLabel.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 10),
            statusTextLabel.bottomAnchor.constraint(equalTo: setStatusButton.topAnchor, constant: -10),
            
            statusTextField.leadingAnchor.constraint(equalTo: statusTextLabel.leadingAnchor, constant: 10),
            statusTextField.trailingAnchor.constraint(equalTo: statusTextLabel.trailingAnchor, constant: .zero),
            statusTextField.topAnchor.constraint(equalTo: statusTextLabel.topAnchor, constant: .zero),
            statusTextField.bottomAnchor.constraint(equalTo: statusTextLabel.bottomAnchor, constant: .zero),
            
            setStatusButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            setStatusButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            setStatusButton.heightAnchor.constraint(equalToConstant: 50),
            setStatusButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func buttonPressed() {
        statusLabel.text = "\(statusText)"
    }
    
    private var statusText: String = ""
    
    @objc func statusTextChanged(_ textField: UITextField) {
        statusText = statusTextField.text!
    }
}

