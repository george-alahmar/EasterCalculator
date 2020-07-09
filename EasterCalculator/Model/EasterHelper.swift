//
//  EasterHelper.swift
//  EasterCalculator
//
//  Created by George Alahmar on 6/28/20.
//  Copyright © 2020 George Alahmar. All rights reserved.
//

import Foundation


final class EasterHelper{
    
    static func getJulianEaster(year:Int)->Date{
        var g:Int = 0
        var i:Int = 0
        var j:Int = 0
        var p:Int = 0
        
        g = year % 19
        i = (19 * g + 15 ) % 30
        j = (year + (year / 4) + i ) % 7
        p = i - j + 28
        var day = p
        var month = 4
        if (p > 31){
            day = p - 31
        }
        else{
            month = 3
        }
        return "\(year)-\(month)-\(day)".toDate()
    }
    
    
    static func getWesternEaster(year:Int)->Date{
        var g:Int = 0
        var c:Int = 0
        var h:Int = 0
        var i:Int = 0
        var j:Int = 0
        var p:Int = 0
        
        g = year % 19
        c = year / 100
        h = c - (c / 4)
        h = h - ((8 * c + 13) / 25)
        h = h + 19 * g + 15
        h = h % 30
        i = h - (h / 28) * (1 - (h / 28) * (29 / (h + 1)) * ((21 - g) / 11))
        j = (year + (year / 4 ) + i + 2 - c + (c / 4)) % 7
        p = i - j + 28
        
        var day = p
        var month = 4
        if (p > 31){
            day = p - 31
        }
        else{
            month = 3
        }
        
        return "\(year)-\(month)-\(day)".toDate()
        
    }
    
    static func getOrthodoxEaster(julianDate:Date)->Date{
        var extra:Int = 10
        var tmp:Int = 0
        var day = 0
        var month = 0
        
        let calendar = Calendar.current
        let julianYear = calendar.component(.year, from: julianDate)
        let julianMonth = calendar.component(.month, from: julianDate)
        let julianDay = calendar.component(.day, from: julianDate)
        
        if(julianYear > 1600){
            tmp = julianYear / 100 - 16
            extra = extra + tmp - (tmp / 4)
        }
        
        day = julianDay + extra
        month = julianMonth
        if month == 3 && day > 31 {
            month = 4
            day = day - 31
        }
        if month == 4 && day > 30 {
            month = 5
            day = day - 30
        }
        
        return "\(julianYear)-\(month)-\(day)".toDate()
        
    }
    
    
    static func getTone(toneNumer:Int)->String{
        switch toneNumer {
        case 1:
            return "First"
        case 2:
            return "Second"
        case 3:
            return "Third"
        case 4:
            return "Fourth"
        case 5:
            return "Fifth"
        case 6:
            return "Sixth"
        case 7:
            return "Seventh"
        case 0:
            return "Eighth"
        default:
            return ""
        }
    }
    
    
    static func getEasterRelatedDays(easterDate:Date , inputDate:Date)->String{
        if (inputDate.isEqualTo(targetDate: easterDate.AddDays(days: -70))){
            return "Sunday of the Publican and Pharisee"
        }
        else  if (inputDate.isEqualTo(targetDate: easterDate.AddDays(days: -63))){
            return "Sun of the Prodigal Son"
        }
        else  if (inputDate.isEqualTo(targetDate: easterDate.AddDays(days: -57))){
            return "1st Sat. of Souls"
        }
        else  if (inputDate.isEqualTo(targetDate: easterDate.AddDays(days: -56))){
            return "Sunday of the Meat Fare"
        }
        else  if (inputDate.isEqualTo(targetDate: easterDate.AddDays(days: -50))){
            return "2nd Sat. of Souls"
        }
        else  if (inputDate.isEqualTo(targetDate: easterDate.AddDays(days: -49))){
            return "Sunday of cheese Fare"
        }
            
        else  if (inputDate.isEqualTo(targetDate: easterDate.AddDays(days: -48))){
            return "Lent Begins"
        }
        else  if (inputDate.isEqualTo(targetDate: easterDate.AddDays(days: -43))){
            return "3rd Sat. of Souls / St. Theodore"
        }
        else  if (inputDate.isEqualTo(targetDate: easterDate.AddDays(days: -43))){
            return "3rd Sat. of Souls / St. Theodore"
        }
        else  if (inputDate.isEqualTo(targetDate: easterDate.AddDays(days: -42))){
            return "1st Sat. of the Fast(Sunday Of Orthodoxy)"
        }
            
        else  if (inputDate.isEqualTo(targetDate: easterDate.AddDays(days: -35))){
            return "2nd Sunda of the Fast(Our father in the Saints,Gregory,Archbishop and wonder worker of Thessalonica)"
        }
            
        else  if (inputDate.isEqualTo(targetDate: easterDate.AddDays(days: -28))){
            return "3rd Sunday of the Fast(The veneration of the Honourable anf life-effecting Cross)"
        }
        else  if (inputDate.isEqualTo(targetDate: easterDate.AddDays(days: -21))){
            return "4th Sunday of the Fast(Our venerable Father, Jhon Climacus)"
        }
        else  if (inputDate.isEqualTo(targetDate: easterDate.AddDays(days: -17))){
            return "The Thursday of the 5th week"
        }
        else  if (inputDate.isEqualTo(targetDate: easterDate.AddDays(days: -15))){
            return "The Saturday of the 5th week"
        }
        else  if (inputDate.isEqualTo(targetDate: easterDate.AddDays(days: -14))){
            return "5th Sunday of the Fast(Our venerable Mother, Mary of Egypt)"
        }
        else  if (inputDate.isEqualTo(targetDate: easterDate.AddDays(days: -8))){
            return "The Saturday of the Holy and Righteous Lazarus"
        }
        else  if (inputDate.isEqualTo(targetDate: easterDate.AddDays(days: -7))){
            return "The Sunday Of The Palms"
        }
        else  if (inputDate.isEqualTo(targetDate: easterDate.AddDays(days: -6))){
            return "The Holy and Great Monday"
        }
            
        else  if (inputDate.isEqualTo(targetDate: easterDate.AddDays(days: -5))){
            return "The Holy and Great Tuesday"
        }
        else  if (inputDate.isEqualTo(targetDate: easterDate.AddDays(days: -4))){
            return "The Holy and Great wednesday"
        }
        else  if (inputDate.isEqualTo(targetDate: easterDate.AddDays(days: -3))){
            return "The Holy and Great Thursday"
        }
        else  if (inputDate.isEqualTo(targetDate: easterDate.AddDays(days: -2))){
            return "The Holy and Great Friday"
        }
        else  if (inputDate.isEqualTo(targetDate: easterDate.AddDays(days: -1))){
            return "The Holy and Great Saturday"
        }
        else  if (inputDate.isEqualTo(targetDate: easterDate)){
            return "The Holy and Great Sunday of PASCHA - Easter DAY"
        }
        else  if (inputDate.isEqualTo(targetDate: easterDate.AddDays(days: 39))){
            return "The Ascension of our Lord"
        }
        else  if (inputDate.isEqualTo(targetDate: easterDate.AddDays(days: 48))){
            return "Sat. of Souls"
        }
        else  if (inputDate.isEqualTo(targetDate: easterDate.AddDays(days: 49))){
            return "The Descent of the Holy Spirit on Pentecost"
        }
        else  if (inputDate.isEqualTo(targetDate: easterDate.AddDays(days: 56))){
            return "Sunday of the Saints"
        }
        else{
            return ""
        }
    }
    
    
    static func getLordFeast(inputDate:Date)->String{
        let components = Calendar.current.dateComponents([.year], from: inputDate)
        let year = components.year!
        
        if inputDate.isEqualTo(targetDate: "\(year)-01-06".toDate()){
            return "The Epiphany"
        }else if inputDate.isEqualTo(targetDate: "\(year)-02-02".toDate()){
            return "The Presentation of Christ into the Temple"
        }else if inputDate.isEqualTo(targetDate: "\(year)-02-25".toDate()){
            return "The Annuciation of our Lord"
        }else if inputDate.isEqualTo(targetDate: "\(year)-08-06".toDate()){
            return "The Transfiguration of our Lord"
        }else if inputDate.isEqualTo(targetDate: "\(year)-08-15".toDate()){
            return "The Dormition of the Theotokos"
        }else if inputDate.isEqualTo(targetDate: "\(year)-09-08".toDate()){
            return "The Nativity of the Theotokos"
        }else if inputDate.isEqualTo(targetDate: "\(year)-09-14".toDate()){
            return "The Exaltation of the Life_Giving Cross"
        }else if inputDate.isEqualTo(targetDate: "\(year)-11-21".toDate()){
            return "The Entrance of the Theotokos into the temple"
        }else if inputDate.isEqualTo(targetDate: "\(year)-12-25".toDate()){
            return "The Nativity of our Lord Jesus Christ"
        }else {
            return ""
        }
        
    }
    
    static func getFast(easter:Date,inputDate:Date)->String{
        let components = Calendar.current.dateComponents([.year], from: inputDate)
        let year = components.year!
        
        if inputDate >= easter.AddDays(days: -48) && (inputDate <= easter.AddDays(days: -1)){
            // Great Fast
            if (inputDate.isEqualTo(targetDate: "\(year)-3-25".toDate())) || (inputDate.isEqualTo(targetDate: easter.AddDays(days: -7))){
                return "Fast/Fish Allowed"
            }
            else{
                return "Strict Fast"
            }
        }
        else if inputDate >= easter.AddDays(days: 57) && (inputDate <= "\(year)-06-28".toDate()){
            // Appostols Fast
            if inputDate.isEqualTo(targetDate: "\(year)-6-24".toDate()){
                return "Fast/Fish Allowed"
            }else {
                let weekDay = Calendar.current.dateComponents([.weekday], from: inputDate).weekday
                if ((weekDay == 4) || (weekDay == 6)){
                    return "Strict Fast"
                }
                else{
                    return "Fast/Fish Allowed"
                }
            }
        }
        else if inputDate >= "\(year)-08-01".toDate() && (inputDate <= "\(year)-08-14".toDate()){
            // Theotokos Fast
            if inputDate.isEqualTo(targetDate: "\(year)-8-6".toDate()){
                return "Fast/Fish Allowed"
            }
            else{
                return "Strict Fast"
            }
        }
        else if inputDate >= "\(year)-11-15".toDate() && (inputDate <= "\(year)-12-24".toDate()){
            // Nativity Fast
            if ((inputDate.isEqualTo(targetDate: "\(year)-11-21".toDate())) || (inputDate.isEqualTo(targetDate: "\(year)-12-12".toDate()))){
                return "Fast/Fish Allowed"
            }
            else{
                if ((inputDate > "\(year)-12-12".toDate()) && (inputDate <= "\(year)-12-24".toDate())){
                    return "Strict Fast"
                }
                else{
                    let weekDay = Calendar.current.dateComponents([.weekday], from: inputDate).weekday
                    if ((weekDay == 4) || (weekDay == 6)){
                        return "Strict Fast"
                    }
                    else{
                        return "Fast/Fish Allowed"
                    }
                }
            }
        }
        else{
            // Non Fasting Period
            return chechNonFastingPeriod(easter: easter, inputDate: inputDate)
        }
    }
    
    
    private static func chechNonFastingPeriod(easter:Date,inputDate:Date)->String{
        let components = Calendar.current.dateComponents([.year], from: inputDate)
        let year = components.year!
        let weekDay = Calendar.current.dateComponents([.weekday], from: inputDate).weekday
        var result = ""
        
        if inputDate.isEqualTo(targetDate: "\(year)-8-29".toDate()){
            if (weekDay == 1){
                result =  ""
            }
            else{
                result = "Strict Fast"
            }
        }
        else if inputDate.isEqualTo(targetDate: "\(year)-1-5".toDate()) || inputDate.isEqualTo(targetDate: "\(year)-9-14".toDate()){
            result = "Strict Fast"
        }
        else if (inputDate > easter.AddDays(days: -56)) && (inputDate < easter.AddDays(days: -48)) {
            result = "Fast/Dairy and Eggs Allowed"
        }
        else if ((weekDay == 4) || (weekDay == 6)){
            if (inputDate.isEqualTo(targetDate: "\(year)-1-6".toDate())) ||
                ((inputDate >= "\(year)-12-25".toDate()) && (inputDate <= "\(year)-12-31".toDate())) ||
                ((inputDate >= "\(year)-1-1".toDate()) && (inputDate < "\(year)-1-5".toDate())) ||
                ((inputDate > easter.AddDays(days: -70)) && (inputDate < easter.AddDays(days: -63))) ||
                (inputDate.isEqualTo(targetDate: easter.AddDays(days: 3))) ||
                (inputDate.isEqualTo(targetDate: easter.AddDays(days: 5))) ||
                (inputDate.isEqualTo(targetDate: easter.AddDays(days: 52))) ||
                (inputDate.isEqualTo(targetDate: easter.AddDays(days: 54))) {
                result =  ""
            }
            else if (inputDate.isEqualTo(targetDate: "\(year)-2-2".toDate())) ||
                (inputDate.isEqualTo(targetDate: "\(year)-6-29".toDate())) ||
                (inputDate.isEqualTo(targetDate: "\(year)-9-8".toDate())) ||
                (inputDate.isEqualTo(targetDate: "\(year)-8-15".toDate())) ||
                (inputDate.isEqualTo(targetDate: "\(year)-1-7".toDate())) ||
                ((inputDate > easter.AddDays(days: 7)) && (inputDate < easter.AddDays(days: 49))) ||
                ((inputDate > "\(year)-1-6".toDate()) && (inputDate <= "\(year)-1-14".toDate())) ||
                ((inputDate > "\(year)-2-2".toDate()) && (inputDate <= "\(year)-2-9".toDate())) ||
                ((inputDate > "\(year)-8-15".toDate()) && (inputDate <= "\(year)-8-23".toDate())) ||
                ((inputDate > "\(year)-9-8".toDate()) && (inputDate <= "\(year)-9-12".toDate())) ||
                ((inputDate > "\(year)-9-14".toDate()) && (inputDate <= "\(year)-9-21".toDate())) {
                result = "Fast/Fish Allowed"
            }
            else
            {
                result = "Strict Fast"
            }
        }
        else{
            result = ""
        }
        
        if (result == "Strict Fast") && (!( (inputDate >= easter.AddDays(days: -6)) && (inputDate >= easter.AddDays(days: -1)) )){
            result = "Fast" + checkTwelveAppostols(easter: easter, inputDate: inputDate)
        }
        
        
        if ((result == "Strict Fast") || (result == "Fast")) &&  (!( (inputDate >= easter.AddDays(days: -6)) && (inputDate >= easter.AddDays(days: -1)) )){
            result = "Fast" + checkWineAndOil(easter: easter, inputDate: inputDate)
        }
        
        return result
    }
    
    
    private static func checkTwelveAppostols(easter:Date,inputDate:Date)->String{
        let components = Calendar.current.dateComponents([.year], from: inputDate)
        let year = components.year!
        if (inputDate.isEqualTo(targetDate: "\(year)-4-30".toDate())) ||
            (inputDate.isEqualTo(targetDate: "\(year)-5-8".toDate())) ||
            (inputDate.isEqualTo(targetDate: "\(year)-5-10".toDate())) ||
            (inputDate.isEqualTo(targetDate: "\(year)-6-11".toDate())) ||
            (inputDate.isEqualTo(targetDate: "\(year)-6-19".toDate())) ||
            (inputDate.isEqualTo(targetDate: "\(year)-8-9".toDate())) ||
            (inputDate.isEqualTo(targetDate: "\(year)-8-25".toDate())) ||
            (inputDate.isEqualTo(targetDate: "\(year)-9-26".toDate())) ||
            (inputDate.isEqualTo(targetDate: "\(year)-10-6".toDate())) ||
            (inputDate.isEqualTo(targetDate: "\(year)-10-9".toDate())) ||
            (inputDate.isEqualTo(targetDate: "\(year)-11-14".toDate())) ||
            (inputDate.isEqualTo(targetDate: "\(year)-11-16".toDate())) ||
            (inputDate.isEqualTo(targetDate: "\(year)-11-30".toDate())) {
            return "/Fish Allowed"
        }
        else{
            return ""
        }
    }
    
    private static func checkWineAndOil(easter:Date,inputDate:Date)->String{
        let components = Calendar.current.dateComponents([.year], from: inputDate)
        let year = components.year!
         if (inputDate.isEqualTo(targetDate: "\(year)-1-11".toDate())) ||
        (inputDate.isEqualTo(targetDate: "\(year)-1-16".toDate())) ||
        (inputDate.isEqualTo(targetDate: "\(year)-1-17".toDate())) ||
        (inputDate.isEqualTo(targetDate: "\(year)-1-18".toDate())) ||
        (inputDate.isEqualTo(targetDate: "\(year)-1-20".toDate())) ||
        (inputDate.isEqualTo(targetDate: "\(year)-1-22".toDate())) ||
        (inputDate.isEqualTo(targetDate: "\(year)-1-25".toDate())) ||
        (inputDate.isEqualTo(targetDate: "\(year)-1-27".toDate())) ||
        (inputDate.isEqualTo(targetDate: "\(year)-1-30".toDate())) ||
        (inputDate.isEqualTo(targetDate: "\(year)-2-8".toDate())) ||
        (inputDate.isEqualTo(targetDate: "\(year)-2-10".toDate())) ||
        (inputDate.isEqualTo(targetDate: "\(year)-2-11".toDate())) ||
        (inputDate.isEqualTo(targetDate: "\(year)-2-17".toDate())) ||
        (inputDate.isEqualTo(targetDate: "\(year)-2-24".toDate())) ||
        (inputDate.isEqualTo(targetDate: "\(year)-3-9".toDate())) ||
        (inputDate.isEqualTo(targetDate: "\(year)-3-26".toDate())) ||
        (inputDate.isEqualTo(targetDate: "\(year)-4-23".toDate())) ||
        (inputDate.isEqualTo(targetDate: "\(year)-4-25".toDate())) ||
        (inputDate.isEqualTo(targetDate: "\(year)-4-30".toDate())) ||
        (inputDate.isEqualTo(targetDate: "\(year)-5-2".toDate())) ||
        (inputDate.isEqualTo(targetDate: "\(year)-5-8".toDate())) ||
        (inputDate.isEqualTo(targetDate: "\(year)-5-15".toDate())) ||
        (inputDate.isEqualTo(targetDate: "\(year)-5-21".toDate())) ||
        (inputDate.isEqualTo(targetDate: "\(year)-5-25".toDate())) ||
        (inputDate.isEqualTo(targetDate: "\(year)-6-8".toDate())) ||
        (inputDate.isEqualTo(targetDate: "\(year)-6-11".toDate())) ||
        (inputDate.isEqualTo(targetDate: "\(year)-6-30".toDate())) ||
        (inputDate.isEqualTo(targetDate: "\(year)-7-1".toDate())) ||
        (inputDate.isEqualTo(targetDate: "\(year)-7-2".toDate())) ||
        (inputDate.isEqualTo(targetDate: "\(year)-7-17".toDate())) ||
        (inputDate.isEqualTo(targetDate: "\(year)-7-20".toDate())) ||
        (inputDate.isEqualTo(targetDate: "\(year)-7-22".toDate())) ||
        (inputDate.isEqualTo(targetDate: "\(year)-7-25".toDate())) ||
        (inputDate.isEqualTo(targetDate: "\(year)-7-26".toDate())) ||
        (inputDate.isEqualTo(targetDate: "\(year)-7-27".toDate())) ||
        (inputDate.isEqualTo(targetDate: "\(year)-8-31".toDate())) ||
        (inputDate.isEqualTo(targetDate: "\(year)-9-1".toDate())) ||
        (inputDate.isEqualTo(targetDate: "\(year)-9-6".toDate())) ||
        (inputDate.isEqualTo(targetDate: "\(year)-9-9".toDate())) ||
        (inputDate.isEqualTo(targetDate: "\(year)-9-13".toDate())) ||
        (inputDate.isEqualTo(targetDate: "\(year)-9-20".toDate())) ||
        (inputDate.isEqualTo(targetDate: "\(year)-9-23".toDate())) ||
        (inputDate.isEqualTo(targetDate: "\(year)-9-26".toDate())) ||
        (inputDate.isEqualTo(targetDate: "\(year)-10-6".toDate())) ||
        (inputDate.isEqualTo(targetDate: "\(year)-10-18".toDate())) ||
        (inputDate.isEqualTo(targetDate: "\(year)-10-23".toDate())) ||
        (inputDate.isEqualTo(targetDate: "\(year)-10-26".toDate())) ||
        (inputDate.isEqualTo(targetDate: "\(year)-11-1".toDate())) ||
        (inputDate.isEqualTo(targetDate: "\(year)-11-8".toDate())) ||
        (inputDate.isEqualTo(targetDate: "\(year)-11-12".toDate())) ||
        (inputDate.isEqualTo(targetDate: "\(year)-11-13".toDate())) ||
        (inputDate.isEqualTo(targetDate: "\(year)-11-14".toDate())) ||
        (inputDate.isEqualTo(targetDate: "\(year)-11-16".toDate())) ||
        (inputDate.isEqualTo(targetDate: "\(year)-11-30".toDate())) ||
        (inputDate.isEqualTo(targetDate: "\(year)-12-4".toDate())) ||
        (inputDate.isEqualTo(targetDate: "\(year)-12-5".toDate())) ||
        (inputDate.isEqualTo(targetDate: "\(year)-12-6".toDate())) ||
        (inputDate.isEqualTo(targetDate: "\(year)-12-9".toDate())) ||
        (inputDate.isEqualTo(targetDate: "\(year)-12-12".toDate())) ||
        (inputDate.isEqualTo(targetDate: "\(year)-12-15".toDate())) ||
        (inputDate.isEqualTo(targetDate: "\(year)-12-17".toDate())) ||
            (inputDate.isEqualTo(targetDate: "\(year)-12-20".toDate())) {
            return "/Wine and Oil Allowed"
        }
        else
         {
            return ""
        }
    }
    
    
}
