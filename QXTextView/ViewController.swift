//
//  ViewController.swift
//  QXLabel
//
//  Created by labi3285 on 2019/6/22.
//  Copyright © 2019 labi3285_lab. All rights reserved.
//

import UIKit
import QXUIKitExtension
import QXConsMaker

class Button: UIButton {
    deinit {
        print("btn deinit")
    }
}

class View: UIView {
    deinit {
        print("view deinit")
    }
}

class ViewController: UIViewController {
    
    override func loadView() {
        self.view = View()
    }
    
    func newButton(_ title: String) -> Button {
        let one = Button()
        one.setTitle(title, for: .normal)
        one.setTitleColor(UIColor.green, for: .normal)
        one.backgroundColor = UIColor.purple
        one.addTarget(self, action: #selector(btnClicked), for: .touchUpInside)
        return one
    }
    @objc func btnClicked() {
        print("btn clicked")
    }
    
    lazy var label: QXLabel = {
        let one = QXLabel()
        one.lineSpace = 0
        one.paragraphSpace = 0
        one.alignmentX = .left
        one.alignmentY = .top
        one.justified = true
        one.numberOfLines = 7
        one.edgeInsets = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        one.backgroundColor = QXColor.hex("#f5f5f5", 1).uiColor
        //one.lineHeightTolerance = 1.1
        one.intrinsicWidth = 300
        
        let t1 = QXLabel.Item.text(string: "鲁镇的酒店的格局，是和别处不同的",
                                   font: QXFont(size: 16, color: QXColor.hex("#333333", 1)),
                                   linkData: "t1")
        let t2 = QXLabel.Item.text(string: "做工的人，傍午傍晚散了工，每每花四文铜钱，买一碗酒，这是二十多年前的事，现在每碗涨到十文，靠柜外站着，热热的喝了休息；",
                                   font: QXFont(size: 16, color: QXColor.hex("#666666", 1)),
                                   linkData: "t2")
        let t3 = QXLabel.Item.text(string: "倘肯多花一文，便可以买一碟盐煮笋，或者茴香豆，做下酒物了，如果出到十几文，那就能买一样荤菜，但这些顾客，多是短衣帮，大抵没有这样阔绰。",
                                   font: QXFont(size: 16, color: QXColor.hex("#999999", 1)),
                                   linkData: "t3")
        
        let img1 = QXLabel.Item.image(image: QXImage("pic"),
                                      size: CGSize(width: 30, height: 30),
                                      widthPadding: 5,
                                      descentRatio: 0.2,
                                      linkData: "img1")
        
        let btn1 = QXLabel.Item.view(view: newButton("按钮"), size: CGSize(width: 60, height: 30), widthPadding: 5, descentRatio: 0.2, linkData: nil)

        var moreFont = QXFont(size: 16, color: QXColor.hex("#0000ff", 1))
        moreFont.underline = true
        one.lineBreakItem = QXLabel.Item.text(string: "更多", font: moreFont, linkData: "more")

        one.items = [t1, img1, t2, btn1, t3]
        one.respondTouchLink = { [weak self] data in
            print(data)
        }
        return one
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(label)
        label.IN(view).CENTER.MAKE()
    }
    
    deinit {
        print("deinit vc")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let vc = ViewController()
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
}

