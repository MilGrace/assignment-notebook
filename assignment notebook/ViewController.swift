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
    var completeList = [false, false, false]
    override func viewDidLoad()
    
    {
        loadData()
        super.viewDidLoad()
        myTableView.delegate = self
        myTableView.dataSource = self
        // Do any additional setup after loading the view.
      
    }
    
    @IBAction func addButtonTapped(_ sender: Any)
    {
        let name = myTextField.text!
        cellList.append(name)
        completeList.append(false)
        myTableView.reloadData()
        myTextField.text = ""
        saveData()
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        
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
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath)
    {
        if editingStyle == UITableViewCell.EditingStyle.delete
                {
                cellList.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
                saveData()
                }
    }
//
    
    func saveData()
    {
        let defaults = UserDefaults.standard
        defaults.setValue(cellList, forKey: "assignments")
    }
    
    func loadData()
    {
        let defaults = UserDefaults.standard
       if let data = defaults.array(forKey: "assignments")
       {
        cellList = data as! [String]
       }
        
    }


}

