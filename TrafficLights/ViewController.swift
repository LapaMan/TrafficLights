//
//  ViewController.swift
//  TrafficLights
//
//  Created by user on 01/05/2023.
//

import UIKit

enum CurrentLight {
    case red, yellow, green
}

class ViewController: UIViewController {
    
    @IBOutlet var redLight: UIView!
    @IBOutlet var yellowLight: UIView!
    @IBOutlet var greenLight: UIView!
    
    @IBOutlet var startButtom: UIButton!
    
    //текущий цвет красный
    private var currentLight = CurrentLight.red
    //если вкл цвет
    private let lightIsOn: CGFloat = 1
    //если выкл цвет
    private let lightIsOff: CGFloat = 0.3
    
    //фиксированые констрейны
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        
        startButtom.layer.cornerRadius = 10
        
        //все кнопки выкл
        redLight.alpha = lightIsOff
        yellowLight.alpha = lightIsOff
        greenLight.alpha = lightIsOff
    }
    
    //динамические констрейны
    override func viewWillLayoutSubviews() {
        redLight.layer.cornerRadius = redLight.frame.width / 2
        yellowLight.layer.cornerRadius = redLight.frame.width / 2
        greenLight.layer.cornerRadius = redLight.frame.width / 2
    }
    
    //при нажатие кнопки
    @IBAction func startButtomOresseed() {
        
        startButtom.setTitle("NEXT", for: .normal)
        
        switch currentLight {
        case .red:
            greenLight.alpha = lightIsOff
            redLight.alpha = lightIsOn
            currentLight = .yellow
        case .yellow:
            redLight.alpha = lightIsOff
            yellowLight.alpha = lightIsOn
            currentLight = .green
        case .green:
            greenLight.alpha = lightIsOn
            yellowLight.alpha = lightIsOff
            currentLight = .red
        }
    }
}

