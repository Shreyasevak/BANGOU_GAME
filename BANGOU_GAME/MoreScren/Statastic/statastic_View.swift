//
//  statastic_View.swift
//  BANGOU_GAME
//
//  Created by mac on 3/10/18.
//  Copyright © 2018 pc. All rights reserved.
//

import UIKit

class statastic_View: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    var array_data:NSArray? = nil
    var array_data2:NSArray? = nil
    
    
    
    @IBOutlet var tblView: UITableView!
    
    let section = ["Easy", "Hard"]
    
    override func viewDidLoad()
    {
        
        var data: NSData? = nil
        data = UserDefaults.standard.object(forKey: "bestScor_hard") as? NSData
        
        if data == nil
        {
            
            
            
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
                    
                    a1 = Int(arr_bestscor[i])!
                    
                    a2 = Int(arr_bestscor[i+1])!
                    
                    print("1st value",a1)
                    print("2nd value",a2)
                    
                    if a3 == 0
                    {
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
                
                
                
            }
            
            
            
            
        
        }
       
        var arr_time = [String]()
        
        var data1: NSData? = nil
        data1 = UserDefaults.standard.object(forKey: "BestTime") as? NSData
        
        if data1 == nil
        {
            
            
            
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
            
        }
        
        
        
      
        
        
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func backClick(_ sender: Any)
    {
        self.navigationController?.popViewController(animated: true)
    }
    
    // MARK: - tableView method
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        
        switch (section)
        {
            
        case 0:
            
            if array_data?.count == nil
            {
                return 0
            }
            else
            {
                return array_data!.count
            }
//            return (array_data?.count)!
            
        case 1:
            
            if array_data2?.count == nil
            {
                return 0
            }
                
            else
            {
                return array_data2!.count
            }
//            return (array_data2?.count)!
            
        default:
            
            return 1
            
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String?
    {
        return self.section [section]
    }

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath)
    {
        cell.contentView.backgroundColor = UIColor.clear
        let whiteRoundedView = UIView(frame: CGRect(x: 10, y: 2, width: view.frame.size.width - 20, height: cell.contentView.frame.size.height - 15))
        whiteRoundedView.layer.backgroundColor = UIColor.white.cgColor
        whiteRoundedView.layer.masksToBounds = false
        //    whiteRoundedView.layer.cornerRadius = 5.0;
        whiteRoundedView.layer.shadowOffset = CGSize(width: -1, height: 1)
        whiteRoundedView.layer.shadowOpacity = 0.2
        cell.contentView.addSubview(whiteRoundedView)
        cell.contentView.sendSubview(toBack: whiteRoundedView)
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int
    {
        // #warning Incomplete implementation, return the number of sections
        return 2
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! statastic_ViewCell
        
         switch (indexPath.section)
        {
            
        case 0:
            
            let sTr_name = (array_data?[indexPath.row] as AnyObject) as! String
            
            cell.lbl_name.text = "Top time:- " + sTr_name
            
        case 1:
            
            let sTr_name = (array_data2?[indexPath.row] as AnyObject) as! String
            
            cell.lbl_name.text = "Top score:- " + sTr_name
            
            
        default:
            
            cell.lbl_name.text = ""
            
        }
        
        return cell
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
