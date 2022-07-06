//
//  VCTwo.swift
//  paginationlib
//
//  Created by Sanjay Kochrekar on 24/06/22.
//

import UIKit

class VCTwo: UIViewController, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "VCTwoCell", for: indexPath) as! VCTwoCell
        cell.label.text = "abcd\(indexPath.row)"
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
    }
}
