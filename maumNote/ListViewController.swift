//
//  ViewController.swift
//  maumNote
//
//  Created by joon-ho kil on 2020/05/22.
//  Copyright © 2020 joon-ho kil. All rights reserved.
//

import UIKit
import AsyncDisplayKit

class ListViewController: ASViewController<ASTableNode> {
  var items: [String] = ["Welcome to Texture-KR",
                         "Welcome to Texture-KR",
                         "Welcome to Texture-KR, long test!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"]
  
  init() {
    super.init(node: ASTableNode.init(style: .plain))
    self.node.backgroundColor = .white
    self.node.delegate = self
    self.node.dataSource = self
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

extension ListViewController: ASTableDelegate, ASTableDataSource {
  
  func numberOfSections(in tableNode: ASTableNode) -> Int {
    return 1
  }
  
  func tableNode(_ tableNode: ASTableNode, numberOfRowsInSection section: Int) -> Int {
    return items.count
  }
  
  func tableNode(_ tableNode: ASTableNode, nodeBlockForRowAt indexPath: IndexPath) -> ASCellNodeBlock {
    return {
      let item = self.items[indexPath.row]
      return CellNode(item: item)
    }
  }
  
  func tableNode(_ tableNode: ASTableNode, didSelectRowAt indexPath: IndexPath) {
    let detailNodeViewController = DetailNodeViewController()
    self.navigationController?.pushViewController(detailNodeViewController, animated: true)
  }
}
