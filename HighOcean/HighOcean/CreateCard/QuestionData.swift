//
//  QuestionData.swift
//  HighOcean
//
//  Created by Shin seungah on 2023/05/12.
//

import SwiftUI

struct Question {
let text: String
let isPositive: Bool
let isForChild: Bool
let set: Int // 1, 2, 3 중 하나
}

let Emotion = [
Question(text: "오늘 누군가 함께 했던 일 중에 즐거웠던 일이 있나요?", isPositive: true, isForChild: true, set: 1), // 긍정질문이며, 아이를 위한 1set의 질문
Question(text: "아이의 즐거운 일에 대해 공감해 주고 언제 한번 함께 자세히 얘기하자고 말해보세요.", isPositive: true, isForChild: false, set: 1),

Question(text: "오늘 하루 중 어떤 감정이 느껴질 때 ‘기분이 좋다’라고 생각되었는지 적어보세요.", isPositive: true, isForChild: true, set: 2),
Question(text: "아이가 좋은 감정이 느끼는 순간에 연관 지어 편지를 적어보세요.", isPositive: true, isForChild: false, set: 2),

Question(text: "최근 신경 쓰이는 일이 있나요? 간단하게 생각을 표현해 보세요.", isPositive: true, isForChild: true, set: 3),
Question(text: "아이가 고민되는 일에 대해 잘 말할 수 있도록 질문을 해보세요.", isPositive: true, isForChild: false, set: 3),

Question(text: "지금 나의 기분이 풀려면 무엇을 하면 좋을까요?", isPositive: false, isForChild: true, set: 1),
Question(text: "아이의 감정을 해소하기 위한 우리 가족만의 계획을 세워주세요.", isPositive: false, isForChild: false, set: 1),

Question(text: "오늘 가장 참기 힘들었던 감정과 이유를 알려주세요.", isPositive: false, isForChild: true, set: 2),
Question(text: "다루기 어려운 감정을 마주했을 아이에게 위로와 칭찬을 건네주세요.", isPositive: false, isForChild: false, set: 2),

Question(text: "오늘 기분이 안 좋은 이유를 말해주세요.", isPositive: false, isForChild: true, set: 3),
Question(text: "아이에게 함께 있어 주지 못해서 생긴 미안함과 고마움을 전달해 보세요.", isPositive: false, isForChild: false, set: 3)
]

struct question {
    let text: String
    let set: Int
}

let Noemotion = [
    question(text: "아이를 향한 관심을 표현해 주세요.", set: 0),
    question(text: "아이가 모를만한 아이의 추억을 공유해 주세요.", set: 0),
    question(text: "아이에게 격려와 응원의 메시지를 전달해 주세요.", set: 0)
]

