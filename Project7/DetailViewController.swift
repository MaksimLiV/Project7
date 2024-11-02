//
//  DetailViewController.swift
//  Project7
//
//  Created by Maksim Li on 31/10/2024.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {
    var webView: WKWebView!
    var detailItem: Petition?
    
    override func loadView() {
        webView = WKWebView()
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let detailItem = detailItem else { return }
        
        let html = """
        <html>
        <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <style>
            body {
                font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif;
                font-size: 1.2em;
                background-color: #f8f9fa;
                color: #343a40;
                padding: 20px;
                margin: 0;
                line-height: 1.6;
            }
            
            h1 {
                font-size: 2.5em;
                color: #007bff;
                margin-bottom: 10px;
            }

            p {
                margin: 10px 0;
                padding: 10px;
                background-color: #ffffff;
                border-left: 5px solid #007bff;
                border-radius: 5px;
                box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            }

            a {
                color: #007bff;
                text-decoration: none;
                font-weight: bold;
            }

            a:hover {
                text-decoration: underline;
            }

            footer {
                margin-top: 20px;
                text-align: center;
                font-size: 0.9em;
                color: #6c757d;
            }
        </style>
        </head>
        <body>
        <h1>Details</h1>
        <p>\(detailItem.body)</p>
        <footer>
            <p>© 2024 Your Company Name</p>
        </footer>
        </body>
        </html>
        """
        webView.loadHTMLString(html, baseURL: nil)
    }
}
