# 💲 은행창구 매니저 *for Console-App User*💸


## 📖 목차

1. [소개](#1.)
2. [팀원](#2.)
3. [타임라인](#3.)
4. [파일트리](#4.)
5. [실행 화면](#5.)
6. [트러블 슈팅](#6.)
7. [팀 회고](#7.)
8. [참고 링크](#8.)

<br>

<a id="1."></a>

## 1. 📢 소개

*Dear. `Console-App User Customer`*

`Bank`에 업무를 보러 오셨나요? *CommandLine*에 원하시는 메뉴를 선택해주세요!
저희 `BankManager`에게 대기번호를 받으시고 대기해주세요.
`BankClerk`이 업무 처리를 도와드릴 겁니다!
    
> **핵심 개념 및 경험**
> - LinkedList를 이용한 Queue 구현
> - Queue의 UnitTest 구현
> - GCD를 이용한 Concurrency 프로그래밍
> - Opaque and Boxed Types을 활용하여 Queue의 추상화

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
| **2023.07.16** |▫️ 코드 개선을 위한 리펙토링 <br> ▫️ WorkType에 업무 Name 추가|
| **2023.07.17** |▫️ HTTP 개인 공부<br> |
| **2023.07.18** |▫️ 코드 개선을 위한 리펙토링 <br> |
| **2023.07.19** |▫️ Queue를 protocol Queueable로 추상화 <br> |

<br>

<a id="4."></a>
## 4. 📊 파일트리
<!-- <Img src = "" width="700"/> -->
```
BankManagerConsoleApp
├── Bank
│   ├── BankManager.swift
│   ├── Bank.swift
│   ├── BankClerk.swift
│   ├── Customer.swift
│   ├── CustomerQueue.swift
│   ├── CustomerQueueable.swift
│   └── WorkType.swift
├── Util
│   ├── LinkedList.swift
│   ├── Node.swift
│   └── Queueable.swift
└── main.swift
```

<br>

<a id="5."></a>
## 5. 📲 실행 화면

| 은행 개점 선택 시 | 은행 업무 종료 시 |
| :--------------: | :-------: | 
| <Img src = "https://github.com/h-suo/TIL/assets/109963294/4f6bc387-d0e6-4637-8b4c-b2083e09bf06" width="350"/> | <Img src = "https://hackmd.io/_uploads/r1DTZDAKh.gif" width="350"/>  |


<br>

<a id="6."></a>
## 6. 🛎️ 트러블 슈팅

### [📎 Step2 트러블 슈팅 보러가기](https://github.com/serena0720/ios-bank-manager/tree/step2#6-%EF%B8%8F-트러블-슈팅)

## 비동기 처리 로직 처리
### 🔥 문제점
- 대기줄의 고객을 각 업무에 배치하는 비동기 처리 로직을 어떤 객체에서 진행해야할지에 대한 고민을 했습니다.

### 🧯 해결방법
- `Bank`에서는 `BankClerk`인스턴스를 부서별로 `Deposit`과 `Loan`으로 나누어 생성하였습니다. 이로써 `Bank`에서는 `BankClerk`별 부서를 나누어, `clockIntoWork` 메소드에서 각 부서별 `BankClerk`에게 업무를 지시하였습니다.
- 지시를 받은 `BankClerk`는 `carryOutBankService`에서 부서별 업무 인원에 맞추어 업무를 처리하였습니다.
    - 이때 부서별 업무 인원의 수를 `workType.numberOfBankClerk`라고 네이밍하여, 각 부서에 맞추어 `DispatchSemaphore`의 값을 지정하였습니다.
- 결론적으로 비동기 처리 로직(업무 인원에 맞춰 동시에 일을 시키는 작업)은 `BankClerk`에서 하도록 구현하였습니다.

<br>

## Semaphore로 Race Condition 해결
### 🔥 문제점
- 이전 Step에서 은행원이 1명일 때와는 달리 은행원이 여러명일 때는 비동기 작업을 어떤식으로 처리할지 고민했습니다.
- `DispatchQueue`의 `global().async`는 여러 스레드를 생성 가능하게 합니다. 이렇게 생성된 여러 스레드가 하나의 자원에 접근하게 되면 `Race Condition`이 발생할 수 있습니다. 이를 방지하면서 스레드 제한을 해줄 수 있는 방법을 고민했습니다.

### 🧯 해결방법
- `DispatchSemaphore`는 카운팅 `Semaphore`를 이용하여 리소스(스레드)의 접근을 제어할 수 있습니다. 이를 사용하면 멀티 스레드가 하나의 자원에 접근하면서 생길 수 있는 `Race Condition`을 방지할 수 있었습니다.
- 이러한 `DispatchSemaphore`를 이용하여 `DispatchSemaphore`의 값을 업무 종류에 따른 은행원의 수로 설정하고 `Wait()`과 `Signal()`을 사용하여 은행원(스레드)이 업무 중에는 동시에 다른 업무를 할 수 없도록 구현하였습니다.
    ```swift
    self.semaphore = DispatchSemaphore(value: workType.numberOfBankClerk)

    // ...
    DispatchQueue.global().async(group: group) {
        semaphore.wait()

        startTask(customer.waitingNumber)
        Thread.sleep(forTimeInterval: workType.taskTime)
        endTask(customer.waitingNumber)

        semaphore.signal()
    }
    ```
<br>

## Queueable로 Queue의 추상화
### 🔥 문제점
- 객체지향과 프로토콜 지향 중 어떤 것이 정답이라고 생각하진 않지만 이번에 새롭게 `POP`에 대해 배우면서 현재 코드에 대한 고민을 해보았습니다. 먼저 `Queue`를 프로토콜로 생성하여 사용할 경우 객체가 여러 프로토콜을 채택할 수 있기 때문에 `다형성`을 확보할 수 있다는 장점생긴다고 생각했습니다.
- 또한 `Queue`를 `SOLID`원칙에 맞추어 수정할 수 있지 않을까 하는 고민을 하였습니다. `SOLID`원칙 중 `DIP`원칙에 따르면 '구체적인 객체가 아닌 추상적인 객체에 의존해야한다'는 것과 달리 현재 저희 코드는 구체적인 객체인 `Queue`를 `Bank`가 의존하고 있다고 생각했습니다.

### 🧯 해결방법
- 기존 생성한 `Queue`는 제네릭 타입을 사용하고 있었기에, `Opaque and Boxed Types`을 활용하여 `Queue`의 추상화하는 방식을 채택하였습니다. 이렇게 추상화한 `Queueable`은 `associatedtype`으로 선언된 `generic`타입이 있기 때문에, 이를 채택하여 사용하는 곳에서 `where`절로 타입을 제한을 주거나 `Opaque and Boxed Types`으로 해결을 해야한다 생각했기때문입니다.
- 하여 `Queueable`을 `Extension`으로 기본 구현을 한 상태에서, 중간 객체인 `CustomerQueue`를 생성하였습니다. 이 `CustomerQueue`가 `CustomerQueueable`를 채택하여 `BankManager`를 위한 `CustomQueue`를 만들었습니다.
- `Bank`에서 호출 시 `CustomerQueue`를 `any`로 타입을 감싸서 사용하였습니다.
    <br>
    > 예시코드
    ```swift
    // Queueable 생성 코드
    protocol Queueable {
        associatedtype Element

        var linkedList: LinkedList<Element> { get }
        var peek: Element? { get }
        var isEmpty: Bool { get }

        func enqueue(_ value: Element)
        func dequeue() -> Element?
        func clear()
    }

    extension Queueable {
        var peek: Element? {
            let node = linkedList.head
            return node?.value
        }

        var isEmpty: Bool {
            return linkedList.head == nil
        }

        func enqueue(_ value: Element) {
            let node = Node(value: value)

            linkedList.append(node)
        }

        func dequeue() -> Element? {
            return linkedList.removeFirst()?.value
        }

        func clear() {
            linkedList.clear()
        }
    }
    ```
    ```swift
    // CustomerQueueable 생성 코드
    public protocol CustomerQueueable: Queueable where Element == Customer { }

    // CustomerQueue 생성 코드
    public struct CustomerQueue: CustomerQueueable {
        public let linkedList: LinkedList<Customer> = LinkedList()

        public init() {}
    }
    ```
    ```swift
    // CustomerQueueable 호출 부
    struct Bank {
        ...
        private var waitingLine: any CustomerQueueable = CustomerQueue()
        ...
        }
    ```

<br>


<a id="7."></a> 
## 7. 💭 팀 회고

<details>
<summary>팀 회고</summary>

- 추후 업데이트 예정
    
</details>

<br>

<a id="8."></a>
## 8. 🔗 참고 링크
- [🍎 Apple Developer: DispatchSemaphore](https://developer.apple.com/documentation/dispatch/dispatchsemaphore)
- [🍎 Apple Developer: Concurrency Programming Guide](https://developer.apple.com/library/archive/documentation/General/Conceptual/ConcurrencyProgrammingGuide/Introduction/Introduction.html)
- [🍎 Apple Developer: Opaque and Boxed Types](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/opaquetypes/)
- [🐻 야곰닷넷: 동시성 프로그래밍](https://yagom.net/courses/동시성-프로그래밍-concurrency-programming/)
- [🐻 야곰Blog: Swift–프로토콜 지향 프로그래밍](https://blog.yagom.net/531/)
