//
//  ViewController.swift
//  XXX
//
//  Created by Anton Rubenchik on 16/03/2019.
//  Copyright © 2019 Anton Rubenchik. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var progressBar: UIProgressView!
    var dictStudents = ["Иван":"25","Серега":"15"]
    let docsBaseURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    
    
    @IBOutlet weak var textLabel: UILabel!
    var timerTest : Timer?
    var textArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let pasteboard = UIPasteboard.general
        pasteboard.string = textLabel.text;
        print(Bundle.main.preferredLocalizations.first)
        
        
        
        
        
        
//        if let path = Bundle.main.path(forResource: "text", ofType: "txt") {
//        let customPlistURL = docsBaseURL.appendingPathComponent("text.txt")
//            NSDictionary(dictionary: dictStudents).write(to: customPlistURL, atomically: true)

//        }
//        let customPlistURL = docsBaseURL.appendingPathComponent("text.txt")
//        NSDictionary(dictionary: dictStudents).write(to: customPlistURL, atomically: true)
//        NSDictionary(dictionary: dictStudents).write(toFile: "text.txt", atomically: true)
        
        
        
        
//        if timerTest == nil {
//            timerTest = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(self.workProgressBar), userInfo: nil, repeats: true)
//        }
//        progressBar.progress = 0
     //   readFromFile()
//        writeInFile()

    }

    func readFromFile() {
        // only array
//        if let path = Bundle.main.path(forResource: "text", ofType: "txt") {
//            if let text = try? String(contentsOfFile: path) {
//                textArray = text.components(separatedBy: "\n\n")
//                print(textArray)
//            }
//        }
//        var nsDictionary: NSDictionary?
//        if let path = Bundle.main.path(forResource: "text", ofType: "txt") {
//            nsDictionary = NSDictionary(contentsOfFile: path)
//            print(nsDictionary)
//        }
        
        
        
        if let path = Bundle.main.path(forResource: "dictionary", ofType: "json") {
            if let jsonString = try? String(contentsOfFile: path) {
                let dict = convertJsonStringToDictionary(text: jsonString)
                if let xxx = dict?["users"] as? NSDictionary {
                    if let yyy = xxx["9gDKqKWxJEUZQYqBOE74yNY9ryp2"] as? NSDictionary {
                        if let zzz = yyy["I_am_buying"] as? NSDictionary {
                            if let ttt = zzz["foreign"] as? String {
                                print(ttt)
                            }
                        }
                    }
//                    print(xxx)
                }
//                print(dict!)
            }


        }
    }
    
    func writeInFile() {
//        let file: FileHandle? = FileHandle(forWritingAtPath: "text.txt")
//        
//        if file != nil {
//            // Set the data we want to write
////            let data = ("Silentium est aureum" as NSString).dataUsingEncoding(NSUTF8StringEncoding)
//            let string1 = "fdsfghdfgh"
//            // Write it to the file
//            file?.write(Data(string1))
//            // Close the file
//            file?.closeFile()
//        }
//        else {
//            print("Ooops! Something went wrong!")
//        }
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
    
    @objc func workProgressBar(){
        print(progressBar.progress)
        progressBar.progress = progressBar.progress + 0.0025
        if timerTest != nil && progressBar.progress > 0.98 {
            timerTest!.invalidate()
            timerTest = nil
        }
        
    }
    
    @IBAction func pressButton(_ sender: Any) {
        print("Yes")
//        if timerTest != nil && progressBar.progress > 0.98 {
//            timerTest!.invalidate()
//            timerTest = nil
//        }
        let pasteboard = UIPasteboard.general
        pasteboard.string = textLabel.text;
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
//    @IBAction func press(_ sender: UIButton) {
//        print("Yes")
//        progressBar.progress = progressBar.progress + 0.1
//    }
    
    
}
