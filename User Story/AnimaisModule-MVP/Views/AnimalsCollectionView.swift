
import UIKit

protocol AnimalsViewDelegate: AnyObject {
    func tap()
}

class AnimalsCollectionView: UIView {
    
    var delegate: AnimalsViewDelegate?
    
    var updateButton = CustomButton(title: "Загрузить новые", titleColor:  UIColor(named: "purple_pixel") ?? .blue)
    
    var titleLabel: UILabel = {
        let label = UILabel()
        label.toAutoLayout()
        label.textColor = UIColor(named: "purple_pixel")
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure() {
        
        backgroundColor = .systemGreen
        addSubviews(titleLabel,updateButton)
        updateButton.toAutoLayout()
        
        updateButton.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        
        setupViews()
        
        self.updateButton.buttonAction = {
            self.delegate?.tap()
        }
    }
    
    func setupViews() {
        
        NSLayoutConstraint.activate([
            
            titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 5),
            updateButton.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 5),
            updateButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            updateButton.heightAnchor.constraint(equalToConstant: 35),
            updateButton.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}
