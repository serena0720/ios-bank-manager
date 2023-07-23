# 💲 은행창구 매니저 *for UI-App User*💸


## 📖 목차

1. [소개](#1.)
2. [팀원](#2.)
3. [타임라인](#3.)
4. [UML & 파일트리](#4.)
5. [실행 화면](#5.)
6. [트러블 슈팅](#6.)
7. [팀 회고](#7.)
8. [참고 링크](#8.)

<br>

<a id="1."></a>

## 1. 📢 소개

*Dear. `UI-App User Customer`*

`Bank`에 업무를 보러 오셨나요?

저희 은행은 `10명`씩 `대기중`에 추가를 해드리고 있습니다!

순서가 되면 `BankClerk`이 순번에 따라 `업무중` 라인에서 호출해드립니다.

잠시만 기다려 주세요~
    
> **핵심 개념 및 경험**
> - **MVC**
>   - `Model`, `View`, `Controller`가 하나의 역할만 할 수 있도록 구현
> - **Timer**
>   - `Timer`를 이용하여 업무시간을 측정할 수 있는 `WorkTimer` 구현
> - **CustomView**
>   - `CustomView`를 만들어 `View`와 `Controller`를 분리하고 코드로만 UI 구현
>   - `StackView`를 활용하여 `Label`의 추가 삭제 기능을 구현
> - **Concurrency UI update**
>   - 멀티 스레드 환경에서 `Operation.main`을 이용한 UI 업데이트 작성 수행
> - **Swift Package Manager**
>   - 콘솔앱의 `Customer`를 로컬 패키지로 만들어 UI앱에 활용

<br>

<a id="2."></a>

## 2. 👤 팀원

| [Serena 🐷](https://github.com/serena0720) | [Erick 🦦](https://github.com/h-suo) |
| :--------: | :--------: | 
| <Img src = "https://i.imgur.com/q0XdY1F.jpg" width="350"/>| <Img src = "https://user-images.githubusercontent.com/109963294/235300758-fe15d3c5-e312-41dd-a9dd-d61e0ab354cf.png" width="350"/>|

<br>

<a id="3."></a>
## 3. ⏱️ 타임라인

> 프로젝트 기간 :  2023.07.10 ~ 2023.07.21

|날짜|내용|
|:---:|---|
| **2023.07.10** |▫️ `Linked List` 구현 <br> ▫️ `Linked List`를 이용한 `Queue` 구현 |
| **2023.07.11** |▫️ 코드 개선을 위한 리펙토링 |
| **2023.07.12** |▫️ 고객의 역할을 하는 `Customer` <br> ▫️ 은행원의 역할을 하는 `BankClerk` 구현 <br> ▫️ 은행의 업무를 하기 위한 `Bank` 구현 <br> ▫️ `Bank`를 관리하는 `BankManager` 구현 <br>|
| **2023.07.13** |▫️ 코드 개선을 위한 리펙토링 |
| **2023.07.14** |▫️ 업무의 종류를 나누기 위해 `WorkType` 구현 <br> ▫️ 은행원의 인원에 따라 비동기적으로 업무를 처리하는 로직 구현 <br> ▫️ 은행원의 `WorkType`에 따라 업무를 나눠 주는 로직 구현 <br> ▫️ README 작성 |
| **2023.07.16** |▫️ 코드 개선을 위한 리펙토링 <br> ▫️ `WorkType`에 업무 `Name` 추가|
| **2023.07.17** |▫️ `HTTP` 개인 공부<br> |
| **2023.07.18** |▫️ 코드 개선을 위한 리펙토링 <br> |
| **2023.07.19** |▫️ `Queue`를 `protocol Queueable`로 추상화 <br> ▫️ 은행창구 매니저 앱의 화면을 구성하는 `BankManagerView` 구현 <br> ▫️ `DynamicType` 적용|
| **2023.07.20** |▫️ `MVC` 파일 분리 및 `Timer` 개인 공부 <br> |
| **2023.07.21** |▫️ `SPM` 활용하여 로컬 라이브러리 추가 <br> ▫️`Console App`에 구현한 `Bank`를 `UI App`에 맞게 리펙토링 <br> ▫️ 업무시간을 측정하는 `WorkTimer` 구현 <br> ▫️ `Controller`에서 사용자 입력에 맞게 `View`를 업데이트하고 `Model`을 호출하는 로직 구현 <br> |


<br>

<a id="4."></a>
## 4. 📊 UML & 파일트리

### UML
<Img src = "https://github.com/h-suo/codingTest/assets/109963294/2785d477-05a5-481b-8e88-c0a32e1ea1f8" width="750"/>

### 파일트리
```
BankManagerUIApp
├── Application
│   ├── AppDelegate.swift
│   └── SceneDelegate.swift
├── ViewController
│   └── BankManagerViewController.swift
├── View
│   └── BankManagerView.swift
├── Model
│   ├── Bank
│   │   ├── Bank.swift
│   │   └── BankClerk.swift
│   └── WorkTimer.swift
└── Extenstion
    ├── Double+.swift
    └── Notification.Name+.swift
```

<br>

<a id="5."></a>
## 5. 📲 실행 화면

| 최초 대기인원 추가 시 | 업무 완료 전 대기인원 추가 시 | 업무 완료 후 대기인원 추가 시 |
| :--------------: | :-------: |  :-------: | 
| <Img src = "https://hackmd.io/_uploads/ry6o8Lcc2.gif" width="230"/> | <Img src = "https://hackmd.io/_uploads/ryv2wI9q2.gif" width="230"/>  | <Img src = "https://hackmd.io/_uploads/rk33DU59h.gif" width="230"/>  |
| **업무 중 초기화 시** | **업무 완료 후 초기화 시** | **초기화 후 대기인원 추가 시** |
| <Img src = "https://hackmd.io/_uploads/SysS_U5cn.gif" width="230"/> | <Img src = "https://hackmd.io/_uploads/rJkLuUqq3.gif" width="230"/>  | <Img src = "https://hackmd.io/_uploads/HkRidL9q3.gif" width="230"/>  |


<br>

<a id="6."></a>
## 6. 🛎️ 트러블 슈팅

### [📎 Step3 트러블 슈팅 보러가기](https://github.com/serena0720/ios-bank-manager/tree/step3#6-%EF%B8%8F-트러블-슈팅)

## MVC 패턴에 따른 구조 고민
### 🔥 문제점
- `Model`, `View`, `Controller`의 역할에 대해 고민했습니다.
    - 또한 객체가 서로의 프로퍼티에 직접 접근하는 것이 아닌 메서드를 통한 의사소통을 해야한다고 생각했습니다.

### 🧯 해결방법
- **View**: `View`는 `View`객체를 프로퍼티로 가지고 `Constraints` 코드와 `View`객체에 데이터를 세팅할 수 있는 메서드를 가지고 있습니다.
- **Model**: 비즈니스 로직을 실행시킬 수 있는 코드와 `Controller`에서 이를 실행 시킬 수 있는 메서드를 가지고 있습니다.
- **Controller**: `View`와 `Model`을 객체로 가지고 있고 사용자의 입력이나 특정 이벤트가 발생했을때 뷰를 업데이트 시키거나 `Model`의 로직을 실행시킵니다.

<br>

## 화면 회전 / scrollview
### 🔥 문제점
- 화면 회전을 해도 `UI`가 기기의 가장자리에 잘리지 않고 출력될 수 있도록 구현하기 위해 고민했습니다.
- 그리고 화면 스크롤을 `대기중/업무중` `stackView`만 스크롤이 되도록 할지 전체 화면을 모두 스크롤을 할지 고민했습니다.
    

### 🧯 해결방법
- 화면 회전을 해도 `UI`가 기기의 가장자리에 잘리지 않고 출력될 수 있도록 `scrollView`를 뷰의 안전구역 내에 위치하게 하였습니다. 이를 위해 `view.safeAreaLayoutGuide`와 `constraint`를 설정해주었습니다.
    ```swift
    private func setUpScrollViewConstraints() {
        NSLayoutConstraint.activate([
            scrollView.frameLayoutGuide.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            scrollView.frameLayoutGuide.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            scrollView.frameLayoutGuide.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            scrollView.frameLayoutGuide.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    ```
- 앱을 이용할 때 화면 내 뷰객체가 스크롤되는 것보단 전체 화면을 스크롤 하는 쪽이 접근성이 더 좋다고 생각하여 전체화면이 스크롤 되도록 설정하였습니다.
    - 특히 야곰 닷넷을 통해 배운 내용 또한 활용하였습니다. 스크롤뷰 설정 시 `frame`과 `multiply`을 1로 맞춘 후 `constant` 1값을 주면 `contentview`의 크기가 작아도 드래그 및 스크롤의 효과를 내었습니다.
    ```swift
    let contentViewHeightConstraints = contentView.heightAnchor.constraint(equalTo: scrollView.frameLayoutGuide.heightAnchor, constant: 1)
    contentViewHeightConstraints.priority = .init(1)
    contentViewHeightConstraints.isActive = true
    ```

<br>

## 비동기 처리 로직 처리
### 🔥 문제점

- 직전 스텝과 달리 `UI`에 맞추어 프로젝트를 구성하다보니 어떠한 방식으로 비동기를 구현할지 고민하였습니다. 
    - 첫번째로 `DispatchQueue`는 `Operation`과 달리 스레드에 작업을 전달 시 변경 및 취소가 되지 않았습니다. 이에 `UI`는 `main`스레드에서만 진행기 때문에 작동 시 충돌의 우려가 있었습니다. 
    - 두번째로 콘솔앱과 `UI`를 구현할 때 뷰컨트롤이라는 가장 큰 차이가 생겼습니다. 이에 구조를 이전과 동일하게 진행하기엔 어색한 부분이 생길 수 있다고 생각했습니다

### 🧯 해결방법
- `Operation`으로 작업을 타입화 시켜줄 수 있고, `Queue`를 이용한 작업관리가 더 쉬워 코드가 간결하며 가독성이 좋아져 `GCD`로 구현되어 있던 비동기 로직을 `Operation`으로 변경하였습니다.
    - `BankClerk`을 업무별로 나눠 인스턴스를 생성하는 것이 아닌 업무별로 `OperationQueue`를 나눠 생성하여 스레드 관리를 하였습니다.
    - 그리고 `BankClerk.carryOutBankService`를 `BlockOperation`으로 타입화하여 업무별 `Queue`에 넣어주는 것으로 비동기 처리를 하였습니다.
    - `초기화` 버튼을 눌렀을 때 이미 큐에 들어간 작업을 `cancelAllOperations`를 이용하여 취소하였습니다.
    ```swift
    class Bank {
        // ...
        private let loanOperationQueue: OperationQueue = {
            let operationQueue = OperationQueue()
            operationQueue.maxConcurrentOperationCount = WorkType.loan.numberOfBankClerk

            return operationQueue
        }()

        private let depositOperationQueue: OperationQueue = {
            let operationQueue = OperationQueue()
            operationQueue.maxConcurrentOperationCount = WorkType.deposit.numberOfBankClerk

            return operationQueue
        }()
        
        // ...
        private func startBankService() {
            while !waitingLine.isEmpty {
                guard let currentCustomer = waitingLine.dequeue() else { return }
                let operation = BlockOperation { BankClerk.carryOutBankService(for: currentCustomer) }

                switch currentCustomer.workType {
                case .deposit:
                    depositOperationQueue.addOperation(operation)
                case .loan:
                    loanOperationQueue.addOperation(operation)
                default:
                    print("workType이 nil입니다.")
                }
            }
        }

        func stopBankService() {
            // ...
            depositOperationQueue.cancelAllOperations()
            loanOperationQueue.cancelAllOperations()
        }
    }
    ```

<br>

## 스크롤 시 타이머 멈춤
### 🔥 문제점
- 화면을 스크롤 시 타이머가 멈추는 문제가 있었습니다. 이는 사용자가 스크롤을 했을 때 RunLoop가 tracking 모드로 바뀌어 타이머가 실행되지 않는 문제였습니다.

### 🧯 해결방법
- 이를 해결하기 위해 현재 런루프에 타이머를 `.common` 모드로 등록하였습니다.

> .common: 하나 이상의 다른 실행 모드를 포함한 모드

```swift
RunLoop.current.add(timer, forMode: .common)
```

<br>

## Swift Package Manager를 활용하여 콘솔앱과 UI 통합
### 🔥 문제점
- 기존에 구현한 콘솔앱 프로젝트를 활용하여 새롭게 UI프로젝트를 진행함에 있어 어떻게 파일을 합칠지 고민을 했습니다. 콘솔앱 프로젝트에 구현한 파일의 경로를 추적하여 파일을 공유하는 방법도 가능하지만 이 방법을 사용할 경우 UI프로젝트를 위해 파일을 변경할 경우 콘솔앱의 프로젝트도 함께 수정된다는 단점이 존재했습니다.

### 🧯 해결방법
- 콘솔앱과 UI 프로젝트 모두 `Queue`, `Linked-List`, `Customer` 등 큐 구조와 `Customer` 내용을 로컬 `framework`로 만들었습니다. 프레임워크를 활용하는데 `CocoaPods`, `Carthage`, `SPM` 등 여러 방법이 있지만 로컬로 바로 연동이 가능한 `SPM`을 사용하여 콘솔앱 프로젝트의 공통 내용을 UI 프로젝트에 적용하였습니다.
<Img src = "https://hackmd.io/_uploads/rJcQ9ccc3.png" width="350"/>


<br>

## Public 키워드
### 🔥 문제점
- `swift packmanager`를 사용하여 `customer` 로컬 패키지를 생성하여 활용하는 과정에서 직접 만든 패지를 활용하다보니 새로운 문제에 직면했습니다. 기본적으로 설정되어있는 `internal`을 모듈 외부에서도 사용가능하게 수정해야하는 문제였습니다. 모듈 외부에서 사용 가능하게 하는 접근제어자에는 `public`과 `open`이 있습니다. 이 둘의 차이점을 고려하여 적용하고자 하였습니다.

### 🧯 해결방법
- `open`과 `public`은 모두 외부에 개방이 되어 있어 모듈 밖에서 모두 접근이 가능하다는 공통점이 있지만, `open`의 경우 오버라이드, 서브클래싱이 가능하지만 `public`의 경우 오버라이드, 서브클래싱이 불가능합니다. 이러한 차이를 고려을했을 때 정형화된 큐와 `Customer` 객체를 공유하고자 프레임워크를 생성한 저희의 의도에는 `public`이 더 적절하다 생각하여 `public`을 각 메소드, 프로퍼티별로 추가하였습니다.
    ```swift
    public struct Customer {
        public let waitingNumber: Int
        public let workType: WorkType? = WorkType.allCases.randomElement()
    
        public init(waitingNumber: Int) {
            self.waitingNumber = waitingNumber
        }
    }
    ```

<br>

<a id="7."></a> 
## 7. 💭 팀 회고

<details>
<summary>팀 회고</summary>

### 우리팀이 잘한 점😃
- 코드를 구현함에 있어 서로의 의견을 반영하여 코드를 작성하였습니다.
- 프로젝트 구현을 함에 있어 한가지 방법이 아닌 여러가지 방법을 고려한 점이 좋았습니다.
- 코드를 깊이있게 고민하고 공부한 후 프로젝트를 진행하였습니다.
- 시간 내에 프로젝트를 완성도 있게 마무리하였습니다.
    
### 우리팀이 아쉬웠던 점😭
- 팀원 간 시간이 잘 안 맞아 더 많은 공부를 함께하지 못 했던 것이 아쉬웠습니다.
- 개인 사정으로 시간 조정 시 어려움이 있었습니다.
    
</details>

<br>

<a id="8."></a>
## 8. 🔗 참고 링크
- [🍎 Apple Developer: Timer](https://developer.apple.com/documentation/foundation/timer)
- [🍎 Apple Developer: UIStackview](https://developer.apple.com/documentation/uikit/uistackview)
- [🍎 Apple Developer: Operation](https://developer.apple.com/documentation/foundation/operation)
- [🍎 Apple Developer: Accesscontrol](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/accesscontrol/)
- [🍎 Apple Developer: Dispatchsourcetimer](https://developer.apple.com/documentation/dispatch/dispatchsourcetimer)
- [🐻 야곰닷넷: 오토레이아웃 정복하기](https://yagom.net/courses/autolayout/)
