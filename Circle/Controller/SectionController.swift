//
//  SectionController.swift
//  Circle
//
//  Created by 林佑淳 on 2023/11/10.
//

import UIKit
import IGListKit

final class LabelSectionController: ListSectionController {
    
    private var text: String?
    
    
    override init(){
        super.init()
        inset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    }
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        let cell = collectionContext!.dequeueReusableCell(of: MyCell.self, for: self, at: index) as! MyCell
        
        cell.configure(with: text)
        return cell
    }
    
    override func sizeForItem(at index: Int) -> CGSize {
        return CGSize(width: collectionContext!.containerSize.width-10, height: 200)
    }
    //該方法在數據更新時被調用，並將新的數據（在這種情況下是字符串）保存到 Section Controller 的 text 屬性中。
    override func didUpdate(to object: Any) {
        self.text = object as? String
    }
    
    override func didSelectItem(at index: Int) {
        print("Selected:\(String(describing: text))")
    }
    
}
