//
//  ViewController.swift
//  HackTravel
//
//  Created by Max Pavlov on 14/01/2020.
//  Copyright © 2020 Pavlov Max. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .white
		Debugger.log(type: .info, logString: "Загрузились вьюхи")
		BaseChain.makeRequest(type: .test, completion: { data in
			Debugger.log(type: .magic, logString: "\(String(data: data ?? Data(), encoding: .utf8) ?? "nil")")
		})
		// Do any additional setup after loading the view.
		testLoadingView()
	}

	private func testLoadingView() {
		let circularView = CircularProgressView()
		circularView.center = view.center
		let duration = 1.0
		circularView.progressAnimation(duration: duration)
		view.addSubview(circularView)
	}
}
