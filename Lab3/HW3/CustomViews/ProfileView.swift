import UIKit

// Create a ProfileView class
final class ProfileView: UIView {
    
    // Create a private property for the profile image
    private let profileImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "avatar")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    // Create a private property for the name label
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemGreen
        label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        return label
    }()
    
    // Create a private property for the price label
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemGreen
        label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        return label
    }()
    
    // Initialize the view
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }

    // Required initializer (not implemented)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Configure the view with data
    func configure(with data: DefaultData) {
        updateInfo(name: data.name, education: data.education)
    }
    
    // Set up the view's appearance and subviews
    private func setUpView() {
        layer.cornerRadius = 20
        layer.borderColor = CGColor(red: 41, green: 49, blue: 51, alpha: 1)
        layer.borderWidth = 2
        layer.masksToBounds = true
        
        addSubview(profileImage)
        addSubview(nameLabel)
        addSubview(priceLabel)
        
        setUpLayout()
    }
    
    // Set up the layout constraints
    private func setUpLayout() {
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            profileImage.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            profileImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            profileImage.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.7)
        ])
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            nameLabel.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 16)
        ])
        
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            priceLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 30),
            priceLabel.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 16)
        ])
    }
}

// Extension to update profile information
extension ProfileView {
    func updateInfo(name: String, education: String) {
        nameLabel.text = name + " at " + education
    }
}

