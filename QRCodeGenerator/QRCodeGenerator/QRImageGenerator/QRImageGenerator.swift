//
//  QRImageGenerator.swift
//  QRCodeGenerator
//
//  Created by Dheeraj on 29/10/17.
//  Copyright © 2017 Dheeraj Rathore. All rights reserved.
//

import Foundation
import UIKit

class QRImageGenerator: NSObject {
    
    private var qrCodeImage : UIImage?
    
    private var qrcodeCIImage: CIImage!
    
    /**
     Create QRcode from the text.
     -parameters:
     takes an option string whose QRCode needs to be generated
     -return:
     UIimage object is returned which contain's QR code for the text.
     */
    func generateQRImage(text : String) -> UIImage {
        
        ///Convert text to data
        let data = text.data(using: String.Encoding.isoLatin1, allowLossyConversion: false)
        
        ///Add filters to generate QRImage.
        let filter = CIFilter(name: "CIQRCodeGenerator")
        filter?.setValue(data, forKey: "inputMessage")
        filter?.setValue("Q", forKey: "inputCorrectionLevel")
        
        ///Get CIImage
        qrcodeCIImage = filter?.outputImage
        
        ///Get UIImage object from CIImage
        ///qrCodeImage = UIImage.init(cgImage: qrcodeCIImage as! CGImage)
        
        let context:CIContext = CIContext.init(options: nil)
        let cgImage:CGImage = context.createCGImage(qrcodeCIImage, from: qrcodeCIImage.extent)!
        qrCodeImage = UIImage.init(cgImage: cgImage)
        
        ///return qr code image.
        return qrCodeImage!
        
    }
}

