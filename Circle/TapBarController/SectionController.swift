//
//  SectionController.swift
//  Circle
//
//  Created by 林佑淳 on 2023/12/15.
//

import IGListKit



final class LabelSectionController: ListSectionController {
    
    
    private var text: String?
    
    override init(){
        super.init()
        inset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5) 
     //add cornerradius
        
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        let cell = collectionContext!.dequeueReusableCell(of: Mycell.self, for: self, at: index) as! Mycell
        cell.configure(with: text)
        cell.layer.cornerRadius = 40
        
        return cell
    }
    override func sizeForItem(at index: Int) -> CGSize {
        return CGSize(width: collectionContext!.containerSize.width-50, height: 200)
     
    }
  
    override func didUpdate(to object: Any) {
        self.text = object as? String
    }
    override func didSelectItem(at index: Int) {
        print("didSelectItem\(String(describing: text))")
    }
}

