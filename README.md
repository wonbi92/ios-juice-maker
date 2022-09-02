
# 🍹 쥬스 메이커

## 📖 목차
1. [소개](#🌱-소개)
2. [고민한 점](#👀-고민한-점)
3. [타임라인](#⏰-타임라인)
4. [트러블 슈팅](#🚀-트러블-슈팅)
6. [참고 링크](#🔗-참고-링크)

## 🌱 소개

`Wonbi`과 `woong` 팀이 만든 쥬스 메이커입니다.
 
## 👀 고민한 점

- 객체지향적인 기능분리
- 접근제어의 활용
- 싱글톤 패턴 사용
- 이니셜라이저 활용


## ⏰ 타임라인

### Step 1

- **220829**
    - Fruit의 타입 enum 설정 ➡️ `strawberry` `banana` `pineapple` `kiwi` `mango`

    - 과일의 수량을 확인하여 `.success` 와  `.failure`를 반환하는 `checkstock` 함수 구현
    - enum에 `CaseIterable` 프로토콜을 채택하여 초기값을 설정
    - 과일의 수량을 설정값에 따라 바꿔주는 `changeAmount` 함수 구현
    - `stockManager`를 `FruitStore`의 타입인스턴스로 선언하고, init() 함수 접근제어자에 접근제어를 private으로 지정하여 init 함수로 인스턴스를 생성하는 것을 차단해줌.(싱글톤 구현)

- **220830**
    - Juice 타입의 enum 설정 ➡️ `strawberryJuice` `bananaJuice` `kiwiJuice` `pineappleJuice` `kiwiJuice` `mangoJuice` `strawberryBananaJuice` `mangokiwiJuice`
    - FruitStore에서 과일을 넘겨주는 `handOver` 함수를 구현하고, JuiceMaker에 과일을 가져오는 `takeFruit` 함수 구현
    - `JuiceMaker`라는 구조체 하위에 열거형 `Juice`를 갖도록 함. (중첩타입)
    - `stockManager.stock` 의 과일로 쥬스를 만들어주는 `makeJuice` 함수 구현
    -  열거형의 프로퍼티에 쥬스별 과일 소모량을 알려주는 dictionary 타입의 `recipe`  연산 프로퍼티를 선언
    -  에러타입 `outOfStock` `invalidFruit` 정의
    -  JuiceMaker에서 dictionary 타입의 `stock`을 선언하여 기본값을 설정

- **220831**
    - 레시피가 요구하는 과일이 2개 이상일 때 일부 과일이 재고애서 제거되는 버그 수정
    - 재고 안의 과일 수를 바꾸는 `changeStock`메서드 구현
    - 메서드명 및 매개변수, 프로퍼티 명 리팩토링
    - `Fruits`타입 재정의. ➡️ 중첩 타입 `FruitName` 열거형 추가, 이름과 갯수를 나타내는 프로퍼티 추가, 이니셜라이저 생성
    - `extension`을 통한 `fruitsList` 구현
    - `FruitStore`의 재고를 확인하는 함수 수정 ➡️ 에러타입이 아닌 불리언 타입을 반환하도록 수정
    - 재고의 타입 변경(딕셔너리 -> 배열)으로 인한 재고 관리 메서드 수정
    - 과일의 제공이 가능한지를 알려주는 메서드 리팩토링
    - 


- **220901**
    - makeJuice 메서드 로직을 수정
    - 쥬스 완성 시 재고에 여러 과일의 인스턴스가 추가되는 문제 해결
    - 초기 재고를 `CaseIterable` 을 사용하지않고 설정하는 메서드 구현
    - 에러타입 `stockError` 삭제 ,`addStock`과 `removeStock` 메서드를 합침
    - 싱글톤 패턴 제거

- **220902**
    - 재고를 추가하거나 제거하는 메서드내에 삼항 연산자를 이용해 리팩토링.

## 🚀 트러블 슈팅

### `JuiceMaker`와 `FruitStore`의 기능 분리
- 처음 설계를 할 때 부터, `JuiceMaker`가 `FruitStore`가 처리하는 로직에 관여할 필요가 업고, 반대로 `FruitStore`도 `JuiceMaker`가 처리하는 로직에 관여할 필요가 없이, 서로 과일을 요청하고, 전달 해주는 방식으로만 구현해보고 싶었다.

- 이렇게 하게되면 각 타입별로 은닉화가 가능해지고, 각자가 모듈로써 기능이 분리되어 좀 더 편한 유지보수와 수정이 가능할 것이라고 생각했다. 그리고 이 방법이 좀 더 객체지향적이라고 생각했다.

- `FruitStore`가 받은 요청에서 재고가 부족하거나, 취급하지 않는 과일을 요구할 경우, 이 에러에 대한 처리를 `JuiceMaker`가 하는것 보다 `FruitStore`가 하는게 맞다고 생각하였다. 그래서 `FruitStore`에서 요청받은 과일의 갯수와 취급 여부를 판단하는 메서드인 `checkStock(fruit:number:)`메서드를 구현하였고, 이 에러를 처리한 후 과일을 건네주는 `handOver(of:number:)`메서드를 구현하게 되었다. 만약 요청받은 과일의 재고가 부족하거나, 취급하지 않는 과일일 경우 에러 메세지를 출력한 후 `0`을 리턴하도록 하여, 과일의 재고 변경을 하지 않게 구현하였다.

- 하지만 이 방식은 메서드의 네이밍적인 부분이나, 로직으로나 너무 돌아가는 방법이었다. 에러처리 부분 역시 `enum`타입으로 이미 과일을 제한하였는데, 굳이 에러를 나눠줄 필요가 없었고, 딕셔너리 역시 과일의 타입을 새로 구현하면 해결이 가능했다. 이 모든 부분들을 적용해보니 에러처리는 `Bool`타입만으로 충분히 가능해졌고, 요청하는 과일의 종류가 여러가지일 경우에도 요청을 처리할 때 배열을 받게하여 한번에 처리하도록 진행하므로써 해결하였다.

### 싱글톤 패턴의 사용
- 프로젝트를 진행하면서, `FruitStore`의 처리를 어떻게 해야될지에 대한 고민이 있었다. 우리가 생각했던 방식은 싱글톤 패턴을 사용하는 방식과, `JuiceMaker`타입 안에 `private`접두사를 붙여 인스턴스화 시키는 방식이었다.

- 처음에는 싱글톤 패턴을 사용하는 것을 고려하였다. 앱의 구현에 있어서 뷰 컨트롤러가 두개 이상이고, 각 뷰컨트롤러가 하나의 재고만을 참조해야 하기 때문이었다. 그 결과 싱글톤 패턴을 이용하여 `FruitStore`를 구현하게 되었다.

- 하지만 피드백을 받은 후 싱글톤의 치명적인 단점들을 알게 되었고, 싱글톤을 사용해야만 했던 이유가 노티피케이션 센터와 같은 옵저빙을 통해 해결 가능해질 것이라 판단이 들어서 싱글톤에서 다시 `JuiceMaker`안에 `FruitStore`를 `private`접근 레벨로 인스턴스화 시키게 되었다. 

### 재고관리 메서드 구현
- 처음 재고의 타입을 딕셔너리로 구성하게 되면서, `updateValue`메서드를 통해 재고안의 과일 수를 관리하고자 했다. 코드의 가독성을 올리고 싶어 change, add, remove 각각의 메서드를 구현하였는데, 나중에보니 오히려 코드를 중복적으로 사용하는 듯한 느낌이 많이 들었다.

- 이후 재고의 타입을 배열로 바꾸면서 배열의 아이템이 과일 타입을 받도록 재구현하였다. 과일타입 안에는 과일 이름과 수를 가지는 구조체 타입이라 딕셔너리를 사용하지 않고도 과일의 종류와 갯수를 전달할 수 있었다. 하지만 과일의 재고를 변경하는 함수 내부 로직을 과일 타입을 새로 인스턴스화 해서 그 새로운 인스턴스를 넣어주는 방식으로 구현하는 바람에, 재고를 변경할 때마다 그 과일을 다 꺼내고 새거를 다시 넣는 듯한 느낌으로 구현되고 말았다.

- 그 점을 리뷰어를 통해 피드백을 받은 후, 재고 안 인스턴스의 프로퍼티에 접근 해 그 값을 바꿔주는 방식으로 다시 구현하였다. 그리고 코드의 중복작성을 막기 위해 add와 remove를 하나로 합치고, 그 안에 삼항 연산자를 활용해 값을 더하는것인지 빼는것인지 구분하여 사용할 수 있도록 구현해보았다.

### rawValue의 사용
- `enum`타입의 `rawValue`사용은 매우 유용했다. 하지만 이 매직리터럴을 바로 사용하는 것은 코드의 가독성을 떨어뜨린다 생각하였다.

- 그래서 이 원시값 사용을 지양하게 되었는데, 이를 활용하면서도 더욱 깔끔하게 코드를 구성할 수 있다는 사실을 피드백을 통해 배웠다.

```swift
    enum Juice: String {
        case strawberryJuice = "딸기 주스"
        case bananaJuice = "바나나 주스"
        case kiwiJuice = "키위 주스"
        case pineappleJuice = "파인애플 주스"
        case mangoJuice = "망고 주스"
        case strawberryBananaJuice = "딸바 주스"
        case mangoKiwiJuice = "망키 주스"

        fileprivate var name: String {
            self.rawValue
        }
    }
```

- 🤩 너무.. 아름답다..✨✨

## 🔗 참고 링크

[Swift API Design Guidelines - Naming](https://swift.org/documentation/api-design-guidelines/)  
[Swift Language Guide - Initialization](https://docs.swift.org/swift-book/LanguageGuide/Initialization.html)  
[Swift Language Guide - Access Control](https://docs.swift.org/swift-book/LanguageGuide/AccessControl.html)  
[Swift Language Guide - Nested Types](https://docs.swift.org/swift-book/LanguageGuide/NestedTypes.html)  
[Swift Language Guide - Type Casting](https://docs.swift.org/swift-book/LanguageGuide/TypeCasting.html)  
[Swift Language Guide - Error Handling](https://docs.swift.org/swift-book/LanguageGuide/ErrorHandling.html)  
 
---

[🔝 맨 위로 이동하기](#🍹-쥬스-메이커)



