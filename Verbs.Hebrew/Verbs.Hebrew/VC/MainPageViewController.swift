//
//  MainPageViewController.swift
//  Verbs.Hebrew
//
//  Created by Anton Rubenchik on 08/02/2019.
//  Copyright © 2019 Anton Rubenchik. All rights reserved.
//
// Доделать:
//V 1. Все формы в массив
//V 2. Поиск по всем формам
//V 3. Исходный файл. Убрать Пустоту
//+ 4. Исходжный файл. УБрать 2 строчки
//+ 5. Сделать страницу загрузки данных
// 6. Закрыть БД от записи
//- 7. При загрузук приложения. проверяется дата последнего внесения данных в Firebase. И определяетс, нужно ли подгружать данные
//+ 8. Если данных в массиве нет, то показывать заставку. Упс... нужен интернет, чтобы загрузить данные
//V 9. Убрать препозишн из перевода
//V 10. Убрать "*" из слов
//V 10. Отсортировать массив во алфавиту
//V 11. Закрепить поиск
//+ 12. Запомнить тип времени, для показа на автомате
// 13.
//V 14 Убрать клавиатуру
//V 15. Добавить английскую верстю
//V 16. Добравить переключение языков
//V 17. Добавить копировать
// 18.  Определения языка при старте.
// 19. Загрузить базу англ перевода
// 20. Опубликовать
// 21. Сделать сайт. программы.
// 22. Пересортировывать после смены языка


import UIKit
import CoreData
import Firebase //english version//
import FirebaseDatabase //english version//

class MainPageViewController: UITableViewController, UISearchBarDelegate {
    var ref: DatabaseReference! //english version//
    @IBOutlet weak var searchBar: UISearchBar!
    let commonTranslation   = Translation()
    let emptyTranslationCD = TranslationCD() //
    var createData = CreateData()
    var currentWordsArray = [Word]()
    var isLoad = false
    var newItem = Word()
   
    override func viewWillAppear(_ animated: Bool) {
//        startConfiguration() /// temp
        
//        print(wordsArray.count,"willAppear")
        self.navigationItem.setHidesBackButton(true, animated: false)
        

    }
    

//    override func viewDidAppear(_ animated: Bool) {
//        startConfiguration() /// temp
//    }
//    override func viewDidDisappear(_ animated: Bool) {
//        saveToCoreData()
//    }
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        alterLayout()
        createRightButton()
 //       startConfiguration() //english version//
//        howManyRecordInCoreData()
        
        
        //english version//
        //start block AddEnglishPrononce
//        readFromFireBase(for: .upgradeData)
//        readFromFireBase(for: .showRecords)
        // end block AddEnglishPrononce
        
          readFromFireBase(for: .showRecords)
        //start block correction
     //   correctionDataInFireBase()
        // end block correction
        
        // not for main App
        // create array from excel
        //start. block add Info to FireBase //english version// block comment
//        let createDataModule = CreateData()
//        createDataModule.fillArray() //createArrayFromExcel
//
//        ref = Database.database().reference()
//        writeToFireBase() // - work well //writeArrayToFireBase
//        howRecordsInFireBase()
        //end. block
        
//        self.ref.child(nameTable8).setValue("__") { (error, dataResult) in
//            if let error = error {
//                print("No")
//                print(error.localizedDescription)
//            }
//        }
        
        //CoreData
//        saveToCoreData()
//        ddeleteDataInCoreData()
//        howManyRecordInCoreData()
//        readToArrayFromCoreData()
//        updateCoreData() //save add data
        
    }
    //english version// block comment
    func howRecordsInFireBase() { // temp for debug
        if Auth.auth().currentUser?.uid != nil {
            print("connection to FireBase. well")
            ref.child(nameTable).observeSingleEvent(of: .value, with: { (snapshot) in
                print("Start read FB")
                // Get user value
                let value = snapshot.value as? NSDictionary
                print(value?.count ?? 0)
            }) { (error) in
                print(error.localizedDescription)
            }
        } else {
            print("no connection to FireBase")
        }
    }
    
    func startConfiguration() {
//        howManyRecordInCoreData()
        if isLoad {
            print("Save to CoreData")
            currentWordsArray = wordsArray
//
//            let nsThread = Thread {
//                self.saveToCoreData()
//            }
//            nsThread.qualityOfService = .default
//            nsThread.start()
//            nsThread.cancel()
//            let queue = DispatchQueue.global(qos: .utility)
//            queue.async {
//                self.saveToCoreData()
//            }
//            DispatchQueue.main.async {
//                self.saveToCoreData()
//            }
            
            
//            saveToCoreData() // temp
            isLoad = false
        }
        if isFisrtTime {
            currentWordsArray = wordsArray
            isFisrtTime = false
        }
//        else {
//            print(isUpdate, "нужно ли обновляться")
//            // Update CoreData
//            if isUpdate {
//                print("Update to CoreData")
//                ref = Database.database().reference()
//                if Auth.auth().currentUser?.uid == nil {
//                    print("need singIn")
//                    singInFirebase()
//                }
//                readFromFireBase() // readArrayFromFireBase
//                updateCoreData()
//                wordsArray.sort(by: { (one, two) -> Bool in
//                    let x = one.translation?.russian ?? ""
//                    let y = two.translation?.russian ?? ""
//                    if x < y {
//                        return true
//                    } else {
//                        return false
//                    }
//                })
//                isUpdate = false
//            }
//        }
     
    }

    func createRightButton() {
        let rightButton = UIButton()
        if let imageRightButton = UIImage(named: "language32") {
            rightButton.setImage(imageRightButton, for: .normal)
        }
        rightButton.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        rightButton.layer.cornerRadius = 20
        rightButton.contentMode = .scaleAspectFit
        rightButton.addTarget(self, action: #selector(pressButton), for: .touchDown)
        rightButton.addTarget(self, action: #selector(upInsideButton), for: .touchUpInside)
        rightButton.addTarget(self, action: #selector(leaveButton), for: .touchDragExit)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightButton)
        
    }
    
    @objc func pressButton() {
        self.navigationItem.rightBarButtonItem?.customView?.alpha = 0.2
    }
    
    @objc func upInsideButton() {
        if actualLanguage == TypeOfLanguage.english {
            actualLanguage = TypeOfLanguage.russian
        } else {
            actualLanguage = TypeOfLanguage.english
        }
        let currentLanguage = actualLanguage == TypeOfLanguage.russian ? "russian" : "english"
        UserDefaults.standard.setValue(currentLanguage, forKey: keyCurrentLanguage)
        print(currentLanguage)
        UserDefaults.standard.synchronize()
        searchBar.text = ""
        let vc = ViewController()
        vc.sortingArray()
        currentWordsArray = wordsArray
        tableView.reloadData()
        self.navigationItem.rightBarButtonItem?.customView?.alpha = 1
    }
    
    @objc func leaveButton() {
        self.navigationItem.rightBarButtonItem?.customView?.alpha = 1
    }
    
    // MARK: - CoreData
    func addToRecordCoreData(translation: Translation?,typeOfTranslation: String) -> (TranslationCD) {
        let translationCD = TranslationCD()
        translationCD.russian = translation?.russian
        translationCD.english = translation?.english
        translationCD.spanish = translation?.spanish
        translationCD.typeOfTranslation = typeOfTranslation
        return translationCD
    }
    
    func addToRecordCoreData(presentTense: PresentTense?) -> (PresentTenseCD) {
        let presentTenseCD = PresentTenseCD()
        presentTenseCD.masculineSingular = presentTense?.masculineSingular
        presentTenseCD.feminineSingular  = presentTense?.feminineSingular
        presentTenseCD.masculinePlural   = presentTense?.masculinePlural
        presentTenseCD.femininePlural    = presentTense?.femininePlural
        
        let masculineSingularPr = addToRecordCoreData(translation: presentTense?.masculineSingularPr, typeOfTranslation: TypeOfTranslation.masculineSingularPr.rawValue)
        masculineSingularPr.relationshipToPresentTense = presentTenseCD

        let feminineSingularPr = addToRecordCoreData(translation: presentTense?.feminineSingularPr, typeOfTranslation: TypeOfTranslation.feminineSingularPr.rawValue)
        feminineSingularPr.relationshipToPresentTense = presentTenseCD
        
        let masculinePluralPr = addToRecordCoreData(translation: presentTense?.masculinePluralPr, typeOfTranslation: TypeOfTranslation.masculinePluralPr.rawValue)
        masculinePluralPr.relationshipToPresentTense = presentTenseCD
        
        let femininePluralPr = addToRecordCoreData(translation: presentTense?.femininePluralPr, typeOfTranslation: TypeOfTranslation.femininePluralPr.rawValue)
        femininePluralPr.relationshipToPresentTense = presentTenseCD

        CoreDataManager.instance.saveContext()
        return presentTenseCD
    }
    
    func addToRecordCoreData(pastTense: PastTense?) -> (PastTenseCD) {
        let pastTenseCD = PastTenseCD()
        pastTenseCD.singular1st           = pastTense?.singular1st
        pastTenseCD.masculineSingular2nd  = pastTense?.masculineSingular2nd
        pastTenseCD.feminineSingular2nd   = pastTense?.feminineSingular2nd
        pastTenseCD.masculineSingular3nd  = pastTense?.masculineSingular3nd
        pastTenseCD.feminineSingular3nd   = pastTense?.feminineSingular3nd
        pastTenseCD.plural1st             = pastTense?.plural1st
        pastTenseCD.masculinePlural2nd    = pastTense?.masculinePlural2nd
        pastTenseCD.femininePlural2nd     = pastTense?.femininePlural2nd
        pastTenseCD.plural3nd             = pastTense?.plural3nd
        
        let singular1stPr = addToRecordCoreData(translation: pastTense?.singular1stPr, typeOfTranslation: TypeOfTranslation.singular1stPr.rawValue)
        singular1stPr.relationshipToPastTense = pastTenseCD
        let masculineSingular2ndPr = addToRecordCoreData(translation: pastTense?.masculineSingular2ndPr, typeOfTranslation: TypeOfTranslation.masculineSingular2ndPr.rawValue)
        masculineSingular2ndPr.relationshipToPastTense = pastTenseCD
        let feminineSingular2ndPr = addToRecordCoreData(translation: pastTense?.feminineSingular2ndPr, typeOfTranslation: TypeOfTranslation.feminineSingular2ndPr.rawValue)
        feminineSingular2ndPr.relationshipToPastTense = pastTenseCD
        let masculineSingular3ndPr = addToRecordCoreData(translation: pastTense?.masculineSingular3ndPr, typeOfTranslation: TypeOfTranslation.masculineSingular3ndPr.rawValue)
        masculineSingular3ndPr.relationshipToPastTense = pastTenseCD
        let feminineSingular3ndPr = addToRecordCoreData(translation: pastTense?.feminineSingular3ndPr, typeOfTranslation: TypeOfTranslation.feminineSingular3ndPr.rawValue)
        feminineSingular3ndPr.relationshipToPastTense = pastTenseCD
        let plural1stPr = addToRecordCoreData(translation: pastTense?.plural1stPr, typeOfTranslation: TypeOfTranslation.plural1stPr.rawValue)
        plural1stPr.relationshipToPastTense = pastTenseCD
        let masculinePlural2ndPr = addToRecordCoreData(translation: pastTense?.masculinePlural2ndPr, typeOfTranslation: TypeOfTranslation.masculinePlural2ndPr.rawValue)
        masculinePlural2ndPr.relationshipToPastTense = pastTenseCD
        let femininePlural2ndPr = addToRecordCoreData(translation: pastTense?.femininePlural2ndPr, typeOfTranslation: TypeOfTranslation.femininePlural2ndPr.rawValue)
        femininePlural2ndPr.relationshipToPastTense = pastTenseCD
        let plural3ndPr = addToRecordCoreData(translation: pastTense?.plural3ndPr, typeOfTranslation: TypeOfTranslation.plural3ndPr.rawValue)
        plural3ndPr.relationshipToPastTense = pastTenseCD
        
        CoreDataManager.instance.saveContext()
        return pastTenseCD
    }
    
    func addToRecordCoreData(futureTense: FutureTense?) -> (FutureTenseCD) {
        let futureTenseCD = FutureTenseCD()
        futureTenseCD.singular1st           = futureTense?.singular1st
        futureTenseCD.masculineSingular2nd  = futureTense?.masculineSingular2nd
        futureTenseCD.feminineSingular2nd   = futureTense?.feminineSingular2nd
        futureTenseCD.masculineSingular3nd  = futureTense?.masculineSingular3nd
        futureTenseCD.feminineSingular3nd   = futureTense?.feminineSingular3nd
        futureTenseCD.plural1st             = futureTense?.plural1st
        futureTenseCD.masculinePlural2nd    = futureTense?.masculinePlural2nd
        futureTenseCD.femininePlural2nd     = futureTense?.femininePlural2nd
        futureTenseCD.plural3nd             = futureTense?.plural3nd
        
        let singular1stPr = addToRecordCoreData(translation: futureTense?.singular1stPr,
                                                typeOfTranslation: TypeOfTranslation.singular1stPr.rawValue)
        singular1stPr.relationshipToFutureTense = futureTenseCD
        
        let masculineSingular2ndPr = addToRecordCoreData(translation: futureTense?.masculineSingular2ndPr,
                                                         typeOfTranslation: TypeOfTranslation.masculineSingular2ndPr.rawValue)
        masculineSingular2ndPr.relationshipToFutureTense = futureTenseCD
        
        let feminineSingular2ndPr = addToRecordCoreData(translation: futureTense?.feminineSingular2ndPr,
                                                        typeOfTranslation: TypeOfTranslation.feminineSingular2ndPr.rawValue)
        feminineSingular2ndPr.relationshipToFutureTense = futureTenseCD
        
        let masculineSingular3ndPr = addToRecordCoreData(translation: futureTense?.masculineSingular3ndPr,
                                                         typeOfTranslation: TypeOfTranslation.masculineSingular3ndPr.rawValue)
        masculineSingular3ndPr.relationshipToFutureTense = futureTenseCD
        
        let feminineSingular3ndPr = addToRecordCoreData(translation: futureTense?.feminineSingular3ndPr,
                                                        typeOfTranslation: TypeOfTranslation.feminineSingular3ndPr.rawValue)
        feminineSingular3ndPr.relationshipToFutureTense = futureTenseCD
        
        let plural1stPr = addToRecordCoreData(translation: futureTense?.plural1stPr,
                                              typeOfTranslation: TypeOfTranslation.plural1stPr.rawValue)
        plural1stPr.relationshipToFutureTense = futureTenseCD
        
        let masculinePlural2ndPr = addToRecordCoreData(translation: futureTense?.masculinePlural2ndPr,
                                                       typeOfTranslation: TypeOfTranslation.masculinePlural2ndPr.rawValue)
        masculinePlural2ndPr.relationshipToFutureTense = futureTenseCD
        
        let femininePlural2ndPr = addToRecordCoreData(translation: futureTense?.femininePlural2ndPr,
                                                      typeOfTranslation: TypeOfTranslation.femininePlural2ndPr.rawValue)
        femininePlural2ndPr.relationshipToFutureTense = futureTenseCD
        
        let plural3ndPr = addToRecordCoreData(translation: futureTense?.plural3ndPr,
                                              typeOfTranslation: TypeOfTranslation.plural3ndPr.rawValue)
        plural3ndPr.relationshipToFutureTense = futureTenseCD
        
        CoreDataManager.instance.saveContext()
        return futureTenseCD
    }
    
    func addToRecordCoreData(imperative: Imperative?) -> (ImperativeCD) {
        let imperativeCD = ImperativeCD()
        imperativeCD.masculineSingular = imperative?.masculineSingular
        imperativeCD.feminineSingular  = imperative?.feminineSingular
        imperativeCD.plural            = imperative?.plural

        
        let masculineSingularPr = addToRecordCoreData(translation: imperative?.masculineSingularPr,
                                                typeOfTranslation: TypeOfTranslation.masculineSingularPr.rawValue)
        masculineSingularPr.relationshipToImperative = imperativeCD
        
        let feminineSingularPr = addToRecordCoreData(translation: imperative?.feminineSingularPr,
                                                         typeOfTranslation: TypeOfTranslation.feminineSingularPr.rawValue)
        feminineSingularPr.relationshipToImperative = imperativeCD
        
        let pluralPr = addToRecordCoreData(translation: imperative?.pluralPr,
                                                        typeOfTranslation: TypeOfTranslation.pluralPr.rawValue)
        pluralPr.relationshipToImperative = imperativeCD
        
        CoreDataManager.instance.saveContext()
        return imperativeCD
    }
    
    func addToCoreData(record word: Word) -> () {
        
        let wordCD = WordCD()
        wordCD.infinitive = word.infinitive
        wordCD.typeOfVerb = word.typeOfVerb.rawValue
        wordCD.preposition = word.preposition
        
        let infinitiveP = self.addToRecordCoreData(translation: word.infinitiveP, typeOfTranslation: TypeOfTranslation.infinitiveP.rawValue)
        infinitiveP.relationshipToWord = wordCD
        
        let translation = self.addToRecordCoreData(translation: word.translation, typeOfTranslation: TypeOfTranslation.translation.rawValue)
        translation.relationshipToWord = wordCD
        
        wordCD.relationshipToPresentTense = self.addToRecordCoreData(presentTense: word.presentTense)
        wordCD.relationshipToPastTense    = self.addToRecordCoreData(pastTense:    word.pastTense)
        wordCD.relationshipToFutureTense  = self.addToRecordCoreData(futureTense:  word.futureTense)
        wordCD.relationshipToImperative   = self.addToRecordCoreData(imperative:   word.imperative)
        CoreDataManager.instance.saveContext()
    }
    
    func saveNumberUpdateToUserDefaults() {
//        ref = Database.database().reference()
//        ref.child(nameFieldUpdate).observeSingleEvent(of: .value, with: { (snapshot) in
//            // Get number Update
//            if let numberUpdate = snapshot.value as? String {
//                UserDefaults.standard.setValue(numberUpdate, forKey: keyForNumberUpdateInUserDefaults)
//                UserDefaults.standard.synchronize()
////                print(numberUpdate)
//            }
//        }) { (error) in
//            print(error.localizedDescription)
//        }
        
    }
    
    func saveToCoreData() -> () {
        for word in wordsArray {
            // add one record
            addToCoreData(record: word)
//            var p = false
//            let nsThread = Thread {
//                self.addToCoreData(record: word)
//                p = true
//            }
//            nsThread.qualityOfService = .background
//            nsThread.start()
//            while !p {
//
//            }
//            nsThread.cancel()
        }
//        var p = false
//        let nsThread = Thread {
//            for word in wordsArray {
//                self.addToCoreData(record: word)
//            }
//            p = true
//        }
//        nsThread.qualityOfService = .default
//        nsThread.start()
////        while !p {
////
////        }
//        nsThread.cancel()
            // add one record
            //            addToCoreData(record: word)
//        saveNumberUpdateToUserDefaults()
    }

    func addTo(record type: String) -> (TypeOfVerb) {
        switch type {
        case "פָּעַל"  : return TypeOfVerb.paal
        case "פִּיעֵל" : return TypeOfVerb.piel
        case "פֻּיעַל"  : return TypeOfVerb.pial
        case "הִפְעִיל" : return TypeOfVerb.hifil
        case "הֻפְעַל"  : return TypeOfVerb.hifal
        case "נִפְעַל"  : return TypeOfVerb.nifal
        case "הִתְפַּעֵל" : return TypeOfVerb.hitpael
        default:
            return TypeOfVerb.paal
        }
    }
    
    func addToRecordArray(translationCD: TranslationCD) -> (Translation) {
        var translation = Translation()
        translation.russian = translationCD.russian ?? ""
        translation.english = translationCD.english ?? ""
        translation.spanish = translationCD.spanish ?? ""
        return translation
    }
    
    func addToRecordArray(presentTenseCD: PresentTenseCD) -> (PresentTense) {
        var presentTense = PresentTense()
        presentTense.masculineSingular = presentTenseCD.masculineSingular ?? ""
        presentTense.feminineSingular  = presentTenseCD.feminineSingular ?? ""
        presentTense.masculinePlural   = presentTenseCD.masculinePlural ?? ""
        presentTense.femininePlural    = presentTenseCD.femininePlural ?? ""
        
        // take NSSet
        if let translations = presentTenseCD.relationshipToTranslation
        {
            if let translations = translations.allObjects as? [TranslationCD] {
                for translation in translations {
                    switch translation.typeOfTranslation {
                    case "masculineSingularPr" :
                        presentTense.masculineSingularPr = addToRecordArray(translationCD: translation)
                    case "feminineSingularPr"  :
                        presentTense.feminineSingularPr = addToRecordArray(translationCD: translation)
                    case "masculinePluralPr" :
                        presentTense.masculinePluralPr = addToRecordArray(translationCD: translation)
                    case "femininePluralPr" :
                        presentTense.femininePluralPr = addToRecordArray(translationCD: translation)
                    default :
                        presentTense.masculineSingularPr = addToRecordArray(translationCD: translation)
                    }
                }
            }
        }
        return presentTense
    }
    
    func addToRecordArray(pastTenseCD: PastTenseCD) -> (PastTense) {
        var pastTense = PastTense()
        
        pastTense.singular1st           = pastTenseCD.singular1st ?? ""
        pastTense.masculineSingular2nd  = pastTenseCD.masculineSingular2nd ?? ""
        pastTense.feminineSingular2nd   = pastTenseCD.feminineSingular2nd ?? ""
        pastTense.masculineSingular3nd  = pastTenseCD.masculineSingular3nd ?? ""
        pastTense.feminineSingular3nd   = pastTenseCD.feminineSingular3nd ?? ""
        pastTense.plural1st             = pastTenseCD.plural1st ?? ""
        pastTense.masculinePlural2nd    = pastTenseCD.masculinePlural2nd ?? ""
        pastTense.femininePlural2nd     = pastTenseCD.femininePlural2nd ?? ""
        pastTense.plural3nd             = pastTenseCD.plural3nd ?? ""
        
        // take NSSet
        if let translations = pastTenseCD.relationshipToTranslation
        {
            if let translations = translations.allObjects as? [TranslationCD] {
                for translation in translations {
                    switch translation.typeOfTranslation {
                    case "singular1stPr" :
                        pastTense.singular1stPr = addToRecordArray(translationCD: translation)
                    case "masculineSingular2ndPr"  :
                        pastTense.masculineSingular2ndPr = addToRecordArray(translationCD: translation)
                    case "feminineSingular2ndPr" :
                        pastTense.feminineSingular2ndPr = addToRecordArray(translationCD: translation)
                    case "masculineSingular3ndPr" :
                        pastTense.masculineSingular3ndPr = addToRecordArray(translationCD: translation)
                    case "feminineSingular3ndPr" :
                        pastTense.feminineSingular3ndPr = addToRecordArray(translationCD: translation)
                    case "plural1stPr"  :
                        pastTense.plural1stPr = addToRecordArray(translationCD: translation)
                    case "masculinePlural2ndPr" :
                        pastTense.masculinePlural2ndPr = addToRecordArray(translationCD: translation)
                    case "femininePlural2ndPr" :
                        pastTense.femininePlural2ndPr = addToRecordArray(translationCD: translation)
                    case "plural3ndPr" :
                        pastTense.plural3ndPr = addToRecordArray(translationCD: translation)
                    default :
                        pastTense.singular1stPr = addToRecordArray(translationCD: translation)
                    }
                }
            }
        }
        return pastTense
    }
    
    func addToRecordArray(futureTenseCD: FutureTenseCD) -> (FutureTense) {
        var futureTense = FutureTense()
        
        futureTense.singular1st           = futureTenseCD.singular1st ?? ""
        futureTense.masculineSingular2nd  = futureTenseCD.masculineSingular2nd ?? ""
        futureTense.feminineSingular2nd   = futureTenseCD.feminineSingular2nd ?? ""
        futureTense.masculineSingular3nd  = futureTenseCD.masculineSingular3nd ?? ""
        futureTense.feminineSingular3nd   = futureTenseCD.feminineSingular3nd ?? ""
        futureTense.plural1st             = futureTenseCD.plural1st ?? ""
        futureTense.masculinePlural2nd    = futureTenseCD.masculinePlural2nd ?? ""
        futureTense.femininePlural2nd     = futureTenseCD.femininePlural2nd ?? ""
        futureTense.plural3nd             = futureTenseCD.plural3nd ?? ""
        
        // take NSSet
        if let translations = futureTenseCD.relationshipToTranslation
        {
            if let translations = translations.allObjects as? [TranslationCD] {
                for translation in translations {
                    switch translation.typeOfTranslation {
                    case "singular1stPr" :
                        futureTense.singular1stPr = addToRecordArray(translationCD: translation)
                    case "masculineSingular2ndPr"  :
                        futureTense.masculineSingular2ndPr = addToRecordArray(translationCD: translation)
                    case "feminineSingular2ndPr" :
                        futureTense.feminineSingular2ndPr = addToRecordArray(translationCD: translation)
                    case "masculineSingular3ndPr" :
                        futureTense.masculineSingular3ndPr = addToRecordArray(translationCD: translation)
                    case "feminineSingular3ndPr" :
                        futureTense.feminineSingular3ndPr = addToRecordArray(translationCD: translation)
                    case "plural1stPr"  :
                        futureTense.plural1stPr = addToRecordArray(translationCD: translation)
                    case "masculinePlural2ndPr" :
                        futureTense.masculinePlural2ndPr = addToRecordArray(translationCD: translation)
                    case "femininePlural2ndPr" :
                        futureTense.femininePlural2ndPr = addToRecordArray(translationCD: translation)
                    case "plural3ndPr" :
                        futureTense.plural3ndPr = addToRecordArray(translationCD: translation)
                    default :
                        futureTense.singular1stPr = addToRecordArray(translationCD: translation)
                    }
                }
            }
        }
        return futureTense
    }
    
    func addToRecordArray(imperativeCD: ImperativeCD) -> (Imperative) {
        var imperative = Imperative()
        
        imperative.masculineSingular = imperativeCD.masculineSingular ?? ""
        imperative.feminineSingular  = imperativeCD.feminineSingular ?? ""
        imperative.plural            = imperativeCD.plural ?? ""

        
        // take NSSet
        if let translations = imperativeCD.relationshipToTranslation
        {
            if let translations = translations.allObjects as? [TranslationCD] {
                for translation in translations {
                    switch translation.typeOfTranslation {
                    case "masculineSingularPr" :
                        imperative.masculineSingularPr = addToRecordArray(translationCD: translation)
                    case "feminineSingularPr"  :
                        imperative.feminineSingularPr = addToRecordArray(translationCD: translation)
                    case "pluralPr" :
                        imperative.pluralPr = addToRecordArray(translationCD: translation)
                    default :
                        imperative.masculineSingularPr = addToRecordArray(translationCD: translation)
                    }
                }
            }
        }
        return imperative
    }
    
    func addToArray(word translationCD:TranslationCD) -> () {
        var word = Word()

        word.infinitive  = translationCD.relationshipToWord?.infinitive ?? ""
        word.preposition = translationCD.relationshipToWord?.preposition ?? ""
        word.typeOfVerb = addTo(record: translationCD.relationshipToWord?.typeOfVerb ?? "")
        word.translation = addToRecordArray(translationCD: translationCD)
        
        if let translations = translationCD.relationshipToWord?.relationshipToTranslation
        {
            if let translations = translations.allObjects as? [TranslationCD] {
                for translation in translations {
                    if translation.typeOfTranslation == "infinitiveP" {
                        word.infinitiveP = addToRecordArray(translationCD: translation)
                    }
                }
            }
        }
        
        let presentTense = addToRecordArray(presentTenseCD: translationCD.relationshipToWord?.relationshipToPresentTense ?? emptyPresentTenseCD)
        word.presentTense = presentTense
        
        let pastTense    = addToRecordArray(pastTenseCD: translationCD.relationshipToWord?.relationshipToPastTense ?? emptyPastTenseCD)
        word.pastTense = pastTense
        
        let futureTense  = addToRecordArray(futureTenseCD: translationCD.relationshipToWord?.relationshipToFutureTense ?? emptyFutureTenseCD)
        word.futureTense = futureTense
        
        let imperative   = addToRecordArray(imperativeCD: translationCD.relationshipToWord?.relationshipToImperative ?? emptyImperativeCD)
        word.imperative = imperative
        wordsArray.append(word)
    }
    
    func readToArrayFromCoreData() -> () {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "TranslationCD")
        let predicate = NSPredicate(format: "%K == %@", "typeOfTranslation", "translation")
        var language = "russian"
        switch actualLanguage  {
        case .russian: language = "russian"
        case .english: language = "english"
        case .spanish: language = "spanish"
        default: break
        }
        let sortDescription = NSSortDescriptor(key: language, ascending: true)
        request.sortDescriptors = [sortDescription]
        request.predicate = predicate
        do {
            let translationsCD = try CoreDataManager.instance.persistentContainer.viewContext.fetch(request) as! [NSManagedObject]
            print(translationsCD.count)
            if let translationsCD = translationsCD as? [TranslationCD] {
                for translationCD in translationsCD {
                    addToArray(word: translationCD)
                }
            }
        } catch {
            print(error)
        }
    }
    
    func deleteDataInCoreData() -> () {
        var request = NSFetchRequest<NSFetchRequestResult>(entityName: "WordCD")
        do {
            let delete = try CoreDataManager.instance.persistentContainer.viewContext.fetch(request) as! [NSManagedObject]
            for item in delete {
                CoreDataManager.instance.persistentContainer.viewContext.delete(item)
            }
            CoreDataManager.instance.saveContext()
        } catch {
            print(error)
        }
        
        request = NSFetchRequest<NSFetchRequestResult>(entityName: "TranslationCD")
        do {
            let delete = try CoreDataManager.instance.persistentContainer.viewContext.fetch(request) as! [NSManagedObject]
            for item in delete {
                CoreDataManager.instance.persistentContainer.viewContext.delete(item)
            }
            CoreDataManager.instance.saveContext()
        } catch {
            print(error)
        }
    }
    
    func updateCoreData() -> () {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "WordCD")
        do {
            let wordsCD = try CoreDataManager.instance.persistentContainer.viewContext.fetch(request) as! [NSManagedObject]
            // подгружать данные из FireBase если есть что грузить
            if let wordsCD = wordsCD as? [WordCD] {
                for wordArray in wordsArray {
                    var p = false
                    var i = 0
                    while (i != wordsCD.count) && (!p) {
                        if wordArray.infinitive == wordsCD[i].infinitive {
                            p = true
                        }
                        i += 1
                    }
                    if !p {
                        print("need add word")
                        // add one record
                        addToCoreData(record: wordArray)
                    }
                }
            }
        } catch {
            print(error.localizedDescription)
        }
//        saveNumberUpdateToUserDefaults()
//        wordsArray = wordsArrayFireBase
    }
    // MOVED to VC
    func howManyRecordInCoreData() -> () {
        var request = NSFetchRequest<NSFetchRequestResult>(entityName: "TranslationCD")
        let predicate = NSPredicate(format: "%K == %@", "typeOfTranslation", "translation")
        request.predicate = predicate
        do {
            let words = try CoreDataManager.instance.persistentContainer.viewContext.fetch(request) as! [NSManagedObject]
            print(words.count,"TranslationCD")
        } catch {
            print(error)
        }
        request = NSFetchRequest<NSFetchRequestResult>(entityName: "WordCD")
        do {
            let words = try CoreDataManager.instance.persistentContainer.viewContext.fetch(request) as! [NSManagedObject]
            print(words.count,"WordCD")
        } catch {
            print(error)
        }
        request = NSFetchRequest<NSFetchRequestResult>(entityName: "PresentTenseCD")
        do {
            let words = try CoreDataManager.instance.persistentContainer.viewContext.fetch(request) as! [NSManagedObject]
            print(words.count,"PresentTenseCD")
        } catch {
            print(error)
        }
    }
    
    // MARK: - Create dictionary to FireBase
    func createDictTranslationFor (_ translation: Translation) -> ([String : Any]) {
        var wordDict = [String : Any]()
        for i in 0...namesFieldsTranslation.count - 1 {
            switch i {
            case 0:  wordDict[namesFieldsTranslation[i]] = translation.russian
            case 1:  wordDict[namesFieldsTranslation[i]] = translation.english
            case 2:  wordDict[namesFieldsTranslation[i]] = translation.spanish
            default:
                print("Yes")
            }
        }
        return wordDict
    }
    
    func createTense (typeOfTanse : TypeOfTense, word: Word) -> ([String : Any]) {
        var wordDict = [String : Any]()
        switch typeOfTanse {
        case .presentTense:
            for i in 0...namesFieldsPresentTense.count - 1 {
                switch i {
                case 0:  wordDict[namesFieldsPresentTense[i]] = word.presentTense?.masculineSingular
                case 1:  wordDict[namesFieldsPresentTense[i]] = createDictTranslationFor(word.presentTense?.masculineSingularPr ?? commonTranslation)
                case 2:  wordDict[namesFieldsPresentTense[i]] = word.presentTense?.feminineSingular
                case 3:  wordDict[namesFieldsPresentTense[i]] = createDictTranslationFor(word.presentTense?.feminineSingularPr ?? commonTranslation)
                case 4:  wordDict[namesFieldsPresentTense[i]] = word.presentTense?.masculinePlural
                case 5:  wordDict[namesFieldsPresentTense[i]] = createDictTranslationFor(word.presentTense?.masculinePluralPr ?? commonTranslation)
                case 6:  wordDict[namesFieldsPresentTense[i]] = word.presentTense?.femininePlural
                case 7:  wordDict[namesFieldsPresentTense[i]] = createDictTranslationFor(word.presentTense?.femininePluralPr ?? commonTranslation)
                default:
                    print("Yes")
                }
            }
            
        case .pastTense:
            for i in 0...namesFieldsPastTense.count - 1 {
                switch i {
                case 0:  wordDict[namesFieldsPastTense[i]] = word.pastTense?.singular1st
                case 1:  wordDict[namesFieldsPastTense[i]] = createDictTranslationFor(word.pastTense?.singular1stPr ?? commonTranslation)
                case 2:  wordDict[namesFieldsPastTense[i]] = word.pastTense?.masculineSingular2nd
                case 3:  wordDict[namesFieldsPastTense[i]] = createDictTranslationFor(word.pastTense?.masculineSingular2ndPr ?? commonTranslation)
                case 4:  wordDict[namesFieldsPastTense[i]] = word.pastTense?.feminineSingular2nd
                case 5:  wordDict[namesFieldsPastTense[i]] = createDictTranslationFor(word.pastTense?.feminineSingular2ndPr ?? commonTranslation)
                case 6:  wordDict[namesFieldsPastTense[i]] = word.pastTense?.masculineSingular3nd
                case 7:  wordDict[namesFieldsPastTense[i]] = createDictTranslationFor(word.pastTense?.masculineSingular3ndPr ?? commonTranslation)
                case 8:  wordDict[namesFieldsPastTense[i]] = word.pastTense?.feminineSingular3nd
                case 9:  wordDict[namesFieldsPastTense[i]] = createDictTranslationFor(word.pastTense?.feminineSingular3ndPr ?? commonTranslation)
                case 10:  wordDict[namesFieldsPastTense[i]] = word.pastTense?.plural1st
                case 11:  wordDict[namesFieldsPastTense[i]] = createDictTranslationFor(word.pastTense?.plural1stPr ?? commonTranslation)
                case 12:  wordDict[namesFieldsPastTense[i]] = word.pastTense?.masculinePlural2nd
                case 13:  wordDict[namesFieldsPastTense[i]] = createDictTranslationFor(word.pastTense?.masculinePlural2ndPr ?? commonTranslation)
                case 14:  wordDict[namesFieldsPastTense[i]] = word.pastTense?.femininePlural2nd
                case 15:  wordDict[namesFieldsPastTense[i]] = createDictTranslationFor(word.pastTense?.femininePlural2ndPr ?? commonTranslation)
                case 16:  wordDict[namesFieldsPastTense[i]] = word.pastTense?.plural3nd
                case 17:  wordDict[namesFieldsPastTense[i]] = createDictTranslationFor(word.pastTense?.plural3ndPr ?? commonTranslation)
                default:
                    print("Yes")
                }
            }
        case .futureTense:
            for i in 0...namesFieldsFutureTense.count - 1 {
                switch i {
                case 0:  wordDict[namesFieldsFutureTense[i]] = word.futureTense?.singular1st
                case 1:  wordDict[namesFieldsFutureTense[i]] = createDictTranslationFor(word.futureTense?.singular1stPr ?? commonTranslation)
                case 2:  wordDict[namesFieldsFutureTense[i]] = word.futureTense?.masculineSingular2nd
                case 3:  wordDict[namesFieldsFutureTense[i]] = createDictTranslationFor(word.futureTense?.masculineSingular2ndPr ?? commonTranslation)
                case 4:  wordDict[namesFieldsFutureTense[i]] = word.futureTense?.feminineSingular2nd
                case 5:  wordDict[namesFieldsFutureTense[i]] = createDictTranslationFor(word.futureTense?.feminineSingular2ndPr ?? commonTranslation)
                case 6:  wordDict[namesFieldsFutureTense[i]] = word.futureTense?.masculineSingular3nd
                case 7:  wordDict[namesFieldsFutureTense[i]] = createDictTranslationFor(word.futureTense?.masculineSingular3ndPr ?? commonTranslation)
                case 8:  wordDict[namesFieldsFutureTense[i]] = word.futureTense?.feminineSingular3nd
                case 9:  wordDict[namesFieldsFutureTense[i]] = createDictTranslationFor(word.futureTense?.feminineSingular3ndPr ?? commonTranslation)
                case 10:  wordDict[namesFieldsFutureTense[i]] = word.futureTense?.plural1st
                case 11:  wordDict[namesFieldsFutureTense[i]] = createDictTranslationFor(word.futureTense?.plural1stPr ?? commonTranslation)
                case 12:  wordDict[namesFieldsFutureTense[i]] = word.futureTense?.masculinePlural2nd
                case 13:  wordDict[namesFieldsFutureTense[i]] = createDictTranslationFor(word.futureTense?.masculinePlural2ndPr ?? commonTranslation)
                case 14:  wordDict[namesFieldsFutureTense[i]] = word.futureTense?.femininePlural2nd
                case 15:  wordDict[namesFieldsFutureTense[i]] = createDictTranslationFor(word.futureTense?.femininePlural2ndPr ?? commonTranslation)
                case 16:  wordDict[namesFieldsFutureTense[i]] = word.futureTense?.plural3nd
                case 17:  wordDict[namesFieldsFutureTense[i]] = createDictTranslationFor(word.futureTense?.plural3ndPr ?? commonTranslation)
                default:
                    print("Yes")
                }
            }
            
        case .imperative:
            for i in 0...namesFieldsImperative.count - 1 {
                switch i {
                case 0:  wordDict[namesFieldsImperative[i]] = word.imperative?.masculineSingular
                case 1:  wordDict[namesFieldsImperative[i]] = createDictTranslationFor(word.imperative?.masculineSingularPr ?? commonTranslation)
                case 2:  wordDict[namesFieldsImperative[i]] = word.imperative?.feminineSingular
                case 3:  wordDict[namesFieldsImperative[i]] = createDictTranslationFor(word.imperative?.feminineSingularPr ?? commonTranslation)
                case 4:  wordDict[namesFieldsImperative[i]] = word.imperative?.plural
                case 5:  wordDict[namesFieldsImperative[i]] = createDictTranslationFor(word.imperative?.pluralPr ?? commonTranslation)
                default:
                    print("Yes")
                }
            }
        }
        return wordDict
    }
    
    // MARK: - Firebase
    //english version// coment block
    func singInFirebase() {
        Auth.auth().signIn(withEmail: "anton@rubenchick.com", password: "eWV6cPJGjEyavFeQP") { (user, error) in
            if let error = error {
                print(error.localizedDescription)
                print("NOOOOO. Connection")
            }
            else {
                print("All right. Connection")
            }
        }
    }
    
//    func resetTable() {
//        currentWordsArray = wordsArray
//        tableView.reloadData()
//    }
    func isNeedUpdate() -> (Bool) {
        return false
    }
    func convert(dictionaryTo item: NSDictionary) -> (Translation) {
        var translation = Translation()
        translation.russian = item["translationR"] as? String ?? ""
        translation.english = item["translationE"] as? String ?? ""
        translation.spanish = item["translationS"] as? String ?? ""
        return translation
    }
    
    func convert(dictionaryTo item: NSDictionary) -> (PresentTense?) {
        var presentTense = PresentTense()
        presentTense.masculineSingular = item["masculineSingular"] as? String ?? ""
        
        if let masculineSingularPr = item["masculineSingularPr"] as? NSDictionary {
            presentTense.masculineSingularPr = self.convert(dictionaryTo: masculineSingularPr)
        }
        presentTense.feminineSingular = item["feminineSingular"] as? String ?? ""
        
        if let feminineSingularPr = item["feminineSingularPr"] as? NSDictionary {
            presentTense.feminineSingularPr = self.convert(dictionaryTo: feminineSingularPr)
        }
        presentTense.masculinePlural = item["masculinePlural"] as? String ?? ""
        
        if let masculinePluralPr = item["masculinePluralPr"] as? NSDictionary {
            presentTense.masculinePluralPr = self.convert(dictionaryTo: masculinePluralPr)
        }
        presentTense.femininePlural = item["femininePlural"] as? String ?? ""
        
        if let femininePluralPr = item["femininePluralPr"] as? NSDictionary {
            presentTense.femininePluralPr = self.convert(dictionaryTo: femininePluralPr)
        }
        
        return presentTense
    }
    
    func convert(dictionaryTo item: NSDictionary) -> (PastTense?) {
        var pastTense = PastTense()
        
        pastTense.singular1st = item["singular1st"] as? String ?? ""
        if let singular1stPr = item["singular1stPr"] as? NSDictionary {
            pastTense.singular1stPr = self.convert(dictionaryTo: singular1stPr)
        }
        
        pastTense.masculineSingular2nd = item["masculineSingular2nd"] as? String ?? ""
        if let masculineSingular2ndPr = item["masculineSingular2ndPr"] as? NSDictionary {
            pastTense.masculineSingular2ndPr = self.convert(dictionaryTo: masculineSingular2ndPr)
        }
        
        pastTense.feminineSingular2nd = item["feminineSingular2nd"] as? String ?? ""
        if let feminineSingular2ndPr = item["feminineSingular2ndPr"] as? NSDictionary {
            pastTense.feminineSingular2ndPr = self.convert(dictionaryTo: feminineSingular2ndPr)
        }
        
        pastTense.masculineSingular3nd = item["masculineSingular3nd"] as? String ?? ""
        if let masculineSingular3ndPr = item["masculineSingular3ndPr"] as? NSDictionary {
            pastTense.masculineSingular3ndPr = self.convert(dictionaryTo: masculineSingular3ndPr)
        }
        
        pastTense.feminineSingular3nd = item["feminineSingular3nd"] as? String ?? ""
        if let feminineSingular3ndPr = item["feminineSingular3ndPr"] as? NSDictionary {
            pastTense.feminineSingular3ndPr = self.convert(dictionaryTo: feminineSingular3ndPr)
        }
        
        pastTense.plural1st = item["plural1st"] as? String ?? ""
        if let plural1stPr = item["plural1stPr"] as? NSDictionary {
            pastTense.plural1stPr = self.convert(dictionaryTo: plural1stPr)
        }
        
        pastTense.masculinePlural2nd = item["masculinePlural2nd"] as? String ?? ""
        if let masculinePlural2ndPr = item["masculinePlural2ndPr"] as? NSDictionary {
            pastTense.masculinePlural2ndPr = self.convert(dictionaryTo: masculinePlural2ndPr)
        }
        
        pastTense.femininePlural2nd = item["femininePlural2nd"] as? String ?? ""
        if let femininePlural2ndPr = item["femininePlural2ndPr"] as? NSDictionary {
            pastTense.femininePlural2ndPr = self.convert(dictionaryTo: femininePlural2ndPr)
        }
        
        pastTense.plural3nd = item["plural3nd"] as? String ?? ""
        if let plural3ndPr = item["plural3ndPr"] as? NSDictionary {
            pastTense.plural3ndPr = self.convert(dictionaryTo: plural3ndPr)
        }
        
        return pastTense
    }
    
    func convert(dictionaryTo item: NSDictionary) -> (FutureTense?) {
        var futureTense = FutureTense()
        
        futureTense.singular1st = item["singular1st"] as? String ?? ""
        if let singular1stPr = item["singular1stPr"] as? NSDictionary {
            futureTense.singular1stPr = self.convert(dictionaryTo: singular1stPr)
        }
        
        futureTense.masculineSingular2nd = item["masculineSingular2nd"] as? String ?? ""
        if let masculineSingular2ndPr = item["masculineSingular2ndPr"] as? NSDictionary {
            futureTense.masculineSingular2ndPr = self.convert(dictionaryTo: masculineSingular2ndPr)
        }
        
        futureTense.feminineSingular2nd = item["feminineSingular2nd"] as? String ?? ""
        if let feminineSingular2ndPr = item["feminineSingular2ndPr"] as? NSDictionary {
            futureTense.feminineSingular2ndPr = self.convert(dictionaryTo: feminineSingular2ndPr)
        }
        
        futureTense.masculineSingular3nd = item["masculineSingular3nd"] as? String ?? ""
        if let masculineSingular3ndPr = item["masculineSingular3ndPr"] as? NSDictionary {
            futureTense.masculineSingular3ndPr = self.convert(dictionaryTo: masculineSingular3ndPr)
        }
        
        futureTense.feminineSingular3nd = item["feminineSingular3nd"] as? String ?? ""
        if let feminineSingular3ndPr = item["feminineSingular3ndPr"] as? NSDictionary {
            futureTense.feminineSingular3ndPr = self.convert(dictionaryTo: feminineSingular3ndPr)
        }
        
        futureTense.plural1st = item["plural1st"] as? String ?? ""
        if let plural1stPr = item["plural1stPr"] as? NSDictionary {
            futureTense.plural1stPr = self.convert(dictionaryTo: plural1stPr)
        }
        
        futureTense.masculinePlural2nd = item["masculinePlural2nd"] as? String ?? ""
        if let masculinePlural2ndPr = item["masculinePlural2ndPr"] as? NSDictionary {
            futureTense.masculinePlural2ndPr = self.convert(dictionaryTo: masculinePlural2ndPr)
        }
        
        futureTense.femininePlural2nd = item["femininePlural2nd"] as? String ?? ""
        if let femininePlural2ndPr = item["femininePlural2ndPr"] as? NSDictionary {
            futureTense.femininePlural2ndPr = self.convert(dictionaryTo: femininePlural2ndPr)
        }
        
        futureTense.plural3nd = item["plural3nd"] as? String ?? ""
        if let plural3ndPr = item["plural3ndPr"] as? NSDictionary {
            futureTense.plural3ndPr = self.convert(dictionaryTo: plural3ndPr)
        }
        
        return futureTense
    }
    
    func convert(dictionaryTo item: NSDictionary) -> (Imperative?) {
        var imperative = Imperative()
        
        imperative.masculineSingular = item["masculineSingular"] as? String ?? ""
        if let masculineSingularPr = item["masculineSingularPr"] as? NSDictionary {
            imperative.masculineSingularPr = self.convert(dictionaryTo: masculineSingularPr)
        }
        
        imperative.feminineSingular = item["feminineSingular"] as? String ?? ""
        if let feminineSingularPr = item["feminineSingularPr"] as? NSDictionary {
            imperative.feminineSingularPr = self.convert(dictionaryTo: feminineSingularPr)
        }
        
        imperative.plural = item["plural"] as? String ?? ""
        if let pluralPr = item["pluralPr"] as? NSDictionary {
            imperative.pluralPr = self.convert(dictionaryTo: pluralPr)
        }
        
        return imperative
    }
    
    func convert(dictionaryTo item: NSDictionary) -> (Word) {
        var newWord = Word()
        
        newWord.infinitive = item["infinitive"] as? String ?? ""
        
        if let infinitiveP = item["infinitiveP"] as? NSDictionary {
            newWord.infinitiveP = self.convert(dictionaryTo: infinitiveP)
        }
        if let typeOfVerb = item["typeOfVerb"] as? String {
            newWord.typeOfVerb = TypeOfVerb(rawValue: typeOfVerb) ?? TypeOfVerb.paal
        }
        newWord.preposition = item["preposition"] as? String ?? ""
        
        if let translation = item["translation"] as? NSDictionary {
            newWord.translation = self.convert(dictionaryTo: translation)
        }
        
        if let presentTense = item["presentTense"] as? NSDictionary {
            newWord.presentTense = self.convert(dictionaryTo: presentTense)
        }
        
        if let pastTense = item["pastTense"] as? NSDictionary {
            newWord.pastTense = self.convert(dictionaryTo: pastTense)
        }
        
        if let futureTense = item["futureTense"] as? NSDictionary {
            newWord.futureTense = self.convert(dictionaryTo: futureTense)
        }
        
        if let imperative = item["imperative"] as? NSDictionary {
            newWord.imperative = self.convert(dictionaryTo: imperative)
        }
        
        return newWord
    }
    
    //english version// comment func
    func readFromFireBase(for type: TypeOfReadDataFromFireBase) {
        ref = Database.database().reference()
        if Auth.auth().currentUser?.uid != nil {
            print("connection to FireBase. well")
            ref.child(nameTestTable).observeSingleEvent(of: .value, with: { (snapshot) in
        //    ref.child(nameTable).observeSingleEvent(of: .value, with: { (snapshot) in //test english version//
                // Get user value
                let value = snapshot.value as? NSDictionary
                for word in (value?.allValues)! {
                    if let word = word as? NSDictionary {
                        wordsArray.append(self.convert(dictionaryTo: word))
                    }
                }
                switch type {
                case .showRecords :
                    self.currentWordsArray = wordsArray //english version//
                    self.tableView.reloadData() //english version//
                    //                self.updateCoreData()
                    
                case .upgradeData :
                    let createDataModule = CreateData() //test english version// delete
                    createDataModule.fillUpgradeArray() //createArrayFromExcel //test english version// delete
                    self.addEnglishPrononceInFireBase()
                }
             //   print(wordsArray.count,"data from FB.1")


            }) { (error) in
                print(error.localizedDescription)
            }
        } else {
            singInFirebase()
            print("no connection to FireBase")
        }
     //   print(wordsArray.count,"data from FB.2")
    }
    
//    func writeToFireBaseNumberUpdate() {
//
//        let userID = Auth.auth().currentUser?.uid
//        if userID != nil {
//
//            //read old number Update
//            ref.child(nameFieldUpdate).observeSingleEvent(of: .value, with: { (snapshot) in
//                // Get number Update
//                if let numberUpdate = snapshot.value as? String {
////                    numberS = String(numberUpdate)
//                    if let a:Int = Int(numberUpdate) {
//                        self.number = a + 1
//
//                    }
//                }
//            })
//            //write new number update
////            self.ref.child(nameFieldUpdate).setValue(String(self.number)) { (error, dataResult) in
//            self.ref.child(nameFieldUpdate).setValue(String(numberUp+1)) { (error, dataResult) in
//                if let error = error {
//                    print(error.localizedDescription)
//                }
//            }
//        } else {
    //            print("userID - nil")
    //        }
    //    }
    //english version// full comment block
    func correctionDataInFireBase() {
        ref = Database.database().reference()
        let userID = Auth.auth().currentUser?.uid
        if userID != nil {
            // find item in Array
            for item in wordsArray {
                let searchText = "לָשׁוֹם"
                    if item.infinitive == searchText {
                    print("Data find")

                    var correction = item.translation
                    correction?.english = "english"

                    var wordDict = [String : Any]()
                    for i in 0...namesFieldsArray.count-1 {
                        switch i {
                        case 0: wordDict[namesFieldsArray[i]] = item.infinitive
                        case 1: wordDict[namesFieldsArray[i]] = createDictTranslationFor(item.infinitiveP ?? commonTranslation)
                        case 2: wordDict[namesFieldsArray[i]] = item.typeOfVerb.rawValue
                        case 3: wordDict[namesFieldsArray[i]] = item.preposition
                        case 4: wordDict[namesFieldsArray[i]] = createDictTranslationFor(correction ?? commonTranslation)
//                            case 4: wordDict[namesFieldsArray[i]] = createDictTranslationFor(item.translation ?? commonTranslation)
                        case 5: wordDict[namesFieldsArray[i]] = createTense(typeOfTanse: .presentTense, word: item)
                        case 6: wordDict[namesFieldsArray[i]] = createTense(typeOfTanse: .pastTense,    word: item)
                        case 7: wordDict[namesFieldsArray[i]] = createTense(typeOfTanse: .futureTense,  word: item)
                        case 8: wordDict[namesFieldsArray[i]] = createTense(typeOfTanse: .imperative,   word: item)

                        default:
                            return
                        }
                    }
                        //test english version//
                    self.ref.child(nameTestTable).child(item.infinitive).setValue(wordDict) { (error, dataResult) in
                    //self.ref.child(nameTable).child(item.infinitive).setValue(wordDict) { (error, dataResult) in
                        if let error = error {
                            print("No")
                            print(error.localizedDescription)
                        } else {
                            print("Data record ")
                        }

                    }
                }
            }
        }
    }
    
    
    
    //english version// add for English version
    func addEnglishPrononceInFireBase() {
        
        let userID = Auth.auth().currentUser?.uid
        if userID != nil {
            
            for upgradeWord in upgradeWordsArray {
                //seach item in FireBase
                var i = 0
                var isFound = false
                var currentWord = Word()
                while (i < wordsArray.count)&&(!isFound) {
                    if wordsArray[i].infinitive == upgradeWord.infinitive {
                        currentWord = wordsArray[i]
                        isFound = true
                    }
                    i += 1
                }
                print("I - \(i)")
                
                
                // send new field
                
                if currentWord.infinitive != "" {
                    currentWord.infinitiveP?.english = upgradeWord.infinitiveP?.english ?? ""
                    // PresentTense
                    currentWord.presentTense?.masculineSingularPr?.english = upgradeWord.presentTense?.masculineSingularPr?.english ?? ""
                    currentWord.presentTense?.feminineSingularPr?.english  = upgradeWord.presentTense?.feminineSingularPr?.english ?? ""
                    currentWord.presentTense?.masculinePluralPr?.english   = upgradeWord.presentTense?.masculinePluralPr?.english ?? ""
                    currentWord.presentTense?.femininePluralPr?.english    = upgradeWord.presentTense?.femininePluralPr?.english ?? ""
                    // Past Tense
                    currentWord.pastTense?.singular1stPr?.english          = upgradeWord.pastTense?.singular1stPr?.english ?? ""
                    currentWord.pastTense?.masculineSingular2ndPr?.english = upgradeWord.pastTense?.masculineSingular2ndPr?.english ?? ""
                    currentWord.pastTense?.feminineSingular2ndPr?.english  = upgradeWord.pastTense?.feminineSingular2ndPr?.english ?? ""
                    currentWord.pastTense?.masculineSingular3ndPr?.english = upgradeWord.pastTense?.masculineSingular3ndPr?.english ?? ""
                    currentWord.pastTense?.feminineSingular3ndPr?.english  = upgradeWord.pastTense?.feminineSingular3ndPr?.english ?? ""
                    currentWord.pastTense?.plural1stPr?.english            = upgradeWord.pastTense?.plural1stPr?.english ?? ""
                    currentWord.pastTense?.masculinePlural2ndPr?.english   = upgradeWord.pastTense?.masculinePlural2ndPr?.english ?? ""
                    currentWord.pastTense?.femininePlural2ndPr?.english    = upgradeWord.pastTense?.femininePlural2ndPr?.english ?? ""
                    currentWord.pastTense?.plural3ndPr?.english            = upgradeWord.pastTense?.plural3ndPr?.english ?? ""
                    
                    //FutureTense
                    currentWord.futureTense?.singular1stPr?.english          = upgradeWord.futureTense?.singular1stPr?.english ?? ""
                    currentWord.futureTense?.masculineSingular2ndPr?.english = upgradeWord.futureTense?.masculineSingular2ndPr?.english ?? ""
                    currentWord.futureTense?.feminineSingular2ndPr?.english  = upgradeWord.futureTense?.feminineSingular2ndPr?.english ?? ""
                    currentWord.futureTense?.masculineSingular3ndPr?.english = upgradeWord.futureTense?.masculineSingular3ndPr?.english ?? ""
                    currentWord.futureTense?.feminineSingular3ndPr?.english  = upgradeWord.futureTense?.feminineSingular3ndPr?.english ?? ""
                    currentWord.futureTense?.plural1stPr?.english            = upgradeWord.futureTense?.plural1stPr?.english ?? ""
                    currentWord.futureTense?.masculinePlural2ndPr?.english   = upgradeWord.futureTense?.masculinePlural2ndPr?.english ?? ""
                    currentWord.futureTense?.femininePlural2ndPr?.english    = upgradeWord.futureTense?.femininePlural2ndPr?.english ?? ""
                    currentWord.futureTense?.plural3ndPr?.english            = upgradeWord.futureTense?.plural3ndPr?.english ?? ""
                    //Imperative
                    currentWord.imperative?.masculineSingularPr?.english     = upgradeWord.imperative?.masculineSingularPr?.english ?? ""
                    currentWord.imperative?.feminineSingularPr?.english      = upgradeWord.imperative?.feminineSingularPr?.english ?? ""
                    currentWord.imperative?.pluralPr?.english                = upgradeWord.imperative?.pluralPr?.english ?? ""
                    
                    currentWord.translation?.english = upgradeWord.translation?.english ?? ""
                    
                    var wordDict = [String : Any]()
                    for i in 0...namesFieldsArray.count-1 {
                        switch i {
                        case 0: wordDict[namesFieldsArray[i]] = currentWord.infinitive
                        case 1: wordDict[namesFieldsArray[i]] = createDictTranslationFor(currentWord.infinitiveP ?? commonTranslation)
                        case 2: wordDict[namesFieldsArray[i]] = currentWord.typeOfVerb.rawValue
                        case 3: wordDict[namesFieldsArray[i]] = currentWord.preposition
                        case 4: wordDict[namesFieldsArray[i]] = createDictTranslationFor(currentWord.translation ?? commonTranslation)
                        case 5: wordDict[namesFieldsArray[i]] = createTense(typeOfTanse: .presentTense, word: currentWord)
                        case 6: wordDict[namesFieldsArray[i]] = createTense(typeOfTanse: .pastTense,    word: currentWord)
                        case 7: wordDict[namesFieldsArray[i]] = createTense(typeOfTanse: .futureTense,  word: currentWord)
                        case 8: wordDict[namesFieldsArray[i]] = createTense(typeOfTanse: .imperative,   word: currentWord)
                            
                        default:
                            return
                        }
                    }
                    //test english version//
                    self.ref.child(nameTestTable).child(currentWord.infinitive).setValue(wordDict) { (error, dataResult) in
                        //self.ref.child(nameTable).child(item.infinitive).setValue(wordDict) { (error, dataResult) in
                        if let error = error {
                            print("No")
                            print(error.localizedDescription)
                        } else {
                            print("Data record ")
                        }
                    }
                }
            }
        } else {
            print("userID - nil")
        }
    }
    
    
    //english version// comment full block
    func writeToFireBase() {
        let userID = Auth.auth().currentUser?.uid
        //        print(userID)
        if userID != nil {
            // each elements of wordArray
            for item in wordsArray {
                // create tuple with information about word
                var wordDict = [String : Any]()
                for i in 0...namesFieldsArray.count-1 {
                    switch i {
                    case 0: wordDict[namesFieldsArray[i]] = item.infinitive
                    case 1: wordDict[namesFieldsArray[i]] = createDictTranslationFor(item.infinitiveP ?? commonTranslation)
                    case 2: wordDict[namesFieldsArray[i]] = item.typeOfVerb.rawValue
                    case 3: wordDict[namesFieldsArray[i]] = item.preposition
                    case 4: wordDict[namesFieldsArray[i]] = createDictTranslationFor(item.translation ?? commonTranslation)
                    case 5: wordDict[namesFieldsArray[i]] = createTense(typeOfTanse: .presentTense, word: item)
                    case 6: wordDict[namesFieldsArray[i]] = createTense(typeOfTanse: .pastTense,    word: item)
                    case 7: wordDict[namesFieldsArray[i]] = createTense(typeOfTanse: .futureTense,  word: item)
                    case 8: wordDict[namesFieldsArray[i]] = createTense(typeOfTanse: .imperative,   word: item)

                    default:
                        return
                    }
                }
                //test english version//
                self.ref.child(nameTestTable).child(item.infinitive).setValue(wordDict) { (error, dataResult) in
                //self.ref.child(nameTable).child(item.infinitive).setValue(wordDict) { (error, dataResult) in
                    if let error = error {
                        print("No")
                        print(error.localizedDescription)
                    }
                }
            }
//            writeToFireBaseNumberUpdate()
        } else {
            print("userID - nil")
            //english version// comment block. bad. алгоритм не работает
            if Auth.auth().currentUser?.uid == nil {
                print("need singIn")
                singInFirebase()
            }
        }
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.contentView.backgroundColor = UIColor(displayP3Red: 255/255, green: 234/255, blue: 166/255, alpha: 255/255)
    }
    
    func alterLayout() {
        self.tableView.tableHeaderView = UIView()
        self.navigationItem.titleView = searchBar
        searchBar.showsScopeBar = false
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print(currentWordsArray[indexPath.row].translation?.russian,indexPath.row)
        performSegue(withIdentifier: identifierSegue, sender: currentWordsArray[indexPath.row])
        
        
    }
  
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == identifierSegue {
            let detailPageVC = segue.destination as! DetailPageViewController
            if let newWord = sender as? Word {
                detailPageVC.currentWord = newWord
            }            
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return currentWordsArray.count
    }
    
    func returnTranslation(translation: Translation?) -> (String) {
        if translation != nil {
            switch actualLanguage {
            case .russian:
                return translation?.russian ?? ""
            case .english:
                return translation?.english ?? ""
            case .spanish:
                return translation?.spanish ?? ""
            case .hebrew:
                return translation?.russian ?? ""
            }
        } else {
            return ""
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: "reuseIdentifier")
        cell.textLabel?.text = returnTranslation(translation: currentWordsArray[indexPath.row].translation)
//        cell.textLabel?.text = currentWordsArray[indexPath.row].translation?.russian //english version//
        cell.selectionStyle = .none
        cell.detailTextLabel?.text = currentWordsArray[indexPath.row].infinitive
        
        return cell
    }
    
    func cleanHebrew(word: String) -> (String) {
        var cleanText = ""
        for i in word.unicodeScalars{
            if (i.value < 1515 && i.value > 1487) || (i.value == 32) {
                cleanText = cleanText + String(i)
            }
        }
        return cleanText
    }
    func createSearchText(word: Word)->(String) {
        var outputText : String = ""
        outputText = cleanHebrew(word: word.infinitive.lowercased()) + " " +   cleanHebrew(word: word.presentTense?.masculineSingular.lowercased() ?? "") + " " +   cleanHebrew(word: word.presentTense?.feminineSingular.lowercased() ?? "") + " " + cleanHebrew(word: word.presentTense?.masculinePlural.lowercased() ?? "") + " " + cleanHebrew(word: word.presentTense?.femininePlural.lowercased() ?? "") + " " +
            cleanHebrew(word: word.pastTense?.singular1st.lowercased() ?? "") + " " +
            cleanHebrew(word: word.pastTense?.masculineSingular2nd.lowercased() ?? "") + " " +
            cleanHebrew(word: word.pastTense?.feminineSingular2nd.lowercased() ?? "") + " " +
            cleanHebrew(word: word.pastTense?.masculineSingular3nd.lowercased() ?? "") + " " +
            cleanHebrew(word: word.pastTense?.feminineSingular3nd.lowercased() ?? "") + " " +
            cleanHebrew(word: word.pastTense?.plural1st.lowercased() ?? "") + " " +
            cleanHebrew(word: word.pastTense?.masculinePlural2nd.lowercased() ?? "") + " " +
            cleanHebrew(word: word.pastTense?.femininePlural2nd.lowercased() ?? "") + " " +
            cleanHebrew(word: word.pastTense?.plural3nd.lowercased() ?? "") + " " +
            cleanHebrew(word: word.futureTense?.plural3nd.lowercased() ?? "") + " " +
            cleanHebrew(word: word.futureTense?.femininePlural2nd.lowercased() ?? "") + " " +
            cleanHebrew(word: word.futureTense?.singular1st.lowercased() ?? "") + " " +
            cleanHebrew(word: word.futureTense?.masculineSingular2nd.lowercased() ?? "") + " " +
            cleanHebrew(word: word.futureTense?.feminineSingular2nd.lowercased() ?? "") + " " +
            cleanHebrew(word: word.futureTense?.masculineSingular3nd.lowercased() ?? "") + " " +
            cleanHebrew(word: word.futureTense?.feminineSingular3nd.lowercased() ?? "") + " " +
            cleanHebrew(word: word.futureTense?.plural1st.lowercased() ?? "") + " " +
            cleanHebrew(word: word.futureTense?.masculinePlural2nd.lowercased() ?? "") + " " +
            word.translation!.russian.lowercased()        
        return outputText
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        // filter array
        if searchBar.text != "" {
            searchBar.text = searchBar.text?.lowercased()
            currentWordsArray = wordsArray.filter({ (word) -> Bool in
                guard let text = searchBar.text else { return false }
                let fullTextForSearch = cleanHebrew(word: word.infinitive.lowercased()) + " " + returnTranslation(translation: word.translation!).lowercased()
                //english version//
                //let fullTextForSearch = cleanHebrew(word: word.infinitive.lowercased()) + " " + word.translation!.russian.lowercased()
                return fullTextForSearch.contains(text.lowercased())
            })
            if currentWordsArray.count == 0 {
                currentWordsArray = wordsArray.filter({ (word) -> Bool in
                    guard let text = searchBar.text else { return false }
                    let fullTextForSearch = createSearchText(word: word)
                    return fullTextForSearch.contains(text.lowercased())
                })
            }
        } else {
            currentWordsArray = wordsArray
        }
        
        tableView.reloadData()
    }
}
