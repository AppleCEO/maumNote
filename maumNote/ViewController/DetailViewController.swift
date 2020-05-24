//
//  DetailViewController.swift
//  maumNote
//
//  Created by joon-ho kil on 2020/05/22.
//  Copyright © 2020 joon-ho kil. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
  @IBOutlet var titleLabel: UILabel!
  @IBOutlet var contentTextView: UITextView!
  var memo: Memo!
  
  override func viewDidLoad() {
    self.titleLabel.text = memo.title
    self.contentTextView.text = memo.content
    
    self.titleLabel.layer.cornerRadius = 5
    self.titleLabel.layer.borderColor = UIColor.init(red: 204/255.0, green: 204/255.0, blue: 204/255.0, alpha: 1).cgColor
    self.titleLabel.layer.borderWidth = 1
    self.titleLabel.clipsToBounds = true
    self.contentTextView.layer.cornerRadius = 5
    self.contentTextView.layer.borderColor = UIColor.init(red: 204/255.0, green: 204/255.0, blue: 204/255.0, alpha: 1).cgColor
    self.contentTextView.layer.borderWidth = 1
    self.contentTextView.clipsToBounds = true
  }
}
