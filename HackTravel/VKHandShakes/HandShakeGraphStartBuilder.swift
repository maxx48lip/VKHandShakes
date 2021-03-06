//
//  HandShakeGraphStartBuilder.swift
//  HackTravel
//
//  Created by Max Pavlov on 21/03/2020.
//  Copyright © 2020 Pavlov Max. All rights reserved.
//

import UIKit

final class HandShakeGraphStartBuilder {

	func makeLabelForTextField() -> UILabel {
		let label = UILabel()
		label.clipsToBounds = true
		label.layer.cornerRadius = 20
		label.layer.borderColor = UIColor.black.cgColor
		label.layer.borderWidth = 1
		label.layer.shadowOffset = CGSize(width: 0, height: 2)
		label.layer.shadowOpacity = 5
		label.layer.shadowRadius = 2
		return label
	}

	func makeTextField1() -> UITextField {
		let textField = UITextField()
		textField.placeholder = "id1"
		textField.text = "3664185"
		textField.textColor = .black
		return textField
	}

	func makeTextField2() -> UITextField {
		let textField = UITextField()
		textField.placeholder = "id2"
		textField.text = "271057793"
		textField.textColor = .black
		return textField
	}

	func makeStartButton() -> UIButton {
		let button = StartButton()
		button.titleText = "Start"
		return button
	}
}
