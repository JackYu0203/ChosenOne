//
//  ViewController.swift
//  ChosenOne
//
//  Created by JackYu on 2021/1/31.
//

import UIKit

struct quetionStruct {
    let quetion:String
    var choosen:[String]=[]
    let answer:Int
    let selected:Bool
}


class ViewController: UIViewController {
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var quetionLabel: UILabel!
    @IBOutlet weak var quetionNumber: UILabel!
    @IBOutlet weak var score1: UILabel!
    
    var count=1
    var point=0
    var timer=Timer()
    var timerCount=10
    var quetionArray:[quetionStruct]=[]
        
    func setQuetion(){
                
        quetionArray.append(quetionStruct(quetion:"木曜四有幾個主持人?", choosen:["4","5","6"], answer: 3, selected:false))
        
        quetionArray.append(quetionStruct(quetion: "皮卡丘是什麼顏色?",
            choosen:["黑色","黃色","綠色"], answer: 2, selected: false))
        
        quetionArray.append(quetionStruct(quetion:"水之呼吸第一式?", choosen:["流流舞","水面斬","水車"], answer: 2, selected:false))
        
        quetionArray.append(quetionStruct(quetion:"地球上體型最大的生物?", choosen:["藍鯨","座頭鯨","長鬚鯨"], answer: 1, selected:false))
        
        quetionArray.append(quetionStruct(quetion:"哪個動物有方形瞳孔?", choosen:["梅花鹿","馬","山羊"], answer: 3, selected:false))
        
        quetionArray.append(quetionStruct(quetion:"36+48= ?", choosen:["82","76","84"], answer: 3, selected:false))
        
        quetionArray.append(quetionStruct(quetion:"iPhone12 Pro 有幾個鏡頭?", choosen:["2","3","4"], answer: 2, selected:false))
        
        quetionArray.append(quetionStruct(quetion:"佐助的輪迴眼有幾個勾玉?", choosen:["6","7","9"], answer: 1, selected:false))
        
        quetionArray.append(quetionStruct(quetion:"TEP-102有多少人?", choosen:["12","13","14"], answer: 1, selected:false))
        
        quetionArray.append(quetionStruct(quetion:"體型最大的鹿?", choosen:["馴鹿","麋鹿","駝鹿"], answer: 3, selected:false))
        print(quetionArray)
        
        quetionArray.shuffle()
    }
    
    
 
    
        
    func getQuetion()
    {
        quetionLabel.text = quetionArray[count-1].quetion
        
        quetionNumber.text="Q"+String(count)
        button1.setTitle(quetionArray[count-1].choosen[0], for:UIControl.State.normal)
        button2.setTitle(quetionArray[count-1].choosen[1], for:UIControl.State.normal)
        button3.setTitle(quetionArray[count-1].choosen[2], for:UIControl.State.normal)
    }
        
        
    override func viewDidLoad() {
        super.viewDidLoad()
        setQuetion()
        getQuetion()
    }
    
    @IBAction func Button(_ sender: UIButton) {
        if((sender==button1&&quetionArray[count-1].answer==1)||(sender==button2&&quetionArray[count-1].answer==2)||(sender==button3&&quetionArray[count-1].answer==3)) {
            point = point + 10
            score1.text=String(point)
        }
        
        timerCount = 10;
        count = count + 1
        if (count <= 10){
            getQuetion()
        }
        else{
            button1.isEnabled=false
            button2.isEnabled=false
            button3.isEnabled=false
            
            performSegue(withIdentifier: "showResult", sender: self)
        }
    }
    
    @IBSegueAction func showResul(_ coder: NSCoder) -> ResultViewController? {

        let controller = ResultViewController(coder: coder)

        controller?.textScore = TotalScore.init(finalscore: point)

        return controller
    }
    
}

