//
//  AddNewWords.swift
//  Learn Hebrew
//
//  Created by Anton Rubenchik on 18.08.2018.
//  Copyright © 2018 Anton Rubenchik. All rights reserved.
//

import Foundation
class AddNewWords {
    let newWordsArray : [WordForLearning] = [
        WordForLearning(foreign: "דַבַר",
                        original: "говорить",
                        isLearned: false,
                        levelOfLearning: 0,
                        nextContact: nil,
                        dontWantToLearn: false,
                        image: "tell",
                        mistake: 0,
                        discription: nil,
                        simple: "давар"),
        WordForLearning(foreign: "בוֹנוֹת",
                        original: "строить",
                        isLearned: false,
                        levelOfLearning: 0,
                        nextContact: nil,
                        dontWantToLearn: false,
                        image: "build",
                        mistake: 0,
                        discription: nil,
                        simple: "бонот"),
        WordForLearning(foreign: "כִיסֵא",
                        original: "стул",
                        isLearned: false,
                        levelOfLearning: 0,
                        nextContact: nil,
                        dontWantToLearn: false,
                        image: "chair",
                        mistake: 0,
                        discription: nil,
                        simple: "кисе"),
        WordForLearning(foreign: "וֵגַם",
                        original: "и",
                        isLearned: false,
                        levelOfLearning: 0,
                        nextContact: nil,
                        dontWantToLearn: false,
                        image: "and",
                        mistake: 0,
                        discription: nil,
                        simple: "вегам"),
        WordForLearning(foreign: "שוּלחַן",
                        original: "таблица",
                        isLearned: false,
                        levelOfLearning: 0,
                        nextContact: nil,
                        dontWantToLearn: false,
                        image: "table",
                        mistake: 0,
                        discription: nil,
                        simple: "шулхан"),
        WordForLearning(foreign: "מִשקפַייִם",
                        original: "очки",
                        isLearned: false,
                        levelOfLearning: 0,
                        nextContact: nil,
                        dontWantToLearn: false,
                        image: "glasses",
                        mistake: 0,
                        discription: nil,
                        simple: "мишкфайм"),
        WordForLearning(foreign: "בִקְצֵה",
                        original: "край",
                        isLearned: false,
                        levelOfLearning: 0,
                        nextContact: nil,
                        dontWantToLearn: false,
                        image: "edge",
                        mistake: 0,
                        discription: nil,
                        simple: "бикце"),
        WordForLearning(foreign: "הַחוֹטַם",
                        original: "лицо",
                        isLearned: false,
                        levelOfLearning: 0,
                        nextContact: nil,
                        dontWantToLearn: false,
                        image: "face",
                        mistake: 0,
                        discription: nil,
                        simple: "ахотем"),
        WordForLearning(foreign: "זֶרֶת",
                        original: "мизинец",
                        isLearned: false,
                        levelOfLearning: 0,
                        nextContact: nil,
                        dontWantToLearn: false,
                        image: "pinkie",
                        mistake: 0,
                        discription: nil,
                        simple: "зерет"),
        WordForLearning(foreign: "יוֹנֶה",
                        original: "птица",
                        isLearned: false,
                        levelOfLearning: 0,
                        nextContact: nil,
                        dontWantToLearn: false,
                        image: "bird",
                        mistake: 0,
                        discription: nil,
                        simple: "йоне"),
        WordForLearning(foreign: "אַף",
                        original: "нос",
                        isLearned: false,
                        levelOfLearning: 0,
                        nextContact: nil,
                        dontWantToLearn: false,
                        image: "nose",
                        mistake: 0,
                        discription: nil,
                        simple: "аф"),
        WordForLearning(foreign: "לִבכּוֹת",
                        original: "крик",
                        isLearned: false,
                        levelOfLearning: 0,
                        nextContact: nil,
                        dontWantToLearn: false,
                        image: "noise",
                        mistake: 0,
                        discription: nil,
                        simple: "ливкот"),
        WordForLearning(foreign: "לֶקָשקֶש",
                        original: "болтать",
                        isLearned: false,
                        levelOfLearning: 0,
                        nextContact: nil,
                        dontWantToLearn: false,
                        image: "talk",
                        mistake: 0,
                        discription: nil,
                        simple: "лекашкеш"),
        WordForLearning(foreign: "בוֹהֵן",
                        original: "большой палец",
                        isLearned: false,
                        levelOfLearning: 0,
                        nextContact: nil,
                        dontWantToLearn: false,
                        image: "thumb",
                        mistake: 0,
                        discription: nil,
                        simple: "боен"),
        WordForLearning(foreign: "שוֹבַך",
                        original: "голубь",
                        isLearned: false,
                        levelOfLearning: 0,
                        nextContact: nil,
                        dontWantToLearn: false,
                        image: "pigeon",
                        mistake: 0,
                        discription: nil,
                        simple: "шобах"),
        WordForLearning(foreign: "בּוֹ",
                        original: "в нем",
                        isLearned: false,
                        levelOfLearning: 0,
                        nextContact: nil,
                        dontWantToLearn: false,
                        image: "into_it",
                        mistake: 0,
                        discription: nil,
                        simple: "бо"),
        WordForLearning(foreign: "הוֹמוֹת",
                        original: "шуметь",
                        isLearned: false,
                        levelOfLearning: 0,
                        nextContact: nil,
                        dontWantToLearn: false,
                        image: "noise2",
                        mistake: 0,
                        discription: nil,
                        simple: "хомот"),
        WordForLearning(foreign: "בְּרוֹגֵז",
                        original: "со злостью",
                        isLearned: false,
                        levelOfLearning: 0,
                        nextContact: nil,
                        dontWantToLearn: false,
                        image: "angry",
                        mistake: 0,
                        discription: nil,
                        simple: "брогез"),
        WordForLearning(foreign: "הִתפַּייֵס",
                        original: "мириться",
                        isLearned: false,
                        levelOfLearning: 0,
                        nextContact: nil,
                        dontWantToLearn: false,
                        image: "accept",
                        mistake: 0,
                        discription: nil,
                        simple: "хитпаиес"),

    ]
}
