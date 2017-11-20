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

## 5. Networking
branch: `05-netowrking` 🙄

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
