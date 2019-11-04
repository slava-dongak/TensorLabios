//
//  Storage.swift
//  AutoCatalog
//
//  Created by Гость on 24/10/2019.
//  Copyright © 2019 sia. All rights reserved.
//

import Foundation

private let fileURL = URL(fileURLWithPath: "/Users/macbookpro/Downloads/TenzorTasks/carList/cars.txt")

class Storage {
    internal private(set) var cars: [Car] = []
    
    func addCar(_ car: Car, at place: Int) {
        cars.insert(car, at: place)
        
        save()
    }
    
    func removeCar(_ carForRemove: Car) {
        cars.removeAll { car in
            return car == carForRemove
        }
        
        save()
    }
    
    func save() {
        guard let data = try? JSONEncoder().encode(cars) else {
            print("fatal error: programm can't encode data, your changes were not saved")
            return
        }
        
        try? data.write(to: fileURL)
    }
    
    func load() {
        guard let data = try? Data(contentsOf: fileURL) else {
            print("Cannot find the file, programm will create new file cars.txt for saving data to disk")
            return
        }
        
        guard let loadedCars = try? JSONDecoder().decode([Car].self, from: data) else {
            print("Cannot load cars from the file. Your list is empty now")
            return
        }
        print("Data base restored from the file")
        cars = loadedCars
    }
}
