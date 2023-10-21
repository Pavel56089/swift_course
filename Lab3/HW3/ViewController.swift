import UIKit

class ViewController: UIViewController {
    
    private var profileView = ProfileView()
    private var nameTextField = {
        var textField = CustomTextField()
        textField.placeholder = "Name"
        textField.textColor = .systemGreen
        textField.tintColor = .systemGreen
        
        return textField
    }()
    
    private var educationTextField = {
        var textField = CustomTextField()
        textField.placeholder = "Education"
        textField.textColor = .systemGreen
        textField.tintColor = .systemGreen
        
        return textField
    }()
    
    private var updateButton = {
        var button = UIButton()
        button.layer.cornerRadius = 20
        button.layer.masksToBounds = true
        button.backgroundColor = .systemGray
        button.setTitle("Save", for: .normal)
        button.setTitleColor( .white, for: .normal)
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        
        print("viewDidLoad")
    }

    private func setUpView() {
        view.backgroundColor = .white
        
        view.addSubview(profileView)
        view.addSubview(nameTextField)
        view.addSubview(educationTextField)
        view.addSubview(updateButton)
        setUpLayout()
        
        profileView.configure(with: DefaultData())
        
        updateButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    private func setUpLayout() {
        profileView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: profileView, attribute: .top, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .top, multiplier: 1, constant: 16),
            NSLayoutConstraint(item: profileView, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 16),
            NSLayoutConstraint(item: profileView, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: -16),
            NSLayoutConstraint(item: profileView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 150)
        ])
        
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: nameTextField, attribute: .top, relatedBy: .equal, toItem: profileView, attribute: .bottom, multiplier: 1, constant: 50),
            NSLayoutConstraint(item: nameTextField, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 16),
            NSLayoutConstraint(item: nameTextField, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: -16),
            NSLayoutConstraint(item: nameTextField, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 50)
        ])
        
        educationTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: educationTextField, attribute: .top, relatedBy: .equal, toItem: nameTextField, attribute: .bottom, multiplier: 1, constant: 20),
            NSLayoutConstraint(item: educationTextField, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 16),
            NSLayoutConstraint(item: educationTextField, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: -16),
            NSLayoutConstraint(item: educationTextField, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 50)
        ])
        
        updateButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: updateButton, attribute: .top, relatedBy: .equal, toItem: educationTextField, attribute: .bottom, multiplier: 1, constant: 20),
            NSLayoutConstraint(item: updateButton, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 40),
            NSLayoutConstraint(item: updateButton, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: -40),
            NSLayoutConstraint(item: updateButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 50)
        ])
    }
    
    @objc func buttonAction() {
        profileView.updateInfo(name: nameTextField.text ?? "", education: educationTextField.text ?? "")
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
