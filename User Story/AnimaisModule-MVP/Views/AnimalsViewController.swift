
import UIKit
import SnapKit
import iOSIntPackage

class AnimalsViewController: UIViewController {
    
    let presenter: AnimalsViewOutput
    var nameAnimal: String?
    private let imageProcessor = ImageProcessor()
    private var processImages = [CGImage]()
    
    init(presenter: AnimalsViewOutput) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private var dataSource: [UIImage]? {
        didSet {
            collectionAnimalsView.reloadData()
        }
    }
    
    private let layout = UICollectionViewFlowLayout()
    
    private lazy var collectionAnimalsView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionAnimalsView.backgroundColor = .systemGroupedBackground
        configureAnimalsConstraints()
        
        imageProcessor.processImagesOnThread(sourceImages: dataSource ?? [], filter: .chrome, qos: .default) { newImages in
            DispatchQueue.main.async {
                for image in newImages {
                    self.processImages.append(image!)
                }
                self.collectionAnimalsView.reloadData()
            }
        }
    }
// qos: .userInteractive - 2.00 s
// qos: .userInitiated - 2.00 s
// qos: .utility - 2.00
// qos: .background - 6.10
// qos: .default - 2.00
    
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
        let backButton = UIBarButtonItem()
        backButton.title = "Back"
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
}

private extension AnimalsViewController{
    
    func configureAnimalsConstraints() {
        
        view.addSubview(collectionAnimalsView)
        collectionAnimalsView.toAutoLayout()
        
        collectionAnimalsView.snp.makeConstraints { (make) in
            make.edges.equalTo(view).inset(UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
        }
        
        collectionAnimalsView.dataSource = self
        collectionAnimalsView.delegate = self
        collectionAnimalsView.register(AnimalsCollectionViewCell.self, forCellWithReuseIdentifier: String(describing: AnimalsCollectionViewCell.self))
    }
}

// MARK: - AnimalsViewInput
extension AnimalsViewController: AnimalsViewInput {
    
    func setImage(animal: [UIImage]) {
        dataSource = animal
    }
}

// MARK: UICollectionViewDataSource
extension AnimalsViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: AnimalsCollectionViewCell.self), for: indexPath) as! AnimalsCollectionViewCell
        
        if !processImages.isEmpty {
            cell.animalPhoto = UIImage(cgImage: processImages[indexPath.row])
        } else {
            cell.animalPhoto = dataSource?[indexPath.row]
        }
        
        return cell
    }
}

// MARK: UICollectionViewDelegateFlowLayout
extension AnimalsViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: widthForCell, height: widthForCell)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: baseInset, left: baseInset, bottom: baseInset, right: baseInset)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return baseInset
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return .zero
    }
}

// MARK: Helpers
extension AnimalsViewController {
    private var baseInset: CGFloat { return 8 }
    private var widthForCell: CGFloat { return (collectionAnimalsView.frame.width - baseInset * 4) / 2 }
}





