//
//  WormStripTabButton.swift
//  paginationlib
//
//  Created by Sanjay Kochrekar on 24/06/22.
//

import Foundation
import UIKit
class WormTabStripButton: UILabel{
    
    
    var index:Int?
    var paddingToEachSide:CGFloat = 0
    var tabText:NSString?{
        didSet{
            let textSize:CGSize = tabText!.size(withAttributes: [NSAttributedString.Key.font: font ?? UIFont(name: "arial", size: 14)!])
            self.frame.size.width = textSize.width + paddingToEachSide + paddingToEachSide
            
            self.text = String(tabText!)
        }
    }
    //MARK: init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    convenience required init(key:String) {
        self.init(frame:CGRect.zero)
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
}
