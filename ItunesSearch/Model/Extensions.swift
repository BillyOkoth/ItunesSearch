//
//  Extensions.swift
//  ItunesSearch
//
//  Created by Billy Okoth on 24/12/2024.
//
import SwiftUI



extension String {
    //comvert string date f
    var dateFormat:String {
        // "2012-01-01T08:00:00Z"
        let dateFormatGetter  = DateFormatter()
        dateFormatGetter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
        
        guard let date = dateFormatGetter.date(from: self) else {
                   return ""
               }
        let dateFormatter = DateFormatter()
               dateFormatter.locale = Locale.current
               dateFormatter.dateStyle = .medium
               dateFormatter.timeStyle = .none
               
              return dateFormatter.string(from: date)
        
    }
}

extension Int {
//     convert track milliseconds to minutes and seconds
     func formattedDuration() -> String {
        
        let timeInSeconds = Double(self) / 1000
        
        let interval = TimeInterval(timeInSeconds)
        let formatter = DateComponentsFormatter()
        formatter.zeroFormattingBehavior = .pad
        formatter.allowedUnits = [.minute, .second]
        formatter.unitsStyle = .positional
        
        return formatter.string(from: interval) ?? ""
    }
    
    
}
