//
//  ApexPredator.swift
//  JPApexPredators17
//
//  Created by Karla Miriam Dos santos Goncalves on 19/10/24.
//

import Foundation
import SwiftUI
import MapKit

struct ApexPredator: Decodable, Identifiable {
    let id: Int
    let name: String
    let type: PredatorType
    let latitude: Double
    let longitude: Double
    let movies: [String]
    let movieScenes: [MovieScene]
    let link: String
    
    var image: String {
        name.lowercased().replacingOccurrences(of: " ", with: "")
    }
    
    var location: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    
    struct MovieScene: Decodable, Identifiable {
        let id: Int
        let movie: String
        let sceneDescription: String
    }
}
    
    enum PredatorType: String, Decodable, CaseIterable, Identifiable {
        case all
        case land
        case air
        case sea
        
        var id: PredatorType {
            self
        }
        
        var background: Color {
            switch self {
            case .land:
                return .brown
            case .air:
                return .teal
            case .sea:
                return .blue
            case .all:
                return .black
            }
        }
        
        var icon: String {
            switch self {
            case .all:
                return "square.stack.3d.up.fill"
            case .land:
                return "leaf.fill"
            case .air:
                return "wind"
            case .sea:
                return "drop.fill"
            }
        }
    }

