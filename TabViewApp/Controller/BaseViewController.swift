//
//  BaseViewController.swift
//  TabViewApp
//
//  Created by 藤岡正哉 on 2021/02/19.
//

import UIKit
//SegementSlideを使う事でスマニューの様なタブ付きのスライドを行うことができる。
import SegementSlide

class BaseViewController: SegementSlideDefaultViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        reloadData()
        defaultSelectedIndex = 0
    
    }
    
//    Headerに画像を設定する場合はsegementSlideHeaderView()を使う
    override func segementSlideHeaderView() -> UIView? {

        let headerView = UIImageView()
        headerView.isUserInteractionEnabled = true
        headerView.contentMode = .scaleAspectFill
        headerView.image = UIImage(named: "header")
        headerView.translatesAutoresizingMaskIntoConstraints = false

        let headerHeight:CGFloat

        if #available(iOS 11, *){

            headerHeight = view.bounds.height/4 + view.safeAreaInsets.top
        }else{

            headerHeight = view.bounds.height/4 + topLayoutGuide.length
        }

        headerView.heightAnchor.constraint(equalToConstant: headerHeight).isActive = true

        return headerView
    }
    
//    タブのタイトル
    override var titlesInSwitcher: [String]{
        
        return ["Top", "AbemaNews", "Yahoo", "IT", "CNN", "Zuss"]
    }
    
//    Controllerを返すメソッド
    override func segementSlideContentViewController(at index: Int) -> SegementSlideContentScrollViewDelegate? {
//        indexがある場合はSwitch文を使う
        
        switch index{
        
        case 0:
            return Page1ViewController()
        case 1:
            return Page2ViewController()
        case 2:
            return Page3ViewController()
        case 3:
            return Page4ViewController()
        case 4:
            return Page5ViewController()
        case 5:
            return Page6ViewController()
            
        default:return Page1ViewController()
        }
        
    }

}
