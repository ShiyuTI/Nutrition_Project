//
//  AddChildViewController3.swift
//  nutrition-app
//
//  Created by Tian Shiyu on 12/22/20.
//

import UIKit
import TextFieldEffects
import iOSDropDown
import CheckBox

class AddChildViewController3: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var momHighGrade: DropDown!
    @IBOutlet weak var numOfChildren: YoshikoTextField!
    @IBOutlet weak var birthOrder: DropDown!
    @IBOutlet weak var childLanguage: DropDown!
    @IBOutlet weak var homeLanguage: DropDown!
    @IBOutlet weak var statusOfParent: DropDown!
    @IBOutlet weak var childLiveWith: DropDown!
    
    @IBOutlet weak var address1: YoshikoTextField!
    @IBOutlet weak var address2: YoshikoTextField!
    @IBOutlet weak var city: YoshikoTextField!
    @IBOutlet weak var state: YoshikoTextField!
    @IBOutlet weak var zip: YoshikoTextField!
    @IBOutlet weak var mobileNum: YoshikoTextField!
    @IBOutlet weak var country: YoshikoTextField!
    
    @IBOutlet weak var culturalPreference: DropDown!
    @IBOutlet weak var income: DropDown!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        address1.delegate = self
        address2.delegate = self
        city.delegate = self
        state.delegate = self
        zip.setNumberKeyboardReturn()
        mobileNum.setNumberKeyboardReturn()
        country.delegate = self

        let momhighgrade = ["Less than high school degree", "Some high school but no degree", "Completed high school (high school diploma or equivalent including GED)", "Associate’s degree (2-years)", "College degree (4-years)", "Master's degree", "Doctoral degree", "Professional degree (JD, MD)", "other"]
        setDropdown(array: momhighgrade, dropdown1: momHighGrade)
        
        numOfChildren.setNumberKeyboardReturn()
        
        let birthorder = ["Youngest", "Middle", "Oldest"]
        setDropdown(array: birthorder, dropdown1: birthOrder)
        
        let language = ["English", "Spanish", "other"]
        setDropdown(array: language, dropdown1: childLanguage)

        setDropdown(array: language, dropdown1: homeLanguage)
        
        let statusofparent = ["Married", "Not married", "Separated", "Divorced", "Widowed"]
        setDropdown(array: statusofparent, dropdown1: statusOfParent)
        
        let childlivewith = ["Parents", "Mother", "Mothers", "Father", "Fathers", "Grandparent/s", "Other"]
        setDropdown(array: childlivewith, dropdown1: childLiveWith)
        
        let culturalpreference = ["Hispanic or Latina", "Indian", "Other"]
        setDropdown(array: culturalpreference, dropdown1: culturalPreference)
        
        let income1 = ["Less than $10,000", "$10,000-19,999", "$20,000-29,999", "$30,000-39,999", "$40,000-49,999", "$50,000-59,999", "$60,000-69,999", "$70,000-79,999", "$80,000-89,999", "$90,000-99,999", "$100,000-149,999", "$150,000 more"]
        setDropdown(array: income1, dropdown1: income)
        
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
