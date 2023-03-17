//
//  NetworkLayer.swift
//  gitHUBBBBB
//
//  Created by Admin on 17/03/23.
//

//
//
import Foundation
import Alamofire
import UIKit

final class NetworkLayer {
    static let shared = NetworkLayer()
    var session: Session
    var configuration = URLSessionConfiguration.default
    private init() {
        configuration.waitsForConnectivity = true
        session = Session(configuration: configuration)
    }
//    enum MimeType: String {
//        case image = "image/jpeg"
//        case video = " video/mp4"
//        case pdf = "application/pdf"
//        case doc = "application/msword"
//        case docx = "application/vnd.openxmlformats-officedocument.wordprocessingml.document"
//
//    }
    
    func request<T: Codable>(_ urlConvertible: NetworkRouter, type: T.Type, completion: @escaping(Result<T, String>) -> Void) {
        guard NetworkReachabilityManager() != nil else {
            completion(Result.failure(NetworkMessages.internetIssue.rawValue))
            return
        }
        
        Logger.log(urlConvertible)
        let startDate = Date()
        session.request(urlConvertible).responseData { (response) in
            let executionTime = Date().timeIntervalSince(startDate)
            if executionTime > 2 {
                Logger.log("Api execution greater than 2 seconds.\n Actual time = \(executionTime)", logEvent: .warning)
            }
            switch response.result {
            case .success(let data):
                do
                {
                    Logger.log("Request url :\(urlConvertible.urlRequest?.url?.absoluteString ?? "")\nRequest body params: \(String(data: urlConvertible.urlRequest?.httpBody ?? Data(), encoding: .utf8)  ?? "") \nResponse: \(String(data: data, encoding: .utf8)  ?? "")\n", logEvent: .debug)
                    let decoder = JSONDecoder()
                    let errorResponse = try decoder.decode(ErrorResponseModel.self, from: data)
                    if let errorMessage = errorResponse.message, errorResponse.success?.intValue != 200, errorResponse.statusCode?.intValue != 200,errorResponse.statusCode?.intValue != 201,errorResponse.status?.intValue != 200, errorResponse.successCode?.intValue != 200,errorResponse.message?.count ?? 0 > 0 {
                        if errorResponse.code?.intValue == 99 {
                        }
                        completion(Result.failure(errorMessage))
                        return
                    }
                    let result = try decoder.decode(T.self, from: data)
                    completion(Result.sucess(result))
                    return
                }
                catch
                {
                    Logger.log(error, logEvent: .error)
                    completion(Result.failure(error.localizedDescription))
                    return
                }
                
            case .failure(let error):
                completion(Result.failure(error.localizedDescription))
            }
        }
    }
    
    
//    func uploadDataAPI(withFile file: Any, mimeType mime: MimeType,andPathName path: String,header: HTTPHeaders,profile status: Bool, callback: @escaping ( _ result: (Bool,String?,String?)) -> Void){
//        let urlComp = URLComponents(string: Enviornment.baseUrl)!
//        var url = urlComp.url!
//        if status == true{
//            url = url.appendingPathComponent(Enviornment.pathImageUpload)
//        }else{
//            url = url.appendingPathComponent(Enviornment.pathImageUploadGallery)
//        }
//        let keyName = "file"
//        if let image: Data = file as? Data {
//            let name = self.makeFileName(mimeType: mime)
//
//            session.upload(multipartFormData: { multipartFormData in
//                multipartFormData.append(image, withName: keyName, fileName: name, mimeType: mime.rawValue)
//            }, to: url, headers: header  ).responseData(completionHandler: { data in
//                do {
//                    let object = try JSONDecoder().decode(ResponseModel<ImageResponseModel>.self , from: data.data ?? Data())
//                    if let path = object.data?.url, let path1 = object.data?.key{
//                        callback((true, path,path1))
//                    }else {
//                        callback((false, "error getting path",""))
//                    }
//                } catch {
//                    callback((false, "error getting path",""))
//                }
//
//            })
//
//        } else if let fileURL: URL = file as? URL {
//
//
//            let name = self.makeFileName(mimeType: mime)
//
//            session.upload(multipartFormData: { multipartFormData in
//                multipartFormData.append(fileURL, withName: keyName, fileName: name, mimeType: mime.rawValue)
//            }, to: url).responseData(completionHandler: { data in
//                do {
//                    let object = try JSONDecoder().decode( ResponseModel<ImageResponseModel>.self , from: data.data ?? Data())
//                    if let path = object.data?.url, let path1 = object.data?.key{
//                        callback((true, path,path1))
//                    } else {
//                        callback((false, "error getting path",""))
//                    }
//
//                } catch {
//                    callback((false, "error getting path",""))
//                }
//
//            })
//
//
//
//        } else {
//            callback((false, "Unknown format",""))
//        }
//
//    }
//    fileprivate func makeFileName(mimeType : MimeType) -> String {
//
//        var type = ""
//        switch mimeType {
//        case .video:
//            type = "mp4"
//        case .image:
//            type = "jpg"
//        case .pdf:
//            type = "pdf"
//        case .doc:
//            type = "doc"
//        case .docx:
//            type = "docx"
//        }
//
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "yyMMddHHmmssSSS"
//        let filename = dateFormatter.string(from: Date())
//
//        return "\(filename).\(type)"
//    }
    
    
    func stopAllSessions(completion: @escaping() -> Void) {
        AF.session.getTasksWithCompletionHandler { (sessionDataTask, uploadData, downloadData) in
            sessionDataTask.forEach { $0.cancel() }
            uploadData.forEach { $0.cancel() }
            downloadData.forEach { $0.cancel() }
            completion()
        }
        
    }
}
