//
//  mentionHashtag.swift
//  mentionHashtagDetector
//
//  Created by Sajjad Sarkoobi on 11/10/18.
//  Copyright © 2018 sarkoobi. All rights reserved.


import Foundation
import UIKit

public enum signTypeModels {
    case hashTag
    case mention
    case normal
}

public protocol mentionHashtagDetectorDelegate {
    func didSignDetected(_ text:String,_ signType:signTypeModels)
}


public final class mentionHashtagDetector {
    
    
    public func detectSign(textView:UITextView){
        if let selectedRange = textView.selectedTextRange {
            let cursorPosition = textView.offset(from: textView.beginningOfDocument, to: selectedRange.start)
            if let text = textView.text {
                findSign(cursorPosition: cursorPosition,text: text)
            }
        }
    }
    
    public init(){

    }
    
    
    //////////////
    private var signText:String = ""
    private var positionofSign:Int = 0
    private var signDetected:Bool = false
    public var delegate : mentionHashtagDetectorDelegate?
    
    //Calculating Mention and Hashtag
    private func findSign(cursorPosition : Int = 0,text:String){
        
        
        var signtype:signTypeModels = .normal
        var subText:String = ""
        var x = cursorPosition
        
        repeat {
            if x>1{
                subText = text.substring(with: (x-1)..<x)
            }else{
                subText = text.substring(to: x)
            }
            
            if x < text.count {
                if subText == " " && !charHasSign(text: text.substring(with: (x)..<x+1)){
                    signDetected = false
                    break
                }
            }
            
            if charHasSign(text: subText) {
                
                if x > 1 && text.substring(with: (x-2)..<x-1).isBlankOrEmpty{
                    signDetected = true
                }else if x==1 {
                    signDetected = true
                }else{
                    signDetected = false
                }
                
                if signDetected {
                    positionofSign = x
                    signtype = detectSignType(char: subText)
                }
                
                break
            }
            
            x -= 1
        } while (x >= 0);
        
        //Space detected
        if  text.substring(with: (cursorPosition-1)..<cursorPosition).isBlankOrEmpty{
            signDetected = false
        }
        
        
        var nextSpacePosition:Int = cursorPosition
        
        
        //set whole Text after sign
        x = cursorPosition
        repeat {
            x += 1
            if x>=text.count{
                nextSpacePosition = x-1
                break
            }
            
            if text.substring(with: (x-1)..<x).isBlankOrEmpty {
                nextSpacePosition = x - 1
                break
            }
            
            if text.substring(with: x..<x+1).isBlankOrEmpty {
                nextSpacePosition = x
                break
            }
            
            
        } while (x <= text.count);
        
        if signDetected {
            signText = text.substring(with: positionofSign..<nextSpacePosition)
        }else{
            signText = ""
        }
        delegate?.didSignDetected(signText,signtype)

    }
    
    private func charHasSign(text:String) ->Bool {
        return text == "@" || text == "#"
    }
    
    private func detectSignType(char:String) -> signTypeModels{
        switch char {
        case "@":
            return .mention
        case "#":
            return .hashTag
        default:
            return .normal
        }
    }
}



extension String {
    var isBlank: Bool {
        return self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
    
    var isBlankOrEmpty: Bool{
        return self.isBlank || self.isEmpty
    }
    
    
    func index(from: Int) -> Index {
        return self.utf16.index(startIndex, offsetBy: from)
    }
    
    func substring(from: Int) -> String {
        let fromIndex = index(from: from)
        return  String(self[fromIndex...]) // substring(from: fromIndex)
    }
    
    func substring(to: Int) -> String {
        if self.utf16.count < to {
            return ""
        }
        let toIndex = index(from: to)
        return String(prefix(upTo: toIndex))
    }
    
    func substring(with r: Range<Int>) -> String {
        let startIndex = index(from: r.lowerBound)
        let endIndex = index(from: r.upperBound)
        let range = startIndex..<endIndex
        return String(self[range]) //substring(with: startIndex..<endIndex)
    }
    
}
