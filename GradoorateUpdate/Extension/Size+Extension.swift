//
//  Size+Extension.swift
//  GradoorateUpdate
//
//  Created by Nibras Fitri Zuhra on 21/08/23.
//

import Foundation

extension Int {
    var widthBadges: CGFloat {
        let sizes = [60, 53, 56, 66, 52]
        return CGFloat(sizes[self - 1])
    }
    
    var heightBadges: CGFloat {
        let sizes = [73, 71, 59, 51, 53]
        return CGFloat(sizes[self - 1])
    }
    
    var widthPopUp: CGFloat {
        let sizes = [192, 190, 219, 256, 210, 236]
        return CGFloat(sizes[self - 1])
    }
    
    var heightPopUp: CGFloat {
        let sizes = [236, 252, 232, 195, 212, 212]
        return CGFloat(sizes[self - 1])
    }
    
    var offsetX: CGFloat {
        let sizes = [0, -9, 2, -12, 0, 0]
        return CGFloat(sizes[self - 1])
    }
    
    var offsetY: CGFloat {
        let sizes = [0, -9, 0, -12, 0, 0]
        return CGFloat(sizes[self - 1])
    }
    
    var offsetBadges: CGFloat {
        let sizes = [0, -3, 0, -4, 0, 0]
        return CGFloat(sizes[self - 1])
    }
}

