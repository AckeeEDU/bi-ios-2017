# bi-ios-2017

## 1. Views
branch: `01-views`
- gitignore.io - užitečný nástroj pro generování .gitignore souborů
- App -> UIWindow -> rootViewController -> view -> subviews
- Views v Interface builderu (IB) - custom subclass, propojení do kódu (outlets, actions)
- Views v kódu - CGRect, `addSubview()`, `removeFromSuperView()`
- Frame vs. bounds
- Pixels vs. points (https://www.paintcodeapp.com/news/ultimate-guide-to-iphone-resolutions)

## 2. Autolayout
branch: `02-autolayout`
- CocoaPods.org pro third party knihovny
- Constraints v IB
- Constraints v kódu pomocí `NSLayoutConstraint`
- Constraints v kódu pomocí knihovny **SnapKit**
- `snp.makeConstraints`, `snp.updateConstraints`, `snp.remakeConstraints`
- `intrinsicContentSize` a `contentHugging`/`contentCompressionResistance`
- Úprava constraints v runtime (install, uninstall)
- jednoduché animování autolayoutu
- `UIStackView`

## 3. ViewControllers
branch: `03-viewcontrollers`
- Size classes
  - `regular` vs `compact`
  - `traitCollectionDidChange()`
- UIViewController lifecycle
  - init
  - loadView
  - viewDidLoad
  - willAppear/Disappear, didAppear/Disappear
  - dealloc
- UINavigationController
  - Kontejner zajišťující "stack" navigaci mezi viewControllery 
  - Princip stacku - push/pop
  - `UINavigationBar`, `UINavigationItem`, `UIBarButtonItem`
- UITabBarController
  - Kontejner pro přepínání viewControllerů na stejné úrovni
  - `UITabBar`, `UITabBarItem`

## 4. ScrollViews
branch: `04-scrollviews`
- Framework UIKit 
- Kontejnery s `UITableView`, `UICollectionView` a `UIScrollView`
- Buňky `UItableViewCell`
- Přechod pomocí `UINAvigationController`

## 5. Networking
branch: `05-netowrking` 
- Stahování dat pomocí `Alamofire`
- Mapování dat pomocí `Codeable` a `Decodeable`
- Zobrazování těchto dat v tabulce 
- postování dat na api
- Práce s DataService

## 6. Mapy a GPS
branch: `06-map`
- frameworky MapKit a CoreLocation
- `MKMapView`
- `CLLocationManager`
  - získání povolení od uživatele (`NSLocationWhenInUseUsageDescription` v Info.plist)
  - start/stop získávání pozice
  - `CLLocationManagerDelegate`
- protokol `MKAnnotation`
- správa pinů na mapě, custom piny
- callouts
- geocoding/reverse geocoding - překlad GPS lokace na adresu a zpět

## 7. CoreData
branch: `07-coredata`
- CoreData stack
  - `NSManagedObjectModel` - schéma DB
  - `NSPersistentStore` - to, kam se to reálně fyzicky persistuje (SQLite, XML, Binary, InMemory)
  - `NSPersistentStoreCoordinator` - spojuje store a model, zná model a ví jak podle něj číst/zapisovat do storu
  - `NSManagedObjectContext` - pískoviště na kterém pracujeme a provedené změny následně ukládáme
- Vytvoření modelu (DB schématu)
- Model classes
  - Xcode auto generated (políčko codegen při editaci modelu)
  - *XCode* -> *Editor* -> *Create NSManagedObject subclass*
  - mogenerator (https://github.com/rentzsch/mogenerator)
- Inicializace stacku
  - Xcode generated (checkbox *Use CoreData* při vytváření projektu)
  - Kompletně custom init modelu, storu, coordinatoru atd.
  - MagicalRecord init
- MagicalRecord
  - přednastavené kontexty - rootSaving (nesahat), default (pro selectování, observing)
  - používání local kontextů pro změny
    - `MagicalRecord.save { localContext in ... }`
    - `.mr_createEntity(in:)`, `.mr_deleteEntity(in:)`
  - fetch z DB
    - `mr_findAll()` + další varianty s více parametry
    - `NSPredicate`
