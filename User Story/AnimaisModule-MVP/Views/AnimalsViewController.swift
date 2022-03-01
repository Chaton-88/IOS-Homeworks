
import UIKit
import iOSIntPackage

final class AnimalsViewController: UIViewController {
    
    let presenter: AnimalsViewOutput
    let animalsView = AnimalsCollectionView()
    var nameAnimal: String?
    private let imageProcessor = ImageProcessor()
    private var processImages = [CGImage]()
    private var timer: Timer?
    private var count = 10
    private var isIncluded = false
    
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
    
    private var dataSourceNew: [UIImage]? {
        didSet {
            collectionAnimalsView.reloadData()
        }
    }
    
    private let layout = UICollectionViewFlowLayout()
    
    private lazy var collectionAnimalsView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
        self.navigationController?.navigationBar.isHidden = true
        
        collectionAnimalsView.backgroundColor = UIColor(named: "green_pixel")
        animalsView.backgroundColor =  UIColor(named: "green_pixel")
        
        animalsView.delegate = self
        
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
}

private extension AnimalsViewController{
    
    func configureAnimalsConstraints() {
        
        view.addSubviews(collectionAnimalsView, animalsView)
        collectionAnimalsView.toAutoLayout()
        animalsView.toAutoLayout()
        
        NSLayoutConstraint.activate([
            animalsView.topAnchor.constraint(equalTo: view.topAnchor),
            animalsView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            animalsView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            animalsView.bottomAnchor.constraint(equalTo: collectionAnimalsView.topAnchor),
            
            collectionAnimalsView.topAnchor.constraint(equalTo: animalsView.bottomAnchor),
            collectionAnimalsView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionAnimalsView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionAnimalsView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        collectionAnimalsView.dataSource = self
        collectionAnimalsView.delegate = self
        collectionAnimalsView.register(AnimalsCollectionViewCell.self, forCellWithReuseIdentifier: String(describing: AnimalsCollectionViewCell.self))
    }
}

// MARK: - AnimalsViewInput
extension AnimalsViewController: AnimalsViewInput {
    
    func setImage(animal: [UIImage],animals: [UIImage]) {
        dataSource = animal
        dataSourceNew = animals
    }
}

// MARK: UICollectionViewDataSource
extension AnimalsViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if !isIncluded {
            return dataSource?.count ?? 0
        } else {
            return dataSourceNew?.count ?? 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: AnimalsCollectionViewCell.self), for: indexPath) as! AnimalsCollectionViewCell
        
        if !isIncluded {
            if !processImages.isEmpty {
                cell.animalPhoto = UIImage(cgImage: processImages[indexPath.row])
            } else {
                cell.animalPhoto = dataSource?[indexPath.row]
            }
        } else {
            cell.animalPhoto = dataSourceNew?[indexPath.row]
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

// MARK: Timer
extension AnimalsViewController: AnimalsViewDelegate {
    
    func tap() {
        
        UIView.animate(withDuration: 1.0, animations: {
            self.animalsView.updateButton.alpha = 0.0
        })
        
        if timer == nil {
            let timer = Timer(timeInterval: 1.0,
                              target: self,
                              selector: #selector(updateTime),
                              userInfo: nil,
                              repeats: true)
            RunLoop.current.add(timer, forMode: .common)
            timer.tolerance = 0.01
            
            self.timer = timer
        }
    }
    
    @objc func updateTime() {
        guard count > -1 else { return }
        let seconds = String(count)
        animalsView.titleLabel.text = seconds
        count-=1
        guard count == -1 else { return }
        animalsView.titleLabel.text = ""
        isIncluded = true
        collectionAnimalsView.reloadData()
    }
}

// На странице Profile можно через какое-то время предлагать обновить публикации
// На странице, где применяются фильтры к фото, можно после обработки через какое-то время вывести информацию о фильтре и предложить его сменить на другой или оставить

