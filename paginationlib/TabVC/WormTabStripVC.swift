//
//  ViewController.swift
//  paginationlib
//
//  Created by Sanjay Kochrekar on 24/06/22.
//

import UIKit

class WormTabStripVC: UIViewController, WormTabStripDelegate {
    var tabs:[UIViewController] = []
    let numberOfTabs = 10
    let tabName = ["OVERVIEW", "MARKET STATS", "OPTION CHAIN", "OPEN INTREST ANALYSIS"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.view.backgroundColor = UIColor(netHex: 0xffffff)
        setUpTabs()
        setUpViewPager()
    }
    
    func setUpTabs(){
        for _ in 1...numberOfTabs/2 {
            let vc = VCOne()
            let vc2 = VCThree()
            tabs.append(vc)
            tabs.append(vc2)
        }
    }
    
    func setUpViewPager(){
        let frame =  CGRect(x: 0, y: 40, width: self.view.frame.size.width, height: self.view.frame.size.height - 40)
        let viewPager:WormTabStrip = WormTabStrip(frame: frame)
        self.view.addSubview(viewPager)
        viewPager.delegate = self
        viewPager.eyStyle.kHeightOfTopScrollView = 36
        viewPager.eyStyle.wormStyel = .line
        viewPager.eyStyle.isWormEnable = true
        viewPager.eyStyle.spacingBetweenTabs = 4
        viewPager.eyStyle.dividerBackgroundColor = .white
        viewPager.eyStyle.tabItemSelectedColor = .white
        viewPager.eyStyle.tabItemDefaultColor = UIColor(red: 0.90, green: 0.90, blue: 0.90, alpha: 1.00)
        viewPager.currentTabIndex = 0
        viewPager.shouldCenterSelectedWorm = false
        viewPager.eyStyle.WormColor = .orange
        viewPager.eyStyle.kHeightOfWorm = 2
        viewPager.eyStyle.kPaddingOfIndicator = 4
        viewPager.eyStyle.spacingBetweenTabs = 4
        viewPager.eyStyle.topScrollViewBackgroundColor = UIColor(red: 0.07, green: 0.45, blue: 0.87, alpha: 1.00)
        viewPager.buildUI()
    }
    
    func wtsNumberOfTabs() -> Int {
        return numberOfTabs
    }
    
    func wtsTitleForTab(index: Int) -> String {
        return tabName[index % 3]
    }
    
    func wtsViewOfTab(index: Int) -> UIView {
        let view = tabs[index]
        return view.view
    }
    
    func wtsReachedLeftEdge(panParam: UIPanGestureRecognizer) {
        
    }
    
    func wtsReachedRightEdge(panParam: UIPanGestureRecognizer) {
        
    }

    func wtsDidSelectTab(index: Int) {
        print("selected index:\(index)")
    }
}

