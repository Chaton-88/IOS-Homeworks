
import UIKit

protocol LogInViewDelegate: AnyObject {
    func tap()
}

class LogInView: UIView, UITextFieldDelegate {
    
    weak var delegate: LogInViewDelegate?
    
    private let imageView: UIImageView = {
        var imageView = UIImageView()
        let vk = UIImage(named: "Image")
        imageView = UIImageView(image: vk)
        imageView.clipsToBounds = true
        imageView.toAutoLayout()
        return imageView
    }()
    
    private let containerView: UIView = {
        var containerView = UIView()
        containerView.layer.cornerRadius = 10
        containerView.backgroundColor = .systemGray6
        containerView.layer.borderWidth = 0.5
        containerView.layer.borderColor = UIColor.lightGray.cgColor
        containerView.clipsToBounds = true
        return containerView
    }()
    
    private var loginView = UIView()
    private let passwordView = UIView()
    
    private let laneView: UIView = {
        var laneView = UIView()
        laneView.layer.borderWidth = 0.5
        laneView.layer.borderColor = UIColor.lightGray.cgColor
        return laneView
    }()
    
    private let loginTextField: UITextField = {
        var loginTextField = UITextField()
        loginTextField.textColor = .black
        loginTextField.autocapitalizationType = .none
        loginTextField.font = UIFont.systemFont(ofSize: 16)
        loginTextField.placeholder = "Email of phone"
        loginTextField.returnKeyType = .done
        loginTextField.toAutoLayout()
        return loginTextField
    }()
    
    private let passwordTextField: UITextField = {
        var passwordTextField = UITextField()
        passwordTextField.textColor = .black
        passwordTextField.autocapitalizationType = .none
        passwordTextField.font = UIFont.systemFont(ofSize: 16)
        passwordTextField.placeholder = "Password"
        passwordTextField.isSecureTextEntry = true
        passwordTextField.returnKeyType = .done
        passwordTextField.toAutoLayout()
        return passwordTextField
    }()
    
    private let setProfileButton: UIButton = {
        var setProfileButton = UIButton()
        setProfileButton.setBackgroundImage(UIImage(named: "blue_pixel"), for: .normal)
        setProfileButton.setTitle("Log in", for: .normal)
        setProfileButton.setTitleColor(.white, for: .normal)
        setProfileButton.layer.cornerRadius = 10
        setProfileButton.clipsToBounds = true
        setProfileButton.toAutoLayout()
        setProfileButton.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
        return setProfileButton
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubviews(imageView, containerView,setProfileButton)
        containerView.addSubviews(loginView, passwordView, laneView, passwordTextField, loginTextField)
        
        containerView.toAutoLayout()
        passwordView.toAutoLayout()
        loginView.toAutoLayout()
        laneView.toAutoLayout()
       
        self.loginTextField.delegate = self
        self.passwordTextField.delegate = self
        
        NSLayoutConstraint.activate([
            
            imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 120),
            imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 100),
            imageView.heightAnchor.constraint(equalToConstant: 100),
            
            containerView.topAnchor.constraint(equalTo: loginView.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: passwordView.bottomAnchor),
            containerView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            containerView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            
            loginView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 120),
            loginView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: .zero),
            loginView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: .zero),
            loginView.heightAnchor.constraint(equalToConstant: 50),
           
            loginTextField.topAnchor.constraint(equalTo: loginView.topAnchor),
            loginTextField.leadingAnchor.constraint(equalTo: loginView.leadingAnchor, constant: 10),
            loginTextField.trailingAnchor.constraint(equalTo: loginView.trailingAnchor, constant: .zero),
            loginTextField.heightAnchor.constraint(equalToConstant: 50),
           
            laneView.topAnchor.constraint(equalTo: loginView.bottomAnchor),
            laneView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            laneView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            laneView.heightAnchor.constraint(equalToConstant: 0.5),
           
            passwordView.topAnchor.constraint(equalTo: laneView.bottomAnchor),
            passwordView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: .zero),
            passwordView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: .zero),
            passwordView.heightAnchor.constraint(equalToConstant: 50),
           
            passwordTextField.topAnchor.constraint(equalTo: passwordView.topAnchor),
            passwordTextField.leadingAnchor.constraint(equalTo: passwordView.leadingAnchor, constant: 10),
            passwordTextField.trailingAnchor.constraint(equalTo: passwordView.trailingAnchor, constant: .zero),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),
            
            setProfileButton.topAnchor.constraint(equalTo: passwordView.bottomAnchor, constant: 16),
            setProfileButton.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor,
                                                       constant: -16),
            setProfileButton.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            setProfileButton.heightAnchor.constraint(equalToConstant: 50),
            setProfileButton.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
        }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.endEditing(true)
        return false
    }
    
    @objc func tapButton() {
        delegate?.tap()
    }
}



