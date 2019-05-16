//
//  ViewController.swift
//  Verbs.Hebrew
//
//  Created by Anton Rubenchik on 01/03/2019.
//  Copyright © 2019 Anton Rubenchik. All rights reserved.

//english version// - example tag
//test english version// - example for test

import UIKit
import CoreData
//import Firebase
//import FirebaseDatabase

class ViewController: UIViewController {
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    @IBOutlet weak var infoLabel: UILabel!
//    var ref: DatabaseReference!
    var isUpdate2 = false
    
    override func viewWillAppear(_ animated: Bool) {
        self.view.isHidden = true
        indicator.startAnimating()
        performSegue(withIdentifier: identifierSegueVC, sender: false) //english version// need comment
 //       self.startConfiguration() //english version//
        
//        progressBar.progress = 0
        // отключили обновление. реальзуем через многопоточность в следующей версии
        // узнаем номер последнего сделанного обновления на телефоне
//        var numberUpdateInUserDefault = ""
//        if UserDefaults.standard.value(forKey: keyForNumberUpdateInUserDefaults) != nil {
//            numberUpdateInUserDefault = UserDefaults.standard.value(forKey: keyForNumberUpdateInUserDefaults) as! String
//        } else {
//            print("UserDefaults - nil")
//        }
//
//        // узнаем номер последнего обновления в базе
//        ref = Database.database().reference()
//        ref.child(nameFieldUpdate).observeSingleEvent(of: .value, with: { (snapshot) in
//            // Get number Update
//            if let numberUpdate = snapshot.value as? String {
//                if numberUpdateInUserDefault != numberUpdate {
//                    isUpdate = true
//                    print(numberUpdateInUserDefault,numberUpdate)
//                    print("not equal. Update will do")
//                    numberUp = Int(numberUpdate) ?? 777
//                } else {
//                    isUpdate = false
//                    print("equal. Update don't need")
//                }
//                self.startConfiguration()
//            }
//        }) { (error) in
//            print(error.localizedDescription)
//        }

//       self.startConfiguration()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
       
     }
    
    func startConfiguration() {
        readFromFile() // temp
        
//        if howManyRecordInCoreData() > 0 {
//            print(howManyRecordInCoreData())
//            print("There are records in CoreData")
//            // read from CoreDate
//            readToArrayFromCoreData()
//            // chech size array
//            if wordsArray.count > 0 {
//                print("There are records in Array")
//                // moved to MainPageViewController
//                indicator.stopAnimating()
//                performSegue(withIdentifier: identifierSegueVC, sender: false)
//            } else {
//                print("There aren't records in Array")
//                // take data from FireBase
//
//                // moved to MainPageViewController
//            }
//        } else {
//            print("There aren't records in CoreData")
//            self.view.isHidden = false
//            // take data from FireBase
////            ref = Database.database().reference()
////
////            if Auth.auth().currentUser?.uid == nil {
////                print("need singIn")
////                singInFirebase()
////            }
////            readFromFireBase() // readArrayFromFireBase
//            //            print("Read data from File") // temp
//
//            readFromFile() // temp
//
//            // moved to MainPageViewController
////            performSegue(withIdentifier: identifierSegueVC, sender: nil)
//        }
        
        // read from CoreDate
        // chech size array
        // 1.1 > 0
            // moved to MainPageViewController
        // 1.2 < 0
            // take data from FireBase
            // moved to MainPageViewController
        
        // MainPageViewController
        // check update
        // save data to CoreData
        // write to FireBase number update
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == identifierSegueVC {
            let mainPageVC = segue.destination as! MainPageViewController
            if let isLoad = sender as? Bool {
                mainPageVC.isLoad = isLoad
//                isUpdate = isUpdate2
            }
        }
    }
    
    // MARK: - FireBase
    func singInFirebase() {
//        Auth.auth().signIn(withEmail: loginFireBase, password: passwordFireBase) { (user, error) in
//            if let error = error {
//                print(error.localizedDescription)
//                print("NOOOOO. Connection")
//            }
//            else {
//                print("All right. Connection")
//            }
//        }
    }
    
    func goToMainPageVCifArrayReady() {
//        print("Start sort array")
        if wordsArray.count > 10 {
            wordsArray.sort(by: { (one, two) -> Bool in
                let x = one.translation?.russian ?? ""   //english version// do english version
                let y = two.translation?.russian ?? ""   //english version// do english version
                if x < y {
                    return true
                } else {
                    return false
                }
            })
            indicator.stopAnimating()
//            print("Go to next VC")
            performSegue(withIdentifier: identifierSegueVC, sender: true)
        }
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

    func readFromFile() {
        if let path = Bundle.main.path(forResource: "hebrewverbs", ofType: "json") {
            if let jsonString = try? String(contentsOfFile: path) {
                let dict = convertJsonStringToDictionary(text: jsonString) as NSDictionary?
                if let xxx = dict?["hebrew"] as? NSDictionary {
                    for word in (xxx.allValues) {
                        if let word = word as? NSDictionary {
                            wordsArray.append(self.convert(dictionaryTo: word))
                        }
                    }
                    print("Finish read File")
                    self.goToMainPageVCifArrayReady()
                }
            }
        }
        
    }
    
    func convertJsonStringToDictionary(text: String) -> [String: Any]? {
        if let data = text.replacingOccurrences(of: "\n", with: "").data(using: String.Encoding.utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? [String:AnyObject]
            } catch {
                print(error.localizedDescription)
            }
        }
        return nil
    }
    
    func readFromFireBase() {
//        if Auth.auth().currentUser?.uid != nil {
//            print("connection to FireBase. well")
//            ref.child(nameTable).observeSingleEvent(of: .value, with: { (snapshot) in
//                print("Start read FB")
//                // Get user value
//                let value = snapshot.value as? NSDictionary
//                for word in (value?.allValues)! {
//                    if let word = word as? NSDictionary {
//                        wordsArray.append(self.convert(dictionaryTo: word))
//
//                    }
//                 }
//                print("Finish read FB")
//                self.goToMainPageVCifArrayReady()
//            }) { (error) in
//                print(error.localizedDescription)
////                self.indicator.stopAnimating()
////                self.infoLabel.text = "Упс... нужен интернет, чтобы загрузить данные"
//
//            }
//        } else {
//            print("no connection to FireBase")
////            indicator.stopAnimating()
////            infoLabel.text = "Упс... нужен интернет, чтобы загрузить данные"
//        }
    }
    
    func writeToFireBase() {
//        let userID = Auth.auth().currentUser?.uid
//        //        print(userID)
//        if userID != nil {
//            // each elements of wordArray
//            for item in wordsArray {
//                // create tuple with information about word
//                var wordDict = [String : Any]()
//                for i in 0...namesFieldsArray.count-1 {
//                    switch i {
//                    case 0: wordDict[namesFieldsArray[i]] = item.infinitive
//                    case 1: wordDict[namesFieldsArray[i]] = createDictTranslationFor(item.infinitiveP ?? commonTranslation)
//                    case 2: wordDict[namesFieldsArray[i]] = item.typeOfVerb.rawValue
//                    case 3: wordDict[namesFieldsArray[i]] = item.preposition
//                    case 4: wordDict[namesFieldsArray[i]] = createDictTranslationFor(item.translation ?? commonTranslation)
//                    case 5: wordDict[namesFieldsArray[i]] = createTense(typeOfTanse: .presentTense, word: item)
//                    case 6: wordDict[namesFieldsArray[i]] = createTense(typeOfTanse: .pastTense,    word: item)
//                    case 7: wordDict[namesFieldsArray[i]] = createTense(typeOfTanse: .futureTense,  word: item)
//                    case 8: wordDict[namesFieldsArray[i]] = createTense(typeOfTanse: .imperative,   word: item)
//
//                    default:
//                        return
//                    }
//                }
//                self.ref.child(nameTable).child(item.infinitive).setValue(wordDict) { (error, dataResult) in
//                    if let error = error {
//                        print("No")
//                        print(error.localizedDescription)
//                    }
//                    else {
//                        //                        print("Yes")
//                    }
//                }
//            }
//        } else {
//            print("userID - nil")
//        }
    }

    // MARK: - Read From CoreData
    func howManyRecordInCoreData() -> (Int) {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "TranslationCD")
        let predicate = NSPredicate(format: "%K == %@", "typeOfTranslation", "translation")
        request.predicate = predicate
        do {
            let words = try CoreDataManager.instance.persistentContainer.viewContext.fetch(request) as! [NSManagedObject]
            return words.count
        } catch {
            print(error)
            return 0
        }
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

}

