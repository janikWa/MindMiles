//
//  LocationManager.swift
//  MindMiles
//
//  Created by Janik Wahrheit on 04.07.25.
//
import Foundation
import CoreLocation

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    private let manager = CLLocationManager()
    
    @Published var totalDistance: Double = 0.0
    private var previousLocation: CLLocation?
    private var isPaused = false
    
    override init() {
        super.init()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    func start() {
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    }
    
    func stop() {
        manager.stopUpdatingLocation()
        previousLocation = nil
        isPaused = false
    }
    
    func pause() {
        isPaused = true
    }
    
    func resume() {
        isPaused = false
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard !isPaused else { return }
        guard let location = locations.last else { return }
        
        if let prev = previousLocation {
            let distance = location.distance(from: prev)
            totalDistance += distance
        }
        
        previousLocation = location
    }
}

