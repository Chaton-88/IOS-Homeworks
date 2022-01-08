
import UIKit
import StorageService

final class FeedViewController: UIViewController {
    
    let post = Post(title: "Пост")
    let postButton = CustomButton(title: "post", titleColor: .black)
    
    let feedView = FeedView()
    let model = ModelScenario()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        print(type(of: self), #function)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        print(type(of: self), #function)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(type(of: self), #function)
        
        view.backgroundColor = .lightGray
        self.postButton.backgroundColor = .cyan
        
        view.addSubviews(feedView, postButton)
        feedView.toAutoLayout()
        
        feedView.feedButton.buttonAction = { [weak self] in
            guard let text = self?.feedView.feedTextField.text, !text.isEmpty else { return }
            self?.model.check(word: text) { [weak self] word in
                self?.feedView.fill(with: word)
            }
        }
        
        postButton.buttonAction = { [weak self] in
            let postView = self?.storyboard?.instantiateViewController(withIdentifier: "Post") as! PostViewController
            postView.post = self?.post
            self?.navigationController?.pushViewController(postView, animated: true)
        }
        
        NSLayoutConstraint.activate([
            feedView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            feedView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            feedView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            feedView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -200),
            
            postButton.topAnchor.constraint(equalTo: feedView.bottomAnchor, constant: 70),
            postButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 150),
            postButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -150),
            postButton.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print(type(of: self), #function)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print(type(of: self), #function)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print(type(of: self), #function)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print(type(of: self), #function)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        print(type(of: self), #function)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        print(type(of: self), #function)
    }
}
