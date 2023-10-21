import UIKit

// Create a ContactViewController class
class ContactViewController: UIViewController {
    var contact: Contact?
    
    // Called when the view is loaded
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        // Create a ContactDataView and configure it with the contact data
        let contactDataView = ContactData()
        if let contact = contact {
            contactDataView.configure(with: contact)
        }
        
        // Add the contactDataView to the view and set up layout constraints
        view.addSubview(contactDataView)
        contactDataView.translatesAutoresizingMaskIntoConstraints = false
        
        // Activate layout constraints
        NSLayoutConstraint.activate([
            contactDataView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            contactDataView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            contactDataView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
        ])
    }
}
