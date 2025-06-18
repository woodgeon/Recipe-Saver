//
//  RecipeModel.swift
//  RecipeSaver
//
//  Created by 도건우 on 6/18/25.
//

import Foundation

enum Category: String, CaseIterable, Identifiable, Hashable {
    var id: String { self.rawValue }
    
    case breakfast = "가벼운 식사"
    case soup = "찌개"
    case salad = "샐러드"
    case appetizer = "에피타이저"
    case main = "메인"
    case side = "사이드"
    case dessert = "간식"
    case snack = "과자"
    case drint = "음료"
}

struct Recipe: Identifiable {
    let id = UUID()
    let name: String
    let image: String
    let description: String
    let ingredients: String
    let directions: String
    let category: Category.RawValue // 대소문자 구분하지 않고 문자열을 읽는다.
    let datePublished: String
    let url: String
}

extension Recipe {
    // static 속성이 구조체의 모든 인스턴스에서 공유되므로 액세스 가능
    static let all: [Recipe] = [
        Recipe(
            name: "김치찌개",
            image: "https://img.bizthenaum.co.kr/data/img/1000000869/ori/1000000869_11.jpg",
            description: "묵은지로 만든 깊고 얼큰한 김치찌개",
            ingredients: "김치, 돼지고기, 두부, 대파, 고추가루, 마늘, 참기름",
            directions: "1. 냄비에 참기름을 두르고 돼지고기를 볶는다.\n2. 김치를 넣고 함께 볶는다.\n3. 물을 붓고 끓이다가 두부와 대파를 넣는다.\n4. 고추가루, 마늘로 간을 맞춘 후 보글보글 끓인다.",
            category: Category.soup.rawValue,
            datePublished: "2024-12-01",
            url: "https://example.com/kimchi-stew"
        ),
        Recipe(
            name: "불고기",
            image: "https://oasisprodproduct.edge.naverncp.com/90010/detail/0_f2beb025-6eb6-4d32-9aa7-42de3c9f5283.jpg",
            description: "달콤짭짤한 소스로 양념된 한국식 소고기 볶음",
            ingredients: "소고기, 간장, 설탕, 마늘, 참기름, 양파, 당근",
            directions: "1. 소고기를 얇게 썰어 양념 재료와 함께 재운다.\n2. 팬에 볶으며 야채를 함께 넣고 익힌다.",
            category: Category.main.rawValue,
            datePublished: "2024-12-10",
            url: "https://example.com/bulgogi"
        ),
        Recipe(
            name: "비빔밥",
            image: "https://img.etoday.co.kr/pto_db/2019/07/20190726153503_1350707_1200_876.jpg",
            description: "다양한 나물과 고기를 고추장과 함께 비벼 먹는 비빔밥",
            ingredients: "쌀밥, 시금치, 콩나물, 당근, 애호박, 고사리, 고추장, 계란",
            directions: "1. 각 나물을 볶거나 데쳐서 준비한다.\n2. 밥 위에 나물과 고기, 계란프라이를 얹는다.\n3. 고추장을 넣고 비벼 먹는다.",
            category: Category.main.rawValue,
            datePublished: "2025-01-05",
            url: "https://example.com/bibimbap"
        ),
        Recipe(
            name: "잡채",
            image: "https://img-cf.kurly.com/hdims/resize/%3E720x/quality/90/src/shop/data/goodsview/20240905/gv00001554830_1.jpg",
            description: "당면과 고기, 채소를 볶아 만든 한국식 잡채",
            ingredients: "당면, 소고기, 시금치, 당근, 양파, 간장, 설탕, 참기름",
            directions: "1. 당면을 삶고, 재료들을 각각 볶는다.\n2. 간장과 설탕으로 간을 한 후 함께 섞는다.",
            category: Category.side.rawValue,
            datePublished: "2025-01-10",
            url: "https://example.com/japchae"
        ),
        Recipe(
            name: "배추김치",
            image: "https://img-cf.kurly.com/hdims/resize/%3E720x/quality/90/src/shop/data/goodsview/20240718/gv10000336468_1.jpg",
            description: "한국인의 밥상에 빠질 수 없는 전통 발효 음식",
            ingredients: "배추, 고춧가루, 마늘, 생강, 새우젓, 멸치액젓, 무, 쪽파",
            directions: "1. 배추를 절이고 씻어 물기를 뺀다.\n2. 무와 쪽파를 썰어 양념과 섞는다.\n3. 배추 잎 사이사이에 양념을 바르고 통에 담아 발효시킨다.",
            category: Category.side.rawValue,
            datePublished: "2025-01-18",
            url: "https://example.com/kimchi"
        ),
        Recipe(
            name: "식혜",
            image: "https://img.choroc.com/newshop/goods/024753/024753_1.jpg",
            description: "쌀과 엿기름으로 만든 전통 한국식 단 음료",
            ingredients: "엿기름, 찹쌀, 설탕, 물",
            directions: "1. 엿기름을 우려 물을 만든다.\n2. 찹쌀을 고두밥으로 짓는다.\n3. 엿기름물에 찹쌀을 넣고 발효시킨 후 끓이고 식힌다.\n4. 설탕을 넣고 마무리한다.",
            category: Category.drint.rawValue,
            datePublished: "2025-01-20",
            url: "https://example.com/sikhye"
        ),
        Recipe(
            name: "쌀과자",
            image: "https://image.8dogam.com/resized/product/asset/v1/upload/eb34dd775cc34beb8b4a0b26ed6ac0d8.jpeg?type=big&res=3x&ext=jpg",
            description: "바삭하고 고소한 전통 쌀로 만든 간식",
            ingredients: "찹쌀가루, 설탕, 물",
            directions: "1. 찹쌀가루 반죽을 만든다.\n2. 반죽을 눌러서 얇게 편 후 말린다.\n3. 기름에 튀겨 설탕을 뿌린다.",
            category: Category.snack.rawValue,
            datePublished: "2025-01-22",
            url: "https://example.com/ricecracker"
        ),
        Recipe(
            name: "약과",
            image: "https://www.k-health.com/news/photo/201802/34449_21427_1718.jpg",
            description: "기름에 튀긴 후 조청에 재운 한국 전통 디저트",
            ingredients: "밀가루, 꿀, 참기름, 생강즙, 술, 조청",
            directions: "1. 재료를 섞어 반죽을 만든다.\n2. 반죽을 틀에 찍어 모양을 만든다.\n3. 기름에 튀긴 후 조청에 재운다.",
            category: Category.dessert.rawValue,
            datePublished: "2025-01-25",
            url: "https://example.com/yakgwa"
        ),
        Recipe(
            name: "간장계란밥",
            image: "https://semie.cooking/image/contents/recipe/ut/in/etyshlxh/122895921ltfj.jpg",
            description: "간단하게 만드는 아침용 한국식 한 그릇 요리",
            ingredients: "밥, 계란, 간장, 참기름",
            directions: "1. 밥을 그릇에 담는다.\n2. 계란후라이를 얹는다.\n3. 간장과 참기름을 뿌려 비벼 먹는다.",
            category: Category.breakfast.rawValue,
            datePublished: "2025-01-26",
            url: "https://example.com/soyegg"
        ),
        Recipe(
            name: "상추무침",
            image: "https://shop.hansalim.or.kr/shopping/is/fo/img/%ED%8F%AC%EA%B8%B0%EC%83%81%EC%B6%94%EA%B2%89%EC%A0%88%EC%9D%B4_1.jpg",
            description: "아삭한 상추를 양념에 무쳐낸 한국식 샐러드",
            ingredients: "상추, 고추장, 식초, 설탕, 마늘, 참기름",
            directions: "1. 상추를 깨끗이 씻어 물기를 뺀다.\n2. 양념 재료를 섞어 소스를 만든다.\n3. 상추에 양념을 넣고 가볍게 무친다.",
            category: Category.salad.rawValue,
            datePublished: "2025-01-27",
            url: "https://example.com/lettucesalad"
        )
    ]
}
