//
//  main.swift
//  AutoCatalog
//
//  Created by Гость on 24/10/2019.
//  Copyright © 2019 sia. All rights reserved.
//

let storage = Storage()
storage.load()

let console = Console(storage: storage)
console.run()
// 5? Сделать возможность добавлять поля в структуру Car без изменения этой структуры. Сделать код расширяемым:
