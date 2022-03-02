//
//  AddBoodViewController.swift
//  BooksUIKit
//
//  Created by Gaurang on 28/02/22.
//

import UIKit
import IQKeyboardManagerSwift

class AddBookViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var nameTextField: ThemeTextField!
    @IBOutlet weak var authorTextField: ThemeTextField!
    @IBOutlet weak var priceTextField: ThemeTextField!
    @IBOutlet weak var synopsisTextField: ThemeTextField!
    @IBOutlet weak var quantityTextField: ThemeTextField!
    @IBOutlet weak var descriptionTextView: ThemeEditText!
    
    // MARK: - Variables
    private lazy var textfieldWithValidation: [ThemeTextField: InputValidation] = [
        nameTextField: .nonEmpty, authorTextField: .nonEmpty,
        priceTextField: .price, synopsisTextField: .synopsis,
        quantityTextField: .price
    ]
    private lazy var doneButton = UIBarButtonItem(title: StringConsts.save, style: .done, target: self, action: #selector(self.saveTapped))
    
    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = StringConsts.addBook
        navigationItem.rightBarButtonItem = doneButton
    }
    
    // MARK: - Other methods
    private func isValidInput() -> Bool {
        var isValid = true
        for (textField, type) in textfieldWithValidation where textField.isValidInput(type: type) == false {
            isValid = false
        }
        return isValid
    }
    
    // MARK: - Actions
    @objc private func saveTapped() {
        view.endEditing(true)
        guard isValidInput() else {
            return
        }
        let book = Book(context: DBManager.shared.viewContext)
        book.name = nameTextField.unwrappedText
        book.author = authorTextField.unwrappedText
        book.price = Double(authorTextField.unwrappedText) ?? 0
        book.synopsis = synopsisTextField.unwrappedText
        book.quantity = Int64(quantityTextField.unwrappedText) ?? 0
        book.desc = descriptionTextView.text ?? ""
        do {
            try DBManager.shared.saveContext()
        } catch {
            print("Error occurred while inserting data - ", error.localizedDescription)
        }
    }

}

// MARK: - TextField Delegate
extension AddBookViewController: UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if IQKeyboardManager.shared.canGoNext {
            IQKeyboardManager.shared.goNext()
        }
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let field = self.textfieldWithValidation.first(where: { $0.key == textField}) else {
            return true
        }
        let currentText = textField.text ?? ""
        guard let stringRange = Range(range, in: currentText) else { return false }
        let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
        return updatedText.count <= field.value.maxLimit
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        (textField as? ThemeTextField)?.errorMessage = nil
        return true
    }
    
}
