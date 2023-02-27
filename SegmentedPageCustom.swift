//
//  SegmentedPageCustom.swift
//  GeyimBuradaApp
//
//  Created by Ömer Firat on 24.02.2023.
//

import UIKit
import SnapKit

class SegmentedPageCustom: UIView {
    
    // MARK: - Names of segments
    lazy var segmentOne = String()
    lazy var segmentTwo = String()
    lazy var segmentThree = String()
    lazy var segmentNames = [segmentOne, segmentTwo, segmentThree]
    
    //MARK: - View of segments
    lazy var viewOne = UIView()
    lazy var viewTwo = UIView()
    lazy var viewThree = UIView()
    
    lazy var segmentedControl = UISegmentedControl(items: segmentNames)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpUI()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        setUpUI()
    }
    
    init(firstSegment: String, secondSegment: String, thirdSegment: String, firstVC: UIView, secondVC: UIView, thirdVC: UIView){
        super.init(frame: .zero)
        segmentOne = firstSegment
        segmentTwo = secondSegment
        segmentThree = thirdSegment
        viewOne = firstVC
        viewTwo = secondVC
        viewThree = thirdVC
        setUpUI()
    }
    
    
    func setUpUI(){
        snp.makeConstraints { make in
            make.width.height.equalTo(safeAreaLayoutGuide)
        }
        
        self.addSubview(segmentedControl)
        segmentedControl.addTarget(self, action: #selector(checkView), for: .valueChanged)
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)], for: .normal)
        segmentedControl.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16)], for: .selected)
        segmentedControl.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalTo(40)
            make.top.equalToSuperview()
        }
        addSubview(viewOne)
        viewOne.backgroundColor = .gray
        viewOne.snp.makeConstraints { make in
            make.top.equalTo(segmentedControl.snp.bottom)
            make.width.equalToSuperview()
            make.height.equalToSuperview()

        }
        addSubview(viewTwo)
        viewTwo.backgroundColor = .yellow
        viewTwo.snp.makeConstraints { make in
            make.top.equalTo(segmentedControl.snp.bottom)
            make.width.equalToSuperview()
            make.height.equalToSuperview()
        }
        addSubview(viewThree)
        viewThree.backgroundColor = .red
        viewThree.snp.makeConstraints { make in
            make.top.equalTo(segmentedControl.snp.bottom)
            make.width.equalToSuperview()
            make.height.equalToSuperview()
        }
        
        
        
    }
    
    
    
    @objc func checkView() {
        if segmentedControl.selectedSegmentIndex == 0 {
            viewOne.isHidden = false
            viewTwo.isHidden = true
            viewThree.isHidden = true
        } else if segmentedControl.selectedSegmentIndex == 1 {
            viewOne.isHidden = true
            viewTwo.isHidden = false
            viewThree.isHidden = true
            
        } else if segmentedControl.selectedSegmentIndex == 2 {
            viewOne.isHidden = true
            viewTwo.isHidden = true
            viewThree.isHidden = false
            
        }
        
        
    }
}
