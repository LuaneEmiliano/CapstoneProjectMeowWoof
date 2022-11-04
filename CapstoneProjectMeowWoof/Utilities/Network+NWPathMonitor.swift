//
//  Network+NWPathMonitor.swift
//  CapstoneProjectMeowWoof
//
//  Created by luane Niejelski on 10/29/22.
//

import Foundation
import Network

class NetworkMonitor: ObservableObject {
    
    private let monitor = NWPathMonitor()
    private let queue = DispatchQueue(label: "Monitor")
    
    var isActive = false
    var isExpensive = false
    var isContrained = false
    var connectionType = NWInterface.InterfaceType.other
    
    init() {
        monitor.pathUpdateHandler = { path in
            // More code here
            self.isActive = path.status == .satisfied
            self.isExpensive = path.isExpensive
            self.isContrained = path.isConstrained
            
            let connectionTypes: [NWInterface.InterfaceType] = [.cellular, .wifi, .wiredEthernet]
            self.connectionType = connectionTypes.first(where: path.usesInterfaceType) ?? .other
            
            DispatchQueue.main.async {
                self.objectWillChange.send()
            }
        }
        monitor.start(queue: queue)
    }
}
