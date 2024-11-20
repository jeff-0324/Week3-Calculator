import UIKit

class StackView {
    let buttons = ButtonUI()
    
    // 각 라인의 버튼을 하나의 스택뷰로 선언
    lazy var firstLineStackView =  makeHorizontalStackView(buttons.firstLineButtons)
    lazy var secondLineStackView = makeHorizontalStackView(buttons.secondLineButtons)
    lazy var thirdLineStackView = makeHorizontalStackView(buttons.thirdLineButtons)
    lazy var fourthLineStackView = makeHorizontalStackView(buttons.fourLineButtons)
    
    // VerticalStackView 생성
    lazy var verticalStackView = makeVerticalStackView([firstLineStackView, secondLineStackView, thirdLineStackView, fourthLineStackView])
    
    // HorizontalStackView 생성하는 메서드
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
}
