//
//  String.swift
//  CarFax
//
//  Created by Varshini Thatiparthi on 7/15/21.
//

import Foundation

extension String {
    func convertToInternationalFormat() -> String {
        let isMoreThanTenDigit = self.count > 10
        _ = self.startIndex
        var newstr = ""
        if isMoreThanTenDigit {
            newstr = "\(self.dropFirst(self.count - 10))"
        }
        else if self.count == 10{
            newstr = "\(self)"
        }
        else {
            return "number has only \(self.count) digits"
        }
        if  newstr.count == 10 {
            let internationalString = "(\(newstr.dropLast(7))) \(newstr.dropLast(4).dropFirst(3)) - \(newstr.dropFirst(6).dropLast(0))"
            newstr = internationalString
        }
        return newstr
    }
}
