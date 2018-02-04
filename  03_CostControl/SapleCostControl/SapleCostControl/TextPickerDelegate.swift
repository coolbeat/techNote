//
//  TextPickerDelegate.swift
//  SapleCostControl
//
//  Created by n_ozawa711 on 2018/02/04.
//  Copyright © 2018年 n_ozawa711. All rights reserved.
//

import UIKit

protocol TextPickerDelegate {
    
    func pickerView(inputAccessoryViewFor pickerView: TextPicker) -> UIView?
    func pickerView(didSelect value: String, inRow row: Int, inComponent component: Int, delegatedFrom pickerView: TextPicker)
    
}
