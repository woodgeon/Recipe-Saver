# 📱 RecipeSaver
---
## 프로젝트 개요

RecipeSaver는 SwiftUI와 MVVM 아키텍처를 기반으로 구현된 iOS 애플리케이션으로,
사용자가 직접 자신만의 레시피를 등록하고 확인할 수 있도록 다음과 같은 기능을 제공합니다:

- **레시피 등록 / 수정 / 열람**
- **카테고리별 분류 (찌개, 샐러드, 간식 등)**
- **탭 기반 UI 구성**

---

## 프로젝트 구조
```swift
RecipeSaver/
├── Models/                 # 데이터 모델 정의 (Recipe, Category)
│   └── RecipeModel.swift
│
├── ViewModels/            # 비즈니스 로직 및 상태 관리
│   └── RecipeViewModel.swift
│
├── Views/
│   ├── Main/              # 홈, 카테고리, 즐겨찾기, 설정 등 메인 UI
│   ├── Components/        # RecipeCard, RecipeList 등 UI 구성요소
│   └── Details/           # 레시피 상세 보기 및 추가 입력 화면
│
├── Assets.xcassets/       # 이미지 및 컬러 리소스
└── RecipeSaverApp.swift   # 앱 진입점
```
---
## ✨ 주요 기능

### 🔹 레시피 관리 기능
- 레시피 제목, 이미지, 설명, 재료, 조리법, 카테고리, 날짜, URL 입력
- UUID 기반 고유 ID 자동 생성
- 로컬 변수 기반 저장 (`Recipe.all` → `@Published var recipes`)

### 🔹 MVVM 아키텍처 구성
- **View**: SwiftUI 기반 UI (`HomeView`, `RecipeView`, `AddRecipeView` 등)
- **ViewModel**: `RecipeViewModel`에서 상태 관리 및 레시피 추가 처리
- **Model**: `Recipe` 구조체 및 `Category` 열거형으로 데이터 모델 정의

### 🔹 UI 구성 요소
- `TabBar.swift`를 통한 하단 탭 네비게이션
- 재사용 가능한 `RecipeCard`, `RecipeList` 컴포넌트 활용
- `NavigationStack` 기반의 뷰 전환 구조
---
## 📌 핵심 코드 설명

### 1. 'Recipe' 모델
```swift
struct Recipe: Identifiable {
    let id = UUID()
    let name: String
    let image: String
    let description: String
    let ingredients: String
    let directions: String
    let category: Category.RawValue
    let datePublished: String
    let url: String
}
```
- Identifiable 프로토콜을 채택해 리스트에서 고유 식별자로 사용
- UUID()를 통해 레시피마다 고유한 ID 생성
- Category enum과 연결되는 문자열 기반 분류 사용
- 샘플 데이터는 static let all 배열에 정의됨
### 2. 'RecipeViewModel' 
```swift
class RecipeViewModel: ObservableObject {
    @Published private(set) var recipes: [Recipe] = []

    init() {
        recipes = Recipe.all
    }

    func addRecipe(recipe: Recipe) {
        recipes.append(recipe)
    }
}
```
- ObservableObject와 @Published를 활용해 뷰와 데이터 바인딩
- 외부에서는 레시피 배열을 읽기만 가능, 내부에서만 수정 가능
- addRecipe()를 통해 사용자가 추가한 레시피를 동적으로 반영
### 3. 'AddRecipeView'
```swift
@State private var name: String = ""
@EnvironmentObject var viewModel: RecipeViewModel

Button("저장") {
    let newRecipe = Recipe(
        name: name,
        image: imageUrl,
        description: description,
        ingredients: ingredients,
        directions: directions,
        category: selectedCategory,
        datePublished: Date().formatted(),
        url: url
    )
    viewModel.addRecipe(recipe: newRecipe)
}
```
- 사용자 입력값을 받아 새로운 Recipe 인스턴스를 생성
- @EnvironmentObject로 전역 뷰모델에 접근하여 데이터 등록
- 단방향 데이터 흐름을 활용한 상태반영 구조
### 4. 'TabBar'
```swift
TabView {
    HomeView()
        .tabItem { Label("홈", systemImage: "house") }

    CategoriesView()
        .tabItem { Label("카테고리", systemImage: "square.grid.2x2") }

    NewRecipeView()
        .tabItem { Label("추가", systemImage: "plus.circle") }

    FavoritesView()
        .tabItem { Label("즐겨찾기", systemImage: "heart") }

    SettingsView()
        .tabItem { Label("설정", systemImage: "gear") }
}
```
- 앱 전체를 구성하는 하단 탭 기반 내비게이션
- 각 화면은 독립된 설계로 구성되어 우수한 모듈화
- Label()을 텍스트와 아이콘을 함께 구성
---
## 🛠️ 사용 기술 스택

- **Swift 5**
- **SwiftUI**
- **MVVM 아키텍처**
- `@Published`, `ObservableObject` 기반 상태 관리
- **Xcode 15 이상 권장**

## 📝 향후 개선 방향 (Todo)

- [ ] **레시피 영구 저장** 기능 (CoreData / Realm / Firebase 연동)
- [ ] **이미지 직접 업로드** 기능 (현재는 URL 기반)
- [ ] **검색 기능** 추가 (레시피 이름 및 카테고리 필터링)
- [ ] **즐겨찾기 상태 저장** (UserDefaults 또는 로컬 DB 활용)
