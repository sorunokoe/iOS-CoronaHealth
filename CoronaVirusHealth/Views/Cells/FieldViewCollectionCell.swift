//
//  FieldViewCollectionCell.swift
//  CoronaVirusHealth
//
//  Created by Yeskendir Salgara on 3/18/20.
//  Copyright © 2020 Yeskendir Salgara. All rights reserved.
//

import UIKit

protocol FieldViewCollectionCellDelegate{
    func set(value: String?, index: Int, optionIndex: Int?, option: OptionModel?)
}
class FieldViewCollectionCell: UICollectionViewCell{
    
    enum FieldType{
        case number
        case double
        case popup
        case text
    }
    
    private var frameView: UIView!
    private var type: FieldType = .text
    private var indexPath: IndexPath?
    private var list: [String] = []
    
    var titleLabel: UILabel!
    var valueTextField: UITextField!
    
    var delegate: FieldViewCollectionCellDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(field: InformationModel, delegate: FieldViewCollectionCellDelegate?, indexPath: IndexPath){
        self.titleLabel.text = field.title
        self.valueTextField.text = field.value
        self.type = field.fieldType
        self.list = field.list ?? []
        self.delegate = delegate
        self.indexPath = indexPath
        switch type{
        case .number:
            valueTextField.keyboardType = .decimalPad
        case .text:
            valueTextField.keyboardType = .default
        case .popup:
            createPickerView()
        case .double:
            valueTextField.keyboardType = .numberPad
        }
    }
    
}
private extension FieldViewCollectionCell{
    @objc func touchHandle(){
        valueTextField.becomeFirstResponder()
    }
    @objc func textChanged(textField: UITextField){
        guard let index = indexPath?.item else { return }
        delegate?.set(value: textField.text, index: index, optionIndex: nil, option: nil)
    }
}
private extension FieldViewCollectionCell{
    func clear(){
        titleLabel.text = nil
        valueTextField.text = nil
    }
    func configureUI(){
        setViews()
        addViews()
        setConstraints()
        let touchGR = UITapGestureRecognizer(target: self, action: #selector(touchHandle))
        self.frameView.addGestureRecognizer(touchGR)
    }
    func setViews(){
        frameView = {
            let view = UIView()
            view.backgroundColor = .clear
            view.layer.cornerRadius = 20
            view.layer.borderColor = Colors.black.color.cgColor
            view.layer.borderWidth = 1.0
            return view
        }()
        titleLabel = {
            let label = UILabel()
            label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
            label.textColor = Colors.black.color
            return label
        }()
        valueTextField = {
            let field = UITextField()
            field.font = UIFont.systemFont(ofSize: 14, weight: .medium)
            field.textColor = Colors.black.color
            field.addTarget(self, action: #selector(touchHandle), for: .touchUpInside)
            field.addTarget(self, action: #selector(textChanged(textField:)), for: .editingChanged)
            return field
        }()
    }
    func addViews(){
        self.addSubview(frameView)
        [titleLabel, valueTextField].forEach{
            frameView.addSubview($0)
        }
    }
    func setConstraints(){
        let width = UIScreen.main.bounds.width
        self.snp.makeConstraints {
            $0.width.equalTo(width)
        }
        frameView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.left.equalToSuperview().offset(20)
            $0.right.equalToSuperview().offset(-20)
            $0.bottom.equalToSuperview()
        }
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.left.equalToSuperview().offset(20)
            $0.right.equalToSuperview().offset(-20)
            $0.height.equalTo(16)
        }
        valueTextField.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(5)
            $0.left.equalToSuperview().offset(20)
            $0.right.equalToSuperview().offset(-20)
            $0.height.equalTo(25)
            $0.bottom.equalToSuperview().offset(-10)
        }
    }
    
    func createPickerView(){
        let pickerView = UIPickerView()
        valueTextField.inputView = pickerView
        pickerView.delegate = self
        pickerView.dataSource = self
    }
    func dismissPickerView() {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let button = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(closePickerView))
        toolBar.setItems([button], animated: true)
        toolBar.isUserInteractionEnabled = true
        valueTextField.inputAccessoryView = toolBar
    }
    @objc func closePickerView() {
        self.endEditing(true)
    }
}
extension FieldViewCollectionCell: UIPickerViewDelegate, UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return list.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return list[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        valueTextField.text = list[row]
        guard let index = indexPath?.item else { return }
        delegate?.set(value: valueTextField.text, index: index, optionIndex: nil, option: nil)
    }
}
