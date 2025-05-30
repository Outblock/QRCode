//
//  Copyright © 2025 Darren Ford. All rights reserved.
//
//  MIT license
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated
//  documentation files (the "Software"), to deal in the Software without restriction, including without limitation the
//  rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to
//  permit persons to whom the Software is furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all copies or substantial
//  portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
//  WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS
//  OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
//  OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//

import CoreGraphics
import Foundation

// MARK: - Pupil shape

public extension QRCode.PupilShape {
	/// A 'squircle' pupil style
	@objc(QRCodePupilShapeSquircle) class Squircle: NSObject, QRCodePupilShapeGenerator {
		@objc public static var Name: String { "squircle" }
		/// The generator title
		@objc public static var Title: String { "Squircle" }

		@objc public static func Create(_ settings: [String : Any]?) -> any QRCodePupilShapeGenerator {
			Squircle()
		}

		/// Make a copy of the object
		@objc public func copyShape() -> any QRCodePupilShapeGenerator { Squircle() }
		/// Reset the pupil shape generator back to defaults
		@objc public func reset() { }

		@objc public func settings() -> [String : Any] { [:] }
		@objc public func supportsSettingValue(forKey key: String) -> Bool { false }
		@objc public func setSettingValue(_ value: Any?, forKey key: String) -> Bool { false }

		/// The pupil centered in the 90x90 square
		@objc public func pupilPath() -> CGPath {
			let eyePupilPath = CGMutablePath()
			eyePupilPath.move(to: CGPoint(x: 45, y: 30))
			eyePupilPath.curve(to: CGPoint(x: 57.61, y: 32.39), controlPoint1: CGPoint(x: 51.57, y: 30), controlPoint2: CGPoint(x: 55.23, y: 30))
			eyePupilPath.curve(to: CGPoint(x: 60, y: 45), controlPoint1: CGPoint(x: 60, y: 34.77), controlPoint2: CGPoint(x: 60, y: 38.43))
			eyePupilPath.curve(to: CGPoint(x: 57.61, y: 57.61), controlPoint1: CGPoint(x: 60, y: 51.57), controlPoint2: CGPoint(x: 60, y: 55.23))
			eyePupilPath.curve(to: CGPoint(x: 45, y: 60), controlPoint1: CGPoint(x: 55.23, y: 60), controlPoint2: CGPoint(x: 51.57, y: 60))
			eyePupilPath.curve(to: CGPoint(x: 32.39, y: 57.61), controlPoint1: CGPoint(x: 38.43, y: 60), controlPoint2: CGPoint(x: 34.77, y: 60))
			eyePupilPath.curve(to: CGPoint(x: 30, y: 45), controlPoint1: CGPoint(x: 30, y: 55.23), controlPoint2: CGPoint(x: 30, y: 51.57))
			eyePupilPath.curve(to: CGPoint(x: 32.39, y: 32.39), controlPoint1: CGPoint(x: 30, y: 38.43), controlPoint2: CGPoint(x: 30, y: 34.77))
			eyePupilPath.curve(to: CGPoint(x: 45, y: 30), controlPoint1: CGPoint(x: 34.77, y: 30), controlPoint2: CGPoint(x: 38.43, y: 30))
			eyePupilPath.close()
			return eyePupilPath
		}
	}
}

public extension QRCodePupilShapeGenerator where Self == QRCode.PupilShape.Squircle {
	/// Create a squircle pupil shape generator
	/// - Returns: A pupil shape generator
	@inlinable static func squircle() -> QRCodePupilShapeGenerator { QRCode.PupilShape.Squircle() }
}
