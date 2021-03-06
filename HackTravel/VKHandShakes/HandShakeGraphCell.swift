//
//  HandShakeGraphCell.swift
//  HackTravel
//
//  Created by Max Pavlov on 21/03/2020.
//  Copyright © 2020 Pavlov Max. All rights reserved.
//

import Foundation
import UIKit

final class HandShakeGraphCell: UICollectionViewCell {
	var name: String? {
		didSet {
			labelName.text = name
		}
	}
	var surname: String? {
		didSet {
			labelSurName.text = surname
		}
	}
	var image: String? {
		didSet {
			imageView.backgroundColor = .lightGray
			guard let sringWithUrl = image else {
				Debugger.log(type: .error, logString: "Image url is nil")
				return
			}
			makeImageFrom(stringWithUrl: sringWithUrl)
		}
	}

	private let labelName = UILabel()
	private let labelSurName = UILabel()
	private let imageView = UIImageView()

	private func makeImageFrom(stringWithUrl: String) {
		guard let url = URL(string: stringWithUrl) else {
			Debugger.log(type: .error, logString: "Invalid url")
			return
		}

		DispatchQueue.global().async {
			guard let data = try? Data(contentsOf: url) else {
				Debugger.log(type: .error, logString: "Image Data is nil")
				return
			}
			DispatchQueue.main.async {
				self.imageView.image = UIImage(data: data)
			}
		}
	}

	override init(frame: CGRect) {
		super.init(frame: frame)

		labelName.textAlignment = .center
		labelName.textColor = .gray

		labelSurName.textAlignment = .center
		labelSurName.textColor = .gray
		imageView.layer.masksToBounds = true
		imageView.layer.cornerRadius = 25
		//backgroundColor = .green

		clipsToBounds = true
		layer.cornerRadius = 10
		setupConstraints()
	}

	private func setupConstraints() {
		[labelName, labelSurName, imageView].forEach { view in
			view.translatesAutoresizingMaskIntoConstraints = false
			addSubview(view)
		}

		NSLayoutConstraint.activate([
			imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4),
			imageView.widthAnchor.constraint(equalToConstant: 50),
			imageView.heightAnchor.constraint(equalToConstant: 50),
			imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),

			labelName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4),
			labelName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
			labelName.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 10),
			labelName.heightAnchor.constraint(equalToConstant: 20),

			labelSurName.topAnchor.constraint(equalTo: labelName.bottomAnchor),
			labelSurName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
			labelSurName.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 10),
			labelSurName.heightAnchor.constraint(equalToConstant: 20)])
	}
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
