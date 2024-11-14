
import UIKit
import SnapKit

class ViewController: UIViewController {
    
    let label = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }

    func configureUI() {
        
        view.backgroundColor = .black
        
        label.text = "12345"
        label.textColor = .white
        label.backgroundColor = .black
        label.textAlignment = .right
        label.font = .boldSystemFont(ofSize: 60)
        
        [label]
            .forEach { view.addSubview($0) }
        
        label.snp.makeConstraints {
            $0.height.equalTo(100)
            $0.leading.equalToSuperview().offset(30)
            $0.trailing.equalToSuperview().offset(-30)
            $0.top.equalToSuperview().offset(200)
        }
    }
}

#Preview {
    ViewController()
}
