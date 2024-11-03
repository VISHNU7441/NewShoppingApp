//
//  DownloadJSON.swift
//  NewShoppingApp
//
//  Created by vishnu r s on 01/11/24.
//

import Foundation

func downloadJSONToOffline(data:Data, fileName:String){
    
    let filePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent(fileName)
    
    do{
        guard let filePath else { return}
        try data.write(to: filePath)
    }
    catch{
        print(error)
    }
}


func retrieveDataFromLocal(fileName:String) -> Data?{
    
    let filePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent(fileName)
    
        guard let filePath else { return nil }
        return try? Data(contentsOf: filePath)
}
