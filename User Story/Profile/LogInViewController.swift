
import UIKit

protocol LoginViewControllerDelegate: AnyObject {
    func checkingValues(login: String, password: String) -> Bool
}

class LogInViewController: UIViewController {
    
    var delegate: LoginViewControllerDelegate?
    
    private let scrollView = UIScrollView()
    let logInView = LogInView()
    
    let currentUser = CurrentUserService()
    let testUser = TestUserService()
    
    private let hacker = PasswordHacker()
  
// MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isHidden = true
        
        self.view.backgroundColor = .white
        logInView.backgroundColor = .white
        
        view.addSubview(scrollView)
        scrollView.addSubview(logInView)
        
        configureConstraints()
        
        logInView.delegate = self
    }
    
// MARK: - configure constraints
    func configureConstraints() {
        
        scrollView.toAutoLayout()
        logInView.toAutoLayout()
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            logInView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            logInView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            logInView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            logInView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            logInView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
        ])
    }
    
// MARK: - viewWillAppear
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
// MARK: - viewDidDisappear
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    func createQueue(queue: DispatchQueue = DispatchQueue.global(qos: .userInteractive), complition: @escaping () -> ()) {
        queue.async {
            complition()
        }
    }
    
    @objc fileprivate func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            
            scrollView.contentInset.bottom = keyboardSize.height
            scrollView.verticalScrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize.height, right: 0)
        }
    }
    
    @objc fileprivate func keyboardWillHide(notification: NSNotification) {
        scrollView.contentInset.bottom = .zero
        scrollView.verticalScrollIndicatorInsets = .zero
    }
}

//MARK: Login view delegate
extension LogInViewController: LogInViewDelegate {
    func tap() {
        
        let userLogin = delegate?.checkingValues(login: logInView.loginTextField.text ?? "", password: logInView.passwordTextField.text ?? "")
        
#if DEBUG
        if userLogin == true, testUser.verification(fullname: logInView.loginTextField.text!) != nil {
            let profile = ProfileViewController(userService: testUser, userName: logInView.loginTextField.text!)
            navigationController?.pushViewController(profile, animated: true)
        } else {
            logInView.loginTextField.text = nil
            logInView.passwordTextField.text = nil
            logInView.loginTextField.attributedPlaceholder = NSAttributedString(string: "User is not found", attributes: [NSAttributedString.Key.foregroundColor : UIColor.red])
            logInView.setProfileButton.isEnabled = false
        }
#else
        if userLogin == true, currentUser.verification(fullname: logInView.loginTextField.text!) != nil {
            let profile = ProfileViewController(userService: currentUser, userName: logInView.loginTextField.text!)
            navigationController?.pushViewController(profile, animated: true)
        } else {
            logInView.loginTextField.text = nil
            logInView.passwordTextField.text = nil
            logInView.loginTextField.attributedPlaceholder = NSAttributedString(string: "User is not found", attributes: [NSAttributedString.Key.foregroundColor : UIColor.red])
            logInView.setProfileButton.isEnabled = false
        }
#endif
   }
    
    func pressPasswordSelection() {
        logInView.activityIndicator.startAnimating()

        createQueue {
            let password = self.hacker.bruteForce(passwordToUnlock: "1!n3p")
            
            DispatchQueue.main.async { [self] in
                logInView.passwordTextField.text = password
                logInView.passwordTextField.isSecureTextEntry = false
                logInView.activityIndicator.stopAnimating()
            }
        }
    }
}
