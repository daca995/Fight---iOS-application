//
//  SingleSelectViewController.swift
//  Borba
//
//  Created by KTIOS2 on 12/20/18.
//  Copyright © 2018 Cim. All rights reserved.
//

import UIKit

protocol SingeSelectDelegate: class{
    func selectedIndex(_ index:Int, type: GroupType)
}

enum GroupType {
    case group1
    case group2
}

class SingleSelectViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    weak var delegate: SingeSelectDelegate?
    var arr : [Fighter] = []
    let cellReuseIdentifier = "cell"
    var groupType : GroupType = .group1
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)

        tableView.delegate = self
        tableView.dataSource = self

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // number of rows in table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arr.count
    }
    
    // create a cell for each table view row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:UITableViewCell = self.tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as UITableViewCell!
        
        let figheter = arr[indexPath.row]
        // set the text from the data model
        cell.textLabel?.text = figheter.name

        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    // method to run when table view cell is tapped
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        delegate?.selectedIndex(indexPath.row, type: groupType)
        self.navigationController?.popViewController(animated: true)
        print("You tapped cell number \(indexPath.row).")
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        if let cell = tableView.cellForRow(at: indexPath as IndexPath) {
            if cell.accessoryType == .checkmark {
                cell.accessoryType = .none
            } else {
                cell.accessoryType = .checkmark
            }
        }
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
