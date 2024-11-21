import UIKit
import SnapKit

protocol CalculatorDelegate {
    func calculate(expression: String) -> Int?
}

class ViewController: UIViewController {
    var calculatorDelegate: CalculatorDelegate?
    let stackView = StackView()
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
        [ViewController.label, stackView.verticalStackView]
            .forEach { view.addSubview($0) }
    
        // MARK: - 오토레이아웃 Part
        // label 레이아웃 설정
        ViewController.label.snp.makeConstraints {
            $0.height.equalTo(100)
            $0.leading.equalToSuperview().offset(30)
            $0.trailing.equalToSuperview().offset(-30)
            $0.top.equalToSuperview().offset(200)
        }
        
        // 각 라인의 HorizontalStackView의 레이아웃 설정
        [stackView.stakViews].forEach(horizontalStackViewLayout(stackView:))
        
        // 최종 verticalStackView의 레이아웃 설정
        stackView.verticalStackView.snp.makeConstraints {
            $0.width.equalTo(350)
            $0.top.equalTo(ViewController.label.snp.bottom).offset(60)
            $0.centerX.equalToSuperview()
        }
    }
    
    // 각 라인의 레이아웃 설정 메서드
    func horizontalStackViewLayout(stackView: [UIStackView]) {
        for index in stackView {
            index.snp.makeConstraints {
                $0.height.equalTo(80)
                $0.leading.equalTo(index.snp.leading).offset(20)
                $0.trailing.equalTo(index.snp.trailing).offset(-28)
            }
        }
    }
}

extension ViewController {
    // MARK: - 버튼 액션 메서드 Part
    // 버튼으로 받은 입력값 처리
    @objc func tappedButton(_ sender: UIButton) {
        guard let title = sender.currentTitle else { return }
        // switch문
        switch title {
        case "AC" :
            changeLabelValue(0)
        case "=" :
            let calculateResult = calculatorDelegate?.calculate(expression: ViewController.result)
            changeLabelValue(calculateResult)
        default :
            if ViewController.result.first == "0" {
                ViewController.result = ""
            }
            appendValue(title)
            let calculateResult = calculatorDelegate?.calculate(expression: ViewController.result)
            changeLabelValue(calculateResult)
        }
    }
   
    // 입력 받은 숫자를 추가
    func appendValue(_ value: String) {
        ViewController.result.append(value)
    }
    
    // label의 값을 변경 (UI 업데이트)
    func changeLabelValue(_ value: Int?) {
        guard let value = value else {return}
        DispatchQueue.main.async {
            ViewController.label.text = String(value)
        }
    }
}


//// preview 메서드
//#Preview {
//    ViewController()
//}



