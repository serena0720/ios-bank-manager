# 💲 은행창구 매니저 💸

> 프로젝트 기간 :  2023.07.10 ~ 2023.07.21


## 📖 목차

1. [소개](#1.)
2. [팀원](#2.)
3. [타임라인](#3.)
4. [다이어그램](#4.)
5. [실행 화면](#5.)
6. [트러블 슈팅](#6.)
7. [팀 회고](#7.)
8. [참고 링크](#8.)

<br>

<a id="1."></a>

## 1. 📢 소개

*Dear. `Customer`*

`Bank`에 업무를 보러 오셨나요? *CommandLine*에 원하시는 메뉴를 선택해주세요! <br>
저희 `BankManager`에게 대기번호를 받으시고 대기해주세요. <br>
`BankClerk`이 업무 처리를 도와드릴 겁니다!
    
    - 주요 개념: Queue, LinkedList, UnitTest, Command Line, GCD, Concurrency 

<br>

<a id="2."></a>

## 2. 👤 팀원

| [Serena 🐷](https://github.com/serena0720) | [Erick 🦦](https://github.com/h-suo) |
| :--------: | :--------: | 
| <Img src = "https://i.imgur.com/q0XdY1F.jpg" width="350"/>| <Img src = "https://user-images.githubusercontent.com/109963294/235300758-fe15d3c5-e312-41dd-a9dd-d61e0ab354cf.png" width="350"/>|

<br>

<a id="3."></a>
## 3. ⏱️ 타임라인

|날짜|내용|
|:---:|---|
| **2023.07.10** |▫️ `Linked List` 구현 <br> ▫️ `Linked List`를 이용한 `Queue` 구현 |
| **2023.07.11** |▫️ 코드 개선을 위한 리펙토링 |
| **2023.07.12** |▫️ 고객의 역할을 하는 `Customer` <br> ▫️ 은행원의 역할을 하는 `BankClerk` 구현 <br> ▫️ 은행의 업무를 하기 위한 `Bank` 구현 <br> ▫️ `Bank`를 관리하는 `BankManager` 구현 <br>|
| **2023.07.13** |▫️ 코드 개선을 위한 리펙토링 |
| **2023.07.14** |▫️ 업무의 종류를 나누기 위해 `WorkType` 구현 <br> ▫️ 은행원의 인원에 따라 비동기적으로 업무를 처리하는 로직 구현 <br> ▫️은행원의 `WorkType`에 따라 업무를 나눠 주는 로직 구현 <br> ▫️ README 작성 |

<br>

<a id="4."></a>
## 4. 📊 다이어그램 및 파일트리
<!-- <Img src = "" width="700"/> -->
- 추후 업로드 예정

<br>

<a id="5."></a>
## 5. 📲 실행 화면

| 은행 개점 선택 시 | 은행 업무 종료 시 |
| :--------------: | :-------: | 
| <Img src = "https://hackmd.io/_uploads/rylC-vAt3.gif" width="350"/> | <Img src = "https://hackmd.io/_uploads/r1DTZDAKh.gif" width="350"/>  |


<br>

<a id="6."></a>
## 6. 🛎️ 트러블 슈팅

##  파일 및 역할 분리
### 🔥 문제점
- 앱이 수행하는 역할이 많아 하나의 파일과 객체로만 앱을 실행하는 것은 객체지향 관점과는 멀다고 생각하였습니다.
- 실제 세상에 있는 은행을 어떤 식으로 `BankManager`라는 앱으로 구현할지 고민이 많았습니다.

### 🧯 해결방법
- 실제 은행을 생각하며 은행 `Bank`, 은행원 `BankClerk`, 고객 `Customer`, 그리고 이를 모두 총괄하는 은행매니저 `BankManager`로 나누어 구현하였습니다.
- `Customer`은 자신의 대기 번호와 업무 시간을 가지고 있고, `BankClerk`은 이를 이용하여 은행 업무 시작, 완료를 하도록 했습니다.
- `Bank`은 은행원과 고객의 숫자 그리고 대기줄을 가지고 있으며 고객을 줄 세우고, 은행원을 이용한 전체 은행 서비스를 수행하도록 했습니다.
- 마지막으로 `BankManager`는 `Bank`를 가지고 있고 관리하는 프로그램 영역의 객체라고 생각하여 메뉴의 출력, 선택과 `Bank`를 초기화하는 로직을 담당하도록 했습니다.

<br>

## Queue와 LinkedList 파일 구분과 네이밍
### 🔥 문제점
- `queue`와 `linkedList`는 별도의 자료구조라 생각했습니다. 그래서 `linkedList`를 별도의 class로 구분하여 `queue`와 `node`사이에서 구분되도록 분리하였습니다.
- 이때 `linkeList`와 `node`는 다른 `queue`에도 확장이 가능하지기 때문에, 네이밍부분에서 고민이 생겼습니다. 현재는 하나의 `queue`만 존재하기 때문에 `queue`의 이름을 따 `WaitingLineLinkedList`, `WaitingLineNode`라고 네이밍을 했습니다.
### 🧯 해결방법
- `WaitingLineQueue`가 실제로 수행하고 있는 역할인 `Queue`로 네이밍을 하는 것이 타입의 확장성을 고려하였을 때 적절하다는 코멘트를 받아 `Queue`로 수정하였습니다.

<br>

## Generic Type Naming
### 🔥 문제점
- `Queue`와 `LinkedList`를 생성할 때 제네릭 타입의 이름을 어떻게 지을지 고민했습니다.
- 아래 내용과 같이 `Queue`와 `Linked List`는 자료구조이기 때문에 개별 데이터를 `Element`라고 불러도 어색하지 않다고 생각했지만 `Element`라고 네이밍하는 것이 맞는지 확신이 없었기 때문에 `T`라고 네이밍하였습니다.

### 🧯 해결방법
- Swift API Design Guidelines 의 Naming 항목에서도 메서드와 매개변수 네이밍 시 의미있는 이름을 담도록 작성하는 것을 권장하고 있습니다. 이에 따라 실제로 Swift의 Array 구현도 Generic Type이 배열 내부 요소라는 의미를 담을 수 있도록 네이밍 되어있는 예시를 참고할 수 있습니다 
- 이러한 부분을 참고하여 Generic Type 의 이름이 좀 더 유용한 정보를 담도록 `T`에서 `Element`로 수정했습니다. 

     > T는 제네릭 타입을 선언할 때 일반적으로 사용되는 관례적인 이름이고, Element는 컬렉션 또는 자료구조에서 개별 요소를 나타내는 데에 사용되는 관례적인 이름입니다.
    
    [참고링크 : Apple Github - Array](https://github.com/apple/swift/blob/main/stdlib/public/core/Array.swift#L301)
<br>

## private(set)
### 🔥 문제점
- `LinkedList`에서 `head`는 `Queue`의 `peak` 기능이나 `isEmpty` 기능에서 쓰일 수 있다고 생각했습니다. 이에 `head`를 public하게 설정하자니, 외부에서 수정이 가능하다는 문제점이 생겨 고민하였습니다.

### 🧯 해결방법
- `private(set)`을 활용하여 외부에서의 수정은 막되, `head`의 정보를 외부에서 접근가능하도록 설정하였습니다.
    > 예시 코드
    ```swift
    final class LinkedList<Element> {
        private(set) var head: Node<Element>?
        ...
    }
    ```
<br>

## DispatchQueue, Thread.Sleep
### 🔥 문제점
- 앱에서 `BankClerk`이 `Customer`의 업무를 처리하는 데 걸리는 시간을 딜레이를 시켜야했습니다. 
- `DispatchQueue.global()`과 `DispatchGroup`의 `.wait()`을 사용하면 업무의 시작 `startTask`와 업무 종료 `endTask`을 서로 다른 스레드에서 비동기적으로 처리하는 것이 아닌 동기적으로 처리할 수 있었습니다.
- 하지만 이것이 `CGD`를 제대로 이용하는 방법이 맞을까? 작업을 비동기적으로 동시에 처리하지 않는데 `DispatchQueue`를 써야할 이유가 있을까? 라는 고민을 하였습니다. 
    > 예시코드
    ```swift
    let group = DispatchGroup()

    group.enter()
    DispatchQueue.global().async {
        startTask()
        group.leave()
    }

    group.enter()
    DispatchQueue.global().asyncAfter(deadline: .now() + 0.7) {
        endTask()
        group.leave()
    }

    group.wait()
    ```

### 🧯 해결방법
- `DispatchQueue`를 활용하는 것은 추후 여러 작업을 비동기 적으로 처리할 때 사용하는 것이 맞다고 생각하여 `Thread.sleep`을 활용하여 하나의 `main`스레드에서 업무 처리가 될 수 있도록 코드를 구현했습니다.
    > 예시코드
    ```swift
    startTask()
    Thread.sleep(forTimeInterval: 0.7)
    endTask()
    ```

<br>

## 실행 시간 출력
### 🔥 문제점
- 은행이 개점을 하고 업무가 마감되었을 때 업무 시간을 출력해줘야 했습니다.
- 단순히 `고객의 수 * 업무 시간`으로 실행 시간을 출력해주기에는 `Thread.sleep`의 오차 등에 의해 실제 실행 시간과의 오차가 있을 수 있다고 생각했습니다.

### 🧯 해결방법
- 추정시간이 아닌 실제 실행 시간을 측정하기 위해 `Date().timeIntervalSince`를 사용했습니다.
    > 예시코드
    ```swift
    let startTime = Date()
    // 업무 실행
    let totalTaskTime = Date().timeIntervalSince(startTime)
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
- [🍎 Apple Developer: Generic](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/generics/)
- [🍎 Apple Developer: sleep(forTimeInterval:)](https://developer.apple.com/documentation/foundation/thread/1413673-sleep)
- [🍎 Apple Developer: CFAbsoluteTimeGetCurrent()](https://developer.apple.com/documentation/corefoundation/1543542-cfabsolutetimegetcurrent)
- [🍎 Apple Developer: init(format)](https://developer.apple.com/documentation/swift/string/init(format:_:) )
- [🍎 Apple Developer: Date](https://developer.apple.com/documentation/foundation/date)
- [📒 Blog: Swift Command Line Tool 프로젝트에서 Unit Test 하기](https://jwonylee.tistory.com/entry/XCode-Swift-Command-Line-Tool-프로젝트에서-유닛-테스트-하기)
- [📒 Blog: Swift 코드 실행 시간 측정 방법](https://hongssup.tistory.com/571)
