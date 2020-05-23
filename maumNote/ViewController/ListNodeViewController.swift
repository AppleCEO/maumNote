//
// ListView
//  maumNote
//
//  Created by joon-ho kil on 2020/05/22.
//  Copyright © 2020 joon-ho kil. All rights reserved.
//

import UIKit
import AsyncDisplayKit

class ListNodeViewController: ASViewController<ASTableNode> {
  var items: [String] = ["Welcome to Texture-KR",
                         "Welcome to Texture-KR",
                         "Welcome to Texture-KR, long test!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"]
  
  init() {
    super.init(node: ASTableNode.init(style: .plain))
    self.node.backgroundColor = .white
    self.node.delegate = self
    self.node.dataSource = self
  }
  
  override func viewDidLoad() {
    self.navigationController?.navigationBar.topItem?.title = "마음노트"
    self.navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(pushAddMemoNodeViewController))
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  @objc func pushAddMemoNodeViewController() {
    let addMemoNodeViewController = AddMemoNodeViewController()
    self.navigationController?.pushViewController(addMemoNodeViewController, animated: true)
  }
}

extension ListNodeViewController: ASTableDelegate, ASTableDataSource {
  
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
