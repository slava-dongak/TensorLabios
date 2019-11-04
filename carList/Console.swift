//
//  Console.swift
//  AutoCatalog
//
//  Created by Гость on 24/10/2019.
//  Copyright © 2019 sia. All rights reserved.
//

class Console {
    private let storage: Storage
    
    init(storage: Storage) {
        self.storage = storage
    }
    
    func run() {
        var isWorked: Bool = true
        while isWorked {
            print("Write command:", separator: "", terminator: "")
            guard let commandOfStr = readLine() else {
                fatalError("Ooops...")
            }
            guard let command = Command(rawValue: commandOfStr) else {
                print("Please write correct command: [\(allCommandsOfStr())]")
                continue
            }
            
            switch command {
            case .exit:
                isWorked = false
            case .print:
                printCarList()
            case .add:
                addCar()
            case .removeByIndex:
                removeCarByIndex()
            case .removeByContains:
                removeCarByContains()
            }
        }
    }
    
    
    
    private func allCommandsOfStr() -> String {
        var result: String = ""
        for command in Command.commands {
            result += "'\(command.rawValue)' "
        }
        return result
    }
    
    
    
    private func printCarList() {
        if storage.cars.isEmpty {
            print("List is empty")
            return
        }
        for (i, car) in storage.cars.enumerated() {
            print("#", i + 1, separator: "")
            print(car)
        }
    }

    
    private func addCar() {
        
        print("Write car name: ", separator: "", terminator: "")
        guard let carName = readLine() else {
            fatalError("Ooops...")
        }
        
        print("Write car year: ", separator: "", terminator: "")
        var carYear: Int = 0
        while true {
            guard let carYearOfStr = readLine(), let newCarYear = Int(carYearOfStr) else {
                print("Please write correct year")
                continue
            }
            
            carYear = newCarYear
            break
        }
        
        print("Write car model: ", separator: "", terminator: "")
        guard let carModel = readLine() else {
            fatalError("Ooops...")
        }
        
        var place = storage.cars.count
        print("Want to specify a place to insert? 'y' = yes")
        guard let answer = readLine() else {
            fatalError("Ooops...")
        }
        if answer == "y" {
            print("Where should the new item be placed?")
            while true {
                guard let placeStr = readLine(), let newPlace = Int(placeStr), newPlace <= (storage.cars.count + 1) && newPlace > 0 else {
                    print("Please write positive number less then \(place + 1)")
                    continue
                }
                
                place = newPlace - 1
                break
            }
        }
        
        storage.addCar(Car(name: carName, year: carYear, model: carModel), at: place)
    }

    private func removeCarByIndex() {
        if storage.cars.isEmpty {
            print("List is empty")
            return
        }
        
        print("write car's index for remove")
        var carIndex: Int = 0
        while true {
            guard let carIndexOfStr = readLine(), let newCarIndex = Int(carIndexOfStr), newCarIndex <= (storage.cars.count + 1) && newCarIndex > 0 else {
                print("write correct index less then \(storage.cars.count + 1)")
                continue
            }
            /*  поправка на индекс  */
            carIndex = newCarIndex - 1
            break
        }
        
        storage.removeCar(storage.cars[carIndex])
    }
    
    private func removeCarByContains() {
        if storage.cars.isEmpty {
            print("List is empty")
            return
        }
        
        print("Your text needed to remove matches")
        guard let textForRemove = readLine() else {
            fatalError("ooops")
        }
        
        for item in storage.cars {
            if item.name.contains(textForRemove) || item.model.contains(textForRemove) || String(item.year).contains(textForRemove) {
                storage.removeCar(item)
            }
        }
    }
}
