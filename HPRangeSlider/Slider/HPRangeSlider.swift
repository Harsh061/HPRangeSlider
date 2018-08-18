//
//  HPRangeSlider.swift
//  HPRangeSlider
//
//  Created by Harshit Parikh on 18/08/18.
//  Copyright © 2018 Harshit Parikh. All rights reserved.
//

import Foundation

public protocol HPRangeSliderDelegate: class {
    func rangeSlider(selectedValue: Float)
}

public class HPRangeSlider: UIView {
    
    public var delegate: HPRangeSliderDelegate?
    
    public var sliderTitle: String = "" {
        didSet {
            titleLabel.text = sliderTitle
        }
    }
    
    public var value: CGFloat {
        get {
            return CGFloat(slider.value)
        }
        set {
            slider.value = Float(newValue)
            valueLabel.text = String(format: "%.2f", newValue)
        }
    }
    
    public var minValue: CGFloat = 0 {
        didSet {
            slider.minimumValue = Float(minValue)
        }
    }
    
    public var maxValue: CGFloat = 1 {
        didSet {
            slider.maximumValue = Float(maxValue)
        }
    }
    
    public var handleTintColor: UIColor = .blue {
        didSet {
            updateHandleTintColor()
        }
    }
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textColor = .black
        return label
    }()
    
    private lazy var valueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textColor = .black
        label.text = "0"
        return label
    }()
    
    private lazy var slider: UISlider = {
        let slider = UISlider()
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.addTarget(self, action: #selector(sliderMoved(slider:event:)), for: .valueChanged)
        return slider
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        sharedInit()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        sharedInit()
    }
    
    private func sharedInit() {
        
        addSubview(titleLabel)
        titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        
        addSubview(valueLabel)
        valueLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        valueLabel.lastBaselineAnchor.constraint(equalTo: titleLabel.lastBaselineAnchor).isActive = true
        
        addSubview(slider)
        slider.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        slider.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        slider.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        slider.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20).isActive = true
        
    }
    
    @objc private func sliderMoved(slider: UISlider, event: UIEvent) {
        valueLabel.text = String(format: "%.2f", slider.value)
        self.delegate?.rangeSlider(selectedValue: slider.value)
    }
    
    private func updateHandleTintColor() {
        slider.tintColor = handleTintColor
    }
    
}
