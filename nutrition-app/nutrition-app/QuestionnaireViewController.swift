//
//  ViewController.swift
//  nutrition-app
//
//  Created by Tian Shiyu on 10/31/20.
//

import UIKit

class QuestionnaireViewController: UIViewController{

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var nextBtn: UIButton!
    
    var counter = 0
    
    var array1:[String] = ["was born full term at 37 weeks gestation or later", "weighed at least 5 ½ pounds at birth", "currently has no growth concerns", "has no major medical issues", "is meeting developmental milestones", "is meeting feeding milestones", "is not receiving developmental therapies (e.g., physical therapy, occupation therapy, speech therapy, feeding therapy)", "currently eats solids (anything other than liquid)"]
    
    var array2:[String] = ["development", "feeding", "health", "growth", "no concerns regarding development, feeding, health, or growth"]
    
    var array:[String] = ["was born full term at 37 weeks gestation or later", "weighed at least 5 ½ pounds at birth", "currently has no growth concerns", "has no major medical issues", "is meeting developmental milestones", "is meeting feeding milestones", "is not receiving developmental therapies (e.g., physical therapy, occupation therapy, speech therapy, feeding therapy)", "currently eats solids (anything other than liquid)"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.register(UINib(nibName: "QuestionnaireCellTableViewCell", bundle: nil), forCellReuseIdentifier: "questionCell")
        tableView.separatorStyle = .none
        nextBtn.addTarget(self, action: #selector(toNext), for: .touchUpInside)
    }
    
    @objc func toNext(sender: UIButton) {
        print(sender.tag)
        if counter == 0 {
            nextBtn.setTitle("Done", for: UIControl.State.normal)
            array = array2
            DispatchQueue.main.async(execute: {
                self.tableView.reloadData()
            })
            counter = counter+1
        }else if counter == 1{
            self.performSegue(withIdentifier: "qtoTab", sender: self)
        }
    }
}

extension QuestionnaireViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "questionCell", for: indexPath) as! QuestionnaireCellTableViewCell
        let message = array[indexPath.row]
        cell.selections?.text = message
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print(indexPath.row)
    }
    
}

