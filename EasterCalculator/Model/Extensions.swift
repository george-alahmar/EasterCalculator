//
//  Extensions.swift
//  EasterCalculator
//
//  Created by George Alahmar on 6/29/20.
//  Copyright © 2020 George Alahmar. All rights reserved.
//

import Foundation

extension String {
    
    func toDate(withFormat format: String = "yyyy-MM-dd") -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        dateFormatter.dateFormat = format
        guard let date = dateFormatter.date(from: self) else {
            preconditionFailure("Take a look to your format")
        }
        return date
    }
}

extension Date{
    func AddDays(days:Int)->Date{
         var dateComponent = DateComponents()
         dateComponent.day = days
        return Calendar.current.date(byAdding: dateComponent, to: self)!
    }
}


extension Date {
    func isEqualTo(targetDate:Date)->Bool{
        let targetComponents = Calendar.current.dateComponents([.year,.month,.day], from: targetDate)
        let components =  Calendar.current.dateComponents([.year,.month,.day], from: self)
        if((targetComponents.year == components.year) && (targetComponents.month == components.month) && (targetComponents.day == components.day)){
            return true
        }
        else
        {
            return false
        }
    }
}
