//
//  DataController.swift
//  TableViewTutorial
//
//  Created by Phil Kirby on 3/10/16.
//  Copyright © 2016 com.Apress. All rights reserved.
//

import Foundation

public class DataController
{
    public func getData() -> Compass {
        var compass : Compass
        compass = Compass(description: "Weekly Compass")
     
        // add list with an anonymous function using Define-And-Call pattern
        compass.addList(
            {
                let list = List(description: "Long Term Goals", numItems: 4, type: .Unordered)
                list.addListItem(ListItem(description: "Cardio/Swimming/Weights"))
                list.addListItem(ListItem(description: "Diet"))
                list.addListItem(ListItem(description: "Start Business"))
                list.addListItem(ListItem(description: "Eliminate Debt"))
                return list
            }()
        )
        
        compass.addList(
            {
                let list = List(description: "Individual", numItems: 6, type: .Unordered)
                
                list.addListItem(ListItem(description: "Pickup Rx", state: .NotStarted, prefix: "Wed", postfix: "Lisinopril"))
                list.addListItem(ListItem(description: "Cooks Warehouse", state: .NotStarted, prefix: "Wed", postfix: "Deep Pot & Lid $20"))
                
                list.addListItem(ListItem(description: "Groceries"))
                list.addListItem(ListItem(description: "Call Doctor Lopresti", state: .NotStarted, prefix: "Wed", postfix: "(650) 636-1286"))
                
                list.addListItem(ListItem(description: "Swift Coding", state : .Completed, prefix : "Tue", postfix : "Done"))
                list.addListItem(ListItem(description: "Costco", state: .Deferred))
                
                return list
            }()
        )
        
        compass.addList(
            {
                let list = List(description: "Career", numItems:4, type: .Unordered)
                
                list.addListItem(ListItem(description: "Start Business", state: .InProgress, prefix: "Thu", postfix: "Web Research"))
                
                list.addListItem(ListItem(description: "Consulting Projects"))
                list.addListItem(ListItem(description: "Business Plan", state: .Deferred))
                list.addListItem(ListItem(description: "Marketing Plan", state: .Deferred))
                list.addListItem(ListItem(description: "Recruiters"))
                return list
            }()
        )
        
        // add a simple list with a function
        compass.addListWithItems("Financial", items: "Citicard", "CapitalOne", "BofA Mastercard")
        compass.addListWithItems("Shopping", items: "SushiZone", "Uniqlo", "Ginto Yakitori")
        compass.addListWithItems("Weekly Compass Coding", items: "Read Items from JSON File", "Table View UI", "Compass Application")

        return compass
    }
}