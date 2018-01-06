# Feedback na druhý domácí úkol

| Username | Body | Poznámky                                                     |
| -------- | ---- | ------------------------------------------------------------ |
| babusand | 20   |                                                              |
| jendrjan | 20   |                                                              |
| mattapet | 20   |                                                              |
| paunkvoj | 20   |                                                              |
| pudisond | 15   | (-5) Projekt nešel zbuildit                                  |
| tranaduc | 20   |                                                              |
| zdvomjir | 20   |                                                              |

## Připomínky ke kódu

### Maličkosti

- funkce / metoda, která nic nevrací, nemusí mít v definici `-> Void`, stačí pouze napsat `func foo()` místo `func foo() -> Void`
- snažíme se vyhnout jakýmkoliv vykříčnikům
```swift
let name: String? = nil

// Preffered
if let username = user {
    // ...
}

// Or
guard let usermane = user else { return }

// Not preffered
if name == nil { return }
let username = name!
```
- nepoužíváme `self` tam, kde je to z kontextu jasné
- v `init`u nepoužíváme předložky, aby se celá metoda četla jako anglická věta, je potřebné vědět čím initializuji danou třídu

```swift
// Preffered
init(checkin: Checkin) {
    // ...
}

// Not preffered
init(`for` checkin: Checkin) {
    // ...
}
```

- není potřeba všechny `Optional` typy rozbalovat, `view?.removeFromSuperview()` je validní zápis, který se provede, pokud `view` není `nil`
- kopírování kódu je špatné, vždy to lze vyřešit funkcí / metodou, která přebírá nějaké parametry

### Práce s formattery

`DateFormatter` patří mezi drahé instance (stejně jako `NumberFormatter`), vždycky je potřeba si ji jednou vytvořit a předávat si instanci tam, kde je to potřeba. Vytvářet instanci `DateFormatter`u v cyklu tedy není správný přístup. V ideálním přístupu si vytvoříme objekt, který bude mít daný `DateFormatter` jako statickou proměnnou a dále pracujeme s tímto obalovacím objektem.

```swift
enum Formatters {

    static let myDateFormatter: DateFormatter = {
        let formatter = DateFormatter()

        // Nastavím formatter podle potřeby

        return formatter
    }()

}
```

> Použití `enum`u jako obalovacího objektu je nejlepší řešení z hlediska výkonu, protože `enum`, který v sobě nemá žádné `case`s, nejde instancovat a tím máme tedy zajištěno, že `myDateFormatter` bude v celé aplikaci použit pouze jeden.

Když nastavujeme `DateFormatter`, je potřeba myslet na to, že mojí aplikaci může používat kdokoli na světě a různě po světě jsou různé konvence pro zobrazení času. Místo hardcodovaného `dateFormat`u je lepší použít metodu `formatter.setLocalizedDateFormatFromTemplate(_ template: String)`, které předám formatovací patterny pouze čisté bez oddělovačů a systém sám nastaví požadovaný formát podle nastavení v telefonu.

### `is` operátor

Zápis `if foo is Bar` je ekvivalentní s `if let _ = foo as? Bar`. Použití operátor `is` je nevýhodné, protože nám dá pouze informaci o tom, zda danou proměnnou `foo` je možné přetypovat na typ `Bar` bez toho, aniž by přetypování proběhlo.

Následující použití operátoru `is`

```swift
if !(annotation is MKPointAnnotation) {
    return nil
}

let checkinAnnotation = annotation as! MyAnnotation
```

je velice špatné. Celé toto řešení lze vyřešit pomocí podmínky

```swift
if let checkAnnotation = annotation as? MyAnnotation {
    // ...
}

return nil
```

nebo ještě lépe, pokud mám pouze jednu podtřídu

```swift
guard let checkAnnotation = annotation as? MyAnnotation else { return nil }
```

### Síla `enum`u

#### Pojmenovávání

Jednotlivé casy pojménovávme vždy malým počátečním písmenem

```swift
// Preffered
enum Gender {
    case male
    case female
}

// Not preffered
enum Gender {
    case Male
    case Female
}
```

#### Použití `rawValue`

Pokud `enum`u přiřadím `rawValue` pomocí dědičnosti, např. `enum MyEnum: String`, musí potom jednotlivé `case`s mít k sobě přiřazenou hodnotu, které je neměnná a je stejného typu jako nadtřída. Pokud použijeme základní třídy jako je `String` nebo `Int`, kompilátor dokáže sám implicitně doplnit tyto hodnoty za nás. Hodnoty jsou potom stejné jako kdybychom si vypsali daný `case` jako řetězec.

Následující dva zápisy jsou ekvivalentní

```swift
enum Gender: String {
    case male = "male"
    case female = "female"
    case other = "other"
}

enum Gender: String {
    case male
    case female
    case other
}
```

#### Přidávání funkcionality `enum`u

`Enum` stejně jako `class`y a `struct`y lze funkčně rozširovat. Použití je například následující

```swift
extension Gender {

    var image: UIImage {
        switch self {
        case .male: return UIImage(named: "obrazek-muz")
        case .female: return UIImage(named: "obrazek-zen")
        case .other: return UIImage(named: "obrazek-neznamy")
        }
    }

}
```

Pokud máme potom v kódu nastavenou instanci `Gender` a chci na základě ní nastavit obrázek, lze to udělat následujícím způsobem

```swift
let selectedGender: Gender = .other
let image = selectedGender.image
```

### Statický formulář pomocí `UITableView`

**Nikdy si nedržím samotné buňky!**

Vytvořím si nějakou datovou strukturu, která drží potřebná data a ta nastavujeme v příslušných metodách. Řešení může vypadat například následovně

```swift
enum Field {
    case username
    case gender
    case rememberDetails
}

enum Section {
    case userDetails
    case remember

    var fields: [Field] {
        switch self {
        case .userDetails: return [.username, .gender]
        case .remember: return [.rememberDetails]
        }
    }

    var title: String? {
        switch self {
        case .userDetails: return "User details"
        case .remember: return "Remember"
        }
    }
}

class Controller: UITableViewController {

    private let sections: [Section] = [.userDetails, remember]

    override func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].fields.count
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section].title
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = sections[indexPath.section]
        let field = section.fields[indexPath.row]

        switch (section, field) {
        case (.userDetails, .username): // ...
        case (.userDetails, .gender): // ...
        case (.remember, _): // ...
        }
    }
}
```

### Přemýšlejte!

```swift
struct User {
    var username: String?

    init(dictionary: [String: Any]) {
        if let username = dictionary["username"] as? String {
            self.username = username
        }
    }
}
```

`struct` je `ValueType`, pracuje se s ní tedy jako s hodnotou a ne jako s referencí u `class`. Při programování ve Swiftu se snažíme co nejvíce používat `let` namísto `var` proměnných, abychom měli co nejméně věcí, které se dají za běhu programu měnit.

Tedy abych mohl změnit `username` definované výše jako `var`, musí být i celá instance `var`.

Když mám `username: String?`, čili `username` je optional, je zbytečné `if let`ovat hodnotu v dictionary. Úplně stejně by to dopadlo, kdybychom rovnou do `username` přiřadili hodnotu z dictionary, tedy

```swift
init(dictionary: [String: Any]) {
    self.username = dictionary["username"] as? String
}
```

Stejná věc je při použití `nil-coalescing` opearátoru (`??`), pomocí kterého můžete nastavit defaultní hodnotu v případě, že hodnota nalevo od operátoru je `nil`.

```swift
let username: String? = "username"
let name = username ?? nil
```

Kód výše tedy zjistí, zda-li `username` je `nil` a do proměnné `name` přiřadí buď hodnotu z `username` nebo `nil`. Datový typ `name` je tedy `String?`, takže jsme si vůbec nepomohli.