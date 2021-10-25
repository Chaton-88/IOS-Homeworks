
import UIKit

class ProfileTableViewCell: UITableViewCell {
    
    var post: PostVk? {
        didSet {
            publicationImageView.image = post?.image
            autorLabel.text = post?.autor
            descriptionLabel.text = post?.description
            likesLabel.text = "Likes: \(post?.likes ?? 0)"
            viewsLabel.text = "Views: \(post?.views ?? 0)"
        }
    }
    
    private let publicationImageView: UIImageView = {
        let publicationImageView = UIImageView()
        publicationImageView.contentMode = .scaleAspectFit
        publicationImageView.backgroundColor = .black
        publicationImageView.toAutoLayout()
        return publicationImageView
    }()
    
    private let autorLabel: UILabel = {
        let autorLabel = UILabel()
        autorLabel.textAlignment = .left
        autorLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        autorLabel.textColor = .black
        autorLabel.numberOfLines = 2
        autorLabel.toAutoLayout()
        return autorLabel
    }()
    
    private let descriptionLabel: UILabel = {
        let descriptionLabel = UILabel()
        descriptionLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        descriptionLabel.textColor = .systemGray
        descriptionLabel.numberOfLines = 0
        descriptionLabel.toAutoLayout()
        return descriptionLabel
    }()
    
    private let likesLabel: UILabel = {
        let likesLabel = UILabel()
        likesLabel.textAlignment = .left
        likesLabel.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        likesLabel.textColor = .black
        likesLabel.toAutoLayout()
        return likesLabel
    }()
    
    private let viewsLabel: UILabel = {
        let viewsLabel = UILabel()
        viewsLabel.textAlignment = .right
        viewsLabel.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        viewsLabel.textColor = .black
        viewsLabel.toAutoLayout()
        return viewsLabel
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        contentView.addSubviews(publicationImageView, autorLabel, descriptionLabel, likesLabel, viewsLabel)
        
        NSLayoutConstraint.activate([
            autorLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            autorLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            autorLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            autorLabel.bottomAnchor.constraint(equalTo: publicationImageView.topAnchor, constant: -12),
            
            publicationImageView.topAnchor.constraint(equalTo: autorLabel.bottomAnchor, constant: 12),
            publicationImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: .zero),
            publicationImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: .zero),
            publicationImageView.bottomAnchor.constraint(equalTo: descriptionLabel.topAnchor, constant: -16),
            publicationImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            publicationImageView.heightAnchor.constraint(equalTo: publicationImageView.widthAnchor),
            
            descriptionLabel.topAnchor.constraint(equalTo: publicationImageView.bottomAnchor, constant: 16),
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            descriptionLabel.bottomAnchor.constraint(equalTo: likesLabel.topAnchor, constant: -16),
            
            likesLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16),
            likesLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            likesLabel.widthAnchor.constraint(equalToConstant: 100),
            likesLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            
            viewsLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16),
            viewsLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            viewsLabel.widthAnchor.constraint(equalToConstant: 100),
            viewsLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
    }
}

