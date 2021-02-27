//
//  Extensions.swift
//  VoiceRecorderChetana
//
//  Created by Arakanakere, Chetana on 17/02/21.
//

import Foundation


extension Date
{
    func toString( dateFormat format  : String ) -> String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }

}
