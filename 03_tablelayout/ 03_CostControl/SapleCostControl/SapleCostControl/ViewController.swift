//
//  ViewController.swift
//  SapleCostControl
//
//  Created by n_ozawa711 on 2018/02/04.
//  Copyright © 2018年 n_ozawa711. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    fileprivate var picker: TextPicker?
    var label =  UILabel ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.red // 背景を赤に
        // Do any additional setup after loading the view, typically from a nib.
        
//        displaySlider()
     
        
        // ボタンのサイズを定義.
        let bWidth: CGFloat = 200
        let bHeight: CGFloat = 50
        
        // 配置する座標を定義(画面の中心).
        let posX: CGFloat = self.view.bounds.width/2 - bWidth/2
        let posY: CGFloat = self.view.bounds.height/2 - bHeight/2
        
        // Labelを作成.
       label = UILabel(frame: CGRect(x: posX, y: posY, width: bWidth, height: bHeight))
        
        // UILabelの背景をオレンジ色に.
        label.backgroundColor = UIColor.orange
       let tapGestureRecognizer =  UITapGestureRecognizer(target: self, action: #selector(handleTap))
        label.addGestureRecognizer(tapGestureRecognizer)

        label.text = "abcde"
        view.addSubview(label)
        
        
        
         displayPickerView()
    }
    
    @objc func handleTap(sender: UITapGestureRecognizer) {
         picker?.startPicking()
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func displayPickerView(){
    
        picker = TextPicker(parentViewController: self)
        picker?.delegate = self
        picker?.set(items: [["aaa", "bbb", "ccc"], ["1", "2", "3"]])
        
       
        
        
    }

    
    func displaySlider(){
        // スライダーの作成
        let slider = UISlider()
        
        // 長さを変更
        slider.frame.size.width = 50
        slider.sizeToFit()
        slider.center = self.view.center
        
        // スライダーの値が変更された時に呼び出されるメソッドを設定
//        slider.addTarget(self, action: #selector(self.onChange), for: .valueChanged)
        slider.addTarget(self, action: #selector(self.onChange(_:)), for: .valueChanged)
        // 最小値・最大値の設定
        slider.minimumValue = -100
        slider.maximumValue = 100
        
        
        // デフォルト値の設定
        slider.setValue(50.0, animated: true)
        
        // 色の変更
        slider.tintColor = UIColor.red
        
        // スライダーを画面に追加
        self.view.addSubview(slider)
    }
    
   @objc func onChange(_ sender: UISlider) {
        // スライダーの値が変更された時の処理
        print(sender.value)
    }

}


// MARK: PickerViewDelegate

extension ViewController: TextPickerDelegate {
    
    @objc func pickerCancelAction() {
        picker?.endPicking()
    }
    
    @objc func pickerSetAction() {
        if let selectedItems = picker?.selectedItems {
            label.text = "\(selectedItems)"
        }
    }
    
    func pickerView(inputAccessoryViewFor pickerView: TextPicker) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 30))
        view.backgroundColor = .white
        let buttonWidth: CGFloat = 100
        
        let cancelButton = UIButton(frame: CGRect(x: UIScreen.main.bounds.width - buttonWidth - 10, y: 0, width: buttonWidth, height: 30))
        cancelButton.setTitle("Cancel", for: .normal)
        cancelButton.setTitleColor(.black, for: .normal)
        cancelButton.setTitleColor(.lightGray, for: .highlighted)
        cancelButton.addTarget(self, action: #selector(pickerCancelAction), for: .touchUpInside)
        view.addSubview(cancelButton)
        
        let setButton = UIButton(frame: CGRect(x: 10, y: 0, width: buttonWidth, height: 30))
        setButton.setTitle("Set", for: .normal)
        setButton.setTitleColor(.black, for: .normal)
        setButton.setTitleColor(.lightGray, for: .highlighted)
        setButton.addTarget(self, action: #selector(pickerSetAction), for: .touchUpInside)
        view.addSubview(setButton)
        
        return view
    }
    
    func pickerView(didSelect value: String, inRow row: Int, inComponent component: Int, delegatedFrom pickerView: TextPicker) {
        print("\(value)")
    }
    
}
