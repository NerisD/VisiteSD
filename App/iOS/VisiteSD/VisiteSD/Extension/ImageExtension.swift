//
//  ImageVewExtension.swift
//  VisiteSD
//
//  Created by Dimitri SMITH on 06/01/2022.
//

import UIKit

extension UIImage {
    func scalePreservingAspectRatio(targetSize: CGSize) -> UIImage {
        // Determine the scale factor that preserves aspect ratio
        let widthRatio = targetSize.width / size.width
        let heightRatio = targetSize.height / size.height
        
        let scaleFactor = min(widthRatio, heightRatio)
        
        // Compute the new image size that preserves aspect ratio
        let scaledImageSize = CGSize(
            width: size.width * scaleFactor,
            height: size.height * scaleFactor
        )

        // Draw and return the resized UIImage
        let renderer = UIGraphicsImageRenderer(
            size: scaledImageSize
        )

        let scaledImage = renderer.image { _ in
            self.draw(in: CGRect(
                origin: .zero,
                size: scaledImageSize
            ))
        }
        
        return scaledImage
    }
    
    func resizedImage(image: UIImage) -> UIImage {
        let size = CGSize(width: 170, height: 170)
        let renderer = UIGraphicsImageRenderer(size: size)
        
        return renderer.image {(context) in
            image.draw(in: CGRect(origin: .zero, size: size))
        }
    }
    
    func addBlackFilter(image: UIImage) -> UIImage {
        
        let context = CIContext(options: nil)
        let ciImage = CoreImage.CIImage(image: image)!

        // Set image color to b/w
        let bwFilter = CIFilter(name: "CIColorControls")!
        bwFilter.setValuesForKeys([kCIInputImageKey:ciImage, kCIInputBrightnessKey:NSNumber(value: 0.0), kCIInputContrastKey:NSNumber(value: 1.1), kCIInputSaturationKey:NSNumber(value: 0.0)])
        let bwFilterOutput = (bwFilter.outputImage)!

        // Adjust exposure
        let exposureFilter = CIFilter(name: "CIExposureAdjust")!
        exposureFilter.setValuesForKeys([kCIInputImageKey:bwFilterOutput, kCIInputEVKey:NSNumber(value: 0.0)])
        let exposureFilterOutput = (exposureFilter.outputImage)!

        // Create UIImage from context
        let bwCGIImage = context.createCGImage(exposureFilterOutput, from: ciImage.extent)
        let resultImage = UIImage(cgImage: bwCGIImage!, scale: 1.0, orientation: image.imageOrientation)

        return resultImage
        
    }
    
//    func addRonderedCornerToBackground(image: UIImage) -> UIImage {
//
//
//
//
//    }
}

