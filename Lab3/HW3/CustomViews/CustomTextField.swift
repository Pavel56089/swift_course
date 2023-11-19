import UIKit

// Create a CustomTextField class that inherits from UITextField
class CustomTextField: UITextField {
    
    // Set padding for the text field
    private let padding = UIEdgeInsets(top: 5, left: 15, bottom: 5, right: 15)
    
    // Initialize the text field
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    // Required initializer (not implemented)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // Override the method to adjust the text rectangle bounds with padding
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    // Override the method to adjust the placeholder rectangle bounds with padding
    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    // Override the method to adjust the editing rectangle bounds with padding
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    // Set up the text field's appearance
    private func setUpView() {
        layer.borderColor = UIColor(red: 41/255, green: 49/255, blue: 51/255, alpha: 1).cgColor
        layer.borderWidth = 2
        layer.masksToBounds = true
    }
}

