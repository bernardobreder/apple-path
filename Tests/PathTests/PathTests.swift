//
//  Path.swift
//  Path
//
//  Created by Bernardo Breder on 21/01/17.
//
//

import XCTest
@testable import Path

class PathTests: XCTestCase {
    
    let path = Path(["a", "b"], "c")

    func testParent() throws {
        XCTAssertEqual("a/b/c", path.path)
        XCTAssertEqual("a/b", path.parentPath?.path)
        XCTAssertEqual("a", path.parentPath?.parentPath?.path)
        XCTAssertNil(path.parentPath?.parentPath?.parentPath?.path)
        XCTAssertNil(path.parentPath?.parentPath?.parentPath?.parentPath?.path)
    }
    
    func testPaths() throws {
        XCTAssertEqual(["a", "b", "c"], path.paths)
        XCTAssertEqual(["a", "b"], path.parentPath?.paths ?? [])
        XCTAssertEqual(["a"], path.parentPath?.parentPath?.paths ?? [])
        XCTAssertEqual([], path.parentPath?.parentPath?.parentPath?.paths ?? [])
        XCTAssertEqual([], path.parentPath?.parentPath?.parentPath?.parentPath?.paths ?? [])
    }
    
    func testParents() throws {
        XCTAssertEqual(["a", "b"], path.parents)
        XCTAssertEqual(["a"], path.parentPath?.parents ?? [])
        XCTAssertEqual([], path.parentPath?.parentPath?.parents ?? [])
        XCTAssertEqual([], path.parentPath?.parentPath?.parentPath?.parents ?? [])
    }
    
    func testLast() throws {
        XCTAssertEqual("c", path.name)
        XCTAssertEqual("b", path.parentPath?.name)
        XCTAssertEqual("a", path.parentPath?.parentPath?.name)
        XCTAssertNil(path.parentPath?.parentPath?.parentPath?.name)
        XCTAssertNil(path.parentPath?.parentPath?.parentPath?.parentPath?.name)
    }
    
    func testDescription() throws {
        XCTAssertEqual("a/b/c", path.description)
        XCTAssertEqual("a/b/c", path.debugDescription)
    }
    
    func testPath() throws {
        XCTAssertEqual("a/b/c", Path("a/b/c").description)
        XCTAssertEqual("a/b", Path("a/b").description)
        XCTAssertEqual("a", Path("a").debugDescription)
        XCTAssertEqual("", Path("").debugDescription)
    }
    
    func testFilter() throws {
        XCTAssertEqual("a/b/c", Path(["a./%", "b./%"], "c./%").path)
        XCTAssertEqual("a0/b0/c0", Path(["a0./%", "b0./%"], "c0./%").path)
        XCTAssertEqual("0/1/2", Path(["0", "1"], "2").path)
    }

}

