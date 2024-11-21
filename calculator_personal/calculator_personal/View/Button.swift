import UIKit

class ButtonUI {
    //let accessViewController = ViewController() -> 에러원인 메서드를 호출
    // Viewcontroller(). 으로 접근은 가능
    
    // 버튼의 구성을 배열로 생성
    let arragne: [[String]] = [ ["7", "8", "9", "+"],
                                ["4", "5", "6", "-"],
                                ["1", "2", "3", "*"],
                                ["AC", "0", "=", "/"]]
    let colorOperator: [String] = ["+", "-", "*", "/", "=", "AC"]
    let defaultColor = CGColor(red: 77/255, green: 77/255, blue: 77/255, alpha: 1.0)
    
    // 버튼 생성
    lazy var buttons: [[UIButton]] = arragne.map{$0.map{makeButton(titleValue: String($0))}}
    
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
        button.addTarget(self, action: #selector (ViewController().tappedButton(_:)), for: .touchUpInside)
        return button
    }
}


