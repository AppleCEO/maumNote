//
//  CellNode.swift
//  maumNote
//
//  Created by joon-ho kil on 2020/05/22.
//  Copyright © 2020 joon-ho kil. All rights reserved.
//

import AsyncDisplayKit

class CellNode: ASCellNode {
    
    let imageNode: ASImageNode = {
        let node = ASImageNode()
        node.image = UIImage(named: "image")
        node.borderColor = UIColor.gray.cgColor
        node.borderWidth = 1.0
        node.cornerRadius = 15.0
        node.contentMode = .scaleAspectFit
        return node
    }()
    
    let titleNode: ASTextNode = {
        let node = ASTextNode()
        node.maximumNumberOfLines = 1
        return node
    }()
    
    init(item: String) {
        super.init()
        self.automaticallyManagesSubnodes = true
        self.selectionStyle = .none
        self.backgroundColor = .white
        self.titleNode.attributedText =
            NSAttributedString(string: item,
                               attributes: [.font: UIFont.boldSystemFont(ofSize: 15.0),
                                            .foregroundColor: UIColor.gray])
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let imageRatioLayout = ASRatioLayoutSpec(ratio: 1.0, child: imageNode)
        imageRatioLayout.style.flexBasis =  ASDimension(unit: .fraction, value: 0.3)
        titleNode.style.flexBasis =  ASDimension(unit: .fraction, value: 0.7)
       
        let containerLayout = ASStackLayoutSpec(direction: .horizontal,
                                                spacing: 10.0,
                                                justifyContent: .start,
                                                alignItems: .stretch,
                                                children: [imageRatioLayout, titleNode])
        
        var containerInsets: UIEdgeInsets = .zero
        containerInsets.left = 15.0
        containerInsets.right = 15.0
        containerInsets.top = 15.0
        containerInsets.bottom = 15.0
        return ASInsetLayoutSpec(insets: containerInsets, child: containerLayout)
    }
}
