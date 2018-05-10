//
//  ViewController.swift
//  BANGOU_GAME
//
//  Created by pc on 10/6/17.
//  Copyright © 2017 pc. All rights reserved.
//

import UIKit
import AVFoundation
import GoogleMobileAds


class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UIAlertViewDelegate, GADBannerViewDelegate
{
    var str_minCount = ""
    var sTR_stopScreen = ""
    var sTr_stopTimer = ""

    
    @IBOutlet var ad_view: GADBannerView!
    
    
    @IBOutlet var lbl_levelNMAe: UILabel!
    
    var arr_indexPath_flip = [String]()
    
    @IBOutlet var lbl_hintNum: UILabel!
    
    @IBOutlet var btn_clear: UIButton!
    var sTr_level = ""
    @IBOutlet weak var lbl_for_bestTimes: UILabel!
    @IBOutlet var lbl_equvalue: UILabel!

    @IBOutlet var lbl_points: UILabel!
    @IBOutlet weak var collection_view: UICollectionView!
    @IBOutlet weak var lbl_for_best_Score: UILabel!
    @IBOutlet weak var lbl_for_timer: UILabel!
    @IBOutlet weak var btn_for_plus: UIButton!
    @IBOutlet weak var btn_for_sub: UIButton!
    @IBOutlet weak var btn_for_dive: UIButton!
    @IBOutlet weak var btn_for_muti: UIButton!
    @IBOutlet weak var btn_for_eque: UIButton!
    @IBOutlet var btn_start: UIButton!
    
    @IBOutlet var view_banner: UIView!
    @IBOutlet var bnt_hint: UIButton!
    @IBOutlet var btn_undo: UIButton!
    
    var pianoSound = NSURL(fileURLWithPath: Bundle.main.path(forResource: "Sound1", ofType: "wav")!)
    var audioPlayer = AVAudioPlayer()
    
    var pianoSound1 = NSURL(fileURLWithPath: Bundle.main.path(forResource: "Sound2", ofType: "wav")!)
    var audioPlayer1 = AVAudioPlayer()
    
    var pianoSound2 = NSURL(fileURLWithPath: Bundle.main.path(forResource: "Sound3", ofType: "wav")!)
    var audioPlayer2 = AVAudioPlayer()
    
    
//    var pianoSoun3 = NSURL(fileURLWithPath: Bundle.main.path(forResource: "btnpress", ofType: "mp3")!)
//    var audioPlaye3 = AVAudioPlayer()
    
    
    
    // MARK: - valiable 
    // MARK:- afterEqe valiable te(= pehla no 6) and beforeEqe valiable te(= p6i no 6)
    
//       var number_Array1 = ["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28"]

    
    var number_Array1 = [String]()
    var selected_number:Int!
    var firstNumberText:Int? = nil
    var secondNumberText:Int? = nil
    var op = ""
    var isFirstNumber = true
    var hasOp = false
    var canClear = true
    var resultLabel:String!
    var currentText:String!
    var afterEqe = 0
    var beforeEqe = 0
    var eque:Bool = false
    var opertion = ""
    var done:String? = nil
    var removeArray = [String]()   // use for Selected numbers store
    var please_selected:Bool = false
    var selected_btn:Bool = false
    var timerCount = 0
    var timerRunning = false
//    var timer = Timer()
//    var helloWorldTimer = Timer() //Use for reapper value in hard level
    
    var timer : Timer = Timer()
    
    var newEasyCounter : Timer = Timer()
    
    var newEasyCounterStop : Timer = Timer()
    
//    var timer = Timer()
//    var timer: Timer?
    var helloWorldTimer: Timer?
    var hard_countTimer: Timer?
    
//    var hard_countTimer = Timer() // Use for 10 sec count after reapper valu in hard level
    var arr_countData = [String]() //Count how many time method call
    
    var variable_timer:String! = nil
    var undo:Bool = false
    var array_chng:Bool = false
    var start_time:Bool = true
    var timerOn:Bool = true
    var index:Int!
    var highTimer:Int = 0
    var fixtimer:Int = 600
    var score: Int = 0
//    var Array_for_undo = NSMutableArray()
    var Array_for_undo = [String]()         //User for undo oeration
    var onetime:Bool = false
    
    var undo_click = false
    
    var new_Array = [String]()            //use for store selected numbers with operators
    
    var hintClick = false
    
    var arr_reEnter = [String]()          //Use for hidden last numbers store
    
    var arr_reEnter_all = [Any]()      //Use for store all hidden numbers array
    
//      var arr_reEnter_all = [String]()
    
//    var arr_reEnter_all : String = ""
    var index_view = [String]()         //Use for store index of the hidden numbers
    var index_data = [Any]()         // User for store index array [array into array store]

    var arr_hint = [String]()         // Use for hint ans numbers
    var arr_hint_time = [String]()  //Use for hint clicked time
    var arr_bestTime = [String]()  //Use for store complite game time
    
    var arr_random = [String]()   //Use for generate random num
    
    var index_value: Int = 0
    
    var arr_hint_index = [String]()
    var arr_index = [String]() //Store index Value Left equ
    
    var Array_for_undo_index = [String]() //Store index Value right equ
    
    @IBOutlet var lbl_bestTime: UILabel!
    
    var startFromAlert = false
    
   var sTr_model = ""
    
    var undoData_first = ""
    
    
    var sTr_data_popUP = ""
    
    
    override func viewDidLoad()
    {
        
        super.viewDidLoad()
        
//        ad_view.delegate = self
//
////        ad_view.adUnitID = Constants.AdMobAdUnitID
//        ad_view.rootViewController = self
//        ad_view.load(GADRequest())

        initAdMobBanner()
        
        btn_for_eque.isEnabled = false
        
        newEasyCounter.invalidate()
        
        timerRunning = false
        timer.invalidate()
        helloWorldTimer?.invalidate()
        hard_countTimer?.invalidate()
        
        
        lbl_hintNum.text = "03"
        
        lbl_hintNum.layer.cornerRadius = lbl_hintNum.frame.height/2
        lbl_hintNum.clipsToBounds = true
        
        lbl_equvalue.adjustsFontSizeToFitWidth = true
        
        bnt_hint.layer.cornerRadius = 10;
        btn_undo.layer.cornerRadius = 10; 
        
        btn_clear.layer.cornerRadius = 10;
        
       
//        bnt_hint.setTitle("Hint(03)",for: .normal)
        
        if sTr_level == "hard"
        {
            
            lbl_levelNMAe.text = "Hard"
            undo_click = true
            lbl_for_best_Score.isHidden = false
            lbl_points.isHidden = false
            
            lbl_for_bestTimes.isHidden = false
            lbl_for_bestTimes.text = "Top Score"
            lbl_bestTime.isHidden = false
            
            btn_start.isHidden = true
            lbl_for_timer.isHidden = true
            
            btn_undo.isHidden = true
            btn_clear.isHidden = false
            
            bnt_hint.isHidden = true
            lbl_hintNum.isHidden = true
            
            
            var arr_bestscor = [String]()
            
            var data: NSData? = nil
            data = UserDefaults.standard.object(forKey: "bestScor_hard") as? NSData
            
            if data == nil
            {
                
                lbl_bestTime.text =  "00"
                
            }
                
            else
            {
                
                arr_bestscor = (NSKeyedUnarchiver.unarchiveObject(with: data! as Data) as! NSArray) as! [String]
                
                print("Best score: ",arr_bestscor)
                
                
                var a3 : Int = 0
                
                //            var a3 = Float(0)
                
                var a1 : Int
                var a2:Int
                
                var index_value = ""
                
                if arr_bestscor.count == 1
                {
                    index_value = arr_bestscor[0]
                    
                    
                }
                    
                    
                else
                {
                    
                    for i in 0 ..< arr_bestscor.count-1
                    {
                        
                        
                        //                    print("1st value",a1)
                        //                    print("2nd value",a2)
                        
                        if a3 == 0
                        {
                            a1 = Int(arr_bestscor[i])!
                            
                            a2 = Int(arr_bestscor[i+1])!
                            
                            if a1 > a2
                            {
                                a3 = a1
                                index_value = String(a3)
                                print("1value",index_value)
                                //                        index_value = arr_bestscor[i]
                            }
                            else
                            {
                                a3 = a2
                                index_value = String(a3)
                                print("1value",index_value)
                                //                        index_value = arr_bestscor[i+1]
                            }
                        }
                            
                        else
                        {
                            
                            a1 = a3
                            
                            a2 = Int(arr_bestscor[i+1])!
                            
                            
                            if a3 > a2
                            {
                                //                        a3 = a3
                                index_value = String(a3)
                                print("1value",index_value)
                                //                        index_value = arr_bestscor[i]
                            }
                                
                            else if a3 > a1
                            {
                                index_value = String(a3)
                                print("1value",index_value)
                                //                        index_value = arr_bestscor[i+1]
                            }
                            else if a1 > a2
                            {
                                a3 = a1
                                index_value = String(a1)
                                print("1value",index_value)
                                //                        index_value = arr_bestscor[i+1]
                            }
                            else if a2 > a1
                            {
                                a3 = a2
                                index_value = String(a2)
                                print("1value",index_value)
                                //                        index_value = arr_bestscor[i+1]
                            }
                                
                            else
                            {
                                index_value = String(a3)
                                print("1value",index_value)
                            }
                            
                        }
                        
                        
                    }
                    
                }
                print("1value",index_value)
                print(index_value)
                lbl_bestTime.text =  index_value
                
            }
            
            
        }
            
        else if sTr_level == "Extreme"
        {
            lbl_levelNMAe.text = "Extreme"
            sTr_level = "Extreme_yes"
            
            undo_click = true
            bnt_hint.isHidden = true
            lbl_hintNum.isHidden = true
            
            lbl_for_bestTimes.isHidden = false
            lbl_bestTime.isHidden = false
            
            lbl_for_best_Score.isHidden = true
            lbl_points.isHidden = true
            btn_start.isHidden = false
            lbl_for_timer.isHidden = false
            
            btn_undo.isHidden = true
            btn_clear.isHidden = false
            
            lbl_equvalue.isHidden = true
            
//             perform(#selector(ExtremeLevel), with: nil, afterDelay: 12.0)
//                ExtremeLevel()
            
        }
            
            
        else if sTr_level == "easy"
        {
            
            lbl_levelNMAe.text = "Easy"
            bnt_hint.isHidden = false
            lbl_hintNum.isHidden = false
            
            lbl_for_bestTimes.isHidden = false
            lbl_bestTime.isHidden = false
            
            lbl_for_best_Score.isHidden = true
            lbl_points.isHidden = true
            btn_start.isHidden = false
            lbl_for_timer.isHidden = false
            
            btn_undo.isHidden = false
            btn_clear.isHidden = true
            
            var arr_time = [String]()
            
            var data: NSData? = nil
            data = UserDefaults.standard.object(forKey: "BestTime") as? NSData
            
            if data == nil
            {
                lbl_bestTime.text =  "00"
            }
                
            else
            {
                
                arr_time = (NSKeyedUnarchiver.unarchiveObject(with: data! as Data) as! NSArray) as! [String]
                
                print("Best score time: ",arr_time)
                
                arr_bestTime=arr_time
                
//                var a3 : Int = 0

                var a3: Int? = 0
     
                var a1: Int? = 0
     
                var a2: Int? = 0
                
                var index_value = ""
                
                if arr_time.count == 1
                {
                    index_value = arr_time[0]
                }
                    else
                {
                    for i in 0 ..< arr_time.count-1
                    {
                        var sTr_value = arr_time[i]
                        print(sTr_value)
                        
                        sTr_value = sTr_value.replacingOccurrences(of: ":", with: "")
                        print("String  ",sTr_value)
                        a1 = Int(sTr_value)
                        
                        var sTr_value1 = arr_time[i+1]
                        print(sTr_value1)
                        
                        sTr_value1 = sTr_value1.replacingOccurrences(of: ":", with: "")
                        print("String 2 ",sTr_value1)
                        
                        a2 = Int(sTr_value1)
                        
                        print("1st value",a1!)
                        print("2nd value",a2!)
                        
                        if a3 == 0
                        {
                            if a1! < a2!
                            {
                                a3 = a1!
                                index_value = arr_time[i]
                            }
                            else
                            {
                                a3 = a2!
                                index_value = arr_time[i+1]
                            }
                        }
                            
                        else
                        {
                            if a3! > a1!
                            {
                                a3 = a1!
                                index_value = arr_time[i]
                            }
                            else if a3! > a2!
                            {
                                a3 = a2!
                                index_value = arr_time[i+1]
                            }
                            else
                            {
                                let time = index_value.replacingOccurrences(of: ":", with: "")
                                
                                print("else String ",time)
                                
                                a3 = Int(time)
                                
                                
                                
                            }
                            
                            //                            if a1! < a2!
                            //                            {
                            //                                a3 = a1!
                            //                                index_value = arr_time[i]
                            //                            }
                            //                            else
                            //                            {
                            //                                a3 = a2!
                            //                                index_value = arr_time[i+1]
                            //                            }
                            
                        }
                        
                        
                    }
                    
                    
                }
                
                lbl_bestTime.text =  index_value
                
            }

            
            
        }
        
        
        let n = Int(arc4random_uniform(42))
        
        print("Int Data\(n)")
        
        var counter = 0
        
        repeat
        {
            let n = Int(arc4random_uniform(31))
            
            
            if n != 0
            {
                var sTr_random = String(n)
                
                if counter == 0
                {
                    
                    arr_random.append(sTr_random)
//                    counter += 1
                    
//                    arr_random.append(sTr_random)
//                    counter += 1
                    
//                    arr_random.append(sTr_random)
                    counter += 1
                    
                }
                else if counter == 3
                {
                    if arr_random.contains(sTr_random)
                    {
                        
                    }
                        
                    else
                    {
                        
//                        arr_random.append(sTr_random)
//                        counter += 1
                        
                        arr_random.append(sTr_random)
                        counter += 1
                    }
                }
                    
                else
                {
                    if arr_random.contains(sTr_random)
                    {
                        
                    }
                    else
                    {
                        arr_random.append(sTr_random)
                        counter += 1
                    }
                }
            }
            
        }
            //            while counter != 28
            while counter != 20

        
        
        print("Array  ",arr_random.count)
        
        number_Array1 = arr_random
        

        var data: NSData? = nil
        data = UserDefaults.standard.object(forKey: "BestTime") as? NSData
        
        if data == nil
        {
            
        }
            
        else{}
//        {
//            
////            let array_data = NSKeyedUnarchiver.unarchiveObject(with: data! as Data) as Any
//
//            arr_bestTime = (NSKeyedUnarchiver.unarchiveObject(with: data! as Data) as! NSArray) as! [String]
//            
//            print("Best time: ",arr_bestTime)
//            
//            var a3 : Float = 0
//            
////            var a3 = Float(0)
//            
//            var a1 : Float
//            var a2:Float
//            
//            var index_value = ""
//            
//            for i in 0 ..< arr_bestTime.count-1
//            {
////                let  a4 = arr_bestTime[i]
//                
//                a1 = ((arr_bestTime[i] as NSString).floatValue)
//                
//                a2 = (((arr_bestTime[i+1]) as NSString).floatValue)
//                
//                print("1st value",a1)
//                print("2nd value",a2)
//                
//                if a3 == 0
//                {
//                    if a1 < a2
//                    {
//                        a3 = a1
//                        index_value = arr_bestTime[i]
//                    }
//                    else
//                    {
//                        a3 = a2
//                        index_value = arr_bestTime[i+1]
//                    }
//                }
//                    
//                else
//                {
//                    if a1 < a2
//                    {
//                        a3 = a1
//                        index_value = arr_bestTime[i]
//                    }
//                    else
//                    {
//                        a3 = a2
//                        index_value = arr_bestTime[i+1]
//                    }
// 
//                }
//                
//                
//            }
//            
//            print(index_value)
//            lbl_bestTime.text = index_value
//            
//            print(a3)
//
//        }

        
//        startMETHOD()
        
        
        btn_undo.isEnabled = false
        btn_undo.setTitleColor(UIColor.lightGray, for: UIControlState.normal)
        
        bnt_hint.isEnabled = false
        bnt_hint.setTitleColor(UIColor.lightGray, for: UIControlState.normal)
        
        
//        let alertTest = UIAlertView()
//        alertTest.delegate = self
//        
//        alertTest.message = "Are you sure you want to start this game?"
//        alertTest.addButton(withTitle: "Yes")
//        alertTest.addButton(withTitle: "No")
//        alertTest.title = ""
//        alertTest.tag = 0;
//        alertTest.show()
        
        
        
        
//        startMETHOD()

        do
        {
            audioPlayer = try AVAudioPlayer(contentsOf:pianoSound as URL)
            audioPlayer.prepareToPlay()
            audioPlayer.stop()
            
            
            audioPlayer1 = try AVAudioPlayer(contentsOf:pianoSound1 as URL)
            audioPlayer1.prepareToPlay()
            audioPlayer1.stop()
            
            
            audioPlayer2 = try AVAudioPlayer(contentsOf:pianoSound2 as URL)
            audioPlayer2.prepareToPlay()
            audioPlayer2.stop()
            
        }
            
        catch
        {
            print("Cannot play the file")
        }
        
        collection_view.layer.borderColor = UIColor.clear.cgColor
        collection_view.layer.borderWidth = 1
        
        
        
        let modelName = UIDevice.current.modelName
        print("Model number:::\(modelName)")
        
        sTr_model =  modelName
        
         modelChoose()
        
        
        bnt_hint.isHidden = true
        lbl_hintNum.isHidden = true
        
        
        
//        factors(of: 456)
//        
//        calculateFactors(n: 456)

    }
    
    func initAdMobBanner()
    {
        
//        if UIDevice.current.userInterfaceIdiom == .phone {
//            // iPhone
        
//            ad_view.frame = CGRect(x: 0, y: view.frame.size.height, width: 320, height: 50)
//        } else
//        {
//            // iPad
//            ad_view.adSize =  GADAdSizeFromCGSize(CGSize(width: 468, height: 60))
//            ad_view.frame = CGRect(x: 0, y: view.frame.size.height, width: 468, height: 60)
//        }
//        ad_view.adSize =  GADAdSizeFromCGSize(CGSize(width: 320, height: 50))
//        ad_view = GADBannerView(adSize: kGADAdSizeSmartBannerPortrait)
        
//        ad_view = GADBannerView(adSize: kGADAdSizeSmartBannerLandscape)
        
        
        ad_view.frame = CGRect(x:0.0,
                              y:self.view.frame.size.height - ad_view.frame.size.height,
                              width:ad_view.frame.size.width,
                              height:ad_view.frame.size.height)
        
        ad_view.adUnitID = "ca-app-pub-3940256099942544/2934735716"
       
//        ad_view.adUnitID = "ca-app-pub-8166067823075787/1360922322"
        ad_view.rootViewController = self
        ad_view.delegate = self
        view.addSubview(ad_view)
        
        let request = GADRequest()
        ad_view.load(request)
    }
    
    
    
    
    func ExtremeLevel()
    {
      sTr_level = "Extreme_yes"
        
        collection_view.reloadData()
        
//        helloWorldTimer = Timer.scheduledTimer(timeInterval: 10.0, target: self, selector: #selector(ViewController.enterNumber), userInfo: nil, repeats: true)
        
    }
    
    override func viewDidDisappear(_ animated: Bool)
    {
        timer.invalidate()
    }
    
    @IBAction func clearClick(_ sender: Any)
    {
        btn_for_eque.isEnabled = false
        
        let sTr_sound = UserDefaults.standard.object(forKey: "music") as? String
        if sTr_sound == "on"
        {
            audioPlayer1.play()
        }
        
        afterEqe = 0
        beforeEqe = 0
        please_selected = false
        eque = false
        
        self.removeArray.removeAll()
        self.new_Array.removeAll()
        Array_for_undo_index.removeAll()
        arr_hint_index.removeAll()
        arr_index.removeAll()
        
        lbl_equvalue.text = " "
        
        collection_view.reloadData()
        
        
    }
    
//    
//    func calculateFactors(n: Int) -> String {
//        var result: String = ""
//        for i in 1...n {
//            guard n % i == 0  else {continue}
//            result += i == 1 ? "1" : " and \(i)"
//        }
//        print(result)
//        
//        return result    
//    }
//    
//    func factors(of n: Int) -> [Int]
//    {
//        precondition(n > 0, "n must be positive")
//        let sqrtn = Int(Double(n).squareRoot())
//        var factors: [Int] = []
//        factors.reserveCapacity(2 * sqrtn)
//        for i in 1...sqrtn {
//            if n % i == 0 {
//                factors.append(i)
//            }
//        }
//        var j = factors.count - 1
//        if factors[j] * factors[j] == n {
//            j -= 1
//        }
//        while j >= 0 {
//            factors.append(n / factors[j])
//            j -= 1
//        }
//        print("Shreyaaa",factors)
//        return factors
//    }
    
    
//    func hint_sol()
//    {
//       let array = String.characters.flatMap{Int(String($0))}
//        
//        
//    }
    
    
    override func viewWillAppear(_ animated: Bool)
    {
        
        number_Array1 = arr_random
        print("Number arrayyyyy::: ",number_Array1)
        number_Array1.shuffle()
        lbl_for_best_Score.text = "00"
        score = 0
        
        variable_timer = ""
        
        if timerCount == 0
        {
            timerRunning = false
        }
        
        if highTimer == 0
        {
            fixtimer = 600
            
        }
        
        collection_view.isUserInteractionEnabled = false
        //        lbl_for_best_Score.text = "00:00"
        
        Func_for_lowtime()
        
        startMETHOD()
        
    }
    
    //Mark: Count 60sec aftre decrement 1sec in hard level
//    func printMessage(message: String)
    
    
    func countnumber(timer: Timer)
        
//    func countnumber(sTr_count: String)
    {
        
//        hard_countTimer?.hard_countTimerhard_countTimer
        
//         let searc = timer.userInfo as! String
//        
//        print(searc)
        
        let array_data = number_Array1.filter{$0 != ""}
        
        if array_data.count==20
        {
            
//            perform(#selector(countnumber(sTr_count:)), with: "no", afterDelay: 60.0)

            hard_countTimer = Timer.scheduledTimer(timeInterval: 60.0, target: self, selector: #selector(ViewController.countnumber), userInfo: "", repeats: true)
        }
            
        else
        {
        
            
            
        let searchText = timer.userInfo as! String
            
            if searchText == "Yes"
            {
                arr_countData.append(searchText)
                
                print("Check arrary after 60sec::: ",arr_countData)
                print("Check arrary count after 60sec",arr_countData.count)
            }
            
            
            
            
            if array_data.count == 20
            {
                helloWorldTimer?.invalidate()
            }
            else
            {
        
        if arr_countData.count == 1
        {
            
             hard_countTimer = Timer.scheduledTimer(timeInterval: 60.0, target: self, selector: #selector(ViewController.countnumber), userInfo: "Yes", repeats: true)
            
//            hard_countTimer = Timer.scheduledTimer(timeInterval: 60.0, target: self, selector: #selector(ViewController.countnumber), userInfo: "10", repeats: true)
            
//            perform(#selector(countnumber(sTr_count:)), with: "no", afterDelay: 60.0)
            
            helloWorldTimer = Timer.scheduledTimer(timeInterval: 10.0, target: self, selector: #selector(ViewController.enterNumber), userInfo: nil, repeats: true)
            
        }
        
        if arr_countData.count == 2
        {
            helloWorldTimer?.invalidate()
            hard_countTimer?.invalidate()
            
//            perform(#selector(countnumber(sTr_count:)), with: "Yes", afterDelay: 60.0)
            
             hard_countTimer = Timer.scheduledTimer(timeInterval: 60.0, target: self, selector: #selector(ViewController.countnumber), userInfo: "Yes", repeats: true)
            
            helloWorldTimer = Timer.scheduledTimer(timeInterval: 9.0, target: self, selector: #selector(ViewController.enterNumber), userInfo: nil, repeats: true)
        }
        
        if arr_countData.count == 3
        {
            helloWorldTimer?.invalidate()
            hard_countTimer?.invalidate()
            
//            perform(#selector(countnumber(sTr_count:)), with: "Yes", afterDelay: 60.0)
            hard_countTimer = Timer.scheduledTimer(timeInterval: 60.0, target: self, selector: #selector(ViewController.countnumber), userInfo: "Yes", repeats: true)
            
            helloWorldTimer = Timer.scheduledTimer(timeInterval: 8.0, target: self, selector: #selector(ViewController.enterNumber), userInfo: nil, repeats: true)
        }
        
        if arr_countData.count == 4
        {
            helloWorldTimer?.invalidate()
            hard_countTimer?.invalidate()
            
//            perform(#selector(countnumber(sTr_count:)), with: "Yes", afterDelay: 60.0)
            
             hard_countTimer = Timer.scheduledTimer(timeInterval: 60.0, target: self, selector: #selector(ViewController.countnumber), userInfo: "Yes", repeats: true)
            
            helloWorldTimer = Timer.scheduledTimer(timeInterval: 7.0, target: self, selector: #selector(ViewController.enterNumber), userInfo: nil, repeats: true)
        }
        
        if arr_countData.count == 5
        {
            helloWorldTimer?.invalidate()
            hard_countTimer?.invalidate()
            
//            perform(#selector(countnumber(sTr_count:)), with: "Yes", afterDelay: 60.0)
             hard_countTimer = Timer.scheduledTimer(timeInterval: 60.0, target: self, selector: #selector(ViewController.countnumber), userInfo: "Yes", repeats: true)
            
            helloWorldTimer = Timer.scheduledTimer(timeInterval: 6.0, target: self, selector: #selector(ViewController.enterNumber), userInfo: nil, repeats: true)
        }
        
        if arr_countData.count == 6
        {
            helloWorldTimer?.invalidate()
            hard_countTimer?.invalidate()
            
//            perform(#selector(countnumber(sTr_count:)), with: "Yes", afterDelay: 60.0)
            
             hard_countTimer = Timer.scheduledTimer(timeInterval: 60.0, target: self, selector: #selector(ViewController.countnumber), userInfo: "Yes", repeats: true)
            
            helloWorldTimer = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(ViewController.enterNumber), userInfo: nil, repeats: true)
        }
        
        if arr_countData.count == 7
        {
            helloWorldTimer?.invalidate()
            hard_countTimer?.invalidate()
            
//            perform(#selector(countnumber(sTr_count:)), with: "Yes", afterDelay: 60.0)
            
             hard_countTimer = Timer.scheduledTimer(timeInterval: 60.0, target: self, selector: #selector(ViewController.countnumber), userInfo: "Yes", repeats: true)
            
            helloWorldTimer = Timer.scheduledTimer(timeInterval: 4.0, target: self, selector: #selector(ViewController.enterNumber), userInfo: nil, repeats: true)
        }
        
        if arr_countData.count == 8
        {
            helloWorldTimer?.invalidate()
            hard_countTimer?.invalidate()
            
//            perform(#selector(countnumber(sTr_count:)), with: "Yes", afterDelay: 60.0)
            
             hard_countTimer = Timer.scheduledTimer(timeInterval: 60.0, target: self, selector: #selector(ViewController.countnumber), userInfo: "Yes", repeats: true)
            
            helloWorldTimer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(ViewController.enterNumber), userInfo: nil, repeats: true)
        }
        
        if arr_countData.count == 9
        {
            helloWorldTimer?.invalidate()
            hard_countTimer?.invalidate()
            
//            perform(#selector(countnumber(sTr_count:)), with: "Yes", afterDelay: 60.0)
            
            hard_countTimer = Timer.scheduledTimer(timeInterval: 60.0, target: self, selector: #selector(ViewController.countnumber), userInfo: "Yes", repeats: true)
            
            helloWorldTimer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(ViewController.enterNumber), userInfo: nil, repeats: true)
        }
        
        
        if arr_countData.count >= 10
        {
            helloWorldTimer?.invalidate()
            hard_countTimer?.invalidate()
            
            hard_countTimer = Timer.scheduledTimer(timeInterval: 60.0, target: self, selector: #selector(ViewController.countnumber), userInfo: "Yes", repeats: true)
            
//            perform(#selector(countnumber(sTr_count:)), with: "Yes", afterDelay: 60.0)
            
            helloWorldTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(ViewController.enterNumber), userInfo: nil, repeats: true)
        }
            
        }
            
            
        }
        
        
//        hard_countTimer?.invalidate()
       
        
        
    }
    
//    func countnumber(message: String)
//    {
//        
//        arr_countData.append(message)
//        
//        print("Check arrary after 60sec::: ",arr_countData)
//        
//        print("Check arrary count after 60sec",arr_countData.count)
//        
//        helloWorldTimer = Timer.scheduledTimer(timeInterval: 9.0, target: self, selector: #selector(ViewController.enterNumber), userInfo: nil, repeats: true)
//        
//        
//    }
    
    //Re Enter Number in Hard Level
    
    func enterNumber()
    {
        
        print(number_Array1)
        
        
//        print(arr_reEnter)
//        
//        print(arr_reEnter_all)
//        
//        arr_reEnter_all.removeFirst()
//        
//        print(arr_reEnter_all)
//        
////        arr_reEnter_all.append(contentsOf: 0)
//        arr_reEnter_all.insert(arr_reEnter, at: 0)
//        
//        print(arr_reEnter_all)
        
        
        
//        let array_data = number_Array1.filter{$0 != ""}
//        
//        if array_data.count==20
//        {
//            perform(#selector(gameOverHard), with: nil, afterDelay: 1.0)
//        }
        
        
        
//        if number_Array1 == ["", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""]
//        {
//            helloWorldTimer?.invalidate()
//            hard_countTimer?.invalidate()
//            
//            timerRunning = false
//            timer.invalidate()
////            let push = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "hardGameOver_View") as! hardGameOver_View
////            
////            push.sTr_score = lbl_for_best_Score.text!
////            
////            self.navigationController?.pushViewController(push, animated: true)
//            
//            
//            if sTR_stopScreen == ""
//            {
//                sTR_stopScreen = "No"
//                let push = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "hardGameOver_View") as! hardGameOver_View
//                
//                push.sTr_score = lbl_for_best_Score.text!
//                
//                self.navigationController?.pushViewController(push, animated: true)
//            }
//        }
        
//        else
//        {
        
        if number_Array1 .contains("")
        {
            
            print("Array number", number_Array1)
            
            print("Arr_reEnter number", arr_reEnter)
            
//            print("Array data in undo",arr_reEnter_all)
            
//            arr_reEnter = arr_reEnter_all.last as! [String]
            
            print("Dataaa ",arr_reEnter)
            
//            arr_reEnter_all.removeLast()
            
            for i in 0..<arr_reEnter.count
            {
                let indexData = index_view.last
//                print("IndexData",indexData!)
                
                let indexValue = indexData
                
                print("IndexData value",indexValue!)
                
                let a:Int? = Int(indexValue!)
                
                print("INTERGER index fill::", a!)
                
                number_Array1[a!] = arr_reEnter.first!
                
                arr_reEnter.removeFirst()
                index_view.removeLast()
                
                collection_view.reloadData()
                
                return
                    
                
            }
            
            print("Array number Add", number_Array1)
            
            print("Index value", index_data)
            
            print("Last Enter ",arr_reEnter)
            
            print("Number Array count:: ",number_Array1.count)
            
        }
        
        else
        {
            perform(#selector(gameOverHard), with: nil, afterDelay: 1.0)
        }
            
//        }
        
        helloWorldTimer?.invalidate()
        
        
    }
    
    func gameOverHard()
    {
        
        let array_data = number_Array1.filter{$0 != ""}
        
        
        print("Array data:: ",array_data)
        print("Array data:: ",array_data.count)
        
//        if number_Array1 == ["", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""]
//        {
//              hard_countTimer?.invalidate()
//            timerRunning = false
////            timer.invalidate()
//            
//            timer.invalidate()
//            
//            arr_reEnter.removeAll()
//            
//            helloWorldTimer?.invalidate()
//            hard_countTimer?.invalidate()
//            
//            timerRunning = false
//            
////            timer.invalidate()
//            
//          timer.invalidate()
//            
//            if sTR_stopScreen == ""
//            {
//            
//                sTR_stopScreen = "No"
//                let push = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "hardGameOver_View") as! hardGameOver_View
//            
//            push.sTr_score = lbl_for_best_Score.text!
//            
//            self.navigationController?.pushViewController(push, animated: true)
//                
//            }
//            
//        }
        

       if !number_Array1.contains("")  && array_data.count == 20
        {
            timerRunning = false
            timer.invalidate()
            
//            timer?.invalidate()
            arr_reEnter.removeAll()
            
            helloWorldTimer?.invalidate()
            hard_countTimer?.invalidate()
            timerRunning = false
            timer.invalidate()
            
//            timer?.invalidate()
            
            if sTR_stopScreen == ""
            {
                sTR_stopScreen = "No"
                let push = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "hardGameOver_View") as! hardGameOver_View
                
                push.sTr_score = lbl_for_best_Score.text!
                
                self.navigationController?.pushViewController(push, animated: true)
            }
            
        }
            
        
    }
    
    func Func_for_lowtime()
    {
        print("Timer::: ", highTimer)
        if highTimer >= fixtimer
        {
            let minutesLeft = Int(highTimer) / 60 % 60
            let secondsLeft = Int(highTimer) % 60
           
            lbl_for_best_Score.text = "\(minutesLeft):\(secondsLeft)"
        }
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return number_Array1.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! numberCollectionViewCell
        
        //For hard level
        
        if sTr_level == "hard"
        {
            
            if (removeArray .contains(number_Array1[indexPath.item]) && arr_index.contains(String(indexPath.item)) || removeArray .contains(number_Array1[indexPath.item]) && Array_for_undo_index.contains(String(indexPath.item)))
            {
                
                cell.layer.backgroundColor = UIColor.init(red:204/255.0, green:204/255.0, blue:255/255.0, alpha: 1.0).cgColor
                
//                cell.backgroundColor = UIColor.cyan
                
                //                        cell.layer.backgroundColor = UIColor.init(red:82/255.0, green:138/255.0, blue:299/255.0, alpha: 1.0).cgColor
                
                cell.layer.shadowOffset = CGSize(width: 1, height: 5)
                cell.layer.shadowRadius = 2.0
                cell.layer.shadowOpacity = 1
                cell.layer.masksToBounds = false
                collectionView.clipsToBounds = false
                 cell.number_lbl.textColor = UIColor.black
                cell.number_lbl.text = number_Array1[indexPath.item]
                
            }
                
            else
            {
                cell.number_lbl.text = " "
                cell.number_lbl.textColor = UIColor.clear
                cell.layer.borderWidth = 1
                cell.layer.cornerRadius=5;
                cell.backgroundColor = UIColor.white
                cell.layer.backgroundColor = UIColor.init(red:196/255.0, green:227/255.0, blue:245/255.0, alpha: 1.0).cgColor
                cell.layer.shadowOffset = CGSize(width: 0, height: 0)
                cell.layer.shadowRadius = 0.0
                cell.layer.shadowOpacity = 0
                cell.layer.masksToBounds = false
                collectionView.clipsToBounds = false
                cell.layer.borderColor = UIColor.clear.cgColor
                
                
                if arr_indexPath_flip.count>0
                {
                     cell.number_lbl.textColor = UIColor.clear
                    
                    print("Cell array indexpath:: ",arr_indexPath_flip)
                    
//                    cell.number_lbl.text = ""
                    
                    if arr_indexPath_flip.contains(String(indexPath.item))
                    {
//                        cell.number_lbl.transform = CGAffineTransform(scaleX: -1, y: 1);
//                        cell.number_lbl.backgroundColor = UIColor.purple

                        cell.number_lbl.backgroundColor = UIColor.init(red:204/255.0, green:204/255.0, blue:255/255.0, alpha: 1.0)
                        
                        let data_index = String(indexPath.item)
                        let index =  self.arr_indexPath_flip.index(of:data_index)
                        self.arr_indexPath_flip.remove(at: index!)
                        
                        print("Cell array indexpath: after remove: ",arr_indexPath_flip)
                        
//                        cell.number_lbl.text = number_Array1[indexPath.item]
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() , execute:
                            {
                                self.animatedlbl(lblname: cell.number_lbl)
                        })

                        
                        
                        
//                        cell.number_lbl.text = ""
//                        cell.number_lbl.textColor = UIColor.black
                        
                        
//                         UIView.transition(with: cell.number_lbl, duration: 0.3, options: .transitionFlipFromRight, animations: nil, completion: nil)
                        
                        
//                        UIView.transition(with: cell.number_lbl, duration: 0.5, options: .transitionFlipFromRight, animations:
//                            {
////                                lblname.textColor = UIColor.black
//                                cell.number_lbl.backgroundColor = UIColor.clear
//                        })
                        
                        
                        
                        //                        cell.number_lbl.flipRight()
                        
                        
                    }

                    else
                    {
                         cell.number_lbl.backgroundColor = UIColor.clear
                        cell.number_lbl.textColor = UIColor.black
                        cell.number_lbl.text = number_Array1[indexPath.item]
                    }
                }
                else
                {
                     cell.number_lbl.textColor = UIColor.black
                     cell.number_lbl.text = number_Array1[indexPath.item]
                }
                
            }
            
        }
        
        
            // for "Extreme" level
        
            if sTr_level == "Extreme"
            {
                if (removeArray .contains(number_Array1[indexPath.item]) && arr_index.contains(String(indexPath.item)) || removeArray .contains(number_Array1[indexPath.item]) && Array_for_undo_index.contains(String(indexPath.item)))
                {
                    cell.layer.backgroundColor = UIColor.init(red:204/255.0, green:204/255.0, blue:255/255.0, alpha: 1.0).cgColor
                    
                    //                cell.backgroundColor = UIColor.cyan
                    
                    //                        cell.layer.backgroundColor = UIColor.init(red:82/255.0, green:138/255.0, blue:299/255.0, alpha: 1.0).cgColor
                    
                    cell.layer.shadowOffset = CGSize(width: 1, height: 5)
                    cell.layer.shadowRadius = 2.0
                    cell.layer.shadowOpacity = 1
                    cell.layer.masksToBounds = false
                    collectionView.clipsToBounds = false
                    cell.number_lbl.text = number_Array1[indexPath.item]
//                    cell.number_lbl.transform = CGAffineTransform(scaleX: -1, y: 1.0);
                }
                    
                else
                {
                    cell.layer.borderWidth = 1
                    cell.layer.cornerRadius=5;
                    cell.number_lbl.text = number_Array1[indexPath.item]
//                    cell.backgroundColor = UIColor.white
                    
                    cell.layer.backgroundColor = UIColor.init(red:196/255.0, green:227/255.0, blue:245/255.0, alpha: 1.0).cgColor
                    
                    cell.layer.shadowOffset = CGSize(width: 0, height: 0)
                    cell.layer.shadowRadius = 0.0
                    cell.layer.shadowOpacity = 0
                    cell.layer.masksToBounds = false
                    collectionView.clipsToBounds = false
                    cell.layer.borderColor = UIColor.clear.cgColor
                    
//                    cell.number_lbl.transform = CGAffineTransform(scaleX: -1, y: 1.0);
                    
                }
            }
            
        if sTr_level == "Extreme_yes"
        {
            if (removeArray .contains(number_Array1[indexPath.item]) && arr_index.contains(String(indexPath.item)) || removeArray .contains(number_Array1[indexPath.item]) && Array_for_undo_index.contains(String(indexPath.item)))
            {
                
                cell.layer.backgroundColor = UIColor.init(red:204/255.0, green:204/255.0, blue:255/255.0, alpha: 1.0).cgColor
                
                //                cell.backgroundColor = UIColor.cyan
                
                //                        cell.layer.backgroundColor = UIColor.init(red:82/255.0, green:138/255.0, blue:299/255.0, alpha: 1.0).cgColor
                
                cell.layer.shadowOffset = CGSize(width: 1, height: 5)
                cell.layer.shadowRadius = 2.0
                cell.layer.shadowOpacity = 1
                cell.layer.masksToBounds = false
                collectionView.clipsToBounds = false
                
                cell.number_lbl.text = number_Array1[indexPath.item]
                
                print("Remove Arrayyyy for extreme level ", removeArray)
                if removeArray.last == number_Array1[indexPath.row]
                {
                   cell.number_lbl.isHidden = false
                }
                else
                {
                    cell.number_lbl.isHidden = true
                }
                
                
                
                //                    cell.number_lbl.transform = CGAffineTransform(scaleX: -1, y: 1.0);
                
                
            }
            else
            {
                
                if number_Array1[indexPath.item] == ""
                {
                    cell.layer.borderWidth = 1
                    cell.layer.cornerRadius=5;
                    cell.number_lbl.text = number_Array1[indexPath.item]
                    cell.backgroundColor = UIColor.clear
                    cell.layer.shadowOffset = CGSize(width: 0, height: 0)
                    cell.layer.shadowRadius = 0.0
                    cell.layer.shadowOpacity = 0
                    cell.layer.masksToBounds = false
                    collectionView.clipsToBounds = false
                    cell.layer.borderColor = UIColor.clear.cgColor
                }
                
                else
                {
                cell.layer.borderWidth = 1
                cell.layer.cornerRadius=5;
                cell.number_lbl.text = number_Array1[indexPath.item]
//                cell.backgroundColor = UIColor.white
                    cell.layer.backgroundColor = UIColor.init(red:196/255.0, green:227/255.0, blue:245/255.0, alpha: 1.0).cgColor
                    
                cell.layer.shadowOffset = CGSize(width: 0, height: 0)
                cell.layer.shadowRadius = 0.0
                cell.layer.shadowOpacity = 0
                cell.layer.masksToBounds = false
                collectionView.clipsToBounds = false
                cell.layer.borderColor = UIColor.clear.cgColor

                //                cell.number_lbl.isHidden = true
                
                
                if removeArray.last == number_Array1[indexPath.row]
                {
                    cell.number_lbl.isHidden = false
                }
                else
                {
                    cell.number_lbl.isHidden = true
                }

                }
                
                //                    cell.number_lbl.transform = CGAffineTransform(scaleX: -1, y: 1.0);
                
            }
        }
            
            
        
            //For easy level
        else if sTr_level == "easy"
        {
        
        //Undo check
        if undo_click == true
        {
            if arr_index.contains(String(indexPath.item))
            
//            if removeArray .contains(number_Array1[indexPath.item])
            {
//                cell.backgroundColor = UIColor.cyan
                
                cell.layer.backgroundColor = UIColor.init(red:204/255.0, green:204/255.0, blue:255/255.0, alpha: 1.0).cgColor
                
                cell.layer.shadowOffset = CGSize(width: 1, height: 5)
                cell.layer.shadowRadius = 2.0
                cell.layer.shadowOpacity = 1
                cell.layer.masksToBounds = false
                collectionView.clipsToBounds = false
                cell.number_lbl.text = number_Array1[indexPath.item]
                
                
            }
            
          else if hintClick == true
            {
                if arr_hint.contains(number_Array1[indexPath.item])
                {
                    let bounds = cell.number_lbl.bounds
                    
                    UIView.animate(withDuration: 1.0, delay: 0.0, usingSpringWithDamping: 0.2, initialSpringVelocity: 10, options: .curveEaseOut, animations:
                        {
                            cell.number_lbl.bounds = CGRect(x: bounds.origin.x - 20, y: bounds.origin.y, width: bounds.size.width + 20, height: bounds.size.height)
                            //                        cell.number_lbl.isEnabled = false
                    }, completion: nil)
                }
                    
                    
                else if removeArray .contains(number_Array1[indexPath.item])
                {
                    if Array_for_undo.contains(number_Array1[indexPath.item])
                    {
                        cell.layer.backgroundColor = UIColor.init(red:204/255.0, green:204/255.0, blue:255/255.0, alpha: 1.0).cgColor
                        
//                        cell.backgroundColor = UIColor.cyan
                        
//                        cell.layer.backgroundColor = UIColor.init(red:82/255.0, green:138/255.0, blue:299/255.0, alpha: 1.0).cgColor
                        
                        cell.layer.shadowOffset = CGSize(width: 1, height: 5)
                        cell.layer.shadowRadius = 2.0
                        cell.layer.shadowOpacity = 1
                        cell.layer.masksToBounds = false
                        collectionView.clipsToBounds = false
                        cell.number_lbl.text = number_Array1[indexPath.item]
                        

                    }
                    else
                    {
                        
                        cell.layer.backgroundColor = UIColor.init(red:204/255.0, green:204/255.0, blue:255/255.0, alpha: 1.0).cgColor
                        
//                        cell.backgroundColor = UIColor.cyan
                        
                        cell.layer.shadowOffset = CGSize(width: 1, height: 5)
                        cell.layer.shadowRadius = 2.0
                        cell.layer.shadowOpacity = 1
                        cell.layer.masksToBounds = false
                        collectionView.clipsToBounds = false
                        cell.number_lbl.text = number_Array1[indexPath.item]
                        
                        
                 
                    }
                    
                }
                    
                else
                {
                    cell.layer.borderWidth = 1
                    cell.layer.cornerRadius=5;
                    cell.number_lbl.text = number_Array1[indexPath.item]
//                    cell.backgroundColor = UIColor.white
                    cell.layer.backgroundColor = UIColor.init(red:196/255.0, green:227/255.0, blue:245/255.0, alpha: 1.0).cgColor
                    
                    
                    if arr_indexPath_flip.count>0
                    {
                        //                    print(arr_indexPath_flip)
                        
                        if arr_indexPath_flip.contains(String(indexPath.item))
                        {
                            
                            cell.number_lbl.backgroundColor = UIColor.init(red:204/255.0, green:204/255.0, blue:255/255.0, alpha: 1.0)
                            
                            let data_index = String(indexPath.item)
                            let index =  self.arr_indexPath_flip.index(of:data_index)
                            self.arr_indexPath_flip.remove(at: index!)
                            
                            print("Cell array indexpath: after remove: ",arr_indexPath_flip)
                            
                            //                        cell.number_lbl.text = number_Array1[indexPath.item]
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() , execute:
                                {
                                    self.animatedlbl(lblname: cell.number_lbl)
                            })
                            
                            
                            
//                            let transitionOptions: UIViewAnimationOptions = [.transitionFlipFromRight, .showHideTransitionViews]
//
//                            UIView.transition(with: cell.number_lbl, duration: 1.0, options: transitionOptions, animations:
//                                {
//                                    cell.number_lbl.text = self.number_Array1[indexPath.item]
//                                    
//                                    var data_index = String(indexPath.item) as! String
//                                    
//                                    let index =  self.arr_indexPath_flip.index(of:data_index)
//                                    
//                                    self.arr_indexPath_flip.remove(at: index!)
//                                    
//                                    //                                self.arr_indexPath_flip.remove(at: indexPath.item)
//                                    
//                            })

                            
//                            UIView.transition(with: cell.number_lbl, duration: 1.0, options: transitionOptions, animations:
//                                {
//                                    cell.number_lbl.text = ""
//                                    cell.number_lbl.isHidden = false
//                                    var data_index = String(indexPath.item)
//                                    let index =  self.arr_indexPath_flip.index(of:data_index)
//                                    self.arr_indexPath_flip.remove(at: index!)
//                                    
//                                                                        //                                self.arr_indexPath_flip.remove(at: indexPath.item)
//                                    
//                            })
                            
                        }
                            
                        else
                        {
                            cell.number_lbl.text = number_Array1[indexPath.item]
                        }
                    }
                    
                    
                    cell.layer.shadowOffset = CGSize(width: 0, height: 0)
                    cell.layer.shadowRadius = 0.0
                    cell.layer.shadowOpacity = 0
                    cell.layer.masksToBounds = false
                    collectionView.clipsToBounds = false
                    cell.layer.borderColor = UIColor.clear.cgColor
                }
                
            }
                
            else
            {
                cell.layer.borderWidth = 1
                cell.layer.cornerRadius=5;
                cell.number_lbl.text = number_Array1[indexPath.item]
//                cell.backgroundColor = UIColor.white
                cell.layer.backgroundColor = UIColor.init(red:196/255.0, green:227/255.0, blue:245/255.0, alpha: 1.0).cgColor
                
                
                if arr_indexPath_flip.count>0
                {
                    //                    print(arr_indexPath_flip)
                    
                    if arr_indexPath_flip.contains(String(indexPath.item))
                    {
                        
                        //                        cell.number_lbl.backgroundColor = UIColor.purple
                        
                        cell.number_lbl.backgroundColor = UIColor.init(red:204/255.0, green:204/255.0, blue:255/255.0, alpha: 1.0)
                        
                        let data_index = String(indexPath.item)
                        let index =  self.arr_indexPath_flip.index(of:data_index)
                        self.arr_indexPath_flip.remove(at: index!)
                        
                        print("Cell array indexpath: after remove: ",arr_indexPath_flip)
                        
                        
                        //                        let transitionOptions: UIViewAnimationOptions = [.transitionFlipFromRight, .showHideTransitionViews]
                        //
                        //                        UIView.transition(with: cell.number_lbl, duration: 1.0, options: transitionOptions, animations:
                        //                            {
                        //                                //            lblname.backgroundColor = UIColor.clear
                        //                        })
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() , execute:
                            {
                                self.animatedlbl(lblname: cell.number_lbl)
                        })
                        
                    }

                        
                    else
                    {
                        cell.number_lbl.text = number_Array1[indexPath.item]
                    }
                }
                
                else
                {
                    cell.number_lbl.text = number_Array1[indexPath.item]
                }
                
                
                
                cell.layer.shadowOffset = CGSize(width: 0, height: 0)
                cell.layer.shadowRadius = 0.0
                cell.layer.shadowOpacity = 0
                cell.layer.masksToBounds = false
                collectionView.clipsToBounds = false
                cell.layer.borderColor = UIColor.clear.cgColor
            }
            
        }
            
        if hintClick == true
        {
            if arr_hint_index.contains(String(indexPath.item))
            {
                cell.layer.borderWidth = 1
                cell.layer.cornerRadius=5;
                cell.number_lbl.text = number_Array1[indexPath.item]
//                cell.backgroundColor = UIColor.white
                
                cell.layer.backgroundColor = UIColor.init(red:196/255.0, green:227/255.0, blue:245/255.0, alpha: 1.0).cgColor
                
                if arr_indexPath_flip.count>0
                {
                    //                    print(arr_indexPath_flip)
                    
                    if arr_indexPath_flip.count>0
                    {
                        //                    print(arr_indexPath_flip)
                        
                        if arr_indexPath_flip.contains(String(indexPath.item))
                        {
                            
                            //                        cell.number_lbl.backgroundColor = UIColor.purple
                            
                            cell.number_lbl.backgroundColor = UIColor.init(red:204/255.0, green:204/255.0, blue:255/255.0, alpha: 1.0)
                            
                            let data_index = String(indexPath.item)
                            let index =  self.arr_indexPath_flip.index(of:data_index)
                            self.arr_indexPath_flip.remove(at: index!)
                            
                            print("Cell array indexpath: after remove: ",arr_indexPath_flip)
                            
                            
                            //                        let transitionOptions: UIViewAnimationOptions = [.transitionFlipFromRight, .showHideTransitionViews]
                            //
                            //                        UIView.transition(with: cell.number_lbl, duration: 1.0, options: transitionOptions, animations:
                            //                            {
                            //                                //            lblname.backgroundColor = UIColor.clear
                            //                        })
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() , execute:
                                {
                                    self.animatedlbl(lblname: cell.number_lbl)
                            })
                            
                        }
                            
                            
                        else
                        {
                            cell.number_lbl.text = number_Array1[indexPath.item]
                        }
                    }
                        
                    else
                    {
                        cell.number_lbl.text = number_Array1[indexPath.item]
                    }
                }
                
                cell.layer.shadowOffset = CGSize(width: 0, height: 0)
                cell.layer.shadowRadius = 0.0
                cell.layer.shadowOpacity = 0
                cell.layer.masksToBounds = false
                collectionView.clipsToBounds = false
                cell.layer.borderColor = UIColor.clear.cgColor
                
                
                let bounds = cell.number_lbl.bounds
                UIView.animate(withDuration: 1.0, delay: 0.0, usingSpringWithDamping: 0.2, initialSpringVelocity: 10, options: .curveEaseOut, animations:
                {
                    cell.number_lbl.bounds = CGRect(x: bounds.origin.x - 20, y: bounds.origin.y, width: bounds.size.width + 20, height: bounds.size.height)
                }, completion: nil)
                

            }

          else if removeArray .contains(number_Array1[indexPath.item])
            {
                if Array_for_undo.contains(number_Array1[indexPath.item])
                {
                    if Array_for_undo_index.contains(String(indexPath.item))
                    {
                        
                        cell.layer.backgroundColor = UIColor.init(red:204/255.0, green:204/255.0, blue:255/255.0, alpha: 1.0).cgColor
                        
//                        cell.backgroundColor = UIColor.cyan
                        
//                        cell.layer.backgroundColor = UIColor.init(red:82/255.0, green:138/255.0, blue:299/255.0, alpha: 1.0).cgColor
                        
                        cell.layer.shadowOffset = CGSize(width: 1, height: 5)
                        cell.layer.shadowRadius = 2.0
                        cell.layer.shadowOpacity = 1
                        cell.layer.masksToBounds = false
                        collectionView.clipsToBounds = false
                        cell.number_lbl.text = number_Array1[indexPath.item]
                        
                    }
            }
                    
                else
                {
                    if arr_index.contains(String(indexPath.item))
                    {
                        
//                        cell.backgroundColor = UIColor.cyan
                        cell.layer.backgroundColor = UIColor.init(red:204/255.0, green:204/255.0, blue:255/255.0, alpha: 1.0).cgColor
                        
                        cell.layer.shadowOffset = CGSize(width: 1, height: 5)
                        cell.layer.shadowRadius = 2.0
                        cell.layer.shadowOpacity = 1
                        cell.layer.masksToBounds = false
                        collectionView.clipsToBounds = false
                        cell.number_lbl.text = number_Array1[indexPath.item]
                        
                    }
                    
                }
                
            }
                
            else
            {
                cell.layer.borderWidth = 1
                cell.layer.cornerRadius=5;
                cell.number_lbl.text = number_Array1[indexPath.item]
//                cell.backgroundColor = UIColor.white
                cell.layer.backgroundColor = UIColor.init(red:196/255.0, green:227/255.0, blue:245/255.0, alpha: 1.0).cgColor
                
                if arr_indexPath_flip.count>0
                {
                    //                    print(arr_indexPath_flip)
                    
                    if arr_indexPath_flip.count>0
                    {
                        //                    print(arr_indexPath_flip)
                        
                        if arr_indexPath_flip.contains(String(indexPath.item))
                        {
                            
                            //                        cell.number_lbl.backgroundColor = UIColor.purple
                            
                            cell.number_lbl.backgroundColor = UIColor.init(red:204/255.0, green:204/255.0, blue:255/255.0, alpha: 1.0)
                            
                            let data_index = String(indexPath.item)
                            let index =  self.arr_indexPath_flip.index(of:data_index)
                            self.arr_indexPath_flip.remove(at: index!)
                            
                            print("Cell array indexpath: after remove: ",arr_indexPath_flip)
                            
                            
                            //                        let transitionOptions: UIViewAnimationOptions = [.transitionFlipFromRight, .showHideTransitionViews]
                            //
                            //                        UIView.transition(with: cell.number_lbl, duration: 1.0, options: transitionOptions, animations:
                            //                            {
                            //                                //            lblname.backgroundColor = UIColor.clear
                            //                        })
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() , execute:
                                {
                                    self.animatedlbl(lblname: cell.number_lbl)
                            })
                            
                        }
                            
                            
                        else
                        {
                            cell.number_lbl.text = number_Array1[indexPath.item]
                        }
                    }
                        
                    else
                    {
                        cell.number_lbl.text = number_Array1[indexPath.item]
                    }
                }
                
                
                cell.layer.shadowOffset = CGSize(width: 0, height: 0)
                cell.layer.shadowRadius = 0.0
                cell.layer.shadowOpacity = 0
                cell.layer.masksToBounds = false
                collectionView.clipsToBounds = false
                cell.layer.borderColor = UIColor.clear.cgColor
            }

        }
        
        if hintClick == false && undo_click == false
        {
            cell.layer.borderWidth = 1
            cell.layer.cornerRadius=5;
            cell.number_lbl.text = number_Array1[indexPath.item]
//            cell.backgroundColor = UIColor.white
            cell.layer.backgroundColor = UIColor.init(red:196/255.0, green:227/255.0, blue:245/255.0, alpha: 1.0).cgColor
            
            if arr_indexPath_flip.count>0
            {
                //                    print(arr_indexPath_flip)
                
                if arr_indexPath_flip.count>0
                {
                    //                    print(arr_indexPath_flip)
                    
                    if arr_indexPath_flip.contains(String(indexPath.item))
                    {
                        
                        //                        cell.number_lbl.backgroundColor = UIColor.purple
                        
                        cell.number_lbl.backgroundColor = UIColor.init(red:204/255.0, green:204/255.0, blue:255/255.0, alpha: 1.0)
                        
                        let data_index = String(indexPath.item)
                        let index =  self.arr_indexPath_flip.index(of:data_index)
                        self.arr_indexPath_flip.remove(at: index!)
                        
                        print("Cell array indexpath: after remove: ",arr_indexPath_flip)
                        
                        
                        //                        let transitionOptions: UIViewAnimationOptions = [.transitionFlipFromRight, .showHideTransitionViews]
                        //
                        //                        UIView.transition(with: cell.number_lbl, duration: 1.0, options: transitionOptions, animations:
                        //                            {
                        //                                //            lblname.backgroundColor = UIColor.clear
                        //                        })
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() , execute:
                            {
                                self.animatedlbl(lblname: cell.number_lbl)
                        })
                        
                    }
                        
                        
                    else
                    {
                        cell.number_lbl.text = number_Array1[indexPath.item]
                    }
                }
                    
                else
                {
                    cell.number_lbl.text = number_Array1[indexPath.item]
                }
            }
            
            cell.layer.shadowOffset = CGSize(width: 0, height: 0)
            cell.layer.shadowRadius = 0.0
            cell.layer.shadowOpacity = 0
            cell.layer.masksToBounds = false
            collectionView.clipsToBounds = false
            cell.layer.borderColor = UIColor.clear.cgColor
            
        }
        
        }
        
        switch sTr_model
        {
        case "iPhone 5":
            
            cell.frame = CGRect(x: cell.frame.origin.x, y: cell.frame.origin.y, width: cell.frame.size.width, height: cell.frame.size.height)
            
            break
            
        case "iPhone 5c":
            
            cell.frame = CGRect(x: cell.frame.origin.x, y: cell.frame.origin.y, width: cell.frame.size.width, height: cell.frame.size.height)
            
            //            return "iPhone 5c"
            
            break
            
            
        case "iPhone 5s":
            
            cell.frame = CGRect(x: cell.frame.origin.x, y: cell.frame.origin.y, width: cell.frame.size.width, height: cell.frame.size.height)
            
            
            //            return "iPhone 5s"
            
            break
            
        case "iPhone 6":
            
             cell.frame = CGRect(x: cell.frame.origin.x, y: cell.frame.origin.y, width: cell.frame.size.width+8, height: cell.frame.size.height+8)
            
            //            return "iPhone 6"
            
            break
        case "iPhone 6 Plus":
            //            return "iPhone 6 Plus"
            
             cell.frame = CGRect(x: cell.frame.origin.x, y: cell.frame.origin.y, width: cell.frame.size.width+8, height: cell.frame.size.height+8)
            
            break
            
            
        case "iPhone 6s":
            
             cell.frame = CGRect(x: cell.frame.origin.x, y: cell.frame.origin.y, width: cell.frame.size.width+8, height: cell.frame.size.height+8)
            
            //            return "iPhone 6s"
            break
            
        case "iPhone 6s Plus":
            
            
             cell.frame = CGRect(x: cell.frame.origin.x, y: cell.frame.origin.y, width: cell.frame.size.width+8, height: cell.frame.size.height+8)
            
            //            return "iPhone 6s Plus"
            break
            
            
        case "iPhone 7":
            //            return "iPhone 7"
            
//            cell.frame = CGRect(x: cell.frame.origin.x, y: cell.frame.origin.y, width: cell.frame.size.width+3, height: cell.frame.size.height+5)

            cell.frame = CGRect(x: cell.frame.origin.x, y: cell.frame.origin.y, width: cell.frame.size.width+5, height: cell.frame.size.height+12)
            
            break
            
            
        case "iPhone 7 Plus":
            
            //            return "iPhone 7 Plus"
            
//            cell.frame = CGRect(x: cell.frame.origin.x, y: cell.frame.origin.y, width: cell.frame.size.width+8, height: cell.frame.size.height+8)

//            cell.frame = CGRect(x: cell.frame.origin.x, y: cell.frame.origin.y, width: cell.frame.size.width+3, height: cell.frame.size.height+5)

            cell.frame = CGRect(x: cell.frame.origin.x, y: cell.frame.origin.y, width: cell.frame.size.width+5, height: cell.frame.size.height+12)
            
            
            
            break
            
        case "iPhone SE":
            //            return "iPhone SE"
            
            cell.frame = CGRect(x: cell.frame.origin.x, y: cell.frame.origin.y, width: cell.frame.size.width, height: cell.frame.size.height)
            
            
            break
            
            
        case "iPhone 8":
            
//             cell.frame = CGRect(x: cell.frame.origin.x, y: cell.frame.origin.y, width: cell.frame.size.width+8, height: cell.frame.size.height+8)

//            cell.frame = CGRect(x: cell.frame.origin.x, y: cell.frame.origin.y, width: cell.frame.size.width+3, height: cell.frame.size.height+5)

            cell.frame = CGRect(x: cell.frame.origin.x, y: cell.frame.origin.y, width: cell.frame.size.width+5, height: cell.frame.size.height+12)
            
            //            return "iPhone 8"
            
            break
            
        case "iPhone 8 Plus":

            cell.frame = CGRect(x: cell.frame.origin.x, y: cell.frame.origin.y, width: cell.frame.size.width+5, height: cell.frame.size.height+12)
            
//             cell.frame = CGRect(x: cell.frame.origin.x, y: cell.frame.origin.y, width: cell.frame.size.width+8, height: cell.frame.size.height+8)
            //            return "iPhone 8 Plus"
            
            break
            
        case "iPhone X":
            
//             cell.frame = CGRect(x: cell.frame.origin.x, y: cell.frame.origin.y, width: cell.frame.size.width+8, height: cell.frame.size.height+8)
//            

//            cell.frame = CGRect(x: cell.frame.origin.x, y: cell.frame.origin.y, width: cell.frame.size.width+3, height: cell.frame.size.height+5)

            cell.frame = CGRect(x: cell.frame.origin.x, y: cell.frame.origin.y, width: cell.frame.size.width+5, height: cell.frame.size.height+12)
            
            //            return "iPhone X"
            
            break
            
            
        case "Simulator":
            
//            cell.frame = CGRect(x: cell.frame.origin.x, y: cell.frame.origin.y, width: cell.frame.size.width, height: cell.frame.size.height)

            cell.frame = CGRect(x: cell.frame.origin.x, y: cell.frame.origin.y, width: cell.frame.size.width+5, height: cell.frame.size.height+12)
            
            
            break
            
            
        //            return "Simulator"
            
            
        default:
            
            break
            //            return sTr_model
            
            
        }
        
        return cell
        
    }
    
    func animatedlbl(lblname: UILabel)
    {
        let transitionOptions: UIViewAnimationOptions = [.transitionFlipFromRight, .showHideTransitionViews]
        
        UIView.transition(with: lblname, duration: 1.2, options: transitionOptions, animations:
        {
            lblname.textColor = UIColor.black
            lblname.backgroundColor = UIColor.clear
        })
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        
        btn_for_eque.isEnabled = true
        
        if sTr_level == "hard"
        {
            sTr_data_popUP = "Yes"
            
//            hintClick = false
//            undo_click = false
            
//            hard_countTimer = Timer.scheduledTimer(timeInterval: 60.0, target: self, selector: #selector(ViewController.countnumber), userInfo: "1", repeats: true)
            
//            perform(#selector(countnumber(sTr_count:)), with: "Yes", afterDelay: 60.0)
            
//            hard_countTimer = Timer.scheduledTimer(timeInterval: 60.0, target: self, selector: #selector(ViewController.countnumber), userInfo: "Yes", repeats: true)
            
        }
        
        if sTr_level == "Extreme"{}
            
        else if sTr_level == "easy"
        {
            newEasyCounter.invalidate()
            
            hintClick = false
            undo_click = false
        }
        
        
        btn_undo.isEnabled = true
        btn_undo.setTitleColor(UIColor.white, for: UIControlState.normal)
        
        let cell = collectionView.cellForItem(at: indexPath as IndexPath)!as!  numberCollectionViewCell
        
//        cell.layer.backgroundColor = UIColor.init(red:196/255.0, green:227/255.0, blue:245/255.0, alpha: 1.0).cgColor
        
           if cell.backgroundColor == UIColor.init(red:196/255.0, green:227/255.0, blue:245/255.0, alpha: 1.0)
           {
            selected_btn = false
            
            if please_selected == false
            {
                if eque == false
                {
                    if cell.backgroundColor == UIColor.cyan
                    {
                        cell.backgroundColor = UIColor.white
                        
                    }
                    else
                    {
                        let sTr_sound = UserDefaults.standard.object(forKey: "music") as? String
                        if sTr_sound == "on"
                        {
                            audioPlayer.play()
                        }
                        
                        index_value = indexPath.row
                        
                        arr_index.append(String(index_value))
                        
                        selected_number = Int(cell.number_lbl.text!)
                        
                        if selected_number == nil
                        {
                            
                        }
                            
                        else
                        {
                            
//                        cell.backgroundColor = UIColor.cyan
                            
                        cell.layer.backgroundColor = UIColor.init(red:204/255.0, green:204/255.0, blue:255/255.0, alpha: 1.0).cgColor
                            
                        cell.layer.shadowOffset = CGSize(width: 1, height: 5)
                        cell.layer.shadowRadius = 2.0
                        cell.layer.shadowOpacity = 1
                        cell.layer.masksToBounds = false
                        collectionView.clipsToBounds = false
                        selected_number = Int(cell.number_lbl.text!)
                        please_selected = true
                            
//                        cell.number_lbl.isHidden = false
                            
                        }
                    }
                    
//                    if(removeArray.count > 1)
//                    {
//                        removeArray.append(String(selected_number))
//                    }
                    selected_number = Int(cell.number_lbl.text!)
                    
                    if selected_number == nil
                    {
                        
                    }
                        
                    else
                    {
                        removeArray.append(String(selected_number))
                        new_Array.append(String(selected_number))
                        
                        let str_value_data = new_Array.joined(separator: " ")
                        
                        lbl_equvalue.text  = str_value_data
                        
                    }
                    
                    print("Selected number:::: ",selected_number)
                    
                    if afterEqe != 0
                    {
                        if opertion == "/"
                        {
                            print(afterEqe)
                            
                            if  afterEqe % selected_number == 0
                            {
                                afterEqe =  afterEqe / selected_number
                                print("After Equ::: ",afterEqe)
                            }
                            else
                            {
                                selected_number = Int(cell.number_lbl.text!)
                                
                                if selected_number == nil
                                {
                                    
                                }
                                else
                                {
                                self.alertMessageOk(title: "", message: "selected number does not divide a evenly")
//                                cell.backgroundColor = UIColor.white
                            
                                cell.layer.backgroundColor = UIColor.init(red:196/255.0, green:227/255.0, blue:245/255.0, alpha: 1.0).cgColor
                                cell.layer.shadowOffset = CGSize(width: 0, height: 0)
                                cell.layer.shadowRadius = 0
                                cell.layer.shadowOpacity = 0
                                selected_number = Int()
                                    
                                please_selected = true
                                    
                                arr_index.removeLast()
                                removeArray.removeLast()
                                new_Array.removeLast()
                                    
                                new_Array.removeLast()
                                    
                                    let str_value_data = new_Array.joined(separator: " ")
                                    
                                    lbl_equvalue.text  = str_value_data
                                    
                                    
                                    
                                }
                            }
                        }
                        
                        Equr_2()
                    }
                    else
                    {
                        //Here put extra
                        selected_number = Int(cell.number_lbl.text!)
                        if selected_number == nil
                        {
                            
                        }
                        else
                        {
                                afterEqe = selected_number
                        }
                        
                    }
                    
                }
                else
                {
//                    cell.layer.backgroundColor = UIColor.init(red:82/255.0, green:138/255.0, blue:299/255.0, alpha: 1.0).cgColor
                    
//                    if cell.backgroundColor == UIColor.init(red:82/255.0, green:138/255.0, blue:299/255.0, alpha: 1.0)
                    
                    if cell.backgroundColor == UIColor.cyan
                    {
                        cell.backgroundColor = UIColor.white
                    }
                    else
                    {
                        
                        let sTr_sound = UserDefaults.standard.object(forKey: "music") as? String
                        if sTr_sound == "on"
                        {
                            audioPlayer.play()
                        }
                        selected_number = Int(cell.number_lbl.text!)
                        
                        index_value = indexPath.row
                        Array_for_undo_index.append(String(index_value))
                        
                        if selected_number == nil
                        {
                            
                        }
                        else
                        {
                            
                        self.Array_for_undo.append(cell.number_lbl.text!)
                            
                        print("Array for add value", Array_for_undo)
                            
                             cell.layer.backgroundColor = UIColor.init(red:204/255.0, green:204/255.0, blue:255/255.0, alpha: 1.0).cgColor
                            
//                        cell.backgroundColor = UIColor.cyan
                            
//                             cell.layer.backgroundColor = UIColor.init(red:82/255.0, green:138/255.0, blue:299/255.0, alpha: 1.0).cgColor
                            
                        cell.layer.shadowOffset = CGSize(width: 1, height: 5)
                        cell.layer.shadowRadius = 2.0
                        cell.layer.shadowOpacity = 1
                        cell.layer.masksToBounds = false
                        collectionView.clipsToBounds = false
                        selected_number = Int(cell.number_lbl.text!)
                        please_selected = true
                            
                        }
                        
                        print("DAta newwww ",new_Array.last)
                        
                        print("Arayyyyyyy ",new_Array)
                        
                        if selected_number == nil
                        {
                            
                        }
                        else{
                        
                        if new_Array.last == String(selected_number) || new_Array.contains("=")
                        {
                            
                        }
                            
                        else
                        {
                            if new_Array.contains("="){}
                            else{
                            new_Array.append(String(selected_number))
                        
                            let str_value_data = new_Array.joined(separator: " ")
                        
                            lbl_equvalue.text  = str_value_data
                            }
                        }
                    }
                    }
                    print("Remove array", removeArray)
                    print("Selected number", selected_number)
                    
                    if(removeArray.count > 0)
                    {
                        if selected_number == nil
                        {
                            
                        }
                        else
                        {
                        removeArray.append(String(selected_number))
                        new_Array.append(String(selected_number))
                        
                        let str_value_data = new_Array.joined(separator: " ")
                        
                        lbl_equvalue.text  = str_value_data
                        }
                    }
                    
//                    removeArray.append(String(selected_number))
                    print(selected_number)
                    
                    if beforeEqe != 0
                    {
                        if opertion == "/"
                        {
                            print(beforeEqe)
                            if  beforeEqe % selected_number == 0
                            {
                                
                                beforeEqe =  beforeEqe / selected_number
                                print("Before eqe::: ",beforeEqe)
                            }
                                
                            else
                            {
                                let sTr_sound = UserDefaults.standard.object(forKey: "music") as? String
                                if sTr_sound == "on"
                                {
                                    audioPlayer.play()
                                }
                                selected_number = Int(cell.number_lbl.text!)
                                
                                if selected_number == nil
                                {
                                    
                                }
                                    
                                else
                                {
                                    
                                self.alertMessageOk(title: "", message: "selected number does not divide a evenly")
//                                cell.backgroundColor = UIColor.white
                                    cell.backgroundColor = UIColor.init(red:196/255.0, green:227/255.0, blue:245/255.0, alpha: 1.0)
                                cell.layer.shadowOffset = CGSize(width: 0, height: 0)
                                cell.layer.shadowRadius = 0
                                cell.layer.shadowOpacity = 0
                                selected_number = Int()
                                    
                                Array_for_undo_index.removeLast()
                                removeArray.removeLast()
                                new_Array.removeLast()
                                new_Array.removeLast()
                                    
                                Array_for_undo.removeLast()
                                    
                                let str_value_data = new_Array.joined(separator: " ")
                                    
                                lbl_equvalue.text  = str_value_data
                                    
                                    opertion = ""
                                    
                                    please_selected = true
                                    
                                }
                            }
                        }
                        
                        Equr_2_before()
                    }
                    else
                    {
                        selected_number = Int(cell.number_lbl.text!)
                        if selected_number == nil
                        {
                            
                        }
                        else
                        {
                            beforeEqe = selected_number
                        }
                    }
                    
                    
                    if afterEqe == beforeEqe
                    {
                        selected_number = Int(cell.number_lbl.text!)
                        if selected_number == nil
                        {
                            
                        }
                        else
                        {
                            if_value_equre()
                        }
                    }

                    
                }
                
                
            }
            else
            {
                alertMessageOk(title: "", message: "You need to select an equation tool first")
            }

           }
            
        else
        {
            self.alertMessageOk(title: "", message: "Please Select another number")
        }
        
        
        if sTr_level == "hard"
        {
            
        }
        
        else if sTr_level == "Extreme_yes" || sTr_level == "Extreme"
        {
//            cell.number_lbl.isHidden = true
            
            collectionView.reloadData()
            
        }
            
        else
        {
        
        let array_data = number_Array1.filter{$0 != ""}
        
        if array_data.count == 0
        {
            
        }
            
//            else if array_data.count == 2
//            {
//                
//                perform(#selector(popUpapper), with: nil, afterDelay: 3.0)
//            }
//            
//        else if array_data.count == 3
//        {
//            
//            perform(#selector(popUpapper), with: nil, afterDelay: 10.0)
//            
//            }
//            
//        else if array_data.count == 4
//        {
//            
//            perform(#selector(popUpapper), with: nil, afterDelay: 15.0)
//            
//            }
            
            
//                cell.layer.backgroundColor = UIColor.init(red:196/255.0, green:227/255.0, blue:245/255.0, alpha: 1.0).cgColor
                
//                eque = false
//                arr_index.removeAll()
//                new_Array.removeAll()
//                Array_for_undo.removeAll()
//                Array_for_undo_index.removeAll()
//                removeArray.removeAll()
////                array_un.removeAll()
////                arr_index.removeAll()
//  
//                lbl_equvalue.text = ""
//                
//                 self.alertMessageOk(title: "", message: "Can’t create an equation? Use the Undo button to keep playing")
                
//            }

        else
        {
//            if array_data.count == 2
            
//            if array_data.count < 7
//            {
//                
//                eque = false
//                perform(#selector(checkPosiblity), with: nil, afterDelay: 3.0)
//                
//            }
            
//            checkPosiblity()
            
        }
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath)
    {
   
    }
    
    func if_value_equre()
    {
        print("Before que: IS value::: ",beforeEqe)
        print("After eqe: IS value::: ",afterEqe)
        
        please_selected = false
        if beforeEqe == afterEqe
        {
            print("yes u right")
            
//            audioPlayer2.play()
            
            let sTr_sound = UserDefaults.standard.object(forKey: "music") as? String
            if sTr_sound == "on"
            {
                audioPlayer2.play()
            }
            
            
            self.removevlaue()
            
            
            
            
//            let alert = UIAlertController(title: "", message: "You are right", preferredStyle: UIAlertControllerStyle.alert)
//            let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default)
//            {
//                UIAlertAction in
//                self.removevlaue()
//            }
//            alert.addAction(okAction)
//            self.present(alert, animated: true, completion: nil)
        }
            
        else
        {
            
            print("Your r not right")
            
//            let alert = UIAlertController(title: "", message: "You are wrong", preferredStyle: UIAlertControllerStyle.alert)
//            let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default)
//            
////            {
////                UIAlertAction in
////                self.collection_view.reloadData()
////                self.afterEqe = 0
////                self.beforeEqe = 0
////                self.removeArray.removeAll()
////                self.selected_number = 0
////                self.eque = false
////
////            }
//            alert.addAction(okAction)
//            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func removevlaue()
    {
        btn_for_eque.isEnabled = false
        
        print("here array is \(removeArray)")
        
        if sTr_level == "hard"
        {
            arr_indexPath_flip.removeAll()
            
            helloWorldTimer?.invalidate()
            
            hard_countTimer?.invalidate()
            
            print("Number array dataaa ",number_Array1)

            let array_data = number_Array1.filter{$0 != ""}
            
            print("Array dataaa ",array_data)
            
            print("Array remaing count: ",array_data.count)
            
            if number_Array1 == ["", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""]
            {
                
                arr_reEnter.append(contentsOf: removeArray)
                print("Array dataaaa:::: ",arr_reEnter)
                
//                perform(#selector(gameOverHard), with: nil, afterDelay: 3.0)
            }
                
            else
            {
                
//            if array_data.count < 20
//            {
//                
////                helloWorldTimer = Timer.scheduledTimer(timeInterval: 10.0, target: self, selector: #selector(ViewController.enterNumber), userInfo: nil, repeats: true)
//                
//                
//                helloWorldTimer.invalidate()
//                
//                hard_countTimer = Timer.scheduledTimer(timeInterval: 10.0, target: self, selector: #selector(ViewController.countnumber), userInfo: "1", repeats: true)
//                
//                
//            }
                
//            else if array_data.count < 20
//            {
//                hard_countTimer.invalidate()
//                
//                helloWorldTimer = Timer.scheduledTimer(timeInterval: 12.0, target: self, selector: #selector(ViewController.enterNumber), userInfo: nil, repeats: true)
//            }
//                
//            else if array_data.count <= 23
//            {
//                hard_countTimer.invalidate()
//                
//                helloWorldTimer = Timer.scheduledTimer(timeInterval: 18.0, target: self, selector: #selector(ViewController.enterNumber), userInfo: nil, repeats: true)
//            }
                
                
                
            arr_reEnter.append(contentsOf: removeArray)
            print("Array dataaaa:::: ",arr_reEnter)
                
//             print(arr)
            
        }
            
        }
            
        else
        {
                arr_reEnter = removeArray
        }
        
        
        print("Array all data:: ",arr_reEnter_all)
        
        arr_reEnter_all.append(arr_reEnter)
        
        print("arr_reEnter_all :", arr_reEnter_all)
        
        
        score_Count()
        
        let newArray  = removeArray.filter { (string) -> Bool in
            return number_Array1.contains(string)
        }
        
        print("New Array",newArray)
        
        print(arr_index)
        print(Array_for_undo_index)
        
        
//        var Count = 0
        
        var arr_index_final = [String]()
        
        arr_index_final.append(contentsOf: arr_index)
        arr_index_final.append(contentsOf: Array_for_undo_index)
        
        
        arr_indexPath_flip = arr_index_final
        
        
        print(arr_index_final)
        
        for i in 0..<newArray.count
        {
//            var  value_arr = arr_index_final[i]
            
            let myInt = Int(arr_index_final[i])
            
            number_Array1[myInt!] = ""
            index_view.append(String(myInt!))
            
            
        }
        

        Array_for_undo_index.removeAll()
        arr_hint_index.removeAll()
        arr_index.removeAll()
        
        index_data.append(index_view)
        
        print("Dataaaa Index",index_data)
        
        removeArray.removeAll()
        new_Array.removeAll()
        Array_for_undo.removeAll()
        print("here array afert remove value \(removeArray)")
        afterEqe = 0
        beforeEqe = 0
        selected_number = 0
        eque = false
        please_selected = false
        
        bnt_hint.isEnabled = false
        bnt_hint.setTitleColor(UIColor.lightGray, for: UIControlState.normal)
        
        if arr_hint_time.count == 1
        {
            lbl_hintNum.text = "02"
//            bnt_hint.setTitle("Hint(02)",for: .normal)
        }
        if arr_hint_time.count == 2
        {
            lbl_hintNum.text = "01"
//            bnt_hint.setTitle("Hint(01)",for: .normal)
        }
        if arr_hint_time.count == 3
        {
            lbl_hintNum.text = "00"
//            bnt_hint.setTitle("Hint(00)",for: .normal)
        }
        
        if new_Array.count == 0
        {
            lbl_equvalue.text  = " "
        }

        collection_view.reloadData()
        
         let array_data1 = number_Array1.filter{$0 != ""}
        
        print("Array data countttt",array_data1.count)
        
//        if number_Array1 == ["", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "","","",""] || array_data1.count<6
        
            if number_Array1 == ["", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "","","",""]
        {
            if sTr_level == "hard"
            {
//                helloWorldTimer?.invalidate()
//                timerRunning = false
//                timer.invalidate()
//                
//                hard_countTimer?.invalidate()
//                
//                perform(#selector(gameOverHard), with: nil, afterDelay: 1.0)
            }
                
            else
            {
                print("Array data in remove fun::- ",arr_bestTime)
                
                arr_bestTime.append(lbl_for_timer.text!)
            
                print("Array data in remove fun Append ::- ",arr_bestTime)
                perform(#selector(gameOver), with: nil, afterDelay: 0.0)
            }
        }
        
        
        let array_data = number_Array1.filter{$0 != ""}
        
        if array_data.count == 0
        {
            
        }
            
        else if array_data.count < 6
        {
            if sTr_level == "hard"
            {
                
            }
                
            else if sTr_level == "easy"
            {
                 if array_data.count < 5
                {
                    newEasyCounter = Timer.scheduledTimer(timeInterval: 20.0, target: self, selector: #selector(ViewController.popUpapper), userInfo: nil, repeats: true)
                    
                }
                
                
                
//                 if array_data.count == 2 || array_data.count == 1
//                {
//                    sTr_data_popUP = ""
//                    hard_countTimer?.invalidate()
//                    
//                    hard_countTimer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(ViewController.popUpapper), userInfo: nil, repeats: true)
//
////                    perform(#selector(popUpapper), with: nil, afterDelay: 3.0)
//                }
//                    
//                else if array_data.count == 3
//                {
//                    
//                    sTr_data_popUP = ""
//                    hard_countTimer?.invalidate()
//                    
//                    hard_countTimer = Timer.scheduledTimer(timeInterval: 10.0, target: self, selector: #selector(ViewController.popUpapper), userInfo: nil, repeats: true)
//                    
////                    perform(#selector(popUpapper), with: nil, afterDelay: 10.0)
//                }
//                    
//                else if array_data.count == 4
//                {
//                    sTr_data_popUP = ""
//                    
//                    hard_countTimer?.invalidate()
//                    hard_countTimer = Timer.scheduledTimer(timeInterval: 15.0, target: self, selector: #selector(ViewController.popUpapper), userInfo: nil, repeats: true)
//                    
////                    perform(#selector(popUpapper), with: nil, afterDelay: 15.0)
//                }

                
//                checkPosiblity()
            }
        }

        
        
        if sTr_level == "hard"
        {
            if sTr_stopTimer == ""
            {
                sTr_stopTimer = "Yes"
                timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(ViewController.Counting), userInfo: nil, repeats: true)
            }
            
            
            
            
//            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(ViewController.Counting), userInfo: nil, repeats: true)
            
//            timerRunning = true
            
            
//            hard_countTimer = Timer.scheduledTimer(timeInterval: 60.0, target: self, selector: #selector(ViewController.countnumber), userInfo: "Yes", repeats: true)
            
//            if array_data.count < 20
//            {
//                
////                helloWorldTimer.invalidate()
//                
//                hard_countTimer = Timer.scheduledTimer(timeInterval: 10.0, target: self, selector: #selector(ViewController.countnumber), userInfo: "1", repeats: true)
//                
//                
//            }
        }

        
        
        
//        {
//            timer.invalidate()
//            lbl_for_timer.text = "Start"
//            let alert = UIAlertController(title: "", message: "Congratulations you are win", preferredStyle: UIAlertControllerStyle.alert)
//            let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default)
//            {
//                UIAlertAction in
//                self.new_game_start()
//                
//            }
//            alert.addAction(okAction)
//            self.present(alert, animated: true, completion: nil)
//        }
        
    }
    
    func gameOver()
    {
        
        hard_countTimer?.invalidate()

        print("Array data arr_bestTime gameover ::- ",arr_bestTime)
        
        UserDefaults.standard.set(NSKeyedArchiver.archivedData(withRootObject: arr_bestTime), forKey: "BestTime")
        
        //            UserDefaults.standard.set(arr_bestTime, forKey: "BestTime")
        
        var index_value1 = ""
        var arr_time = [String]()
        
        var data: NSData? = nil
        data = UserDefaults.standard.object(forKey: "BestTime") as? NSData
        
        if data == nil
        {
            lbl_bestTime.text =  "00"
        }
            
        else
        {
            
            arr_time = (NSKeyedUnarchiver.unarchiveObject(with: data! as Data) as! NSArray) as! [String]
            
            print("Best score time: ",arr_time)
            
            var a3: Int? = 0

            var a1: Int? = 0
           
            var a2: Int? = 0
            
           if arr_time.count == 0
        {
              lbl_bestTime.text =  "00"
        }
           else
           {
            
            if arr_time.count == 1
            {
                index_value1 = arr_time[0]
            }
            else
            {
                for i in 0 ..< arr_time.count-1
                {
                    var sTr_value = arr_time[i]
                    print(sTr_value)
                    
                    sTr_value = sTr_value.replacingOccurrences(of: ":", with: "")
                    print("String  ",sTr_value)
                    a1 = Int(sTr_value)
                    
                    var sTr_value1 = arr_time[i+1]
                    print(sTr_value1)
                    
                    sTr_value1 = sTr_value1.replacingOccurrences(of: ":", with: "")
                    print("String 2 ",sTr_value1)
                    
                    a2 = Int(sTr_value1)
                    
                    print("1st value",a1!)
                    print("2nd value",a2!)
                    
                    if a3 == 0
                    {
                        if a1! < a2!
                        {
                            a3 = a1!
                            index_value1 = arr_time[i]
                        }
                        else
                        {
                            a3 = a2!
                            index_value1 = arr_time[i+1]
                        }
                    }
                        
                    else
                    {
                        if a3! > a1!
                        {
                            a3 = a1!
                            index_value1 = arr_time[i]
                        }
                        else if a3! > a2!
                        {
                            a3 = a2!
                            index_value1 = arr_time[i+1]
                        }
                        else
                        {
                            let time = index_value1.replacingOccurrences(of: ":", with: "")
                            
                            print("else String ",time)
                            
                            a3 = Int(time)
                            
                            
                            
                        }
                        
                        //                            if a1! < a2!
                        //                            {
                        //                                a3 = a1!
                        //                                index_value = arr_time[i]
                        //                            }
                        //                            else
                        //                            {
                        //                                a3 = a2!
                        //                                index_value = arr_time[i+1]
                        //                            }
                        
                    }
                    
                    
                }
                
            }
            
            }
            
            print(index_value1)
            
            
//            lbl_bestTime.text =  index_value
            
        }
        
        print(lbl_for_timer.text!)
        
        let push = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "gameOverView") as! gameOverView
        
        push.sTr_time = lbl_for_timer.text!
    
        if lbl_bestTime.text == "00"
        {
            push.sTr_score = lbl_for_timer.text!
        }
            
        else
        {
            push.sTr_score = index_value1
        }
        
        self.navigationController?.pushViewController(push, animated: true)
        
    }
    
    func score_Count()
    {
        if removeArray.count == 2
        {
            score = score + 10
            lbl_for_best_Score.text = "\(score)"
        }
       if removeArray.count == 3
        {
            score = score + 30
            lbl_for_best_Score.text = "\(score)"
        }
       if removeArray.count == 4
        {
            score = score + 50
            lbl_for_best_Score.text = "\(score)"
        }
       if removeArray.count == 5
        {
            score = score + 70
            lbl_for_best_Score.text = "\(score)"
        }
       if removeArray.count == 6
        {
            score = score + 100
            lbl_for_best_Score.text = "\(score)"
        }
       if removeArray.count == 7
       {
            score = score + 150
            lbl_for_best_Score.text = "\(score)"
        }
        if removeArray.count == 8
        {
            score = score + 200
            lbl_for_best_Score.text = "\(score)"
        }
        if removeArray.count == 9
        {
            score = score + 250
            lbl_for_best_Score.text = "\(score)"
        }
        
        if removeArray.count > 9
        {
            score = score + 300
            lbl_for_best_Score.text = "\(score)"
        }
        
        print("New Array",new_Array)
        
        if new_Array.contains("*") || new_Array.contains("/")
        {
            score = score + 100
            lbl_for_best_Score.text = "\(score)"
        }
        
    }
    
    func equedone()
    {
        if opertion == "+"
        {
            if beforeEqe == 0
            {
                beforeEqe = selected_number
                
            }
            else
            {
//                beforeEqe = beforeEqe + selected_number
                print(beforeEqe)
            }
        }
        else if opertion == "-"
        {
            if beforeEqe == 0
            {
                beforeEqe = selected_number
                
            }
            else
            {
//                beforeEqe = beforeEqe - selected_number
                print("Done before::: ",beforeEqe)
                
            }
        }
        else if opertion == "*"
        {
            if beforeEqe == 0
            {
                beforeEqe = selected_number
                
            }
            else
            {
//              beforeEqe = beforeEqe * selected_number
                print("Done Brfore equ::: ",beforeEqe)
                
            }
        }
            
        else if opertion == "/"
        {
            if beforeEqe == 0
            {
                beforeEqe = selected_number
                
            }
            else
            {
//                beforeEqe = beforeEqe / selected_number
                  print("Done eque before :::: ",beforeEqe)
                
            }
        }
    }
    
    
    func stopBlink()
    {
//        self.btn_undo.removeAllAnimations()
        self.btn_undo.alpha = 1
    }
    
    func startBlink()
    {
        newEasyCounterStop.invalidate()
        
        UIView.animate(withDuration: 0.2 ,
                       delay:1.0,
                       options:[.allowUserInteraction, .curveEaseInOut, .autoreverse, .repeat],
                       animations:
            {
                
                self.btn_undo.alpha = 0;
                
                  self.btn_undo.addTarget(self, action: #selector(self.undo_btn(_:)), for: .touchUpInside)
                
                
//                self.undo_btn(0)
                
        },
                       completion: nil)
        
        
        newEasyCounterStop = Timer.scheduledTimer(timeInterval: 4.0, target: self, selector: #selector(ViewController.stopBlink), userInfo: nil, repeats: true)
        
        
        
//        stopBlink()
        
//        let secondsLeft = Int(timerCount) % 60
//        print("Seconds blink", secondsLeft)
//        
//        if secondsLeft == 3
//        {
//            stopBlink()
//        }
//        
        
    }
    
    
    
    
    
    //pop up use in easy level
    func popUpapper()
    {
        eque = false
        arr_index.removeAll()
        new_Array.removeAll()
        Array_for_undo.removeAll()
        Array_for_undo_index.removeAll()
        removeArray.removeAll()
        //                array_un.removeAll()
        //                arr_index.removeAll()
        
        lbl_equvalue.text = ""
        
//        arr_bestTime.append(lbl_for_timer.text!)
//
//        gameOver()
        
        
        
//        startBlink()
        
        

//        UIView.animate(withDuration: 1.0,
//                       animations: {
//                        self.btn_undo.transform = CGAffineTransform(scaleX: 0.6, y: 0.6)
//        },
//                       completion: { _ in
//                        UIView.animate(withDuration: 1.0) {
//                            self.btn_undo.transform = CGAffineTransform.identity
//                        }
//        })
        
        
        
//        self.yourLabel.alpha = 1;
//        [UIView animateWithDuration: 1.5 delay: 0.5 options:UIViewAnimationOptionRepeat | UIViewAnimationOptionAutoreverse animations:^{
//            self.btn_undo.alpha = 0;
//            } completion:nil];
        
        
        
        
        
        
//        UIView.animate(withDuration: 1.0,
//                       animations: {
//                        self.btn_undo.transform = CGAffineTransform(scaleX: 0.6, y: 0.6)
//        },
//                       completion: { _ in
//                        UIView.animate(withDuration: 1.0) {
//                            self.btn_undo.transform = CGAffineTransform.identity
//                        }
//        })
//        
//        
//        UIView.animate(withDuration: 1.0,
//                       animations: {
//                        self.btn_undo.transform = CGAffineTransform(scaleX: 0.6, y: 0.6)
//        },
//                       completion: { _ in
//                        UIView.animate(withDuration: 1.0) {
//                            self.btn_undo.transform = CGAffineTransform.identity
//                        }
//        })
        
        

        
        
        
        
//        if sTr_data_popUP == ""
//        {
//            sTr_data_popUP = "Data"
//            
//            self.alertMessageOk(title: "", message: "Can’t create an equation? Use the Undo button to keep playing")
//        }
//        else
//        {
//             if sTr_data_popUP == "Data"
//             {
//                sTr_data_popUP = "No"
//                
//                UIView.animate(withDuration: 0.6,
//                           animations: {
//                            self.btn_undo.transform = CGAffineTransform(scaleX: 0.6, y: 0.6)
//            },
//                           completion: { _ in
//                            UIView.animate(withDuration: 0.6) {
//                                self.btn_undo.transform = CGAffineTransform.identity
//                            }
//            })
//            
//            }
//        }
        
        
        
        collection_view.reloadData()
        
        
    }
    
    //Use for check posiblity for game solve
    func checkPosiblity()
    {
        eque = true
        
        var array_data = number_Array1.filter{$0 != ""}
        
        print(array_data.count)
        
        if array_data.count == 2
        {
//            lbl_equvalue.text = ""
            self.alertMessageOk(title: "", message: "Can’t create an equation? Use the Undo button to keep playing")
        }
            
        else
        {
           if array_data.count == 0
                {
            }
           else
           {
                checkposibleHint()
            }
//            if removeArray.count > 0
//            {
//                checkposibleHint()
//            }
//                
//            else
//            {
//                checkposibleHint()
//            }
            
        }
        
        
    }
    
    
    @IBAction func btn_for_plus(_ sender: Any)
    {
        let sTr_sound = UserDefaults.standard.object(forKey: "music") as? String
        if sTr_sound == "on"
        {
            audioPlayer1.play()
        }
        
        newEasyCounter.invalidate()
        
        var last:String = ""
        
        if new_Array.count == 0
        {}
        else
        {
            last = self.new_Array.last ?? String()
            
            
            
            if last  == opertion || self.new_Array.last == "+" || self.new_Array.last == "-" || self.new_Array.last == "*" || self.new_Array.last == "/" || self.new_Array.last == "="
            {
                
            }
            else
            {
                opertion = "+"
                new_Array.append(String(opertion))
                
                let str_value_data = new_Array.joined(separator: " ")
                
                lbl_equvalue.text  = str_value_data
                
                
            }
            
        }
        
        selected_btn = true
        please_selected = false
    }
    
    @IBAction func btn_for_sub(_ sender: Any)
    {
        newEasyCounter.invalidate()
        
        let sTr_sound = UserDefaults.standard.object(forKey: "music") as? String
        if sTr_sound == "on"
        {
            audioPlayer1.play()
        }
        
        var last:String = ""
        if new_Array.count == 0
        {}
        else
        {
            last = self.new_Array.last ?? String()
            
            if last  == opertion || self.new_Array.last == "+" || self.new_Array.last == "-" || self.new_Array.last == "*" || self.new_Array.last == "/" || self.new_Array.last == "="
            {
                
            }
            else
            {
                
                opertion = "-"
                
                new_Array.append(String(opertion))
                
                let str_value_data = new_Array.joined(separator: " ")
                
                lbl_equvalue.text  = str_value_data
                
                
            }
            
        }
        selected_btn = true
        please_selected = false
    }
    
    @IBAction func btn_for_muti(_ sender: Any)
    {
        let sTr_sound = UserDefaults.standard.object(forKey: "music") as? String
        if sTr_sound == "on"
        {
            audioPlayer1.play()
        }
        
        
        newEasyCounter.invalidate()
        
        var last:String = ""
        
       if new_Array.count == 0
       {}
       else
       {
            last = self.new_Array.last ?? String()
        
        if last  == opertion || self.new_Array.last == "+" || self.new_Array.last == "-" || self.new_Array.last == "*" || self.new_Array.last == "/" || self.new_Array.last == "="
        {
            
        }
        else
        {
            opertion = "*"
            
            new_Array.append(String(opertion))
            
            let str_value_data = new_Array.joined(separator: " ")
            
            lbl_equvalue.text  = str_value_data
            
            
        }
        
        }
        
        selected_btn = true
        please_selected = false

    }
    @IBAction func btn_for_div(_ sender: Any)
    {
        newEasyCounter.invalidate()
        
        let sTr_sound = UserDefaults.standard.object(forKey: "music") as? String
        if sTr_sound == "on"
        {
            audioPlayer1.play()
        }
        
        var last:String = ""
        if new_Array.count == 0
        {}
        else
        {
            last = self.new_Array.last ?? String()
            
            if last  == opertion || self.new_Array.last == "+" || self.new_Array.last == "-" || self.new_Array.last == "*" || self.new_Array.last == "/" || self.new_Array.last == "="
            {
                
            }
                
            else
            {
                
                opertion = "/"
                
                new_Array.append(String(opertion))
                
                let str_value_data = new_Array.joined(separator: " ")
                
                lbl_equvalue.text  = str_value_data
                
                
            }
            
        }
        
        selected_btn = true
        please_selected = false

    }
    
    @IBAction func btn_for_eque(_ sender: Any)
    {
        newEasyCounter.invalidate()
        
//        if selected_btn == false
//        {
//            var last = self.new_Array.last ?? String()
//        
//        if new_Array.count == 0
//        {
//        }
//        else
//        {
//            last = self.new_Array.last ?? String()
//            
//            if self.new_Array.last == "=" || self.new_Array.contains("=")
//            {
//                
//            }
//                
//            else
//            {
//                Array_for_undo.append("=")
//                
//                                selected_btn = true
//                                please_selected = false
//                
//                
//                                new_Array.append("=")
//                
//                                let str_value_data = new_Array.joined(separator: " ")
//                                
//                                lbl_equvalue.text  = str_value_data
//                
//                
//            }
//            
//        }
//    }
    
        
        
        //OLD
        
        
        if selected_btn == false
        {
            let sTr_sound = UserDefaults.standard.object(forKey: "music") as? String
            if sTr_sound == "on"
            {
                audioPlayer1.play()
            }
//            selected_btn = true
//            please_selected = false

            print("btn_equ:: ",afterEqe)
            eque = true
            
            let last = self.new_Array.last ?? String()
            
            if last  == "="  || self.new_Array.contains("=")
            {
                selected_btn = true
                please_selected = true

            }
                
            else if new_Array.count == 0
            {
//                print(new_Array.count)
//                
//                let str_value_data = new_Array.joined(separator: " ")
//                
//                lbl_equvalue.text  = "0"

            }
                
            else
            {
                
//                Array_for_undo.append("=")
                
                selected_btn = true
                please_selected = false

                
                new_Array.append("=")
                
                let str_value_data = new_Array.joined(separator: " ")
                
                lbl_equvalue.text  = str_value_data
                
            }
            
//            if arr_hint_time.count > 2
//            {
////                bnt_hint.isEnabled = true
////                bnt_hint.setTitleColor(UIColor.white, for: UIControlState.normal)
//
//                
//                bnt_hint.isEnabled = false
//                bnt_hint.setTitleColor(UIColor.lightGray, for: UIControlState.normal)
//            }
//                
//            else
//            {
//                bnt_hint.isEnabled = true
//                bnt_hint.setTitleColor(UIColor.white, for: UIControlState.normal)
//            }
        }
        
        

    }
    
    func Equr_2()
    {
            print("After equ:::Equ2:::",afterEqe)
//            eque = true
        
        if selected_number == nil
        {
            
        }
        else{
        
            if opertion == "+"
            {
                afterEqe = afterEqe + selected_number
                print("After equ:::Equ2(+):::",afterEqe)
            }
            else if opertion == "-"
            {
                afterEqe = afterEqe - selected_number
                print("After equ:::Equ2(-):::",afterEqe)
            }
            else if opertion == "*"
            {
                afterEqe = afterEqe * selected_number
                print("After equ:::Equ2(*):::",afterEqe)
            }
            else if opertion == "/"
            {
            }
            
        }
    }
    
    func Equr_2_before()
    {
        
        print(beforeEqe)
        //            eque = true
        
        if selected_number == nil
        {
            
        }
        else
        {
        
        if opertion == "+"
        {
            beforeEqe = beforeEqe + selected_number
            print(beforeEqe)
        }
        else if opertion == "-"
        {
            beforeEqe = beforeEqe - selected_number
            print(beforeEqe)
        }
        else if opertion == "*"
        {
            beforeEqe = beforeEqe * selected_number
            print(beforeEqe)
        }
        else if opertion == "/"
        {
//            beforeEqe = beforeEqe / selected_number
//            print(beforeEqe)
        }
            
        }
        
    }
    
    // MARK: - timer
    func timer_set()
    {
            if timerRunning == false
            {
                 timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(ViewController.Counting), userInfo: nil, repeats: true)
                
//                timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(ViewController.Counting), userInfo: nil, repeats: true)
                
                timerRunning = true
            }
            
            //unwrap textField and Display result
            if let countebleNumber = Int(variable_timer)
            {
                timerCount = countebleNumber
                variable_timer = "" //Clean Up TextField
            }
            else
            {
                timerCount = 0 //Defoult Number to Countdown if TextField is nil
                variable_timer = "" //Clean Up TextField
            }
    }
    
    func Counting()
    {
        if timerOn == true
        {
            
            if sTr_level == "easy"
            {
                
            if timerCount <= 600
            {
                
//                print("Timer count::: ",timerCount)
                
                let minutesLeft = Int(timerCount) / 60 % 60
                let secondsLeft = Int(timerCount) % 60
                
                let dayMove = String(format: "%02d", arguments: [secondsLeft])
                
                lbl_for_timer.text = "\(minutesLeft):\(dayMove)"
                
                timerCount += 1
                
//                highTimer = Int(lbl_for_timer.text!)!
//                UserDefaults.standard.set(highTimer, forKey: "time")
               
                
                    if minutesLeft == 9 && secondsLeft == 59
                    {
                        lbl_for_timer.text = "Times up!"
                        
                        self.new_game_start()
                        
                        let alertTest = UIAlertView()
                        alertTest.delegate = self
                        
                        alertTest.message = "Times up!"
                        alertTest.addButton(withTitle: "Play again")
                        alertTest.addButton(withTitle: "Exit")
                        alertTest.title = ""
                        alertTest.tag = 0;
                        alertTest.show()
                        
                    }
                }
                
                
                
                
            }
                
            if sTr_level == "Extreme" || sTr_level == "Extreme_yes"
            {
                
//                if timerCount <= 600
//                {
                
                    //                print("Timer count::: ",timerCount)
                    
                    let minutesLeft = Int(timerCount) / 60 % 60
                    let secondsLeft = Int(timerCount) % 60
                    
                    let dayMove = String(format: "%02d", arguments: [secondsLeft])
                    
                    lbl_for_timer.text = "\(minutesLeft):\(dayMove)"
                    
                    timerCount += 1
                
            }
                
            else if sTr_level == "hard"
            {
                
                
                let minutesLeft = Int(timerCount) / 60 % 60
                let secondsLeft = Int(timerCount) % 60
                
                let dayMove = String(format: "%02d", arguments: [secondsLeft])
                
                timerCount += 1
                
                print("minutes::: ",minutesLeft)
                print("seconds::: ",secondsLeft)
                
                
                if minutesLeft == 0
                {
                    if  secondsLeft == 8 || secondsLeft == 16 || secondsLeft == 24 || secondsLeft == 30 || secondsLeft == 38 || secondsLeft == 46 || secondsLeft == 54
                        
                    {
                        enterNumber()
                    }
                    
                }
                
                if minutesLeft == 2 || minutesLeft == 1
                {
                    //7Sec
                    
                    if  secondsLeft == 2 || secondsLeft == 9 || secondsLeft == 16 || secondsLeft == 23 || secondsLeft == 30 || secondsLeft == 37 || secondsLeft == 44 || secondsLeft == 51 || secondsLeft == 58
                        
                    {
                        enterNumber()
                    }
                    
                }
                
                
                if minutesLeft == 3
                {
                    //6 Sec
                    if  secondsLeft == 5 || secondsLeft == 11 || secondsLeft == 17 || secondsLeft == 23 || secondsLeft == 29 || secondsLeft == 35 || secondsLeft == 41 || secondsLeft == 47 || secondsLeft == 53 || secondsLeft == 59
                        
                    {
                        enterNumber()
                    }
                    
                }
                
                
                if minutesLeft == 4
                {
                    //5 Sec
                    if  secondsLeft == 5 || secondsLeft == 10 || secondsLeft == 15 || secondsLeft == 20 || secondsLeft == 25 || secondsLeft == 30 || secondsLeft == 35 || secondsLeft == 40 || secondsLeft == 45 || secondsLeft == 50 || secondsLeft == 55
                        
                    {
                        enterNumber()
                    }
                    
                }
                
                
                if minutesLeft == 5
                {
                    //4 Sec
                    if secondsLeft == 0 || secondsLeft == 4 || secondsLeft == 8 || secondsLeft == 12 || secondsLeft == 16 || secondsLeft == 20 || secondsLeft == 24 || secondsLeft == 28 || secondsLeft == 32 || secondsLeft == 36 || secondsLeft == 40 || secondsLeft == 44 || secondsLeft == 48 || secondsLeft == 52 || secondsLeft == 56
                        
                    {
                        enterNumber()
                    }
                    
                }
                
                if minutesLeft == 6
                {
                        // 3 Sec
                    if  secondsLeft == 0 || secondsLeft == 3 || secondsLeft == 6 || secondsLeft == 9 || secondsLeft == 12 || secondsLeft == 15 || secondsLeft == 18 || secondsLeft == 21 || secondsLeft == 24 || secondsLeft == 27 || secondsLeft == 30 || secondsLeft == 33 || secondsLeft == 36 || secondsLeft == 39 || secondsLeft == 42 || secondsLeft == 45 || secondsLeft == 48 || secondsLeft == 51 || secondsLeft == 54 || secondsLeft == 57
                        
                    {
                        enterNumber()
                    }
                    
                }
                
                if minutesLeft == 7
                {
                    // 2 Sec
                    if secondsLeft == 0 || secondsLeft == 2 || secondsLeft == 4 || secondsLeft == 6 || secondsLeft == 8 || secondsLeft == 10 || secondsLeft == 12 || secondsLeft == 14 || secondsLeft == 16 || secondsLeft == 18 || secondsLeft == 20 || secondsLeft == 22 || secondsLeft == 24 || secondsLeft == 26 || secondsLeft == 28 || secondsLeft == 30 || secondsLeft == 32 || secondsLeft == 34 || secondsLeft == 36 || secondsLeft == 38 || secondsLeft == 40 || secondsLeft == 42 || secondsLeft == 44 || secondsLeft == 46 || secondsLeft == 48 || secondsLeft == 50 || secondsLeft == 52 || secondsLeft == 54 || secondsLeft == 56 || secondsLeft == 58
                    {
                       enterNumber()
                    }
                }
                
                
                if minutesLeft >= 8
                {
                    enterNumber()
                }
                
                
                
                
                
                
                
//                if minutesLeft == 1 && secondsLeft == 0
                
//                if secondsLeft == 30  && minutesLeft == 0
//                {
//                   enterNumber()
//                }
                
                
//                if minutesLeft == 1 && secondsLeft > 29
                
//                secondsLeft == 0
                
                
                ///////9/4/2018
                
//                if minutesLeft == 0
//                {
//                    if  secondsLeft == 8 || secondsLeft == 16 || secondsLeft == 24 || secondsLeft == 30 || secondsLeft == 38 || secondsLeft == 46 || secondsLeft == 54
//                        
//                    {
//                        enterNumber()
//                    }
//                    
//                }
//                
//                if minutesLeft == 2 || minutesLeft == 1
//                {
//                    //7Sec
//                    
//                    if  secondsLeft == 2 || secondsLeft == 9 || secondsLeft == 16 || secondsLeft == 23 || secondsLeft == 30 || secondsLeft == 37 || secondsLeft == 44 || secondsLeft == 51 || secondsLeft == 58
//                        
//                    {
//                        enterNumber()
//                    }
//                    
//                }
//                
//                
//                if minutesLeft == 3 || minutesLeft == 4 || minutesLeft == 5
//                {
//                    //6 Sec
//                    if  secondsLeft == 5 || secondsLeft == 11 || secondsLeft == 17 || secondsLeft == 23 || secondsLeft == 29 || secondsLeft == 35 || secondsLeft == 41 || secondsLeft == 47 || secondsLeft == 53 || secondsLeft == 59
//                        
//                    {
//                        enterNumber()
//                    }
//                    
//                }
//                
//                
//                if minutesLeft == 6 || minutesLeft == 7 || minutesLeft == 8 || minutesLeft == 9 || minutesLeft == 10
//                {
//                    
//                     if  secondsLeft == 5 || secondsLeft == 10 || secondsLeft == 15 || secondsLeft == 20 || secondsLeft == 25 || secondsLeft == 30 || secondsLeft == 35 || secondsLeft == 40 || secondsLeft == 45 || secondsLeft == 50 || secondsLeft == 55
//                        
//                    {
//                        enterNumber()
//                    }
//                    
//                }
//                
//                
//                if minutesLeft == 11 || minutesLeft == 12
//                {
//                    
//                    if secondsLeft == 0 || secondsLeft == 4 || secondsLeft == 8 || secondsLeft == 12 || secondsLeft == 16 || secondsLeft == 20 || secondsLeft == 24 || secondsLeft == 28 || secondsLeft == 32 || secondsLeft == 36 || secondsLeft == 40 || secondsLeft == 44 || secondsLeft == 48 || secondsLeft == 52 || secondsLeft == 56
//                        
//                    {
//                        enterNumber()
//                    }
//                    
//                }
//                
//                if minutesLeft > 12
//                {
//                    
//                    if  secondsLeft == 0 || secondsLeft == 3 || secondsLeft == 6 || secondsLeft == 9 || secondsLeft == 12 || secondsLeft == 15 || secondsLeft == 18 || secondsLeft == 21 || secondsLeft == 24 || secondsLeft == 27 || secondsLeft == 30 || secondsLeft == 33 || secondsLeft == 36 || secondsLeft == 39 || secondsLeft == 42 || secondsLeft == 45 || secondsLeft == 48 || secondsLeft == 51 || secondsLeft == 54 || secondsLeft == 57
//                        
//                    {
//                        enterNumber()
//                    }
//                    
//                }

                
                
                ////////////////9/4/2018

                
                
                
                
                
//                if minutesLeft == 1
//                {
//                    if secondsLeft == 0 || secondsLeft == 10 || secondsLeft == 20 || secondsLeft == 30 || secondsLeft == 40 || secondsLeft == 50
//                    {
//                        enterNumber()
//                    }
//                    
////                    if str_minCount == ""
////                    {
////                        str_minCount = "1"
////                        
////                        helloWorldTimer = Timer.scheduledTimer(timeInterval: 10.0, target: self, selector: #selector(ViewController.enterNumber), userInfo: nil, repeats: true)
////                    }
//
//                    
//                }
//                
//                if minutesLeft == 2
//                {
//                    if secondsLeft == 0 || secondsLeft == 9 || secondsLeft == 18 || secondsLeft == 27 || secondsLeft == 36 || secondsLeft == 45 || secondsLeft == 54
//                        
//                    {
//                        enterNumber()
//                    }
//                    
////                    if str_minCount == "1"
////                    {
////                        str_minCount = "2"
////                        
////                        helloWorldTimer?.invalidate()
////                        
////                        helloWorldTimer = Timer.scheduledTimer(timeInterval: 9.0, target: self, selector: #selector(ViewController.enterNumber), userInfo: nil, repeats: true)
////                        
////
////                    }
//                    
//                }
//                
//                if minutesLeft == 3
//                {
//                    
//                    if secondsLeft == 8 || secondsLeft == 16 || secondsLeft == 24 || secondsLeft == 32 || secondsLeft == 40 || secondsLeft == 48 || secondsLeft == 56
//                        
//                    {
//                        enterNumber()
//                    }
//
//                    
////                    if str_minCount == "2"
////                    {
////                        str_minCount = "3"
////                        
////                        helloWorldTimer?.invalidate()
////                        
////                        helloWorldTimer = Timer.scheduledTimer(timeInterval: 8.0, target: self, selector: #selector(ViewController.enterNumber), userInfo: nil, repeats: true)
////                        
////                        
////                    }
//                }
//                
//                if minutesLeft == 4
//                {
//                    if  secondsLeft == 7 || secondsLeft == 14 || secondsLeft == 21 || secondsLeft == 28 || secondsLeft == 35 || secondsLeft == 42 || secondsLeft == 49 || secondsLeft == 56
//                        
//                    {
//                        enterNumber()
//                    }
//                    
////                    if str_minCount == "3"
////                    {
////                        str_minCount = "4"
////                        
////                        helloWorldTimer?.invalidate()
////                        
////                        helloWorldTimer = Timer.scheduledTimer(timeInterval: 7.0, target: self, selector: #selector(ViewController.enterNumber), userInfo: nil, repeats: true)
////                        
////                        
////                    }
//
//                }
//                
//                if minutesLeft == 5
//                {
//                    
//                    if  secondsLeft == 6 || secondsLeft == 12 || secondsLeft == 18 || secondsLeft == 24 || secondsLeft == 30 || secondsLeft == 36 || secondsLeft == 42 || secondsLeft == 48 || secondsLeft == 54
//                        
//                    {
//                        enterNumber()
//                    }
//                    
////                    if str_minCount == "4"
////                    {
////                        str_minCount = "5"
////                        
////                        helloWorldTimer?.invalidate()
////                        
////                        helloWorldTimer = Timer.scheduledTimer(timeInterval: 6.0, target: self, selector: #selector(ViewController.enterNumber), userInfo: nil, repeats: true)
////                        
////                        
////                    }
//                }
//                
//                if minutesLeft == 6
//                {
//                    if secondsLeft == 0 || secondsLeft == 5 || secondsLeft == 10 || secondsLeft == 15 || secondsLeft == 20 || secondsLeft == 25 || secondsLeft == 30 || secondsLeft == 35 || secondsLeft == 40 || secondsLeft == 45 || secondsLeft == 50 || secondsLeft == 55
//                        
//                    {
//                        enterNumber()
//                    }
//
//                    
////                    if str_minCount == "5"
////                    {
////                        str_minCount = "6"
////                        
////                        helloWorldTimer?.invalidate()
////                        
////                        helloWorldTimer = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(ViewController.enterNumber), userInfo: nil, repeats: true)
////                        
////                        
////                    }
//
//                }
//                
//                if minutesLeft == 7
//                {
//                    if secondsLeft == 0 || secondsLeft == 4 || secondsLeft == 8 || secondsLeft == 12 || secondsLeft == 16 || secondsLeft == 20 || secondsLeft == 24 || secondsLeft == 28 || secondsLeft == 32 || secondsLeft == 36 || secondsLeft == 40 || secondsLeft == 44 || secondsLeft == 48 || secondsLeft == 52 || secondsLeft == 56
//                        
//                    {
//                        enterNumber()
//                    }
//                    
////                    if str_minCount == "6"
////                    {
////                        str_minCount = "7"
////                        
////                        helloWorldTimer?.invalidate()
////                        
////                        helloWorldTimer = Timer.scheduledTimer(timeInterval: 4.0, target: self, selector: #selector(ViewController.enterNumber), userInfo: nil, repeats: true)
////                        
////                        
////                    }
//
//                }
//                
//                if minutesLeft == 8
//                {
//                    if  secondsLeft == 0 || secondsLeft == 3 || secondsLeft == 6 || secondsLeft == 9 || secondsLeft == 12 || secondsLeft == 15 || secondsLeft == 18 || secondsLeft == 21 || secondsLeft == 24 || secondsLeft == 27 || secondsLeft == 30 || secondsLeft == 33 || secondsLeft == 36 || secondsLeft == 39 || secondsLeft == 42 || secondsLeft == 45 || secondsLeft == 48 || secondsLeft == 51 || secondsLeft == 54 || secondsLeft == 57
//                        
//                    {
//                        enterNumber()
//                    }
//
//                    
//                    
////                    if str_minCount == "7"
////                    {
////                        str_minCount = "8"
////                        
////                        helloWorldTimer?.invalidate()
////                        
////                        helloWorldTimer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(ViewController.enterNumber), userInfo: nil, repeats: true)
////                        
////                        
////                    }
//                }
//                
//                if minutesLeft == 9
//                {
//                    if secondsLeft == 0 || secondsLeft == 2 || secondsLeft == 4 || secondsLeft == 8 || secondsLeft == 10 || secondsLeft == 12 || secondsLeft == 14 || secondsLeft == 16 || secondsLeft == 18 || secondsLeft == 20 || secondsLeft == 22 || secondsLeft == 24 || secondsLeft == 26 || secondsLeft == 28 || secondsLeft == 30 || secondsLeft == 32 || secondsLeft == 34 || secondsLeft == 36 || secondsLeft == 38 || secondsLeft == 40 || secondsLeft == 42 || secondsLeft == 44 || secondsLeft == 46 || secondsLeft == 48 || secondsLeft == 50 || secondsLeft == 52 || secondsLeft == 54 || secondsLeft == 56 || secondsLeft == 58
//                        
//                    {
//                        enterNumber()
//                    }
//
//                    
//                    
////                    if str_minCount == "8"
////                    {
////                        str_minCount = "9"
////                        
////                        helloWorldTimer?.invalidate()
////                        
////                        helloWorldTimer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(ViewController.enterNumber), userInfo: nil, repeats: true)
////                        
////                        
////                    }
//                }
//                
////                if minutesLeft == 10 && secondsLeft == 0
////                {
////                    if str_minCount == "9"
////                    {
////                        str_minCount = "10"
////                        
////                        helloWorldTimer?.invalidate()
////                        
////                        helloWorldTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(ViewController.enterNumber), userInfo: nil, repeats: true)
////                        
////                        
////                    }
////                }
//                
//                if minutesLeft > 9
//                {
//                    enterNumber()
//                }

                
                
            }
        }
        
        else
        {
            lbl_for_timer.text = "Start"
        }
    }
    
    
    
    
    // MARK:- Funcation for new game start
    
    func new_game_start()
    {
         number_Array1 = ["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28"]
        
        
        Func_for_lowtime()
        timerOn = false
        collection_view.isUserInteractionEnabled = false
        viewWillAppear(false)
        collection_view.reloadData()
        self.afterEqe = 0
        self.beforeEqe = 0
        self.removeArray.removeAll()
        self.new_Array.removeAll()
        please_selected = false
        self.selected_number = 0
        self.eque = false
        
        Array_for_undo_index.removeAll()
        arr_hint_index.removeAll()
        arr_index.removeAll()
        
        
        
        if removeArray.count == 0
        {
            lbl_equvalue.text  = " "
        }
        
        bnt_hint.isEnabled = false
        bnt_hint.setTitleColor(UIColor.lightGray, for: UIControlState.normal)
        
        if arr_hint_time.count == 1
        {
            bnt_hint.setTitle("Hint(02)",for: .normal)
        }
        if arr_hint_time.count == 2
        {
            bnt_hint.setTitle("Hint(01)",for: .normal)
        }
        if arr_hint_time.count == 3
        {
            bnt_hint.setTitle("Hint(00)",for: .normal)
        }

    }
    
    @IBAction func new_game_btn(_ sender: Any)
    {
//        let use = UIStoryboard(name: "Main", bundle: nil)
//        let vc = use.instantiateViewController(withIdentifier: "PlayGameViewController") as! PlayGameViewController
  
        if startFromAlert == true
        {
            let alertTest = UIAlertView()
            alertTest.delegate = self
            
            alertTest.message = "Are you sure you want to stop this game?"
            alertTest.addButton(withTitle: "No")
            alertTest.addButton(withTitle: "Yes")
            alertTest.title = ""
            alertTest.tag = 1;
            alertTest.show()
            
            
//            let alert = UIAlertController(title: "", message: "Are you sure stop this game", preferredStyle: UIAlertControllerStyle.alert)
//            alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.default, handler: nil))
//            self.present(alert, animated: true, completion: nil)
            
        }
        
        else
        {
//            arr_hint_time.removeAll()
//            timerRunning = true
//            self.navigationController?.popViewController(animated: true)
            
            timer.invalidate()
            
            timerRunning = false
            timerCount = 800
            
              hard_countTimer?.invalidate()
            
            let push = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SelectGameViewController") as! SelectGameViewController
            self.navigationController?.pushViewController(push, animated: true)
            
            
        }
        
        
//        new_game_start()
    }
    
    func alertView(_ alertView: UIAlertView, clickedButtonAt buttonIndex: Int)
    {
        if alertView.tag == 1
        {
        switch buttonIndex
        {
        case 1:
            
            timerRunning = false
//            timerRunning = true
            timer.invalidate()
//            timerCount = 800
              hard_countTimer?.invalidate()
            
//            helloWorldTimer.invalidate()
            
            let push = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SelectGameViewController") as! SelectGameViewController
            self.navigationController?.pushViewController(push, animated: true)
            
//            arr_hint_time.removeAll()
//            timer_set()
//timer.invalidate()
            
//            self.navigationController?.popViewController(animated: true)
        
        case 0:
            print("Hello click 1")

        default:
            print("Hello click Defult")
        }
            
        }
        
        
        if alertView.tag == 0
        {
            switch buttonIndex
            {
            case 0:
                
                let sTr_sound = UserDefaults.standard.object(forKey: "music") as? String
                if sTr_sound == "on"
                {
                    audioPlayer.play()
                }
                
                startFromAlert = true
                
                if lbl_for_timer.text == "Start"
                {
                    collection_view.isUserInteractionEnabled = true
                    timerOn = true
                    timer_set()
                    please_selected = false
                    selected_btn = true
                }

                
            case 1:
                print("Hello click 1")
                arr_hint_time.removeAll()
                
//                self.navigationController?.popViewController(animated: true)
                  hard_countTimer?.invalidate()
                
//                timer.invalidate()
                
                timer.invalidate()
                timerCount = 800
                
                let push = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PlayGameViewController") as! PlayGameViewController
                self.navigationController?.pushViewController(push, animated: true)
                
            default:
                print("Hello click Defult")
            }
            
        }
        
    }
    
    override func viewWillDisappear(_ animated: Bool)
    {
        
//         timerRunning = false
        
//        timer.invalidate()
       // timer.invalidate()
        
        
    }
    
   override func viewDidAppear(_ animated: Bool)
    {
//         timerRunning = false
//        timer.invalidate()
        super.viewWillAppear(animated)
        // Hide the navigation bar on the this view controller
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    @IBAction func undo_btn(_ sender: Any)
    {
        sTr_data_popUP = "Yes"
        
        newEasyCounter.invalidate()
        
        let sTr_sound = UserDefaults.standard.object(forKey: "music") as? String
        if sTr_sound == "on"
        {
            audioPlayer1.play()
        }
        
        hintClick = false
        
        hard_countTimer?.invalidate()
        
        undo_for_game()
        
        //        let push = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "gameOverView") as! gameOverView
        //        push.sTr_time = lbl_for_timer.text!
        //        self.navigationController?.pushViewController(push, animated: true)
        

        
        
        
    }
    
//    {
//        audioPlayer.play()
//        
//        let newArraya  = removeArray.filter
//        
//        print("NEWWWWW ", newArraya)
//        
//        let newArray  = removeArray.filter
//        {
//            
//            (string) -> Bool in
//            return number_Array1.contains(string)
//        }
//        
//        print("New array ",newArray)
//        if onetime == false
//        {
//            for j in newArray
//            {
//                print("JJJJ ", j)
//                
//                if let i = number_Array1.index(of: j)
//                {
//                    print("Jason is at index \(i)")
//                    number_Array1[i] = "\(j)"
//                    print("here after remove new array is \(number_Array1)")
//                    onetime = true
//                }
//                else
//                {
//                    print("Jason isn't in the array")
//                }
//            }
//        }
//        
//        print("Remove Array", removeArray)
//        
//        onetime = false
//        please_selected = false
//        
//        self.afterEqe = 0
//        self.beforeEqe = 0
//        self.removeArray.removeAll()
//        self.selected_number = 0
//        self.eque = false
//        self.collection_view.reloadData()
//    }
    
    func undo_for_game()
    {
         arr_hint.removeAll()
        
        undo_click=true
        
//        please_selected = true
        
        print("Before value in undo :: ",beforeEqe)
        print("After value in undo :: ",afterEqe)
        print("Reamove array new fun:: ",removeArray)
        
        print("New array new fun:: ",new_Array)
        
        var indexa:Int!
        var index_val:Int!
        
        beforeEqe = 0
        
        if removeArray.count == 0
        {
            afterEqe = 0
            beforeEqe = 0
            
            self.eque = false
            
            bnt_hint.isEnabled = false
            bnt_hint.setTitleColor(UIColor.lightGray, for: UIControlState.normal)
            
            if arr_hint_time.count == 1
            {
                lbl_hintNum.text = "02"
//                bnt_hint.setTitle("Hint(02)",for: .normal)
            }
            if arr_hint_time.count == 2
            {
                lbl_hintNum.text = "01"
//                bnt_hint.setTitle("Hint(01)",for: .normal)
            }
            if arr_hint_time.count == 3
            {
                lbl_hintNum.text = "00"
//                bnt_hint.setTitle("Hint(00)",for: .normal)
            }
            
            
//            please_selected = false
            self.removeArray.removeAll()
            self.new_Array.removeAll()
            
            Array_for_undo_index.removeAll()
            arr_hint_index.removeAll()
            arr_index.removeAll()
            
            please_selected = false
            
            if new_Array.count == 0
            {
                lbl_equvalue.text = " "
            }
            
            if number_Array1 .contains("")
            {
                print("Number Array count:a: ",number_Array1.count)
                
                print("Array number", number_Array1)
                
                print("Arr_reEnter number", arr_reEnter)
                
                print("Array data in undo",arr_reEnter_all)
                
                arr_reEnter = arr_reEnter_all.last as! [String]
                
                print("Dataaa ",arr_reEnter)
                
                arr_reEnter_all.removeLast()
                
                for i in 0..<arr_reEnter.count
                {
                    let indexData = index_view.last
                    print("IndexData",indexData!)
                    
                    let indexValue = indexData
                    
                    print("IndexData",indexValue!)
                    
                    let a:Int? = Int(indexValue!)
                    
                    print("INTERGER::", a!)
                    
                    number_Array1[a!] = arr_reEnter.last!
                    
                    arr_reEnter.removeLast()
                    index_view.removeLast()
                    
                }
                
                 print("Array number Add", number_Array1)
                
                print("Index value", index_data)
                
                print("Last Enter ",arr_reEnter)
                
                print("Number Array count:: ",number_Array1.count)
                

                print("Number Array count Appenddd:: ",number_Array1.count)
                
            }
        }
            
        else
        {
            if Array_for_undo.count > 0
            {
                
                please_selected = false
                
//                please_selected == false
                
                print("Count:: ", Array_for_undo.count)
                print("Array element1111::: ",Array_for_undo)
                
                self.eque = true
                
                if removeArray.count>0
                {
                
                for i in 0 ..< Array_for_undo.count
                {
                    print (i)
                    
                    undoData_first = "yes"
                    
                    self.removeArray.removeLast()
                    self.Array_for_undo.removeLast()
                    
                    Array_for_undo_index.removeLast()
                    
                    self.new_Array.removeLast()
                    
                    let str_value_data = new_Array.joined(separator: " ")
                    
                    lbl_equvalue.text  = str_value_data
                
                   if self.new_Array.count > 1
                   {
                        let last_element = self.new_Array.last ?? String()
                    
                        if last_element == "+" || last_element == "-" || last_element == "*" || last_element == "/"
                    {
                        self.new_Array.removeLast()
                        let str_value_data = new_Array.joined(separator: " ")
                        lbl_equvalue.text  = str_value_data
                    }
                            
                    
                    
                    }
                    
                    
                }
                              //Set after value HERE
                }
                
                
                print("New array countttt ",self.new_Array.count)
                print("New arrayrrrr  ",self.new_Array)
                
                var str_value_data = ""
                
                if new_Array.count>0
                {
                    self.new_Array.removeLast()
                    str_value_data = new_Array.joined(separator: " ")
                }
                
                if undoData_first == "yes"
                {
                    if new_Array.contains("=")
                    {
                        
                    }
                    else{
                    new_Array.append("=")
                    let sTR_value = str_value_data + "="
                    
                    print(sTR_value)
                    
                    lbl_equvalue.text  = sTR_value
                    }
                }
                
                
                print("Array Counttt:: ", Array_for_undo.count)
                
                print("Array new data after remove: ",new_Array)
                
            }
                
            else
            {
//                please_selected = true
                
                self.eque = false
                
                bnt_hint.isEnabled = false
                bnt_hint.setTitleColor(UIColor.lightGray, for: UIControlState.normal)
                
                if arr_hint_time.count == 1
                {
                    bnt_hint.setTitle("Hint(02)",for: .normal)
                }
                if arr_hint_time.count == 2
                {
                    bnt_hint.setTitle("Hint(01)",for: .normal)
                }
                if arr_hint_time.count == 3
                {
                    bnt_hint.setTitle("Hint(00)",for: .normal)
                }
                
                
                indexa = removeArray.count - 1
                
                let last1_data = new_Array.last ?? String()
                
                if last1_data == "="
                {
                        index_val = new_Array.count - 2
                }
                else
                {
                    index_val = new_Array.count - 1
//                    index_val = indexa+1
                }
                
                let last1 = self.removeArray.last ?? String()
                let x1: Int? = Int(last1)
                
                self.removeArray.remove(at: indexa)
                
                self.new_Array.remove(at: index_val)
                
               if self.new_Array.last == "+" || self.new_Array.last == "-" || self.new_Array.last == "*" || self.new_Array.last == "/" || self.new_Array.last == "="
                {
                    new_Array.removeLast()
                }
                else
                {
//                    if self.new_Array.count > 2
//                    {
//                        new_Array.removeLast()
//                    }
//                    self.new_Array.last
                }
                
                if arr_index.count > 0
                {
                    arr_index.removeLast()
                }
                
//                index_view.remove(at: index_val)
                
                
//                let str_value_data = new_Array.joined(separator: " ")
//                
//                lbl_equvalue.text  = str_value_data
                
                if self.new_Array.last == "="
                {
                    please_selected = false
                }
                    
                else
                {
                    please_selected = true
                }
                
                if self.new_Array.last == "+" || self.new_Array.last == "-" || self.new_Array.last == "*" || self.new_Array.last == "/" || self.new_Array.last == "="
                {
                    
//                    please_selected = true
                    
//                    please_selected = false
                    
                    self.new_Array.removeLast()
                    
                    
//                    let str_value_data = new_Array.joined(separator: " ")
//                    lbl_equvalue.text  = str_value_data
                }
                    
                else
                {
//                    please_selected = true
                }
                
                if removeArray.count == 0
                {
                    afterEqe = 0
                    beforeEqe = 0
                    self.new_Array.removeAll()
                    
                    Array_for_undo_index.removeAll()
                    arr_hint_index.removeAll()
                    arr_index.removeAll()
                    
                    please_selected = false
                    
                    if new_Array.count == 0
                    {
                        lbl_equvalue.text  = " "
                    }
                    
                }
                    
                else
                {
                    
                    let last = self.removeArray.last ?? String()
                    let x: Int? = Int(last)
                    

                    
                    //After value SET HERE
                    
                    if removeArray.count == 1
                    {
                         afterEqe = x!
                    }
                    else
                    {
                    var opertionArray = ""
                    var first = ""
                    var second = ""
                        
                    let finalValue = ""
                    
                    var int_first = Int(first)
                    var int_second = Int(second)
                    var int_final_value = Int(finalValue)
                        
                    var int_index = new_Array.count - 3
                        
                        
                        if int_index == 0
                        {
                            int_index = 1
                        }
                        
                    
                        print (removeArray)
                        print (new_Array)
                        
                        
                        // For calculation remaing eque
                        
                    for i in 0 ..< int_index
                    {
                        let dataINT = new_Array[i]
                        
                        if dataINT == "+" || dataINT == "-" || dataINT == "*" || dataINT == "/"
                        {
                            opertionArray = new_Array [i+2]
                            second = new_Array[i+3]
                            int_second = Int(second)
                            
                            print("Operation:: ", opertionArray)
                            print("int_second:: ", int_second)
                            
                            
//                            first = int_final_value
                            int_first = int_final_value
                            
                            print("int_first:: ", int_first)

                            
                        }
                        if int_second == nil
                        {
                            
                            opertionArray = new_Array [i+1]
                            first = new_Array[i]
                            int_first = Int(first)
                            print("Operation:: ", opertionArray)
                            print("first:: ", first)

                            second = new_Array[i+2]
                            int_second = Int(second)
                            print("Operation:: ", opertionArray)
                            print("second:: ", second)
                            
                            
                            
                        }
                        
                        else
                        {
                            opertionArray = new_Array [i+2]
                            second = new_Array[i+3]
                            int_second = Int(second)
                            
                            print("Operation:: ", opertionArray)
                            print("int_second:: ", int_second)
                            
                            
                            //                            first = int_final_value
                            int_first = int_final_value
                            
                            print("int_first:: ", int_first)
                            
                            
 
                        }
                            
                            
                        if opertionArray == "+"
                        {
                            int_final_value = int_first! + int_second!
                            
                            print("1st + :: ", int_first)
                            print("2nd + :: ", int_second)
                            
                            print("int_second equ:::Equ2(+):::",int_final_value)
                        }
                        else if opertionArray == "-"
                        {
                            int_final_value = int_first! - int_second!
                            //                        afterEqe = afterEqe - selected_number
                            
                            print("1st - :: ", int_first)
                            print("2nd - :: ", int_second)
                            
                            print("int_second equ:::Equ2(-):::",int_final_value)
                        }
                        else if opertionArray == "*"
                        {
                            int_final_value = int_first! * int_second!
                            
                            print("1st * :: ", int_first)
                            print("2nd * :: ", int_second)
                            
//                            afterEqe = myInt! * beforeEqe
                            //                        afterEqe = afterEqe * selected_number
                            print("int_second equ:::Equ2(*):::",int_final_value)
                        }
                        else if opertionArray == "/"
                        {
                            int_final_value = int_first! / int_second!
                        }
                        
                        
                    }
                        afterEqe = int_final_value!
                        
                        print("VAlue::", afterEqe)

                    }
                    
                    
                    
                }
                
                if new_Array.count > 1
                {
                    var str_value_data = new_Array.joined(separator: " ")
                    var fullNameArr = str_value_data.components(separatedBy: " ")
                    print("Striing too arrayyyyy ::: ",fullNameArr)
                    
                    fullNameArr.removeLast()
                    
                    str_value_data = fullNameArr.joined(separator: " ")
                    lbl_equvalue.text  = str_value_data
                    
                }

            }
            
            
            
        }
        
        if self.new_Array.last == "+" || self.new_Array.last == "-" || self.new_Array.last == "*" || self.new_Array.last == "/"
        {
            please_selected = false
        }
        
        var  sTr_last_sTr = removeArray.last
        
        var sTr_lastNew = new_Array.last
        
        
        if sTr_lastNew == "+" ||  sTr_lastNew == "*" || sTr_lastNew == "/" ||  sTr_lastNew == "-"
        {
            
        }
        else if sTr_lastNew == sTr_last_sTr
        {
            
        }
        else
        {
            new_Array.removeLast()
            
            
            
        }
        
        
        let str_value_data = new_Array.joined(separator: " ")
        
        lbl_equvalue.text  = str_value_data
        
        if undoData_first == "yes"
        {
            new_Array.append("=")
            
            undoData_first = "no"
            let sTR_value = str_value_data + "="
            
            print(sTR_value)
            
            lbl_equvalue.text  = sTR_value
        }
        
        print("Remove array after THISSSS ::: ",removeArray)
        print("New array after THISSSS ::: ",new_Array)
        
        
        
        
        
        collection_view.reloadData()
    }
    
    func checkposibleHint()
    {
        
//            arr_hint_time.append("hint")
        
            if eque == true
            {
                print("undo aaaray in hinttttt:::: ",Array_for_undo)
                
                hintClick = true
                
//                audioPlayer1.play()
                
                print("Hint_before::", beforeEqe)
                print("Hint_aftre::", afterEqe)
                
                let after_value = afterEqe
                
                
                var sTr_afterEqe = String(afterEqe)
                print("Remove Array on hint\(removeArray)")
                
                arr_hint.removeAll()
                
                if timerOn == true
                {
                    if number_Array1 .contains(sTr_afterEqe)
                    {
                        if removeArray.contains(sTr_afterEqe)
                        {
                            let array_data = number_Array1.filter{$0 != ""}
                            
                            print(array_data.count)
                            
                            print("Array dataaaa",array_data)
                            
                            var arr = [[String]]()
                            
                            arr = [array_data,array_data]
                            
                            //                arr.append(array_data)
                            
                            print("Multidimentinal array:: ",arr)
                            
                            for i in 0..<array_data.count-1
                            {
                                let f_value = arr[0] [i]
                                let s_value = arr[1] [i+1]
                                
                                let fvalue_int = Int(f_value)
                                
                                let svalue_int = Int(s_value)
                                
                                print("First value",f_value)
                                print("Second Value ",s_value)
                                
                                
                                if fvalue_int! / svalue_int! == afterEqe
                                {
                                    print("Div")
                                    
                                    if fvalue_int! % svalue_int! == 0
                                    {
                                        arr_hint.append(f_value)
                                        arr_hint.append(s_value)
                                        
                                        arr_hint_index.append(String(i))
                                        arr_hint_index.append(String(i+1))
                                        
                                        break;
                                        
                                    }
                                    
                                }
                                    
                                else if fvalue_int! * svalue_int! == afterEqe
                                {
                                    print("mul")
                                    arr_hint.append(f_value)
                                    arr_hint.append(s_value)
                                    
                                    arr_hint_index.append(String(i))
                                    arr_hint_index.append(String(i+1))
                                    
                                    break;
                                }
                                    
                                else if fvalue_int! - svalue_int! == afterEqe
                                {
                                    print("minus")
                                    arr_hint.append(f_value)
                                    arr_hint.append(s_value)
                                    
                                    arr_hint_index.append(String(i))
                                    arr_hint_index.append(String(i+1))
                                    
                                    break;
                                }
                                    
                                else if fvalue_int! + svalue_int! == afterEqe
                                {
                                    print("Plus")
                                    arr_hint.append(f_value)
                                    arr_hint.append(s_value)
                                    
                                    arr_hint_index.append(String(i))
                                    arr_hint_index.append(String(i+1))
                                    
                                    
                                    break;
                                }
                                
                                
                            }
                            
                        }
                            
                        else
                        {
                            print("arr_hint hint before append \(arr_hint)")
                            
                            arr_hint.append(sTr_afterEqe)
                            
                            //                        let indexOfA = number_Array1.indexOf("a") // 0
                            
                            index_value = number_Array1.index(of: sTr_afterEqe)!
                            
                            arr_hint_index.append(String(index_value))
                            
                            print("arr_hint hint\(arr_hint)")
                        }
                        
                    }
                        
                    else if afterEqe < 28  || afterEqe > 28
                    {
                        let array_data = number_Array1.filter{$0 != ""}
                        
                        print(array_data.count)
                        
                        print("Array dataaaa",array_data)
                        
                        var arr = [[String]]()
                        
                        arr = [array_data,array_data]
                        
                        //                arr.append(array_data)
                        
                        print("Multidimentinal array:: ",arr)
                        
                        
                        for i in 0..<array_data.count-1
                        {
                            let f_value = arr[0] [i]
                            
                            //                    if i+1 == array_data.count
                            //                    {
                            //                        let s_value = arr[1] [0]
                            //                    }
                            //                    else
                            //                    {
                            let s_value = arr[1] [i+1]
                            //                    }
                            
                            
                            
                            let fvalue_int = Int(f_value)
                            
                            let svalue_int = Int(s_value)
                            
                            print("First value",f_value)
                            print("Second Value ",s_value)
                            
                            
                            if fvalue_int! / svalue_int! == afterEqe
                            {
                                print("Div")
                                
                                if fvalue_int! % svalue_int! == 0
                                {
                                    arr_hint.append(f_value)
                                    arr_hint.append(s_value)
                                    
                                    break;
                                    
                                }
                                
                            }
                                
                            else if fvalue_int! * svalue_int! == afterEqe
                            {
                                print("mul")
                                arr_hint.append(f_value)
                                arr_hint.append(s_value)
                                
                                break;
                            }
                                
                            else if fvalue_int! - svalue_int! == afterEqe
                            {
                                print("minus")
                                arr_hint.append(f_value)
                                arr_hint.append(s_value)
                                
                                break;
                            }
                                
                            else if fvalue_int! + svalue_int! == afterEqe
                            {
                                print("Plus")
                                arr_hint.append(f_value)
                                arr_hint.append(s_value)
                                
                                break;
                            }
                            
                            
                            
                        }
                        
                        
                        
                        
                        if arr_hint.count==0
                        {
                            if array_data.count-2 > 2
                            {
                            
                            
                            for i in 0..<array_data.count-2
                            {
                                hintCall(fValue: array_data[0], sValue: array_data[1], tValue: array_data[2])
                                //                        hintCall(fValue:String, sValue:String,tValue:String)
                            }
                                print ("Hint call")
                            }
                            
                            else
                            {
//                                lbl_equvalue.text = ""
                                
                                self.alertMessageOk(title: "", message: "Can’t create an equation? Use the Undo button to keep playing")
                                
                            }
                            
                        }
                        
                        
                        
                        //                 int[][] finalArray = array_data
                        
                        
                        
                        
                    }
                        
                        
                        //            {
                        //
                        //                if afterEqe % 5  == 0
                        //                {
                        //                   print("After euq::",afterEqe)
                        //
                        //                    if afterEqe % 5 == 0
                        //                    {
                        //
                        //                    }
                        //
                        //                    if afterEqe % 3 == 0
                        //                    {
                        //
                        //                    }
                        //
                        //                    else if afterEqe % 2 == 0
                        //                    {
                        //
                        //                        print("After euq::",afterEqe)
                        //                        sTr_afterEqe = String(afterEqe)
                        //                        let sTr_after_value = String (after_value)
                        //
                        //
                        //                        if number_Array1 .contains(sTr_afterEqe)
                        //                        {
                        //                            arr_hint.append(sTr_afterEqe)
                        //                            arr_hint.append(sTr_after_value)
                        //
                        //                        }
                        //                        else
                        //                        {
                        //                            if afterEqe % 3 == 0
                        //                            {
                        //
                        //                            }
                        //                            else
                        //                            {
                        //
                        //                            }
                        //                        }
                        //                    }
                        //
                        //                }
                        //
                        //              else if afterEqe % 3 == 0
                        //            {
                        //
                        //            }
                        //               else if afterEqe % 2 == 0
                        //                {
                        //
                        //                    print("After euq::",afterEqe)
                        //                    sTr_afterEqe = String(afterEqe)
                        //                    let sTr_after_value = String (after_value)
                        //
                        //
                        //                    if number_Array1 .contains(sTr_afterEqe)
                        //                    {
                        //                        arr_hint.append(sTr_afterEqe)
                        //                        arr_hint.append(sTr_after_value)
                        //
                        //                    }
                        //                    else
                        //                    {
                        //                        if afterEqe % 3 == 0
                        //                        {
                        //
                        //                        }
                        //                        else
                        //                        {
                        //
                        //                        }
                        //                    }
                        //
                        //                }
                        //
                        //
                        //
                        //
                        //
                        //
                        ////                for i in 0..<number_Array1.count
                        ////                {
                        ////                    let a1 = number_Array1[i]
                        ////
                        ////
                        ////                    let a2 = number_Array1[i+1]
                        ////                    
                        ////                   let a = Int(a2)! - Int(a1)!
                        ////                    
                        ////                    if a == afterEqe
                        ////                    {
                        ////                      print("ANS:: ", a)
                        ////                    }
                        ////                    else
                        ////                    {
                        ////                         print("ANS not ans:: ", a)
                        ////                    }
                        ////                    
                        ////                }
                        //            }
                        
                    else
                    {
                        arr_hint.append(sTr_afterEqe)
                        
                        self.alertMessageOk(title: "Hint For Equation", message: "Your total is \(afterEqe)")
                    }
                }
                collection_view.reloadData()
            }
        
        
        if eque == false
        {
            
            
            print("undo aaaray in hinttttt:::: ",Array_for_undo)
            
            hintClick = true
            
            //            audioPlayer1.play()
            
            print("Hint_before::", beforeEqe)
            print("Hint_aftre::", afterEqe)
            
            let after_value = afterEqe
            
            
            var sTr_afterEqe = String(afterEqe)
            print("Remove Array on hint\(removeArray)")
            
            arr_hint.removeAll()
            
            if timerOn == true
            {
                if number_Array1 .contains(sTr_afterEqe)
                {
                    if removeArray.contains(sTr_afterEqe)
                    {
                        let array_data = number_Array1.filter{$0 != ""}
                        
                        print(array_data.count)
                        
                        print("Array dataaaa",array_data)
                        
                        var arr = [[String]]()
                        
                        arr = [array_data,array_data]
                        
                        //                arr.append(array_data)
                        
                        print("Multidimentinal array:: ",arr)
                        
                        for i in 0..<array_data.count-1
                        {
                            let f_value = arr[0] [i]
                            let s_value = arr[1] [i+1]
                            
                            let fvalue_int = Int(f_value)
                            
                            let svalue_int = Int(s_value)
                            
                            print("First value",f_value)
                            print("Second Value ",s_value)
                            
                            
                            if fvalue_int! / svalue_int! == afterEqe
                            {
                                print("Div")
                                
                                if fvalue_int! % svalue_int! == 0
                                {
                                    arr_hint.append(f_value)
                                    arr_hint.append(s_value)
                                    
                                    arr_hint_index.append(String(i))
                                    arr_hint_index.append(String(i+1))
                                    
                                    break;
                                    
                                }
                                
                            }
                                
                            else if fvalue_int! * svalue_int! == afterEqe
                            {
                                print("mul")
                                arr_hint.append(f_value)
                                arr_hint.append(s_value)
                                
                                arr_hint_index.append(String(i))
                                arr_hint_index.append(String(i+1))
                                
                                break;
                            }
                                
                            else if fvalue_int! - svalue_int! == afterEqe
                            {
                                print("minus")
                                arr_hint.append(f_value)
                                arr_hint.append(s_value)
                                
                                arr_hint_index.append(String(i))
                                arr_hint_index.append(String(i+1))
                                
                                break;
                            }
                                
                            else if fvalue_int! + svalue_int! == afterEqe
                            {
                                print("Plus")
                                arr_hint.append(f_value)
                                arr_hint.append(s_value)
                                
                                arr_hint_index.append(String(i))
                                arr_hint_index.append(String(i+1))
                                
                                
                                break;
                            }
                            
                            
                        }
                        
                    }
                        
                    else
                    {
                        print("arr_hint hint before append \(arr_hint)")
                        
                        arr_hint.append(sTr_afterEqe)
                        
                        //                        let indexOfA = number_Array1.indexOf("a") // 0
                        
                        index_value = number_Array1.index(of: sTr_afterEqe)!
                        
                        arr_hint_index.append(String(index_value))
                        
                        print("arr_hint hint\(arr_hint)")
                    }
                    
                }
                    
                else if afterEqe < 28  || afterEqe > 28
                {
                    let array_data = number_Array1.filter{$0 != ""}
                    
                    print(array_data.count)
                    
                    print("Array dataaaa",array_data)
                    
                    var arr = [[String]]()
                    
                    arr = [array_data,array_data]
                    
                    //                arr.append(array_data)
                    
                    print("Multidimentinal array:: ",arr)
                    
                    for i in 0..<array_data.count-1
                    {
                        let f_value = arr[0] [i]
                        
                        //                    if i+1 == array_data.count
                        //                    {
                        //                        let s_value = arr[1] [0]
                        //                    }
                        //                    else
                        //                    {
                        let s_value = arr[1] [i+1]
                        //                    }
                        
                        
                        
                        let fvalue_int = Int(f_value)
                        
                        let svalue_int = Int(s_value)
                        
                        print("First value",f_value)
                        print("Second Value ",s_value)
                        
                        
                        if fvalue_int! / svalue_int! == afterEqe
                        {
                            print("Div")
                            
                            if fvalue_int! % svalue_int! == 0
                            {
                                arr_hint.append(f_value)
                                arr_hint.append(s_value)
                                
                                break;
                                
                            }
                            
                        }
                            
                        else if fvalue_int! * svalue_int! == afterEqe
                        {
                            print("mul")
                            arr_hint.append(f_value)
                            arr_hint.append(s_value)
                            
                            break;
                        }
                            
                        else if fvalue_int! - svalue_int! == afterEqe
                        {
                            print("minus")
                            arr_hint.append(f_value)
                            arr_hint.append(s_value)
                            
                            break;
                        }
                            
                        else if fvalue_int! + svalue_int! == afterEqe
                        {
                            print("Plus")
                            arr_hint.append(f_value)
                            arr_hint.append(s_value)
                            
                            break;
                        }
                        
                        
                        
                    }
                    
                    if arr_hint.count==0
                    {
                        for i in 0..<array_data.count-2
                        {
                            hintCall(fValue: array_data[0], sValue: array_data[1], tValue: array_data[2])
                            //                        hintCall(fValue:String, sValue:String,tValue:String)
                        }
                        print ("Hint call")
                        //                    hint_sol()
                    }
                    
                    
                    
                    //                 int[][] finalArray = array_data
                    
                    
                    
                    
                }
                    
                    
                    //            {
                    //
                    //                if afterEqe % 5  == 0
                    //                {
                    //                   print("After euq::",afterEqe)
                    //
                    //                    if afterEqe % 5 == 0
                    //                    {
                    //
                    //                    }
                    //
                    //                    if afterEqe % 3 == 0
                    //                    {
                    //
                    //                    }
                    //
                    //                    else if afterEqe % 2 == 0
                    //                    {
                    //
                    //                        print("After euq::",afterEqe)
                    //                        sTr_afterEqe = String(afterEqe)
                    //                        let sTr_after_value = String (after_value)
                    //
                    //
                    //                        if number_Array1 .contains(sTr_afterEqe)
                    //                        {
                    //                            arr_hint.append(sTr_afterEqe)
                    //                            arr_hint.append(sTr_after_value)
                    //
                    //                        }
                    //                        else
                    //                        {
                    //                            if afterEqe % 3 == 0
                    //                            {
                    //
                    //                            }
                    //                            else
                    //                            {
                    //
                    //                            }
                    //                        }
                    //                    }
                    //
                    //                }
                    //
                    //              else if afterEqe % 3 == 0
                    //            {
                    //
                    //            }
                    //               else if afterEqe % 2 == 0
                    //                {
                    //
                    //                    print("After euq::",afterEqe)
                    //                    sTr_afterEqe = String(afterEqe)
                    //                    let sTr_after_value = String (after_value)
                    //
                    //
                    //                    if number_Array1 .contains(sTr_afterEqe)
                    //                    {
                    //                        arr_hint.append(sTr_afterEqe)
                    //                        arr_hint.append(sTr_after_value)
                    //
                    //                    }
                    //                    else
                    //                    {
                    //                        if afterEqe % 3 == 0
                    //                        {
                    //
                    //                        }
                    //                        else
                    //                        {
                    //
                    //                        }
                    //                    }
                    //
                    //                }
                    //
                    //
                    //
                    //
                    //
                    //
                    ////                for i in 0..<number_Array1.count
                    ////                {
                    ////                    let a1 = number_Array1[i]
                    ////
                    ////
                    ////                    let a2 = number_Array1[i+1]
                    ////
                    ////                   let a = Int(a2)! - Int(a1)!
                    ////
                    ////                    if a == afterEqe
                    ////                    {
                    ////                      print("ANS:: ", a)
                    ////                    }
                    ////                    else
                    ////                    {
                    ////                         print("ANS not ans:: ", a)
                    ////                    }
                    ////
                    ////                }
                    //            }
                    
                else
                {
                    arr_hint.append(sTr_afterEqe)
                    
                    self.alertMessageOk(title: "Hint For Equation", message: "Your total is \(afterEqe)")
                }
            }
            
            if arr_hint.count > 0
            {
                arr_hint_time.append("hint")
                
                if arr_hint_time.count == 1
                {
                    lbl_hintNum.text = "02"
                    //                bnt_hint.setTitle("Hint(02)",for: .normal)
                }
                if arr_hint_time.count == 2
                {
                    lbl_hintNum.text = "01"
                    //                bnt_hint.setTitle("Hint(01)",for: .normal)
                }
                if arr_hint_time.count == 3
                {
                    lbl_hintNum.text = "00"
                    //                bnt_hint.setTitle("Hint(00)",for: .normal)
                }
                
            }
            
            
            
            
            //        if eque == true || beforeEqe > 0
            //        {
            //            self.alertMessageOk(title: "Hint For Equation", message: "Your total is \(afterEqe)")
            //        }
            
            collection_view.reloadData()
        }
            
            
        }
    
    @IBAction func hint_btn(_ sender: Any)
    {
        undo_click = false
        
        if arr_hint_time.count > 2
        {
            
            bnt_hint.isEnabled = false
            bnt_hint.setTitleColor(UIColor.lightGray, for: UIControlState.normal)
            
//            alertMessageOk(title: "", message: "Sorry,you can use hint only three times")
        }
            
        else
        {
            
            
            
            let sTr_sound = UserDefaults.standard.object(forKey: "music") as? String
            if sTr_sound == "on"
            {
                audioPlayer1.play()
            }
            
        
                
        if eque == true
        {
            print("undo aaaray in hinttttt:::: ",Array_for_undo)
            
            hintClick = true
            
//            audioPlayer1.play()
            
            print("Hint_before::", beforeEqe)
            print("Hint_aftre::", afterEqe)
            
            let after_value = afterEqe
            
            
            var sTr_afterEqe = String(afterEqe)
            print("Remove Array on hint\(removeArray)")
            
            arr_hint.removeAll()
            
            if timerOn == true
            {
                if number_Array1 .contains(sTr_afterEqe)
                {
                    if removeArray.contains(sTr_afterEqe)
                    {
                        let array_data = number_Array1.filter{$0 != ""}
                        
                        print(array_data.count)
                        
                        print("Array dataaaa",array_data)
                        
                        var arr = [[String]]()
                        
                        arr = [array_data,array_data]
                        
                        //                arr.append(array_data)
                        
                        print("Multidimentinal array:: ",arr)
                        
                        for i in 0..<array_data.count-1
                        {
                            let f_value = arr[0] [i]
                            let s_value = arr[1] [i+1]
                        
                            let fvalue_int = Int(f_value)
                            
                            let svalue_int = Int(s_value)
                            
                            print("First value",f_value)
                            print("Second Value ",s_value)
                            
                            
                            if fvalue_int! / svalue_int! == afterEqe
                            {
                                print("Div")
                                
                                if fvalue_int! % svalue_int! == 0
                                {
                                    arr_hint.append(f_value)
                                    arr_hint.append(s_value)
                                    
                                    arr_hint_index.append(String(i))
                                    arr_hint_index.append(String(i+1))
                                    
                                    break;
                                    
                                }
                                
                            }
                                
                            else if fvalue_int! * svalue_int! == afterEqe
                            {
                                print("mul")
                                arr_hint.append(f_value)
                                arr_hint.append(s_value)
                                
                                arr_hint_index.append(String(i))
                                arr_hint_index.append(String(i+1))
                                
                                break;
                            }
                                
                            else if fvalue_int! - svalue_int! == afterEqe
                            {
                                print("minus")
                                arr_hint.append(f_value)
                                arr_hint.append(s_value)
                                
                                arr_hint_index.append(String(i))
                                arr_hint_index.append(String(i+1))
                                
                                break;
                            }
                                
                            else if fvalue_int! + svalue_int! == afterEqe
                            {
                                print("Plus")
                                arr_hint.append(f_value)
                                arr_hint.append(s_value)
                                
                                arr_hint_index.append(String(i))
                                arr_hint_index.append(String(i+1))
                                
                                
                                break;
                            }

                            
                        }
                        
                    }
                        
                    else
                    {
                        print("arr_hint hint before append \(arr_hint)")
                        
                        arr_hint.append(sTr_afterEqe)
                        
//                        let indexOfA = number_Array1.indexOf("a") // 0
                        
                        index_value = number_Array1.index(of: sTr_afterEqe)!
                        
                        arr_hint_index.append(String(index_value))
                        
                        print("arr_hint hint\(arr_hint)")
                    }
                    
                }
                    
                else if afterEqe < 28  || afterEqe > 28
                {
                    let array_data = number_Array1.filter{$0 != ""}
                    
                    print(array_data.count)
                    
                    print("Array dataaaa",array_data)
                    
                    var arr = [[String]]()
                    
                    arr = [array_data,array_data]
                    
                    //                arr.append(array_data)
                    
                    print("Multidimentinal array:: ",arr)
                    
                    for i in 0..<array_data.count-1
                    {
                        let f_value = arr[0] [i]
                        
                        //                    if i+1 == array_data.count
                        //                    {
                        //                        let s_value = arr[1] [0]
                        //                    }
                        //                    else
                        //                    {
                        let s_value = arr[1] [i+1]
                        //                    }
                        
                        
                        
                        let fvalue_int = Int(f_value)
                        
                        let svalue_int = Int(s_value)
                        
                        print("First value",f_value)
                        print("Second Value ",s_value)
                        
                        
                        if fvalue_int! / svalue_int! == afterEqe
                        {
                            print("Div")
                            
                            if fvalue_int! % svalue_int! == 0
                            {
                                arr_hint.append(f_value)
                                arr_hint.append(s_value)
                                
                                break;
                                
                            }
                            
                        }
                            
                        else if fvalue_int! * svalue_int! == afterEqe
                        {
                            print("mul")
                            arr_hint.append(f_value)
                            arr_hint.append(s_value)
                            
                            break;
                        }
                            
                        else if fvalue_int! - svalue_int! == afterEqe
                        {
                            print("minus")
                            arr_hint.append(f_value)
                            arr_hint.append(s_value)
                            
                            break;
                        }
                            
                        else if fvalue_int! + svalue_int! == afterEqe
                        {
                            print("Plus")
                            arr_hint.append(f_value)
                            arr_hint.append(s_value)
                            
                            break;
                        }
                        
                        
                        
                    }
                    
                    if arr_hint.count==0
                    {
                        for i in 0..<array_data.count-2
                        {
                            hintCall(fValue: array_data[0], sValue: array_data[1], tValue: array_data[2])
                            //                        hintCall(fValue:String, sValue:String,tValue:String)
                        }
                        
                        
                        if arr_hint.count == 0
                        {
                            //            lbl_equvalue.text = ""
                            
                            self.alertMessageOk(title: "", message: "Can’t create an equation? Use the Undo button to keep playing")
                            
                        }
                        
                        print ("Hint call")
                        //                    hint_sol()
                    }
                    
                    
                    
                    //                 int[][] finalArray = array_data
                    
                    
                    
                    
                }
                    
                    
                    //            {
                    //
                    //                if afterEqe % 5  == 0
                    //                {
                    //                   print("After euq::",afterEqe)
                    //
                    //                    if afterEqe % 5 == 0
                    //                    {
                    //
                    //                    }
                    //
                    //                    if afterEqe % 3 == 0
                    //                    {
                    //
                    //                    }
                    //
                    //                    else if afterEqe % 2 == 0
                    //                    {
                    //
                    //                        print("After euq::",afterEqe)
                    //                        sTr_afterEqe = String(afterEqe)
                    //                        let sTr_after_value = String (after_value)
                    //
                    //
                    //                        if number_Array1 .contains(sTr_afterEqe)
                    //                        {
                    //                            arr_hint.append(sTr_afterEqe)
                    //                            arr_hint.append(sTr_after_value)
                    //
                    //                        }
                    //                        else
                    //                        {
                    //                            if afterEqe % 3 == 0
                    //                            {
                    //
                    //                            }
                    //                            else
                    //                            {
                    //
                    //                            }
                    //                        }
                    //                    }
                    //
                    //                }
                    //
                    //              else if afterEqe % 3 == 0
                    //            {
                    //
                    //            }
                    //               else if afterEqe % 2 == 0
                    //                {
                    //
                    //                    print("After euq::",afterEqe)
                    //                    sTr_afterEqe = String(afterEqe)
                    //                    let sTr_after_value = String (after_value)
                    //
                    //                    
                    //                    if number_Array1 .contains(sTr_afterEqe)
                    //                    {
                    //                        arr_hint.append(sTr_afterEqe)
                    //                        arr_hint.append(sTr_after_value)
                    //                        
                    //                    }
                    //                    else
                    //                    {
                    //                        if afterEqe % 3 == 0
                    //                        {
                    //                            
                    //                        }
                    //                        else
                    //                        {
                    //                            
                    //                        }
                    //                    }
                    //                    
                    //                }
                    //                
                    //                
                    //                
                    //                
                    //                
                    //                
                    ////                for i in 0..<number_Array1.count
                    ////                {
                    ////                    let a1 = number_Array1[i]
                    ////                    
                    ////                    
                    ////                    let a2 = number_Array1[i+1]
                    ////                    
                    ////                   let a = Int(a2)! - Int(a1)!
                    ////                    
                    ////                    if a == afterEqe
                    ////                    {
                    ////                      print("ANS:: ", a)
                    ////                    }
                    ////                    else
                    ////                    {
                    ////                         print("ANS not ans:: ", a)
                    ////                    }
                    ////                    
                    ////                }
                    //            }
                    
                else
                {
                    arr_hint.append(sTr_afterEqe)
                    
                    self.alertMessageOk(title: "Hint For Equation", message: "Your total is \(afterEqe)")
                }
            }
            
            if arr_hint.count > 0
            {
                arr_hint_time.append("hint")
                
                if arr_hint_time.count == 1
                {
                    lbl_hintNum.text = "02"
                    //                bnt_hint.setTitle("Hint(02)",for: .normal)
                }
                if arr_hint_time.count == 2
                {
                    lbl_hintNum.text = "01"
                    //                bnt_hint.setTitle("Hint(01)",for: .normal)
                }
                if arr_hint_time.count == 3
                {
                    lbl_hintNum.text = "00"
                    //                bnt_hint.setTitle("Hint(00)",for: .normal)
                }
                
            }
            
            
            
            
            //        if eque == true || beforeEqe > 0
            //        {
            //            self.alertMessageOk(title: "Hint For Equation", message: "Your total is \(afterEqe)")
            //        }
            
            collection_view.reloadData()
        }
            
            
            
            
        

    }
        
        
    }
    
    func hintCall(fValue:String, sValue:String,tValue:String)
    {
        
        print("removeArray hint call",removeArray)
        
        let fvalue_int = Int(fValue)
        
        let svalue_int = Int(sValue)

        let tvalue_int = Int(tValue)
        
        print("First value:: Hint Call", fvalue_int!)
        print("Second  value:: Hint Call", svalue_int!)
        print("Thirs value:: Hint Call", tvalue_int!)
        
        var array_data:[String] = ["/", "*","+","-"]
        
        var value1: Int = 0
        var value2: Int = 0
        
        for i in 0..<4
        {
            for j in 0..<4
            {
                let data_index = array_data[i]
                
                if data_index == "/"
                {
                    value1 = fvalue_int! / svalue_int!
                    
                   if fvalue_int! % svalue_int! == 0
                {
                    print("div value1 :f value \(String(describing: fvalue_int)):s value \(String(describing: svalue_int)) : value1 \(value1)")
                }
                   else
                   {
                        break
                    }
                    
                }
                else if data_index == "*"
                {
                    value1 = fvalue_int! * svalue_int!
                    
                    print("mul value1 :f value \(String(describing: fvalue_int)):s value \(svalue_int) : value1 \(value1)")
                    
//                    print("mul value1: : : :",fvalue_int,svalue_int,value1)
                }
                else if data_index == "+"
                {
                    value1 = fvalue_int! + svalue_int!
                    print("plus value1 :f value \(String(describing: fvalue_int)):s value \(svalue_int) : value1 \(value1)")
//                    print("plus value1: : : :",fvalue_int,svalue_int,value1)
                }
                else if data_index == "-"
                {
//                    print("minus value1: : : :",fvalue_int,svalue_int,value1)
                    value1 = fvalue_int! - svalue_int!
                    print("minus value1 :f value \(String(describing: fvalue_int)):s value \(svalue_int) : value1 \(value1)")
                }
                
                
                let data_index_j = array_data[j]
                
                if data_index_j == "/"
                {
                    value2 = value1 / tvalue_int!
                    
                     if value1 % tvalue_int! == 0
                    {
                         print("Div value1 :value1 \(String(describing: value1)):t value \(tvalue_int) : value2 \(value2)")
                    }
                     else
                    {
                        break
                    }
                   
                    
//                    print("div value2: :",,,value2)
                }
                else if data_index_j == "*"
                {
                    value2 = value1 * tvalue_int!
                    print("mul value1 :value1 \(String(describing: value1)):t value \(tvalue_int) : value2 \(value2)")
                }
                else if data_index_j == "+"
                {
                    value2 = value1 + tvalue_int!
                    print("plus value1 :value1 \(String(describing: value1)):t value \(tvalue_int) : value2 \(value2)")
                }
                else if data_index_j == "-"
                {
                    value2 = value1 - tvalue_int!
                    print("minus value1 :value1 \(String(describing: value1)):t value \(tvalue_int) : value2 \(value2)")
                    
                } 
                
                print ("Values2 ",value2)
                print ("After eque ",afterEqe)
                
                if afterEqe == value2
                {
                    print ("Values 222 if",value2)
                    print("Values afteer if", afterEqe)
                    arr_hint.append(fValue)
                    arr_hint.append(sValue)
                    arr_hint.append(tValue)
                    
                    break
                }
            }
            
           
        }
        
        
        let array_data1 = number_Array1.filter{$0 != ""}
        
        print(array_data1.count)
        
        print("Array dataaaa",array_data1)
        
        if arr_hint.count == 0 && array_data1.count < 7
        {
//            lbl_equvalue.text = ""
            
            self.alertMessageOk(title: "", message: "Can’t create an equation? Use the Undo button to keep playing")

        }
        
        collection_view.reloadData()
        
    }
    
    func hint_call()
    {
        let array_data = number_Array1.filter{$0 != ""}
        
        print(array_data.count)
        
        print("Array dataaaa",array_data)
        
        var someInts:[String] = ["/", "*","+","-"]
        
        var arr = [[String]]()
        
        arr = [array_data,array_data,array_data]

        
        var value1: Int = 0
        var value2: Int = 0
        
        for i in 0..<4
        {
            let f_value = arr[0] [i]
            
            let s_value = arr[1] [i+1]
            
            let t_value = arr[2] [i+2]
            
            let fvalue_int = Int(f_value)
            
            let svalue_int = Int(s_value)
            
            let tvalue_int = Int(t_value)
            
            for j in 0..<4
            {
                
                
                let data_index = array_data[i]
                
                if data_index == "/"
                {
                    value1 = fvalue_int! / svalue_int!
                }
                else if data_index == "*"
                {
                    value1 = fvalue_int! * svalue_int!
                }
                else if data_index == "+"
                {
                    value1 = fvalue_int! + svalue_int!
                }
                else if data_index == "-"
                {
                    value1 = fvalue_int! - svalue_int!
                }
                
                let data_index_j = array_data[j]
                
                if data_index_j == "/"
                {
                    value2 = value1 / tvalue_int!
                }
                else if data_index_j == "*"
                {
                    value2 = value1 * tvalue_int!
                }
                else if data_index_j == "+"
                {
                    value2 = value1 + tvalue_int!
                }
                else if data_index_j == "-"
                {
                    value2 = value1 - tvalue_int!
                }
            }
        }
    }
    
    
    func hint_sol()
    {
        let array_data = number_Array1.filter{$0 != ""}
        
        print(array_data.count)
        
        print("Array dataaaa",array_data)
        
        var arr = [[String]]()
        
        arr = [array_data,array_data,array_data]
        
        print("Array three",arr)
        
            for i in 0..<array_data.count-2
            {
                let f_value = arr[0] [i]
                
                let s_value = arr[1] [i+1]
                
                let t_value = arr[2] [i+2]
                
                let fvalue_int = Int(f_value)
                
                let svalue_int = Int(s_value)
                
                let tvalue_int = Int(t_value)
                
                var value: Int
                
                var value_last : Int
                
                print("First value",f_value)
                print("Second Value ",s_value)
                print("Third Value ", t_value)
                
//                for i in 0...4
//                {
//                    if i == 0
//                    {
                
                       value = fvalue_int! / svalue_int!
                        
                        if fvalue_int! % svalue_int! == 0
                        {
                            value_last = value/tvalue_int!
                            
                            if value % tvalue_int! == 0 && value_last == afterEqe
                            {
//                                if value_last == afterEqe
//                                {
                                    print("DIVVV", value_last)
                                arr_hint.append(f_value)
                                arr_hint.append(s_value)
                                arr_hint.append(t_value)
                                
                                break
//                                }
                            }
                            else if value * tvalue_int! == afterEqe
                            {
                                print("DIVVV& MUL", value_last)
                                arr_hint.append(f_value)
                                arr_hint.append(s_value)
                                arr_hint.append(t_value)
                                
                                break
                            }
                                
                            else if value + tvalue_int! == afterEqe
                            {
                                print("DIVVV & add", value_last)
                                arr_hint.append(f_value)
                                arr_hint.append(s_value)
                                arr_hint.append(t_value)
                                
                                break
                                
                            }
                            
                            else if value - tvalue_int! == afterEqe
                            {
                                print("DIVVV & minus", value_last)
                                arr_hint.append(f_value)
                                arr_hint.append(s_value)
                                arr_hint.append(t_value)
                                
                                break
                            }
                            
                        }
                        else if  (fvalue_int != nil)
                        {
                            value = fvalue_int! * svalue_int!
                            value_last = value/tvalue_int!
                            
                            if value % tvalue_int! == 0 && value_last == afterEqe
                            {
//                                if value_last == afterEqe
//                                {
                                print("mul & div")
                                
                                    arr_hint.append(f_value)
                                    arr_hint.append(s_value)
                                    arr_hint.append(t_value)
                                    
                                    break
//                                }
                            }
                            else if value * tvalue_int! == afterEqe
                            {
                                print("mul & mul")
                                arr_hint.append(f_value)
                                arr_hint.append(s_value)
                                arr_hint.append(t_value)
                                
                                break
                            }
                                
                            else if value + tvalue_int! == afterEqe
                            {
                                print("mul & plus")
                                arr_hint.append(f_value)
                                arr_hint.append(s_value)
                                arr_hint.append(t_value)
                                
                                break
                                
                            }
                                
                            else if value - tvalue_int! == afterEqe
                            {
                                print("mul & minus")
                                arr_hint.append(f_value)
                                arr_hint.append(s_value)
                                arr_hint.append(t_value)
                                
                                break
                            }
                            
                        }
                        else if  (fvalue_int != nil)
                        {
                                value = fvalue_int! + svalue_int!
                                value_last = value/tvalue_int!
                                
                                if value % tvalue_int! == 0 && value_last == afterEqe
                                {
//                                    if value_last == afterEqe
//                                    {
                                    
                                    print("pluse & div")
                                        arr_hint.append(f_value)
                                        arr_hint.append(s_value)
                                        arr_hint.append(t_value)
                                        
                                        break
//                                    }
                                }
                                else if value * tvalue_int! == afterEqe
                                {
                                    print("pluse & mul")
                                    arr_hint.append(f_value)
                                    arr_hint.append(s_value)
                                    arr_hint.append(t_value)
                                    
                                    break
                                }
                                    
                                else if value + tvalue_int! == afterEqe
                                {
                                    print("pluse & Add")
                                    arr_hint.append(f_value)
                                    arr_hint.append(s_value)
                                    arr_hint.append(t_value)
                                    
                                    break
                                    
                                }
                                    
                                else if value - tvalue_int! == afterEqe
                                {
                                    print("pluse & minus")
                                    arr_hint.append(f_value)
                                    arr_hint.append(s_value)
                                    arr_hint.append(t_value)
                                    
                                    break
                                }
                                
                            }
                        
                        else if  (fvalue_int != nil)
                        {
                                value = fvalue_int! - svalue_int!
                                value_last = value/tvalue_int!
                                
                                if value % tvalue_int! == 0 && value_last == afterEqe
                                {
//                                    if value_last == afterEqe
//                                    {
                                        print("minus & div")
                                        arr_hint.append(f_value)
                                        arr_hint.append(s_value)
                                        arr_hint.append(t_value)
                                    
                                    arr_hint_index.append(String(i))
                                    arr_hint_index.append(String(i+1))
                                    arr_hint_index.append(String(i+2))
                                        
                                        break
//                                    }
                                }
                                else if value * tvalue_int! == afterEqe
                                {
                                    print("minus & mul")
                                    arr_hint.append(f_value)
                                    arr_hint.append(s_value)
                                    arr_hint.append(t_value)
                                    
                                    
                                    arr_hint_index.append(String(i))
                                    arr_hint_index.append(String(i+1))
                                    arr_hint_index.append(String(i+2))
                                    
                                    break
                                }
                                    
                                else if value + tvalue_int! == afterEqe
                                {
                                    print("minus & pluse")
                                    arr_hint.append(f_value)
                                    arr_hint.append(s_value)
                                    arr_hint.append(t_value)
                                    
                                    arr_hint_index.append(String(i))
                                    arr_hint_index.append(String(i+1))
                                    arr_hint_index.append(String(i+2))
                                    
                                    break
                                    
                                }
                                    
                                else if value - tvalue_int! == afterEqe
                                {
                                    print("minus & minus")
                                    arr_hint.append(f_value)
                                    arr_hint.append(s_value)
                                    arr_hint.append(t_value)
                                    
                                    
                                    arr_hint_index.append(String(i))
                                    arr_hint_index.append(String(i+1))
                                    arr_hint_index.append(String(i+2))
                                    
                                    break
                        }
            }
        }
    }
    
    @IBAction func btn_for_start(_ sender: UIButton)
    {
        let sTr_sound = UserDefaults.standard.object(forKey: "music") as? String
        if sTr_sound == "on"
        {
            audioPlayer.play()
        }
        
        if lbl_for_timer.text == "Start"
        {
            collection_view.isUserInteractionEnabled = true
            timerOn = true
            timer_set()
            please_selected = false
            selected_btn = true
        }
    }
    
    
    func modelChoose()
    {
        switch sTr_model
        {
            
        case "iPhone 5":
            
            
            collection_view.frame = CGRect(x: collection_view.frame.origin.x-5, y: collection_view.frame.origin.y+10, width: collection_view.frame.size.width  , height:collection_view.frame.size.height)
            
            let layout = collection_view.collectionViewLayout as? UICollectionViewFlowLayout
            layout?.minimumLineSpacing = 5
            layout?.minimumInteritemSpacing = 5
            
            break
            
        case "iPhone 5c":
            
            collection_view.frame = CGRect(x: collection_view.frame.origin.x, y: collection_view.frame.origin.y+5, width: collection_view.frame.size.width  , height:collection_view.frame.size.height)
            
            let layout = collection_view.collectionViewLayout as? UICollectionViewFlowLayout
            layout?.minimumLineSpacing = 5
            layout?.minimumInteritemSpacing = 5
            
            
            //            return "iPhone 5c"
            
            
            break
            
            
        case "iPhone 5s":
            
            collection_view.frame = CGRect(x: collection_view.frame.origin.x-5, y: collection_view.frame.origin.y+10, width: collection_view.frame.size.width  , height:collection_view.frame.size.height)
            
            let layout = collection_view.collectionViewLayout as? UICollectionViewFlowLayout
            layout?.minimumLineSpacing = 5
            layout?.minimumInteritemSpacing = 5

            
            //            return "iPhone 5s"
            break
            
        case "iPhone 6":
            
//            collection_view.frame = CGRect(x: collection_view.frame.origin.x-5, y: collection_view.frame.origin.y+10, width: collection_view.frame.size.width  , height:collection_view.frame.size.height + 30)
//            
//            
//            
//            let layout = collection_view.collectionViewLayout as? UICollectionViewFlowLayout
//            layout?.minimumLineSpacing = 15
//            layout?.minimumInteritemSpacing = 10

//            collection_view.frame = CGRect(x: collection_view.frame.origin.x-15, y: collection_view.frame.origin.y+10, width: collection_view.frame.size.width + 15 , height:collection_view.frame.size.height + 30)
//            
//            let layout = collection_view.collectionViewLayout as? UICollectionViewFlowLayout
//            layout?.minimumLineSpacing = 12
//            layout?.minimumInteritemSpacing = 8
            

            collection_view.frame = CGRect(x: collection_view.frame.origin.x-15, y: collection_view.frame.origin.y+10, width: collection_view.frame.size.width + 20 , height:collection_view.frame.size.height + 60)
            
            let layout = collection_view.collectionViewLayout as? UICollectionViewFlowLayout
            layout?.minimumLineSpacing = 18
            layout?.minimumInteritemSpacing = 12
            
            
            //            return "iPhone 6"
            
            break
        case "iPhone 6 Plus":
            


//            collection_view.frame = CGRect(x: collection_view.frame.origin.x-15, y: collection_view.frame.origin.y+10, width: collection_view.frame.size.width + 15 , height:collection_view.frame.size.height + 30)
//            
//            let layout = collection_view.collectionViewLayout as? UICollectionViewFlowLayout
//            layout?.minimumLineSpacing = 12
//            layout?.minimumInteritemSpacing = 8

            collection_view.frame = CGRect(x: collection_view.frame.origin.x-15, y: collection_view.frame.origin.y+10, width: collection_view.frame.size.width + 20 , height:collection_view.frame.size.height + 60)
            
            let layout = collection_view.collectionViewLayout as? UICollectionViewFlowLayout
            layout?.minimumLineSpacing = 18
            layout?.minimumInteritemSpacing = 12
            
            //            return "iPhone 6 Plus"
            
            
            break
            
            
        case "iPhone 6s":
            
//            collection_view.frame = CGRect(x: collection_view.frame.origin.x-5, y: collection_view.frame.origin.y+10, width: collection_view.frame.size.width  , height:collection_view.frame.size.height + 30)
//            
//            
//            
//            let layout = collection_view.collectionViewLayout as? UICollectionViewFlowLayout
//            layout?.minimumLineSpacing = 15
//            layout?.minimumInteritemSpacing = 10

//            collection_view.frame = CGRect(x: collection_view.frame.origin.x-15, y: collection_view.frame.origin.y+10, width: collection_view.frame.size.width + 15 , height:collection_view.frame.size.height + 30)
//            
//            let layout = collection_view.collectionViewLayout as? UICollectionViewFlowLayout
//            layout?.minimumLineSpacing = 12
//            layout?.minimumInteritemSpacing = 8
            

            collection_view.frame = CGRect(x: collection_view.frame.origin.x-15, y: collection_view.frame.origin.y+10, width: collection_view.frame.size.width + 20 , height:collection_view.frame.size.height + 60)
            
            let layout = collection_view.collectionViewLayout as? UICollectionViewFlowLayout
            layout?.minimumLineSpacing = 18
            layout?.minimumInteritemSpacing = 12
            
            //            return "iPhone 6s"
            
            break
            
        case "iPhone 6s Plus":
            

            collection_view.frame = CGRect(x: collection_view.frame.origin.x-15, y: collection_view.frame.origin.y+10, width: collection_view.frame.size.width + 20 , height:collection_view.frame.size.height + 60)
            
            let layout = collection_view.collectionViewLayout as? UICollectionViewFlowLayout
            layout?.minimumLineSpacing = 18
            layout?.minimumInteritemSpacing = 12
            
//            collection_view.frame = CGRect(x: collection_view.frame.origin.x-15, y: collection_view.frame.origin.y+10, width: collection_view.frame.size.width + 15 , height:collection_view.frame.size.height + 30)
//            
//            let layout = collection_view.collectionViewLayout as? UICollectionViewFlowLayout
//            layout?.minimumLineSpacing = 12
//            layout?.minimumInteritemSpacing = 8
            
            
//            collection_view.frame = CGRect(x: collection_view.frame.origin.x-5, y: collection_view.frame.origin.y+10, width: collection_view.frame.size.width  , height:collection_view.frame.size.height + 30)
//            
//            
//            
//            let layout = collection_view.collectionViewLayout as? UICollectionViewFlowLayout
//            layout?.minimumLineSpacing = 15
//            layout?.minimumInteritemSpacing = 10

            
            //            return "iPhone 6s Plus"
            
            break
            
            
        case "iPhone 7":
            //            return "iPhone 7"
            
//            collection_view.frame = CGRect(x: collection_view.frame.origin.x-15, y: collection_view.frame.origin.y+10, width: collection_view.frame.size.width + 15 , height:collection_view.frame.size.height + 30)
//            
//            let layout = collection_view.collectionViewLayout as? UICollectionViewFlowLayout
//            layout?.minimumLineSpacing = 12
//            layout?.minimumInteritemSpacing = 8

            collection_view.frame = CGRect(x: collection_view.frame.origin.x-15, y: collection_view.frame.origin.y+10, width: collection_view.frame.size.width + 20 , height:collection_view.frame.size.height + 60)
            
            let layout = collection_view.collectionViewLayout as? UICollectionViewFlowLayout
            layout?.minimumLineSpacing = 18
            layout?.minimumInteritemSpacing = 12
            
            
            
            
            break
            
            
        case "iPhone 7 Plus":
            
            //            return "iPhone 7 Plus"
            
//            collection_view.frame = CGRect(x: collection_view.frame.origin.x-15, y: collection_view.frame.origin.y+10, width: collection_view.frame.size.width + 15 , height:collection_view.frame.size.height + 30)
//            
//            let layout = collection_view.collectionViewLayout as? UICollectionViewFlowLayout
//            layout?.minimumLineSpacing = 12
//            layout?.minimumInteritemSpacing = 8

            collection_view.frame = CGRect(x: collection_view.frame.origin.x-15, y: collection_view.frame.origin.y+10, width: collection_view.frame.size.width + 20 , height:collection_view.frame.size.height + 60)
            
            let layout = collection_view.collectionViewLayout as? UICollectionViewFlowLayout
            layout?.minimumLineSpacing = 18
            layout?.minimumInteritemSpacing = 12
            
            
            break
            
            
        case "iPhone SE":
            //            return "iPhone SE"
            
            
            collection_view.frame = CGRect(x: collection_view.frame.origin.x, y: collection_view.frame.origin.y, width: collection_view.frame.size.width  , height:collection_view.frame.size.height)
            
            let layout = collection_view.collectionViewLayout as? UICollectionViewFlowLayout
            layout?.minimumLineSpacing = 5
            layout?.minimumInteritemSpacing = 5

            
            
            
            
            break
            
        case "iPhone 8":
            
//            collection_view.frame = CGRect(x: collection_view.frame.origin.x-15, y: collection_view.frame.origin.y+10, width: collection_view.frame.size.width + 15 , height:collection_view.frame.size.height + 30)
//            
//            let layout = collection_view.collectionViewLayout as? UICollectionViewFlowLayout
//            layout?.minimumLineSpacing = 12
//            layout?.minimumInteritemSpacing = 8

            collection_view.frame = CGRect(x: collection_view.frame.origin.x-15, y: collection_view.frame.origin.y+10, width: collection_view.frame.size.width + 20 , height:collection_view.frame.size.height + 60)
            
            let layout = collection_view.collectionViewLayout as? UICollectionViewFlowLayout
            layout?.minimumLineSpacing = 18
            layout?.minimumInteritemSpacing = 12
            
            //            return "iPhone 8"
            
            break
            
        case "iPhone 8 Plus":
            
            
//            collection_view.frame = CGRect(x: collection_view.frame.origin.x-5, y: collection_view.frame.origin.y+10, width: collection_view.frame.size.width  , height:collection_view.frame.size.height + 30)
//            
//            
//            
//            let layout = collection_view.collectionViewLayout as? UICollectionViewFlowLayout
//            layout?.minimumLineSpacing = 15
//            layout?.minimumInteritemSpacing = 10

//            collection_view.frame = CGRect(x: collection_view.frame.origin.x-15, y: collection_view.frame.origin.y+10, width: collection_view.frame.size.width + 15 , height:collection_view.frame.size.height + 30)
//            
//            let layout = collection_view.collectionViewLayout as? UICollectionViewFlowLayout
//            layout?.minimumLineSpacing = 12
//            layout?.minimumInteritemSpacing = 8

            collection_view.frame = CGRect(x: collection_view.frame.origin.x-15, y: collection_view.frame.origin.y+10, width: collection_view.frame.size.width + 20 , height:collection_view.frame.size.height + 60)
            
            let layout = collection_view.collectionViewLayout as? UICollectionViewFlowLayout
            layout?.minimumLineSpacing = 18
            layout?.minimumInteritemSpacing = 12
            
            //            return "iPhone 8 Plus"
            
            break
            
        case "iPhone X":
            
//            collection_view.frame = CGRect(x: collection_view.frame.origin.x-5, y: collection_view.frame.origin.y+10, width: collection_view.frame.size.width  , height:collection_view.frame.size.height + 30)
//            
//            
//            
//            let layout = collection_view.collectionViewLayout as? UICollectionViewFlowLayout
//            layout?.minimumLineSpacing = 15
//            layout?.minimumInteritemSpacing = 10

//            collection_view.frame = CGRect(x: collection_view.frame.origin.x-15, y: collection_view.frame.origin.y+10, width: collection_view.frame.size.width + 15 , height:collection_view.frame.size.height + 30)
//            
//            let layout = collection_view.collectionViewLayout as? UICollectionViewFlowLayout
//            layout?.minimumLineSpacing = 12
//            layout?.minimumInteritemSpacing = 8

            collection_view.frame = CGRect(x: collection_view.frame.origin.x-15, y: collection_view.frame.origin.y+10, width: collection_view.frame.size.width + 20 , height:collection_view.frame.size.height + 60)
            
            let layout = collection_view.collectionViewLayout as? UICollectionViewFlowLayout
            layout?.minimumLineSpacing = 18
            layout?.minimumInteritemSpacing = 12
            
            
            //            return "iPhone X"
            
            break
            
        case "Simulator":
            
//            collection_view.frame = CGRect(x: collection_view.frame.origin.x-5, y: collection_view.frame.origin.y, width: collection_view.frame.size.width  , height:collection_view.frame.size.height)
//            
//            let layout = collection_view.collectionViewLayout as? UICollectionViewFlowLayout
//            layout?.minimumLineSpacing = 5
//            layout?.minimumInteritemSpacing = 5

            
            collection_view.frame = CGRect(x: collection_view.frame.origin.x-15, y: collection_view.frame.origin.y+10, width: collection_view.frame.size.width + 20 , height:collection_view.frame.size.height + 60)
            
            let layout = collection_view.collectionViewLayout as? UICollectionViewFlowLayout
            layout?.minimumLineSpacing = 18
            layout?.minimumInteritemSpacing = 12
            
            
            break
            
            
//            return "Simulator"
        default:
            
            break
//            return sTr_model
            
            
        }
    }
    
    func startMETHOD()
    {
//        audioPlayer.play()

        startFromAlert = true
        
        if lbl_for_timer.text == "Start"
        {
            collection_view.isUserInteractionEnabled = true
            timerOn = true
            
            please_selected = false
            selected_btn = true
            
            if sTr_level == "hard"
            {
                
            }
                
            else
            {
                timer_set()
            }
            
        }
        
    }
    
    
    // MARK: - GADBannerViewDelegate
    
    // Called when an ad request loaded an ad.
    func adViewDidReceiveAd(_ bannerView: GADBannerView)
    {
        print(#function)
        
        ad_view.frame = bannerView.frame
        ad_view = bannerView
        
    }
    
    // Called when an ad request failed.
    func adView(_ bannerView: GADBannerView, didFailToReceiveAdWithError error: GADRequestError) {
        print("\(#function): \(error.localizedDescription)")
    }
    
    // Called just before presenting the user a full screen view, such as a browser, in response to
    // clicking on an ad.
    func adViewWillPresentScreen(_ bannerView: GADBannerView) {
        print(#function)
    }
    
    // Called just before dismissing a full screen view.
    func adViewWillDismissScreen(_ bannerView: GADBannerView) {
        print(#function)
    }
    
    // Called just after dismissing a full screen view.
    func adViewDidDismissScreen(_ bannerView: GADBannerView) {
        print(#function)
    }
    
    // Called just before the application will background or terminate because the user clicked on an
    // ad that will launch another application (such as the App Store).
    func adViewWillLeaveApplication(_ bannerView: GADBannerView) {
        print(#function)
    }
        
    }


// MARK:- Extension file

extension UIViewController
{
    func alertMessageOk(title: String, message: String)
    {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(action)
        UIApplication.shared.endIgnoringInteractionEvents()
        present(alert, animated: true, completion: nil)
    }
}

extension MutableCollection where Indices.Iterator.Element == Index {
    /// Shuffles the contents of this collection.
    mutating func shuffle()
    {
        let c = count
        guard c > 1 else
        {
            return
        }
        
        for (firstUnshuffled , unshuffledCount) in zip(indices, stride(from: c, to: 1, by: -1))
        {
            let d: IndexDistance = numericCast(arc4random_uniform(numericCast(unshuffledCount)))
//            print("DDDD :::",d)
            guard d != 0 else
            {
                continue
            }
            
            let i = index(firstUnshuffled, offsetBy: d)
            
//            print("IIII::: ",i)
            
//            swap(&self[firstUnshuffled], &d )
            
            swap(&self[firstUnshuffled], &self[i])
        }
    }
}

extension Sequence {
    /// Returns an array with the contents of this sequence, shuffled.
    func shuffled() -> [Iterator.Element] {
        var result = Array(self)
        result.shuffle()
        return result
    }
}

public extension UIDevice
{
    
    var modelName: String
    {
        var systemInfo = utsname()
        uname(&systemInfo)
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        let identifier = machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8, value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }
        
        switch identifier
        {
        case "iPod5,1":                                 return "iPod Touch 5"
        case "iPod7,1":                                 return "iPod Touch 6"
        case "iPhone3,1", "iPhone3,2", "iPhone3,3":     return "iPhone 4"
        case "iPhone4,1":                               return "iPhone 4s"
        case "iPhone5,1", "iPhone5,2":                  return "iPhone 5"
        case "iPhone5,3", "iPhone5,4":                  return "iPhone 5c"
        case "iPhone6,1", "iPhone6,2":                  return "iPhone 5s"
        case "iPhone7,2":                               return "iPhone 6"
        case "iPhone7,1":                               return "iPhone 6 Plus"
        case "iPhone8,1":                               return "iPhone 6s"
        case "iPhone8,2":                               return "iPhone 6s Plus"
        case "iPhone9,1", "iPhone9,3":                  return "iPhone 7"
        case "iPhone9,2", "iPhone9,4":                  return "iPhone 7 Plus"
        case "iPhone8,4":                               return "iPhone SE"
        case "iPhone10,1", "iPhone10,4":                return "iPhone 8"
        case "iPhone10,2", "iPhone10,5":                return "iPhone 8 Plus"
        case "iPhone10,3", "iPhone10,6":                return "iPhone X"
        case "iPad2,1", "iPad2,2", "iPad2,3", "iPad2,4":return "iPad 2"
        case "iPad3,1", "iPad3,2", "iPad3,3":           return "iPad 3"
        case "iPad3,4", "iPad3,5", "iPad3,6":           return "iPad 4"
        case "iPad4,1", "iPad4,2", "iPad4,3":           return "iPad Air"
        case "iPad5,3", "iPad5,4":                      return "iPad Air 2"
        case "iPad6,11", "iPad6,12":                    return "iPad 5"
        case "iPad2,5", "iPad2,6", "iPad2,7":           return "iPad Mini"
        case "iPad4,4", "iPad4,5", "iPad4,6":           return "iPad Mini 2"
        case "iPad4,7", "iPad4,8", "iPad4,9":           return "iPad Mini 3"
        case "iPad5,1", "iPad5,2":                      return "iPad Mini 4"
        case "iPad6,3", "iPad6,4":                      return "iPad Pro 9.7 Inch"
        case "iPad6,7", "iPad6,8":                      return "iPad Pro 12.9 Inch"
        case "iPad7,1", "iPad7,2":                      return "iPad Pro 12.9 Inch 2. Generation"
        case "iPad7,3", "iPad7,4":                      return "iPad Pro 10.5 Inch"
        case "AppleTV5,3":                              return "Apple TV"
        case "AppleTV6,2":                              return "Apple TV 4K"
        case "AudioAccessory1,1":                       return "HomePod"
        case "i386", "x86_64":                          return "Simulator"
        default:                                        return identifier
        }
    }
    
}
