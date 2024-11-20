import UIKit

class ButtonUI {
    //let accessViewController = ViewController() -> 에러원인
    
    // 버튼의 구성을 배열로 생성
    let arragne: [[String]] = [ ["7", "8", "9", "+"],
                                ["4", "5", "6", "-"],
                                ["1", "2", "3", "*"],
                                ["AC", "0", "=", "/"]]
    let colorOperator: [String] = ["+", "-", "*", "/", "=", "AC"]
    let defaultColor = CGColor(red: 77/255, green: 77/255, blue: 77/255, alpha: 1.0)
    
    // 각 라인별로 버튼 생성
    lazy var firstLineButtons = arragne[0].map {makeButton(titleValue: String($0))}
    lazy var secondLineButtons = arragne[1].map {makeButton(titleValue: String($0))}
    lazy var thirdLineButtons = arragne[2].map {makeButton(titleValue: String($0))}
    lazy var fourLineButtons = arragne[3].map {makeButton(titleValue: String($0))}
    
    // 버튼을 만드는 메서드
    func makeButton(titleValue: String) -> UIButton {
        // 각 버튼의 값을 이용해 색상을 추가
        let color: UIColor = colorOperator.contains(titleValue) ? .orange : UIColor(cgColor: defaultColor)
        let button = UIButton()
        button.setTitle(titleValue, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 30)
        button.backgroundColor = color
        button.frame.size.height = 80
        button.frame.size.width = 80
        button.layer.cornerRadius = 40
        button.addTarget(self, action: #selector(tappedButton), for: .touchUpInside)
        return button
    }
    
    // 버튼으로 받은 입력값 처리
    @objc func tappedButton(_ sender: UIButton) {
        guard let title = sender.currentTitle else {return}
        guard title != "AC" else {
            DispatchQueue.main.async {
                ViewController.result = "0"
                ViewController.label.text = ViewController.result
            }
            return
        }
        if ViewController.result == "0" {
            ViewController.result = ""
            DispatchQueue.main.async {
                ViewController.result.append(title)
                ViewController.label.text = ViewController.result
            }
        } else {
            // UI업데이트를 위해 메인스레드 사용
            DispatchQueue.main.async {
                ViewController.result.append(title)
                ViewController.label.text = ViewController.result
            }
        }
    }
}
