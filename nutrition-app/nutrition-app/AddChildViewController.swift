//
//  AddChildViewController.swift
//  nutrition-app
//
//  Created by Tian Shiyu on 12/14/20.
//

import UIKit
import TextFieldEffects
import iOSDropDown
import CheckBox

class AddChildViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var timeTextField: YoshikoTextField!
    @IBOutlet weak var firstName: YoshikoTextField!
    @IBOutlet weak var lastName: YoshikoTextField!
    @IBOutlet weak var emailAddress: YoshikoTextField!
    @IBOutlet weak var mobileNumber: YoshikoTextField!
    @IBOutlet weak var yourAge: DropDown!
    @IBOutlet weak var yourRelation: DropDown!
    @IBOutlet weak var childName: YoshikoTextField!
    @IBOutlet weak var childBirthday: YoshikoTextField!
    @IBOutlet weak var childGender: DropDown!
    @IBOutlet weak var myChildCheckbox1: CheckBox!
    @IBOutlet weak var myChildCheckbox2: CheckBox!
    @IBOutlet weak var myChildCheckbox3: CheckBox!
    @IBOutlet weak var myChildCheckbox4: CheckBox!
    @IBOutlet weak var myChildCheckbox5: CheckBox!
    @IBOutlet weak var myChildCheckbox6: CheckBox!
    @IBOutlet weak var myChildCheckbox7: CheckBox!
    @IBOutlet weak var myChildCheckbox8: CheckBox!
    @IBOutlet weak var concernCheckbox1: CheckBox!
    @IBOutlet weak var concernCheckbox2: CheckBox!
    @IBOutlet weak var concernCheckbox3: CheckBox!
    @IBOutlet weak var concernCheckbox4: CheckBox!
    @IBOutlet weak var concernCheckbox5: CheckBox!
    @IBOutlet weak var knowHungry: DropDown!
    @IBOutlet weak var eatEnough: DropDown!
    @IBOutlet weak var eatTime: DropDown!
    @IBOutlet weak var specialEat: DropDown!
    @IBOutlet weak var knowFull: DropDown!
    @IBOutlet weak var concernFeeding: DropDown!
    
    let datePicker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        addDatePicker(counter: 0, textfield: timeTextField)
        
        let setAge = ["less than 18", "18-25", "18-29", "30-39", "40-49","50-59","60-69", "70+"]
        setDropdown(array: setAge, dropdown1: yourAge)
        
        firstName.delegate = self
        lastName.delegate = self
        emailAddress.delegate = self
        mobileNumber.delegate = self
        mobileNumber.setNumberKeyboardReturn()
        yourAge.delegate = self
        
        let relation = ["Mother", "Father", "Grandparent", "Other"]
        setDropdown(array: relation, dropdown1: yourRelation)
        
        childName.delegate = self
        addDatePicker(counter: 1, textfield: childBirthday)
        let genders = ["Male", "Female"]
        setDropdown(array: genders, dropdown1: childGender)
        
        
        myChildCheckbox1.title = "was born full term at 37 weeks gestation or later"
        myChildCheckbox2.title = "weighed at least 5 ½ pounds at birth"
        myChildCheckbox3.title = "currently has no growth concerns"
        myChildCheckbox4.title = "has no major medical issues"
        myChildCheckbox5.title = "is meeting developmental milestones"
        myChildCheckbox6.title = "is meeting feeding milestones"
        myChildCheckbox7.title = "is not currently receiving developmental therapies (e.g., physical therapy, speech therapy)"
        myChildCheckbox8.title = "currently eats solids (anything other than liquid)"
        
        
        concernCheckbox1.title = "development"
        concernCheckbox2.title = "feeding"
        concernCheckbox3.title = "health"
        concernCheckbox4.title = "growth"
        concernCheckbox5.title = "no concerns regarding development, feeding, health, or growth"
        
        setYesNo(dropdownX: knowHungry)
        setYesNo(dropdownX: eatEnough)
        let eatTimeArray = ["<5 minutes ", "5-30 minutes", ">30 minutes"]
        setDropdown(array: eatTimeArray, dropdown1: eatTime)
        setYesNo(dropdownX: specialEat)
        setYesNo(dropdownX: knowFull)
        setYesNo(dropdownX: concernFeeding)
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
    // MARK: - Set picker
    
    func addDatePicker(counter: Int, textfield: YoshikoTextField){
        //Formate Date
        datePicker.datePickerMode = .date

        //ToolBar
        let toolbar = UIToolbar();
        toolbar.sizeToFit()
        if #available(iOS 13.4, *) {
            datePicker.preferredDatePickerStyle = .wheels
            datePicker.sizeToFit()
        }
        
        let doneButton: UIBarButtonItem
        if counter == 0{
            doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(donedatePicker1));
        } else{
            doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(donedatePicker2));
        }
        
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelDatePicker));

        toolbar.setItems([doneButton,spaceButton,cancelButton], animated: false)

        textfield.inputAccessoryView = toolbar
        textfield.inputView = datePicker

    }
    
    @objc func donedatePicker1(){
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy"
        timeTextField.text = formatter.string(from: datePicker.date)
        self.view.endEditing(true)
     }
    
    @objc func donedatePicker2(){
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy"
        childBirthday.text = formatter.string(from: datePicker.date)
        self.view.endEditing(true)
     }

    @objc func cancelDatePicker(){
        self.view.endEditing(true)
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

// MARK: - Number Keyboard
extension UITextField {
    func setNumberKeyboardReturn(){
        
        let width = Float(UIScreen.main.bounds.width)
        let accessoryView = UIToolbar(frame: CGRect(x: 0, y: 0, width: CGFloat(width), height: CGFloat(0.1 * width)))
        let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let done = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(selectDoneButton))
        accessoryView.items = [space,space,done]
        self.inputAccessoryView = accessoryView
}
    
    @objc func selectDoneButton(){
        self.resignFirstResponder()
    }
}
