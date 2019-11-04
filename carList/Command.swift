//
//  Command.swift
//  AutoCatalog
//
//  Created by Гость on 24/10/2019.
//  Copyright © 2019 sia. All rights reserved.
//

enum Command: String {
    case print = "print"
    case add = "add"
    case removeByIndex = "indexDel"
    case exit = "exit"
    case removeByContains = "ContDel"
    
    static let commands: [Command] = [.print,
                                      .add,
                                      .removeByIndex,
                                      .exit,
                                      .removeByContains
    ]
}
