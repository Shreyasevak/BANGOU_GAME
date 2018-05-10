//
//  one_statastic_View.swift
//  BANGOU_GAME
//
//  Created by mac on 3/12/18.
//  Copyright © 2018 pc. All rights reserved.
//

import UIKit

class one_statastic_View: UIViewController {

    @IBOutlet var lbl_hardData: UILabel!
    @IBOutlet var lbl_easyData: UILabel!
    
    var array_data:NSArray? = nil
    var array_data2:NSArray? = nil
    
    override func viewDidLoad()
    {
        
    
        var data: NSData? = nil
        data = UserDefaults.standard.object(forKey: "bestScor_hard") as? NSData
        
        if data == nil
        {
            
            lbl_hardData.text = "No data"
            
        }
            
        else
        {
            var arr_bestscor = [String]()
            arr_bestscor = (NSKeyedUnarchiver.unarchiveObject(with: data! as Data) as! NSArray)     as! [String]
            
            array_data2 = arr_bestscor as NSArray
            
            print("array_data score: ",array_data2)
            
            print("bestScor_hard score: ",arr_bestscor)
            
            
            
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
                
                var sTr_value = ""
                
                for i in 0 ..< arr_bestscor.count-1
                {
                    
                    
                    if a3 == 0
                    {
                        a1 = Int(arr_bestscor[i])!
                        
                        a2 = Int(arr_bestscor[i+1])!
                        
                        if a1 > a2
                        {
                            a3 = a1
                            index_value = String(a3)
                            //                        index_value = arr_bestscor[i]
                        }
                        else
                        {
                            a3 = a2
                            index_value = String(a3)
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
                            //                        index_value = arr_bestscor[i]
                        }
                            
                        else if a3 > a1
                        {
                            index_value = String(a3)
                            //                        index_value = arr_bestscor[i+1]
                        }
                        else if a1 > a2
                        {
                            a3 = a1
                            index_value = String(a1)
                            //                        index_value = arr_bestscor[i+1]
                        }
                        else if a2 > a1
                        {
                            a3 = a2
                            index_value = String(a2)
                            //                        index_value = arr_bestscor[i+1]
                        }
                            
                        else
                        {
                            index_value = String(a3)
                        }
                        
                    }
                    
                    
                }
                
                sTr_value = String(index_value)
                
                lbl_hardData.text = "Best score: " + sTr_value
                
                
                
            }
            
            
            
            
            
        }
        
        var arr_time = [String]()
        
        var data1: NSData? = nil
        data1 = UserDefaults.standard.object(forKey: "BestTime") as? NSData
        
        if data1 == nil
        {
           lbl_easyData.text = "No data"
            
            
        }
            
        else
        {
            var sTr_value1 = ""
            arr_time = (NSKeyedUnarchiver.unarchiveObject(with: data! as Data) as! NSArray) as! [String]
            
            print("Best score time: ",arr_time)
            
            
            //                var a3 : Int = 0
            
            var a3: Int?
            
            //            var a3 = Float(0)
            
            //                var a1 : Int
            //                var a1: Int?
            var a1: Int? = 0
            
            //                var a2:Int
            //                var a2: Int?
            
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
                    
                    
                }
                
            }
            
            sTr_value1 =  index_value
            
            lbl_easyData.text = "Best time:" + sTr_value1
            
        }
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backClick(_ sender: Any)
    {
        self.navigationController?.popViewController(animated: true)

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
