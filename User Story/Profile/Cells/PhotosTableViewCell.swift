
import UIKit

class PhotosTableViewCell: UITableViewCell {
    
    var cell: PhotosCell? {
        didSet {
            photoLabel.text = cell?.title
            arrowImageView.image = UIImage(systemName: cell?.imageArrow ?? "the image is missing")
        }
    }
    
    private let photoLabel: UILabel = {
        let photoLabel = UILabel()
        photoLabel.textAlignment = .left
        photoLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        photoLabel.textColor = .black
        photoLabel.toAutoLayout()
        return photoLabel
    }()
    
    private let stackView: UIStackView = {
        let stack = UIStackView()
        stack.toAutoLayout()
        stack.distribution = .fillEqually
        stack.axis = .horizontal
        stack.spacing = 8
        return stack
    }()
    
    private let arrowImageView: UIImageView = {
        let allowImageView = UIImageView()
        allowImageView.tintColor = .black
        allowImageView.toAutoLayout()
        return allowImageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        contentView.addSubviews(photoLabel, stackView, arrowImageView)
        
        for i in 0...3 {
            let image = Storage.photosImage[i]
            let imageView = UIImageView()
            imageView.image = image
            imageView.clipsToBounds = true
            imageView.layer.cornerRadius = 6
            imageView.contentMode = .scaleAspectFill
            imageView.toAutoLayout()
            stackView.addArrangedSubview(imageView)
        }
        
        NSLayoutConstraint.activate ([
            photoLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            photoLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            photoLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            photoLabel.bottomAnchor.constraint(equalTo: stackView.topAnchor, constant: -12),
            
            stackView.topAnchor.constraint(equalTo: photoLabel.bottomAnchor, constant: 12),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
            stackView.heightAnchor.constraint(equalToConstant: 81.67),
            
            arrowImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            arrowImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            arrowImageView.bottomAnchor.constraint(equalTo: stackView.topAnchor, constant: -12)
        ])
    }
}
