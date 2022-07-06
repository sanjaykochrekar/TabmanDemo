//
//  TabPageVC.swift
//  paginationlib
//
//  Created by Sanjay Kochrekar on 24/06/22.
//
//USING:- TabPageViewController

import UIKit
import Tabman

import Pageboy

class TabPageVC: TabmanViewController {
    private var viewControllers: [UIViewController] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetUp()
    }
    
    private func initialSetUp(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vcTwo = storyboard.instantiateViewController(withIdentifier: "VCTwo")
        let vcOne = storyboard.instantiateViewController(withIdentifier: "VCOne")
        viewControllers.append(vcOne)
        viewControllers.append(vcTwo)
        self.dataSource = self
        let bar = TMBar.ButtonBar()
        bar.layout.transitionStyle = .snap
        bar.spacing = 32
        bar.layout.contentInset = UIEdgeInsets(top: 4, left: 30, bottom: 0, right: 30)
        bar.buttons.customize { (button) in
            button.tintColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.8)
            button.font = UIFont(name: "Helvetica Neue", size: 18) ?? UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.bold)
            button.selectedTintColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1.00)
            bar.indicator.tintColor = .orange
            button.contentInset = UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4)
        }
        let customView = UIView()
        customView.backgroundColor = UIColor(red: 0.19, green: 0.38, blue: 1.00, alpha: 1.00)
        bar.backgroundView.style = .custom(view: customView)
        addBar(bar, dataSource: self, at: .top)
        view.clipsToBounds = true
    }
}

extension TabPageVC: PageboyViewControllerDataSource, TMBarDataSource {

    func numberOfViewControllers(in pageboyViewController: PageboyViewController) -> Int {
        return viewControllers.count
    }

    func viewController(for pageboyViewController: PageboyViewController,
                        at index: PageboyViewController.PageIndex) -> UIViewController? {
        return viewControllers[index]
    }

    func defaultPage(for pageboyViewController: PageboyViewController) -> PageboyViewController.Page? {
        return nil
    }

    func barItem(for bar: TMBar, at index: Int) -> TMBarItemable {
        let barItem = TMBarItem(title: "Page\(index)")
        return barItem
    }
}
