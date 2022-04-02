
import UIKit
import StorageService

class PostViewController: UIViewController, PostViewInput {
    
    var textStorage: String = ""
    var show: Bool?
    let postView = PostView()
    let presenter: PostViewOutput
    
    weak var postCoordinator: PostCoordinator?
    
    init(presenter: PostViewOutput) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBarController?.tabBar.isHidden = true
        self.view.backgroundColor = .systemGroupedBackground
        
        view.addSubview(postView)
        postView.toAutoLayout()
        
        postView.imageButton.buttonAction = { [ weak self ] in
            self?.postCoordinator?.coordinateToAnimals(name: self?.textStorage ?? "")
        }
        
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
            self?.presenter.showPicturing(name: self?.textStorage ?? "", show: self?.show ?? false)
        }
    }
    
    func setPicturing(animal named: String, text: String, examination: Bool) {
        self.postView.postImageView.image = UIImage(named: named)
        self.postView.resultLabel.text = text
        if examination == true {
            self.postView.imageButton.backgroundColor = .systemMint
        } else {
            self.postView.imageButton.backgroundColor = .systemGroupedBackground
        }
    }
}
