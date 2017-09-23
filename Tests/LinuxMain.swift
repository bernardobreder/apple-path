//
//  PathTests.swift
//  Path
//
//  Created by Bernardo Breder.
//
//

import XCTest
@testable import PathTests

extension PathTests {

	static var allTests : [(String, (PathTests) -> () throws -> Void)] {
		return [
			("testDescription", testDescription),
			("testFilter", testFilter),
			("testLast", testLast),
			("testParent", testParent),
			("testParents", testParents),
			("testPath", testPath),
			("testPaths", testPaths),
		]
	}

}

XCTMain([
	testCase(PathTests.allTests),
])

