
# 🍹 캠퍼들의 목마름을 책임진다! 쥬스 메이커


## 📖 목차
1. [팀 소개](#-팀-소개)
2. [기능 소개](#-기능-소개)
3. [Diagram](#-Diagram)
4. [폴더 구조](#-폴더-구조)
5. [타임라인](#-타임라인)
6. [트러블 슈팅](#-트러블-슈팅)
7. [기술적 도전](#-기술적-도전)
8. [참고 링크](#-참고-링크)


## 🌱 팀 소개
 |[Wonbi](https://github.com/wonbi92)|[woong](https://github.com/iOS-Woong)|
 |:---:|:---:|
| <img width="180px" img style="border: 2px solid lightgray; border-radius: 90px;-moz-border-radius: 90px;-khtml-border-radius: 90px;-webkit-border-radius: 90px;" src="https://avatars.githubusercontent.com/u/88074999?v=4">| <img width="180px" img style="border: 2px solid lightgray; border-radius: 90px;-moz-border-radius: 90px;-khtml-border-radius: 90px;-webkit-border-radius: 90px;" src="https://avatars.githubusercontent.com/u/96489602?v=4">|

- `Wonbi`와 `woong` 팀이 만든 쥬스 메이커입니다.


## ⚒️ 기능 소개
 |**주스 주문화면**|**재고 수정 화면**|
 |:---:|:---:|
 |![](https://i.imgur.com/pEexHat.png)|![](https://i.imgur.com/Kn9saKC.png)|
 |**주문 성공(alert)**|**주문 실패(alert)**|
 |![](https://i.imgur.com/YQFHlMg.gif)|![](https://i.imgur.com/KQxT7zK.gif)|
 |**재고수정 이동(alert을 통한 이동)**|**재고수정 이동(button을 통한 이동)**|
 |![](https://i.imgur.com/UedTJUE.gif)|![](https://i.imgur.com/exjbEaf.gif)
|
 |**재고수정 적용(적용버튼)**|**재고수정 취소(취소버튼)**|
 |![](https://i.imgur.com/CVodTQk.gif)|![](https://i.imgur.com/QfJUT8E.gif)|
 
 
## 👀 Diagram

### 🧬 Class Diagram
![JuiceMaker ClassDiagram](https://i.imgur.com/DOguFss.jpg)

### 🧬 Sequence Diagram
![JuiceMaker SequenceDiagram](https://i.imgur.com/VUnKqaj.png)


## 🗂 폴더 구조
> Modal : 앱 구동 로직에 필요한 모델
> View : 화면을 구성하는 뷰
> Controller : 화면의 이벤트와 전환을 컨트롤하는 컨트롤러

*JuiceMaker*
├── Modal
│   ├── AlertMassage
│   ├── JuiceMaker
│   ├── FruitStore
│   └── Fruit
├── View
│   ├── Main
│   ├── Assets
│   └── LaunchScreen
└── Controller
    ├── AppDelegate
    ├── SceneDelegate
    ├── MainViewController
    └── EditViewController


## ⏰ 타임라인

### 👟 Step 1
- class 타입의`FruitStore` 구현
- struct 타입의 `JuiceMaker`구현
- enum 타입의 `Juice`구현
- enum 타입의 `Fruit`구현
- error를 채택한 enum 타입의 `StockError`구현

<details>
<summary>Details</summary>
<div markdown="1">

#### **220829**
- `Fruit`
    - 타입 케이스 구현
- `FruitStore`
    - 의 재고 체크 메서드 구현
    - 재고 개수 변경하는 메서드, 
    패턴 구현
- `StockError`
    - 에러 케이스 구현
    
#### **220830**
- `Juice`
    - 타입 케이스 구현
- `FruitStore`
    - `JuiceMaker`에게 과일을 전달하는 메서드 구현
    - 메서드 로직 변경 및 컨벤션 수정
- `JuiceMaker`
    - 주스 만드는 메서드 구현
    - 프로퍼티 기본값 설정
    - 컨벤션 수정
    
#### **220831**
- 메서드 및 파라미터명 리팩토링
- 버그 수정
- `Fruit`
    - 타입 재정의    
- `FruitStore` 
    - 재고 확인하는 메서드 로직 수정
    - 재고를 변경하는 메서드 로직 수정
    - 과일을 전달하는 메서드 로직 수정  
    
#### **220901**   
- 메서드 및 파라미터명 리팩토링  
- `Fruit`
    - 타입 재정의
- `FruitStore` 
    - 싱글톤 삭제
    - 재고를 변경하는 메서드 리팩토링
- `JuiceMaker`  
    - 쥬스를 만드는 메서드 로직 수정
- `StockError`
    - 삭제
    
#### **220902**   
- 메서드 및 파라미터명 리팩토링  
- `Recipe`
    - 타입 케이스 구현
- `FruitStore`
    - 이니셜라이저 로직 수정
    - 재고 관리하는 메서드 로직 수정
    
#### **220904** 
- `Recipe`
    - 삭제
- `Juice`
    - 재료와 필요갯수를 나타내는 프로퍼티 추가
</div>
</details>

### 👟 Step 2
- `MainViewController` 이벤트에 대응하는 로직 구현
- `EditViewController` 생성
- `EditView` 오토레이아웃 설정
- 모달 방식의 화면전환 구현

<details>
<summary>Details</summary>
<div markdown="1">
    
#### **220905** 
- 세그웨이 방식으로 화면 전환구현
- `MainViewController`
    - 버튼 이벤트에 대응하는 메서드 구현
    - 결과에 맞는 Alert 구현
    - 뷰의 레이블과 모델 내부의 재고값을 연결
- `EditViewController`
    - 생성
    - 오토레이아웃 설정
    - 취소 버튼 구현

#### **220906**
- 코드 네이밍 리팩토링
- 코드를 통한 화면전환 방식으로 리팩토링
- `MainViewController`
    - `NotificationCenter`를 통해 재고 변경시마다 화면 레이블에 동기화되도록 구현
    - 주문 버튼을 식별하는 로직 구현

#### **220907**
- `MainViewController`
    - KVO를 활용하여 재고를 나타내는 로직 구현

#### **220908**
- `MainViewController`
    - KVO를 통해 Alert을 띄우도록 리팩토링
    - 화면 전환 시 데이터 전달을 위한 `StockStorage`타입을 싱글톤 패턴으로 구현
    - 주문 버튼을 식별하고 주문이 성공했는지 확인하는 메서드 기능분리

#### **220912**
- 네이밍 리팩토링, 소스파일 정리
- `MainViewController`
    - KVO 제거 
    - 메서드를 통해 값을 전달하도록 리팩토링

</div>
</details>

### 👟 Step 3
- `EditViewController` 이벤트에 대응하는 로직 구현
- `AlertMessage`네임 스페이스 구현
- Alert 메서드 하나로 통합
- 객체 캡슐화

<details>
<summary>Details</summary>
<div markdown="1">

#### **220913**
- 오토레이아웃 적용
- `Response`
    - 네임 스페이스 enum타입 구현
- `EditViewController`
    - `Stepper`의 `value`를 설정하는 메서드 구현
    - `Stepper` 이벤트에 대응하는 로직 구현
- `FruitStore`
    - 재고 변경하는 메서드 로직 리팩토링

#### **220915**
- `AlertMessage`
    - 타입 명을 `Response`에서 `AlertMessage`로 교체
    - Alert에 관련된 모든 메시지 추가
- `EditViewController`
    - `Stepper` 이벤트에 대응하는 로직 리팩토링
    - Alert 메서드 하나로 통합

#### **220916**
- `EditViewController`
    - 내부 프로퍼티 `stock`을 `FruitStore` 내부로 캡슐화
        
</div>
</details>


## 🏃🏻 기술적 도전

[싱글톤](https://github.com/wonbi92/ios-juice-maker/wiki/%ED%8A%B8%EB%9F%AC%EB%B8%94-%EC%8A%88%ED%8C%85-&-%EA%B8%B0%EC%88%A0%EC%A0%81-%EB%8F%84%EC%A0%84#%EF%B8%8F-%EC%8B%B1%EA%B8%80%ED%86%A4-%ED%8C%A8%ED%84%B4)

[NotificationCenter](https://github.com/wonbi92/ios-juice-maker/wiki/%ED%8A%B8%EB%9F%AC%EB%B8%94-%EC%8A%88%ED%8C%85-&-%EA%B8%B0%EC%88%A0%EC%A0%81-%EB%8F%84%EC%A0%84#%EF%B8%8F-notificationcenter)

[KVO패턴](https://github.com/wonbi92/ios-juice-maker/wiki/%ED%8A%B8%EB%9F%AC%EB%B8%94-%EC%8A%88%ED%8C%85-&-%EA%B8%B0%EC%88%A0%EC%A0%81-%EB%8F%84%EC%A0%84#%EF%B8%8F-kvo-%ED%8C%A8%ED%84%B4)

[Delegate패턴](https://github.com/wonbi92/ios-juice-maker/wiki/%ED%8A%B8%EB%9F%AC%EB%B8%94-%EC%8A%88%ED%8C%85-&-%EA%B8%B0%EC%88%A0%EC%A0%81-%EB%8F%84%EC%A0%84#%EF%B8%8F-delegate-%ED%8C%A8%ED%84%B4)


## 🚀 트러블 슈팅

[화면 전환시 메서드를 통한 데이터 전달](https://github.com/wonbi92/ios-juice-maker/wiki/%ED%8A%B8%EB%9F%AC%EB%B8%94-%EC%8A%88%ED%8C%85-&-%EA%B8%B0%EC%88%A0%EC%A0%81-%EB%8F%84%EC%A0%84#-%ED%99%94%EB%A9%B4-%EC%A0%84%ED%99%98%EC%8B%9C-%EB%A9%94%EC%84%9C%EB%93%9C%EB%A5%BC-%ED%86%B5%ED%95%9C-%EB%8D%B0%EC%9D%B4%ED%84%B0-%EC%A0%84%EB%8B%AC)

[Alert 함수를 여러개로 분리하는 것이 아닌 하나의 함수로 통합 관리](https://github.com/wonbi92/ios-juice-maker/wiki/%ED%8A%B8%EB%9F%AC%EB%B8%94-%EC%8A%88%ED%8C%85-&-%EA%B8%B0%EC%88%A0%EC%A0%81-%EB%8F%84%EC%A0%84#-alert-%ED%95%A8%EC%88%98%EB%A5%BC-%EC%97%AC%EB%9F%AC%EA%B0%9C%EB%A1%9C-%EB%B6%84%EB%A6%AC%ED%95%98%EB%8A%94-%EA%B2%83%EC%9D%B4-%EC%95%84%EB%8B%8C-%ED%95%98%EB%82%98%EC%9D%98-%ED%95%A8%EC%88%98%EB%A1%9C-%ED%86%B5%ED%95%A9-%EA%B4%80%EB%A6%AC)

[FruitStore에 임시재고를 구현함으로써 캡슐화](https://github.com/wonbi92/ios-juice-maker/wiki/%ED%8A%B8%EB%9F%AC%EB%B8%94-%EC%8A%88%ED%8C%85-&-%EA%B8%B0%EC%88%A0%EC%A0%81-%EB%8F%84%EC%A0%84#-fruitstore%EC%97%90-%EC%9E%84%EC%8B%9C%EC%9E%AC%EA%B3%A0%EB%A5%BC-%EA%B5%AC%ED%98%84%ED%95%A8%EC%9C%BC%EB%A1%9C%EC%8D%A8-%EC%BA%A1%EC%8A%90%ED%99%94)

[rawValue의 사용](https://github.com/wonbi92/ios-juice-maker/wiki/%ED%8A%B8%EB%9F%AC%EB%B8%94-%EC%8A%88%ED%8C%85-&-%EA%B8%B0%EC%88%A0%EC%A0%81-%EB%8F%84%EC%A0%84#-rawvalue%EC%9D%98-%EC%82%AC%EC%9A%A9)


## 🔗 참고 링크

[Swift API Design Guidelines - Naming](https://swift.org/documentation/api-design-guidelines/)  
[Swift Language Guide - Initialization](https://docs.swift.org/swift-book/LanguageGuide/Initialization.html)  
[Swift Language Guide - Access Control](https://docs.swift.org/swift-book/LanguageGuide/AccessControl.html)  
[Swift Language Guide - Nested Types](https://docs.swift.org/swift-book/LanguageGuide/NestedTypes.html)  
[Swift Language Guide - Type Casting](https://docs.swift.org/swift-book/LanguageGuide/TypeCasting.html)  
[Swift Language Guide - Error Handling](https://docs.swift.org/swift-book/LanguageGuide/ErrorHandling.html)  
 
---

[🔝 맨 위로 이동하기](#-쥬스-메이커)
