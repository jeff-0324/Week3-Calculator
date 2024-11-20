import UIKit
import SnapKit

class ViewController: UIViewController {
    let stackViews = StackView()
    static var result: String = "0"
    static var label: UILabel = {
        let label = UILabel()
        label.text = result
        label.textColor = .white
        label.backgroundColor = .black
        label.textAlignment = .right
        label.font = .boldSystemFont(ofSize: 60)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    func configureUI() {
        // 뷰의 배경색 설정
        view.backgroundColor = .black
        // 뷰에 컴포넌트 추가
        [ViewController.label, stackViews.verticalStackView]
            .forEach { view.addSubview($0) }
        
        // MARK: - 오토레이아웃 Part
        ViewController.label.snp.makeConstraints {
            $0.height.equalTo(100)
            $0.leading.equalToSuperview().offset(30)
            $0.trailing.equalToSuperview().offset(-30)
            $0.top.equalToSuperview().offset(200)
        }
        
        // 각 라인의 HorizontalStackView의 레이아웃 설정
        [stackViews.firstLineStackView, stackViews.secondLineStackView, stackViews.thirdLineStackView, stackViews.fourthLineStackView].forEach(horizontalStackViewLayout(stackView:))
        
        // 최종 verticalStackView의 레이아웃 설정
        stackViews.verticalStackView.snp.makeConstraints {
            $0.width.equalTo(350)
            $0.top.equalTo(ViewController.label.snp.bottom).offset(60)
            $0.centerX.equalToSuperview()
        }
    }
    
    // 각 라인의 레이아웃 설정 메서드
    func horizontalStackViewLayout(stackView: UIStackView) {
        stackView.snp.makeConstraints {
            $0.height.equalTo(80)
            $0.leading.equalTo(stackView.snp.leading).offset(20)
            $0.trailing.equalTo(stackView.snp.trailing).offset(-28)
        }
    }
}

//// preview 메서드
//#Preview {
//    ViewController()
//}



