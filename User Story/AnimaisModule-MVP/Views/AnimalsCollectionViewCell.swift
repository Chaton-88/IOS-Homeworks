
import UIKit
import SnapKit

class AnimalsCollectionViewCell: UICollectionViewCell {
    
    var animalPhoto: UIImage? {
        didSet {
            imageCollection.image = animalPhoto
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
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        
        contentView.addSubview(imageCollection)
        
        imageCollection.snp.makeConstraints { (make) in
            make.edges.equalTo(contentView).inset(UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
        }
    }
}
