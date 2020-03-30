//
//  OptionsViewCollectionCell.swift
//  CoronaVirusHealth
//
//  Created by Yeskendir Salgara on 3/21/20.
//  Copyright © 2020 Yeskendir Salgara. All rights reserved.
//


import UIKit

protocol OptionsViewCollectionCellDelegate{
    func set(value: String?, index: Int)
}
class OptionsViewCollectionCell: UICollectionViewCell{
    
    private var frameView: UIView!
    var titlLabel: UILabel!
    var stackView: UIStackView!
    
    private var question: InformationModel?
    private var indexPath: IndexPath?
    var delegate: FieldViewCollectionCellDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(question: InformationModel, delegate: FieldViewCollectionCellDelegate?, indexPath: IndexPath){
        self.question = question
        self.indexPath = indexPath
        self.delegate = delegate
        self.titlLabel.text = NSLocalizedString(question.title, comment: "")
        guard let options = question.options else { return }
        for i in 0..<options.count{
            let view = OptionView()
            view.set(option: options[i], index: i)
            view.delegate = self
            stackView.addArrangedSubview(view)
        }
        self.layoutIfNeeded()
    }
    
    override func prepareForReuse() {
        clear()
        super.prepareForReuse()
    }
    
}
extension OptionsViewCollectionCell: OptionViewDelegate{
    func select(index: Int) {
        guard let item = indexPath?.item else { return }
        var option = self.question?.options?[index]
        for i in 0..<stackView.arrangedSubviews.count{
            if let optionView = stackView.arrangedSubviews[i] as? OptionView{
                optionView.set(value: i == index )
            }
        }
        option?.value = true
        guard let clearOption = option else { return }
        delegate?.set(value: clearOption.title, index: item, optionIndex: index, option: clearOption)
    }
}
private extension OptionsViewCollectionCell{
    func clear(){
        self.titlLabel.text = nil
        removeAllArrangedSubviews()
        self.layoutIfNeeded()
    }
    func removeAllArrangedSubviews() {
        let removedSubviews = stackView.arrangedSubviews.reduce([]) { (allSubviews, subview) -> [UIView] in
            self.stackView.removeArrangedSubview(subview)
            return allSubviews + [subview]
        }
        NSLayoutConstraint.deactivate(removedSubviews.flatMap({ $0.constraints }))
        removedSubviews.forEach({ $0.removeFromSuperview() })
    }
    func configureUI(){
        setViews()
        addViews()
        setConstraints()
    }
    func setViews(){
        frameView = {
            let view = UIView()
            view.layer.cornerRadius = 20
            view.layer.borderColor = Colors.black.color.cgColor
            view.layer.borderWidth = 1.0
            return view
        }()
        titlLabel = {
            let label = UILabel()
            label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
            label.textColor = Colors.black.color
            return label
        }()
        stackView = {
            let stackView = UIStackView()
            stackView.alignment = .center
            stackView.axis = .horizontal
            stackView.distribution = .fillEqually
            return stackView
        }()
    }
    func addViews(){
        self.addSubview(frameView)
        [titlLabel, stackView].forEach{
            frameView.addSubview($0)
        }
    }
    func setConstraints(){
        let width = UIScreen.main.bounds.width-40
        frameView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalTo(width)
        }
        titlLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.left.equalToSuperview().offset(20)
            $0.right.equalToSuperview().offset(-20)
        }
        stackView.snp.makeConstraints {
            $0.top.equalTo(titlLabel.snp.bottom).offset(12)
            $0.left.equalToSuperview().offset(20)
            $0.right.equalToSuperview().offset(-20)
            $0.bottom.equalToSuperview().offset(-20)
        }
    }
}
