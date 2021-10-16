
import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    var photo: String? {
        
        didSet {
            imageCollection.image = UIImage(named: photo ?? "the image is missing")
        }
    }
    
    private let imageCollection: UIImageView = {
        let imageCollection = UIImageView()
        imageCollection.contentMode = .scaleAspectFill
        imageCollection.backgroundColor = .white
        imageCollection.clipsToBounds = true
        imageCollection.toAutoLayout()
        return imageCollection
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        
        contentView.addSubview(imageCollection)
        
        NSLayoutConstraint.activate ([
            imageCollection.topAnchor.constraint(equalTo: contentView.topAnchor, constant: .zero),
            imageCollection.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: .zero),
            imageCollection.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: .zero),
            imageCollection.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: .zero)
        ])
    }    
}
