//
//  QRCodeController.swift
//  BFTV-MDS
//
//  Created by Luzenildo Junior on 28/02/17.
//  Copyright © 2017 LAVID-UFPB. All rights reserved.
//

//Imports
import Foundation
import AVFoundation
import UIKit

//Class to handle QRCode Camera interaction.
class QRCodeController: UIViewController, AVCaptureMetadataOutputObjectsDelegate{
    
    //Variablles
    var captureSession: AVCaptureSession?
    var videoPreviewLayer: AVCaptureVideoPreviewLayer?
    var qrCodeFrameView: UIView?
    
    //Outlets
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var QRCodeView: UIView!
    @IBOutlet weak var QRCodeImage: UIImageView!
    
    //constraints
    @IBOutlet weak var QRCodeImageHeight: NSLayoutConstraint!
    
    
    //#############################################################################
    //----------------- Screen State Functions -----------------\\
    //#############################################################################
    
    //This function is called when Screen loads.
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.resizeScreen()
        self.title = "Canal de Interatividade"
        self.messageLabel.text = "No QR code is detected" //Set messageLabel to "No QR code is detected"
        
        let device = AVCaptureDevice.defaultDevice(withMediaType: AVMediaTypeVideo) //Create a device.
        self.initializeQRCode(capture_device: device!) //Call function to initialize QRCode Capture.
    }
    
    func resizeScreen(){
        self.QRCodeImageHeight.constant = self.QRCodeImage.bounds.width
    }
    
    //#############################################################################
    //----------------- QRCode Functions -----------------\\
    //#############################################################################
    
    //This function initialize the QRCode capture with Camera.
    func initializeQRCode(capture_device: AVCaptureDevice){
        do {
            // Get an instance of the AVCaptureDeviceInput class using the previous device object.
            let input = try AVCaptureDeviceInput(device: capture_device)
            // Initialize the captureSession object.
            captureSession = AVCaptureSession()
            // Set the input device on the capture session.
            captureSession?.addInput(input)
            let captureMetadataOutput = AVCaptureMetadataOutput()
            captureSession?.addOutput(captureMetadataOutput)
            
            captureMetadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
            captureMetadataOutput.metadataObjectTypes = [AVMetadataObjectTypeQRCode]
            
            // Initialize the video preview layer and add it as a sublayer to the viewPreview view's layer.
            videoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
            videoPreviewLayer?.videoGravity = AVLayerVideoGravityResizeAspectFill
            videoPreviewLayer?.frame = QRCodeView.layer.bounds
            self.QRCodeView.layer.addSublayer(videoPreviewLayer!)
            
            // Start video capture.
            captureSession?.startRunning()
            //Bring the label to front of the screen.
            self.QRCodeView.bringSubview(toFront: messageLabel)
            
            //Initialize QR Code Frame to highlight the QR code
            self.QRCodeFrameBox()
            
        } catch {
            //If any error occurs, simply print it out and don't continue any more.
            print(error)
            return
        }
    }
    
    //This function creates a frame box when a QRCode is found.
    func QRCodeFrameBox(){
        //Initialize a frameview in uiview.
        qrCodeFrameView = UIView()
        
        //If a QRCode was found, Set color to Green and border to 2 and show the QRCodeFrameView.
        if let qrCodeFrameView = qrCodeFrameView {
            qrCodeFrameView.layer.borderColor = UIColor.green.cgColor
            qrCodeFrameView.layer.borderWidth = 2
            self.QRCodeView.addSubview(qrCodeFrameView)
            self.QRCodeView.bringSubview(toFront: qrCodeFrameView)
        }
    }
    
    //This function decodes the QRCode and shows on the screen the output.
    func captureOutput(_ captureOutput: AVCaptureOutput!, didOutputMetadataObjects metadataObjects: [Any]!, from connection: AVCaptureConnection!) {
        
        // Check if the metadataObjects array is not nil and it contains at least one object.
        if metadataObjects == nil || metadataObjects.count == 0 {
            qrCodeFrameView?.frame = CGRect.zero
            messageLabel.text = "No QR code is detected"
            return
        }
        
        // Get the metadata object.
        let metadataObj = metadataObjects[0] as! AVMetadataMachineReadableCodeObject
        
        if metadataObj.type == AVMetadataObjectTypeQRCode {
            // If the found metadata is equal to the QR code metadata then update the status label's text and set the bounds
            let barCodeObject = videoPreviewLayer?.transformedMetadataObject(for: metadataObj)
            qrCodeFrameView?.frame = barCodeObject!.bounds
            
            if metadataObj.stringValue != nil {
                messageLabel.text = metadataObj.stringValue
            }
        }
    }
}
