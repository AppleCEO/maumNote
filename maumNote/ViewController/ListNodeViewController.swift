//
// ListView
//  maumNote
//
//  Created by joon-ho kil on 2020/05/22.
//  Copyright © 2020 joon-ho kil. All rights reserved.
//

import UIKit
import AsyncDisplayKit
import ReactorKit
import RxCocoa
import RxSwift
import RxDataSources_Texture

class ListNodeViewController: ASViewController<ASTableNode>, View {
  var disposeBag = DisposeBag()
  let dataSource = RxASTableSectionedReloadDataSource<SectionModel<String, String>>(
      configureCellBlock: { (_, _, _, num) in
          return {
              return CellNode(item: num)
          }
  })
  
  init() {
    super.init(node: ASTableNode.init(style: .plain))
    self.node.backgroundColor = .white
    self.node.delegate = self
    self.node.dataSource = self
  }
  
  override func viewDidLoad() {
    self.navigationController?.navigationBar.topItem?.title = "마음노트"
    self.navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(pushAddMemoNodeViewController))
    reactor = ViewReactor()
  }
  
  func bind(reactor: ViewReactor) {
    

    Observable.just([SectionModel(model: "title", items: [1, 2, 3])])
    
    
    // State
    reactor.state.map { $0.memos }
      .map({ (memos) -> String in
        var array = [String]()
        for memo in memos {
          array.append(memo.title)
        }
        return array
      })
//    .flatMap(<#T##selector: (String) throws -> ObservableConvertibleType##(String) throws -> ObservableConvertibleType#>)
//      .flatMap { return Observable.from($0) }
      .map({ (titles) -> SectionModel<String, String> in
        SectionModel.init(model: "title", items: titles)
      })
      .bind(to: self.node.rx.items(dataSource: dataSource))
      .disposed(by: disposeBag)
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
