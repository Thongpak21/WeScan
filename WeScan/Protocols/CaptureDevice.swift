//
//  CaptureDevice.swift
//  WeScan
//
//  Created by Julian Schiavo on 28/11/2018.
//  Copyright © 2018 WeTransfer. All rights reserved.
//

import Foundation
import AVFoundation

public protocol CaptureDevice: class {
    func unlockForConfiguration()
    func lockForConfiguration() throws
    
    var torchMode: AVCaptureDevice.TorchMode { get set }
    var isTorchAvailable: Bool { get }
    
    var focusMode: AVCaptureDevice.FocusMode { get set }
    var focusPointOfInterest: CGPoint { get set }
    var isFocusPointOfInterestSupported: Bool { get }
    func isFocusModeSupported(_ focusMode: AVCaptureDevice.FocusMode) -> Bool
    
    var exposureMode: AVCaptureDevice.ExposureMode { get set }
    var exposurePointOfInterest: CGPoint { get set }
    var isExposurePointOfInterestSupported: Bool { get }
    func isExposureModeSupported(_ exposureMode: AVCaptureDevice.ExposureMode) -> Bool
    
    var isSubjectAreaChangeMonitoringEnabled: Bool { get set }
}

extension AVCaptureDevice: CaptureDevice { }

public final class MockCaptureDevice: CaptureDevice {
    public func unlockForConfiguration() {
        return
    }
    
    public func lockForConfiguration() throws {
        return
    }
    
    public var torchMode: AVCaptureDevice.TorchMode = .off
    public var isTorchAvailable: Bool = true
    
    public var focusMode: AVCaptureDevice.FocusMode = .continuousAutoFocus
    public var focusPointOfInterest: CGPoint = .zero
    public var isFocusPointOfInterestSupported: Bool = true
    
    public var exposureMode: AVCaptureDevice.ExposureMode = .continuousAutoExposure
    public var exposurePointOfInterest: CGPoint = .zero
    public var isExposurePointOfInterestSupported: Bool = true
    
    public func isFocusModeSupported(_ focusMode: AVCaptureDevice.FocusMode) -> Bool {
        return true
    }
    
    public func isExposureModeSupported(_ exposureMode: AVCaptureDevice.ExposureMode) -> Bool {
        return true
    }
    
    public var isSubjectAreaChangeMonitoringEnabled: Bool = false
}
