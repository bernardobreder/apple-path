//
//  Path.swift
//  Path
//
//  Created by Bernardo Breder on 21/01/17.
//
//

import Foundation

public struct Path {
    
    static let letters = CharacterSet.letters
    
    static let decimalDigits = CharacterSet.decimalDigits
    
    public let parent: String?
    
    public let name: String
    
    init(_ parent: String?, _ name: String) {
        self.parent = parent
        self.name = Path.filterName(name)
    }
    
    public init(_ parents: [String], _ name: String) {
        self.init(Path.reduce(parents.map{Path.filterName($0)}), name)
    }
    
    public init?(_ paths: [String]) {
        guard let last = paths.last else { return nil }
        self.init(paths.dropLast().map({$0}), last)
    }
    
    public init(_ path: String) {
        let paths = Path.split(path)
        let last = paths.last ?? path
        self.init(paths.dropLast().map({$0}), last)
    }
    
    public var parentPath: Path? {
        guard let parent = self.parent else { return nil }
        let entry = Path.parent(parent)
        return Path(entry.parent, entry.name)
    }
    
    public var parents: [String] {
        return paths.dropLast().map{$0}
    }
    
    public var paths: [String] {
        if let parent = self.parent {
            return [Path.split(parent), [name]].joined().map{$0}
        } else { return [name] }
    }
    
    public var path: String {
        if let parent = self.parent {
            return parent + "/" + name
        } else { return name }
    }
    
    static func reduce(_ paths: [String]) -> String? {
        guard !paths.isEmpty else { return nil }
        return paths.lazy.reduce("", { $0 + ($0.isEmpty ? "" : "/") + $1})
    }
    
    static func split(_ path: String) -> [String] {
        return path.components(separatedBy: "/")
    }
    
    static func parent(_ path: String) -> (parent: String?, name: String) {
        if let range = path.range(of: "/", options: .backwards) {
            return (path.substring(to: range.lowerBound), path.substring(from: range.upperBound))
        } else { return (nil, path) }
    }
    
    static func filterName(_ name: String) -> String {
        return String(String.UnicodeScalarView() + name.unicodeScalars.filter{Path.letters.contains($0) || Path.decimalDigits.contains($0)})
    }

}

extension Path: Hashable, Comparable {
    
    public var hashValue: Int {
        return (parent?.hashValue ?? 0) | name.hashValue
    }
    
    public static func ==(lhs: Path, rhs: Path) -> Bool {
        return (lhs.parent ?? "") == (rhs.parent ?? "") && lhs.name == rhs.name
    }
    
    public static func <(lhs: Path, rhs: Path) -> Bool {
        return lhs.path < rhs.path
    }
    
}

extension Path: CustomStringConvertible, CustomDebugStringConvertible {
    
    public var debugDescription: String {
        return description
    }

    public var description: String {
        return path
    }

}
