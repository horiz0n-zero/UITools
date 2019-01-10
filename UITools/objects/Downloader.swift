//
//  Downloader.swift
//  UITools
//
//  Created by Antoine Feuerstein on 09/01/2019.
//  Copyright © 2019 z-zero. All rights reserved.
//

import Foundation

// sync & async

public class Downloader: NSObject {
    
    public class func download(url: URL,
                               session: URLSession = URLSession.shared) -> Data? {
        
        session.downloadTask(with: url, completionHandler: { url, reponse, error in
            if let url = url, error == nil {
                //
            }
        })
        return nil
    }
    
}
