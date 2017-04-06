//
//  nisPaymentDate.swift
//  BFTV-MDS
//
//  Created by Luzenildo Junior on 06/04/17.
//  Copyright © 2017 LAVID-UFPB. All rights reserved.
//

import Foundation
import UIKit

class NisPaymentDate{
    
    class func determinePaymentDates(nisLastNumber: String) -> [Date]{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy MM dd"
        switch nisLastNumber {
        case "1":
            return [
                dateFormatter.date(from: "2017 01 18")!,
                dateFormatter.date(from: "2017 02 13")!,
                dateFormatter.date(from: "2017 03 20")!,
                dateFormatter.date(from: "2017 04 13")!,
                dateFormatter.date(from: "2017 05 18")!,
                dateFormatter.date(from: "2017 06 19")!,
                dateFormatter.date(from: "2017 07 18")!,
                dateFormatter.date(from: "2017 08 18")!,
                dateFormatter.date(from: "2017 09 18")!,
                dateFormatter.date(from: "2017 10 18")!,
                dateFormatter.date(from: "2017 11 17")!,
                dateFormatter.date(from: "2017 12 11")!,
            ]
        case "2":
            return [
                dateFormatter.date(from: "2017 01 19")!,
                dateFormatter.date(from: "2017 02 14")!,
                dateFormatter.date(from: "2017 03 21")!,
                dateFormatter.date(from: "2017 04 17")!,
                dateFormatter.date(from: "2017 05 19")!,
                dateFormatter.date(from: "2017 06 20")!,
                dateFormatter.date(from: "2017 07 19")!,
                dateFormatter.date(from: "2017 08 21")!,
                dateFormatter.date(from: "2017 09 19")!,
                dateFormatter.date(from: "2017 10 19")!,
                dateFormatter.date(from: "2017 11 20")!,
                dateFormatter.date(from: "2017 12 12")!,
            ]
        case "3":
            return [
                dateFormatter.date(from: "2017 01 20")!,
                dateFormatter.date(from: "2017 02 15")!,
                dateFormatter.date(from: "2017 03 22")!,
                dateFormatter.date(from: "2017 04 18")!,
                dateFormatter.date(from: "2017 05 22")!,
                dateFormatter.date(from: "2017 06 21")!,
                dateFormatter.date(from: "2017 07 20")!,
                dateFormatter.date(from: "2017 08 22")!,
                dateFormatter.date(from: "2017 09 20")!,
                dateFormatter.date(from: "2017 10 20")!,
                dateFormatter.date(from: "2017 11 21")!,
                dateFormatter.date(from: "2017 12 13")!,
            ]
        case "4":
            return [
                dateFormatter.date(from: "2017 01 23")!,
                dateFormatter.date(from: "2017 02 16")!,
                dateFormatter.date(from: "2017 03 23")!,
                dateFormatter.date(from: "2017 04 19")!,
                dateFormatter.date(from: "2017 05 23")!,
                dateFormatter.date(from: "2017 06 22")!,
                dateFormatter.date(from: "2017 07 21")!,
                dateFormatter.date(from: "2017 08 23")!,
                dateFormatter.date(from: "2017 09 21")!,
                dateFormatter.date(from: "2017 10 23")!,
                dateFormatter.date(from: "2017 11 22")!,
                dateFormatter.date(from: "2017 12 14")!,
            ]
        case "5":
            return [
                dateFormatter.date(from: "2017 01 24")!,
                dateFormatter.date(from: "2017 02 17")!,
                dateFormatter.date(from: "2017 03 24")!,
                dateFormatter.date(from: "2017 04 20")!,
                dateFormatter.date(from: "2017 05 24")!,
                dateFormatter.date(from: "2017 06 23")!,
                dateFormatter.date(from: "2017 07 24")!,
                dateFormatter.date(from: "2017 08 24")!,
                dateFormatter.date(from: "2017 09 22")!,
                dateFormatter.date(from: "2017 10 24")!,
                dateFormatter.date(from: "2017 11 23")!,
                dateFormatter.date(from: "2017 12 15")!,
            ]
        case "6":
            return [
                dateFormatter.date(from: "2017 01 25")!,
                dateFormatter.date(from: "2017 02 20")!,
                dateFormatter.date(from: "2017 03 27")!,
                dateFormatter.date(from: "2017 04 24")!,
                dateFormatter.date(from: "2017 05 25")!,
                dateFormatter.date(from: "2017 06 26")!,
                dateFormatter.date(from: "2017 07 25")!,
                dateFormatter.date(from: "2017 08 25")!,
                dateFormatter.date(from: "2017 09 25")!,
                dateFormatter.date(from: "2017 10 25")!,
                dateFormatter.date(from: "2017 11 24")!,
                dateFormatter.date(from: "2017 12 18")!,
            ]
        case "7":
            return [
                dateFormatter.date(from: "2017 01 26")!,
                dateFormatter.date(from: "2017 02 21")!,
                dateFormatter.date(from: "2017 03 28")!,
                dateFormatter.date(from: "2017 04 25")!,
                dateFormatter.date(from: "2017 05 26")!,
                dateFormatter.date(from: "2017 06 27")!,
                dateFormatter.date(from: "2017 07 26")!,
                dateFormatter.date(from: "2017 08 28")!,
                dateFormatter.date(from: "2017 09 26")!,
                dateFormatter.date(from: "2017 10 26")!,
                dateFormatter.date(from: "2017 11 27")!,
                dateFormatter.date(from: "2017 12 19")!,
            ]
        case "8":
            return [
                dateFormatter.date(from: "2017 01 27")!,
                dateFormatter.date(from: "2017 02 22")!,
                dateFormatter.date(from: "2017 03 29")!,
                dateFormatter.date(from: "2017 04 26")!,
                dateFormatter.date(from: "2017 05 29")!,
                dateFormatter.date(from: "2017 06 28")!,
                dateFormatter.date(from: "2017 07 27")!,
                dateFormatter.date(from: "2017 08 29")!,
                dateFormatter.date(from: "2017 09 27")!,
                dateFormatter.date(from: "2017 10 27")!,
                dateFormatter.date(from: "2017 11 28")!,
                dateFormatter.date(from: "2017 12 20")!,
            ]
        case "9":
            return [
                dateFormatter.date(from: "2017 01 30")!,
                dateFormatter.date(from: "2017 02 23")!,
                dateFormatter.date(from: "2017 03 30")!,
                dateFormatter.date(from: "2017 04 27")!,
                dateFormatter.date(from: "2017 05 30")!,
                dateFormatter.date(from: "2017 06 29")!,
                dateFormatter.date(from: "2017 07 28")!,
                dateFormatter.date(from: "2017 08 30")!,
                dateFormatter.date(from: "2017 09 28")!,
                dateFormatter.date(from: "2017 10 30")!,
                dateFormatter.date(from: "2017 11 29")!,
                dateFormatter.date(from: "2017 12 21")!,
            ]
        case "0":
            return [
                dateFormatter.date(from: "2017 01 31")!,
                dateFormatter.date(from: "2017 02 24")!,
                dateFormatter.date(from: "2017 03 31")!,
                dateFormatter.date(from: "2017 04 28")!,
                dateFormatter.date(from: "2017 05 31")!,
                dateFormatter.date(from: "2017 06 30")!,
                dateFormatter.date(from: "2017 07 31")!,
                dateFormatter.date(from: "2017 08 31")!,
                dateFormatter.date(from: "2017 09 29")!,
                dateFormatter.date(from: "2017 10 31")!,
                dateFormatter.date(from: "2017 11 30")!,
                dateFormatter.date(from: "2017 12 22")!,
            ]
        default:
            return [DateFormatter().date(from: "2017 01 01")!]
        }
    }
}
