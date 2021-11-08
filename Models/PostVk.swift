
import UIKit
import iOSIntPackage

struct PostVk {
    
    let autor: String
    let description: String
    let image: UIImage
    let likes: Int
    let views: Int
}

func addFiltersImage(image: UIImage, filter: ColorFilter) -> UIImage {
    var processedImage: UIImage?
    ImageProcessor().processImage(sourceImage: image, filter: filter) { image in
        processedImage = image
    }
    return processedImage ?? image
}
