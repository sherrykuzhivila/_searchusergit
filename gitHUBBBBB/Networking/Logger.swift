//
//  Logger.swift
//  gitHUBBBBB
//
//  Created by Admin on 17/03/23.
//


//  Logger.swift
//  RGSeed
//
//  Created by MAC on 31/08/22.
//

import Foundation

class Logger {
    static var dateFormat = "dd/MM/yyyy-HH:mm:ss.SSS"
    static var writeToFile = false
    static var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = dateFormat
        formatter.locale = Locale.current
        formatter.timeZone = TimeZone.current
        return formatter
    }
    enum LogEvent: String {
        case error = "Error [‼️]"
        case info = "Info [ℹ️]"
        case debug = "Debug [💬]"
        case verbose = "Verbose [🔬]"
        case warning = "Warning [⚠️]"
        case severe = "Severe [🔥]"
    }
    private class func sourceFileName(filepath: String) -> String {
        let components = filepath.components(separatedBy: "/")
        return components.isEmpty ? "" : (components.last ?? "")
    }
    class func log(_ object: Any,
                   logEvent: LogEvent = .debug,
                   filename: String = #file,
                   line: Int = #line,
                   column: Int = #column,
                   functionName: String = #function) {
        var logString = "==========Logging Starts==========\n"
        logString.append("Time: \(Date().toLoggerDate())\n")
        logString.append("FileName: \(sourceFileName(filepath: filename))\n")
        logString.append("Line: \(line)\tColumn:\(column)\n")
        logString.append("Function Name: \(functionName)\n")
        logString.append("LogEvent: \(logEvent.rawValue)\n\n")
        logString.append("Log: \(object)\n\n")
        logString.append("==========Logging Ends==========\n\n")
#if DEBUG
        print(logString)
        if writeToFile {
            Logger.writeLogToFile(logString)
        }
#endif
#if !DEBUG
        TestFairy.log(logString)
#endif
    }
    
    /// Appends the given string to the stream.
    static func writeLogToFile(_ string: String) {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .allDomainsMask)
        guard let documentDirectoryPath = paths.first, let bundleId = Bundle.main.bundleIdentifier else {
            return
        }
        print(documentDirectoryPath)
        let log = documentDirectoryPath.appendingPathComponent("\(bundleId)_log.txt")
        do {
            let handle = try FileHandle(forWritingTo: log)
            handle.seekToEndOfFile()
            handle.write(string.data(using: .utf8)!)
            handle.closeFile()
        } catch {
            print(error.localizedDescription)
            do {
                try string.data(using: .utf8)?.write(to: log)
            } catch {
                print(error.localizedDescription)
            }
        }
        
    }
}

extension Date {
    func toLoggerDate() -> String {
        return Logger.dateFormatter.string(from: self)
    }
}
