//
//  ViewController.swift
//  TaskArrays
//
//  Created by shaik ubaydulla on 01/06/23.
//

import UIKit
import Foundation

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
//        var array1 = [8, 8, 7, 2, 1, 7, 9]
//        var array2 = [14, 8, 2, 7, 7]
        
        var array1 = ["raju", "raju","raju","raanagju","raaju"]
             var array2 = ["raju", "mani","bhuvi","bhuvi"]
 
        print(solve(array1, array2))
        
        
    }
    
//    using generics for different datatypes
    func solve<T: Equatable & Comparable & Hashable>(_ array1: [T], _ array2: [T]) -> [T] {
        var counts1 = countElements(array1)
        var counts2 = countElements(array2)
        var missingElements: [T] = []
        
        for (element, count) in counts2 {
            if let count1 = counts1[element] {
                if count != count1 {
                    missingElements.append(element)
                }
                counts1[element] = nil
            } else {
                missingElements.append(element)
            }
        }
        
        return missingElements.sorted()
    }

    private func countElements<T: Hashable>(_ array: [T]) -> [T: Int] {
        var counts: [T: Int] = [:]
        
        for element in array {
            counts[element, default: 0] += 1
        }
        
        return counts
    }



}

