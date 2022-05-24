//
//  ViewController.swift
//  assignment notebook
//
//  Created by  on 5/24/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{

    
    @IBOutlet weak var myTextField: UITextField!
    @IBOutlet weak var myTableView: UITableView!
    
    var cellList = ["Finish homework","Delete emails","Fill out application"]
    
    override func viewDidLoad()
    
    {
        super.viewDidLoad()
        myTableView.delegate = self
        myTableView.dataSource = self
        // Do any additional setup after loading the view.
      
    }
    
    @IBAction func addButtonTapped(_ sender: Any)
    {
        let name = myTextField.text!
        cellList.append(name)
        myTableView.reloadData()
        myTextField.text = ""
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        cellList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        
        let item = cellList[indexPath.row]
        cell.textLabel?.text = item
        
        return cell
    }
    


}

