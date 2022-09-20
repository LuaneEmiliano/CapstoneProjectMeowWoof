//
//  PetDiscountModel.swift
//  MeowWoofPetDiary
//
//  Created by luane Niejelski on 9/1/22.
//

import Foundation
import UIKit

// Var containing the prices of 7 (or any number of) items.
let prices: [Double] = [49.00, 15.00, 35.00, 17.99,  31.99, 12.75,  28.97]
//  totalAmount: Total amount of all items before applying discount. (A single value.)
let totalAmount: Double = prices.reduce(0, +)
//Dicount Percentage
var discountPercentageTypeDictionary: [String: Double] = ["Defaults": 5.0, "Thanksgiving": 10.0, "Christmas": 15.0, "New Year": 20.0,"BlackFriday": 30]
// DiscountAmount
let discountedAmount: Double = 5.0
//totalAmountAfterDiscount: total Amount - discountedAmount.
let discountedAmountAfterDiscount: Double = totalAmount * discountedAmount / 100.0

func totalAmountAfterDiscount(totalAmount: Double, discountPercentage: String) -> Double {
    totalAmount - totalAmount * (Double(discountPercentage) ?? 0.0) / 100.0
}

enum DiscountTypes: String, CaseIterable {
    case blackFriday = "blackFriday", christmas = "Christmas", memorialDay = "Memorial Day", newYear = "New Year", defaults = "Defaults"
}
func printDiscount(discountTypes: DiscountTypes) {
    switch discountTypes {
    case .blackFriday:
        print("The BlackFriday discount is: 10.0 %")
    case.christmas:
        print("The Christmas discount is: 15.0 %")
    case.memorialDay:
        print("The Memorial Day discount is: 10.0 %")
    case.newYear:
        print("The New Year discount is: 15.0 %")
    case.defaults:
        print("The Default discount is: 5.0 %")
        
    }
}

