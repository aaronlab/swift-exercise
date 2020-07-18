# Hello Swift
Hello Swift

- 아웃렛 변수 추가
    - @IBOutlet var lblHello: UILabel!
    - @IB로 시작되는 변수 / 함수는 인터페이스 빌더와 관련된 함수나 변수

- Mutable, Immutable 변수
    - Mutable: var
    - Immutable: let
    - 자바스크립트 때문에 헷갈리는 중..

- strong / week
 - 메모리 회수 정책을 나타내는 키워드
 - 일반적으로 객체를 참조하기 위한 아웃렛 변수에 strong을 사용(키워드가 추가되지 않음)
 - strong은 다른 곳에서 참조하고 있을 때 메모리에서 제거되지 않지만, weak은 시스템이 제거할 수 있음
 - 메모리 누수 방지
 
 - 액션 추가 함수
    - @IBAction: 객체의 이벤트를 제어하기 위해 사용
    - (_ sender: UIButton): 액션 함수가 실행되도록 이벤트를 보내는 객체
