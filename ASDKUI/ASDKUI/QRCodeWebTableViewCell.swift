//
//  QRCodeWebTableViewCell.swift
//  ASDKUI
//
//  Copyright (c) 2020 Tinkoff Bank
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//   http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

import UIKit
import WebKit

class QRCodeWebTableViewCell: UITableViewCell {

	@IBOutlet private weak var viewBorder: UIView!
	@IBOutlet private weak var webView: WKWebView!
	@IBOutlet private weak var activityView: UIActivityIndicatorView!
	
	@IBOutlet weak var labelTitle: UILabel!
	@IBOutlet weak var buttonShare: UIButton!
		
	var onButtonShareTouch: (() -> Void)?

	override func awakeFromNib() {
        super.awakeFromNib()
		
		viewBorder.layer.cornerRadius = 20
		viewBorder.backgroundColor = UIColor.init(hex: "#F6F7F8")
		
		webView.navigationDelegate = self		
    }
	
	func showQRCode(data qrCodeData: String) {
		var smartHTML: String
		
		let qrCodeBase64String = Data(qrCodeData.utf8).base64EncodedString()
			smartHTML =
"""
<!DOCTYPE html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>QR-code</title>
	<style>
		body {
			margin:0;
			padding:0;
		}
		.qr {
			display: flex;
			flex-direction: column;
			justify-content: center;
			height: 100vh;
			background-repeat: no-repeat;
			background-size: contain;
			width: 100%;
			background-position: center;
			background-image:url('data:image/svg+xml;base64,\(qrCodeBase64String)')
		}
	</style>
</head>
<body>
	<div class="qr"/>
</body>
</html>
"""
		webView.loadHTMLString(smartHTML, baseURL: Bundle(for: type(of: self)).bundleURL)
	}
	
	@IBAction func buttonShareTouchUpInside(_ sender: UIButton) {
		onButtonShareTouch?()
	}
	
}

extension QRCodeWebTableViewCell: WKNavigationDelegate {
	
	// MARK: WKNavigationDelegate
	
	func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
		activityView.stopAnimating()
	}
	
}
