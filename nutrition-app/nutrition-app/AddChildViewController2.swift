//
//  AddChildViewController2.swift
//  nutrition-app
//
//  Created by Tian Shiyu on 12/22/20.
//

import UIKit
import TextFieldEffects
import iOSDropDown
import CheckBox

class AddChildViewController2: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var bornWeek: DropDown!
    @IBOutlet weak var birthPound: DropDown!
    @IBOutlet weak var birthOunce: DropDown!
    @IBOutlet weak var birthInches: DropDown!
    @IBOutlet weak var spendTime: DropDown!
    @IBOutlet weak var spendTimeWhy: UIView!
    @IBOutlet weak var spendTimeContain: YoshikoTextField!
    @IBOutlet weak var hospitalHeight: NSLayoutConstraint!
    @IBOutlet weak var hospitalized: DropDown!
    @IBOutlet weak var hospitalWhy: UIView!
    @IBOutlet weak var hospitalContain: YoshikoTextField!
    @IBOutlet weak var medicalHeight: NSLayoutConstraint!
    @IBOutlet weak var seeSpecialist: DropDown!
    @IBOutlet weak var seeSpecialistAll: UIView!
    @IBOutlet weak var seeSpecialistHeight: NSLayoutConstraint!
    @IBOutlet weak var previouslyTherapies: DropDown!
    @IBOutlet weak var previouslyTherapiesAll: UIView!
    @IBOutlet weak var previouslyTherapiesHeight: NSLayoutConstraint!
    @IBOutlet weak var currentTherapies: DropDown!
    @IBOutlet weak var currentTherapiesAll: UIView!
    @IBOutlet weak var currentTherapiesHeight: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let bornweek = Array(20...45).map(String.init)
        setDropdown(array: bornweek, dropdown1: bornWeek)
        
        let birthpound = Array(1...25).map(String.init)
        setDropdown(array: birthpound, dropdown1: birthPound)
        
        let birthounce = Array(1...15).map(String.init)
        setDropdown(array: birthounce, dropdown1: birthOunce)
        
        let birthinches = Array(1...30).map(String.init)
        setDropdown(array: birthinches, dropdown1: birthInches)
        
        spendTimeContain.delegate = self
        setYesNo(dropdownX: spendTime)
        self.spendTimeWhy.isHidden = true
        spendTime.listDidDisappear {
            if self.spendTime.text == "Yes"{
                self.spendTimeWhy.isHidden = false
                self.hospitalHeight.constant = 170
            }else{
                self.spendTimeWhy.isHidden = true
                self.hospitalHeight.constant = 20
            }
        }
        
        hospitalContain.delegate = self
        setYesNo(dropdownX: hospitalized)
        self.hospitalWhy.isHidden = true
        hospitalized.listDidDisappear {
            if self.hospitalized.text == "Yes"{
                self.hospitalWhy.isHidden = false
                self.medicalHeight.constant = 170
            }else{
                self.hospitalWhy.isHidden = true
                self.medicalHeight.constant = 20
            }
        }
        
        setYesNo(dropdownX: seeSpecialist)
        self.seeSpecialistAll.isHidden = true
        seeSpecialist.listDidDisappear {
            if self.seeSpecialist.text == "Yes"{
                self.seeSpecialistAll.isHidden = false
                self.seeSpecialistHeight.constant = 340
            }else{
                self.seeSpecialistAll.isHidden = true
                self.seeSpecialistHeight.constant = 20
            }
        }
        
        setYesNo(dropdownX: previouslyTherapies)
        self.previouslyTherapiesAll.isHidden = true
        previouslyTherapies.listDidDisappear {
            if self.previouslyTherapies.text == "Yes"{
                self.previouslyTherapiesAll.isHidden = false
                self.previouslyTherapiesHeight.constant = 340
            }else{
                self.previouslyTherapiesAll.isHidden = true
                self.previouslyTherapiesHeight.constant = 20
            }
        }
        
        setYesNo(dropdownX: currentTherapies)
        self.currentTherapiesAll.isHidden = true
        currentTherapies.listDidDisappear {
            if self.currentTherapies.text == "Yes"{
                self.currentTherapiesAll.isHidden = false
                self.currentTherapiesHeight.constant = 340
            }else{
                self.currentTherapiesAll.isHidden = true
                self.currentTherapiesHeight.constant = 20
            }
        }
        
        
    }
    
    func hideset(dropdownX: DropDown, view: UIView){
        
    }
    
    func setYesNo(dropdownX: DropDown){
        let items = ["Yes", "No"]
        setDropdown(array: items, dropdown1: dropdownX)
    }
    
    func setpadding(widthNum: Int, dropdown: DropDown){
        let paddingView = UIView(frame: CGRect.init(x: 0, y: 0, width: widthNum, height: Int(dropdown.frame.height)))
        dropdown.leftView = paddingView
        dropdown.leftViewMode = .always
    }
    
    func setDropdown(array: [String], dropdown1: DropDown){
        dropdown1.optionArray = array
        dropdown1.isSearchEnable = false
        setpadding(widthNum: 5, dropdown: dropdown1)
    }
    
    // MARK: - Textfield
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.endEditing(true);
        return(true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


