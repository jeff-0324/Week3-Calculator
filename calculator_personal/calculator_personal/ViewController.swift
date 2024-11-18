
import UIKit
import SnapKit

class ViewController: UIViewController {
    // 입력을 보여주는 label 선언
    lazy var label: UILabel = {
        let label = UILabel()
        label.text = "12345"
        label.textColor = .white
        label.backgroundColor = .black
        label.textAlignment = .right
        label.font = .boldSystemFont(ofSize: 60)
        return label
    }()
    
    // 숫자 버튼 선언
    lazy var button0: UIButton = { makeNumberButton(titleValue: "0") }()
    lazy var button1: UIButton = { makeNumberButton(titleValue: "1") }()
    lazy var button2: UIButton = { makeNumberButton(titleValue: "2") }()
    lazy var button3: UIButton = { makeNumberButton(titleValue: "3") }()
    lazy var button4: UIButton = { makeNumberButton(titleValue: "4") }()
    lazy var button5: UIButton = { makeNumberButton(titleValue: "5") }()
    lazy var button6: UIButton = { makeNumberButton(titleValue: "6") }()
    lazy var button7: UIButton = { makeNumberButton(titleValue: "7") }()
    lazy var button8: UIButton = { makeNumberButton(titleValue: "8") }()
    lazy var button9: UIButton = { makeNumberButton(titleValue: "9") }()
    
    // 각 기능이 있는 버튼 선언
    lazy var buttonPlus: UIButton = { makeOperatorButton(
        titleValue: "+",
        action:  #selector(buttonAction))
    }()
    lazy var buttonMinus: UIButton = { makeOperatorButton(
        titleValue: "-",
        action:  #selector(buttonAction))
    }()
    lazy var buttonMultiply: UIButton = { makeOperatorButton(
        titleValue: "*",
        action:  #selector(buttonAction))
    }()
    lazy var buttonDivide: UIButton = { makeOperatorButton(
        titleValue: "/",
        action:  #selector(buttonAction))
    }()
    lazy var buttonResult: UIButton = { makeOperatorButton(
        titleValue: "=",
        action:  #selector(buttonAction))
    }()
    lazy var buttonAC: UIButton = { makeOperatorButton(
        titleValue: "AC",
        action:  #selector(buttonAction))
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    func configureUI() {
        // 뷰의 배경색 설정
        view.backgroundColor = .black
        
        
        // MARK: - 버튼 part
        // 각 줄의 HorizontalStackView 생성
        let firstLineStackView = makeHorizontalStackView([button7, button8, button9, buttonPlus])
        let secondLineStackView = makeHorizontalStackView([button4,button5,button6,buttonMinus])
        let thirdLineStackView = makeHorizontalStackView([button1,button2,button3,buttonMultiply])
        let fourthLineStackView = makeHorizontalStackView([buttonAC,button0,buttonResult,buttonDivide])
        
        // VerticalStackView 생성
        let verticalStackView = makeVerticalStackView([firstLineStackView, secondLineStackView, thirdLineStackView, fourthLineStackView])
        
        // View에 컴포넌트들 추가
        [label, verticalStackView]
            .forEach { view.addSubview($0) }
        
        
        // MARK: - 오토레이아웃 part
        // label의 오토레이아웃
        label.snp.makeConstraints {
            $0.height.equalTo(100)
            $0.leading.equalToSuperview().offset(30)
            $0.trailing.equalToSuperview().offset(-30)
            $0.top.equalToSuperview().offset(200)
        }
        
        // 각 줄의 HorizontalStackView의 레이아웃 설정
        [firstLineStackView, secondLineStackView, thirdLineStackView, fourthLineStackView].forEach(horizontalStackViewLayout(stackView:))
        
        // verticalStackView의 레이아웃 설정
        verticalStackView.snp.makeConstraints {
            $0.width.equalTo(350)
            $0.top.equalTo(label.snp.bottom).offset(60)
            $0.centerX.equalToSuperview()
        }
    }
    

    // MARK: - 함수 part
    // 숫자 버튼을 만드는 함수
    func makeNumberButton(titleValue: String) -> UIButton {
        let button = UIButton()
        button.setTitle(titleValue, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 30)
        button.backgroundColor = UIColor(cgColor: CGColor(red: 77/255, green: 77/255, blue: 77/255, alpha: 1.0))
        button.frame.size.height = 80
        button.frame.size.width = 80
        button.layer.cornerRadius = 40
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        return button
    }
    
    // 기능별 버튼을 만드는 함수
    func makeOperatorButton(titleValue: String, action: Selector) -> UIButton {
        let button = UIButton()
        button.setTitle(titleValue, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 30)
        button.backgroundColor = .orange
        button.frame.size.height = 80
        button.frame.size.width = 80
        button.layer.cornerRadius = 40
        button.addTarget(self, action: action, for: .touchUpInside)
        return button
    }
    
    // HorizontalStackview 생성하는 메서드
    func makeHorizontalStackView(_ views: [UIView]) -> UIStackView {
        let stackView = UIStackView(arrangedSubviews: views )
        stackView.axis = .horizontal
        stackView.backgroundColor = .black
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        return stackView
    }
    
    // VerticalStackView 생성하는 메서드
    func makeVerticalStackView(_ views: [UIView]) -> UIStackView {
        let stackView = UIStackView(arrangedSubviews: views)
        stackView.axis = .vertical
        stackView.backgroundColor = .black
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        return stackView
    }
    
    //HorizontalStackview layout을 함수로 구현
    func horizontalStackViewLayout(stackView: UIStackView) {
        stackView.snp.makeConstraints {
            $0.height.equalTo(80)
            $0.leading.equalTo(stackView.snp.leading).offset(20)
            $0.trailing.equalTo(stackView.snp.trailing).offset(-28)
        }
    }
    
    
    // MARK: - 버튼 action 메서드 part
    // 버튼의 액션을 메서드로 구현
    @objc func buttonAction() {
        print("출력")
    }
}


// preview 메서드
#Preview {
    ViewController()
}

// 추후 리팩토링 예정
// let buttons = Array(0...9).map {makeNumberButton(titleValue: String($0))}

