
import UIKit
import StorageService

class PostViewController: UIViewController, PostViewInput {

    var post: Post?
    var textStorage: String = ""
    let postView = PostView()
    let presenter: PostViewOutput
    
    init(presenter: PostViewOutput) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .systemGroupedBackground
        
        view.addSubview(postView)
        postView.toAutoLayout()
        
        NSLayoutConstraint.activate([
            postView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            postView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            postView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            postView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        postView.textFieldAction = { [weak self] in
            self?.textStorage = self?.postView.textField.text ?? ""
        }
        
        postView.postButton.buttonAction = { [weak self] in
            self?.presenter.showPicturing(name: self?.textStorage ?? "")
        }
    }
    
    func setPicturing(animal named: String, text: String) {
        self.postView.postImageView.image = UIImage(named: named)
        self.postView.resultLabel.text = text
    }
}

