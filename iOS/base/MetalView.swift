//
//  MetalView.swift
//
//  Created by grenlight on 2018/11/23.
//

import UIKit
import Foundation

class MetalView: UIView {
    override class var layerClass: AnyClass {
        return CAMetalLayer.self
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configLayer()
        self.layer.backgroundColor = UIColor.clear.cgColor
    }
    
    private func configLayer() {
        guard let layer = self.layer as? CAMetalLayer else {
            return
        }
        layer.pixelFormat = .rgba16Float
        layer.presentsWithTransaction = false
        layer.framebufferOnly = true
        // nativeScale is real physical pixel scale
        // https://tomisacat.xyz/tech/2017/06/17/scale-nativescale-contentsscale.html
        layer.removeAllAnimations()
        self.contentScaleFactor = UIScreen.main.nativeScale
        
        // 支持 HDR
        // opt-in EDR
    }
}

