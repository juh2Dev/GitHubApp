//
//  RepositoryTableViewCell.swift
//  GitHubApp
//
//  Created by 임주희 on 2022/12/28.
//

import Foundation
import UIKit
import SnapKit

//- 소유자 이름
//- 레파지토리 이름
//- 레파지토리 설명
//- 스타 개수
//- 스타 버튼
//- (Optional) Topics

class RepositoryTableViewCell: UITableViewCell {
    
    private let bookImageView: UIImageView = UIImageView()
    private let titleLabel: UILabel = UILabel()
    private let descriptionLabel: UILabel = UILabel()
    private let startButton: UIButton = UIButton()
    
    private let titleStackView: UIStackView = UIStackView()
    
    private let topicLabel: UILabel = UILabel()
    
    //스타 개수
    private let starCountLabel: UILabel = UILabel()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // 책 이미지
        bookImageView.contentMode = .scaleAspectFit
        bookImageView.image = UIImage(systemName: "book.closed")
        bookImageView.tintColor = .darkGray
        bookImageView.snp.makeConstraints {
            $0.height.width.equalTo(20)
        }

        // 타이틀
        titleLabel.text = "안녕 타이틀"
        titleLabel.font = .systemFont(ofSize: 20, weight: .medium)
        titleLabel.numberOfLines = 1
        
        // 스타 버튼
        startButton.setImage(UIImage(named: "star"), for: .normal)
        startButton.imageView?.contentMode = .scaleAspectFit
        startButton.snp.makeConstraints {
            $0.height.width.equalTo(28)
        }
        
        
        // 스택 (책이미지, 타이틀, 스타버튼)
        titleStackView.axis = .horizontal
        titleStackView.alignment = .center
        titleStackView.distribution = .fill
        titleStackView.spacing = 10
        [bookImageView, titleLabel, startButton].forEach {
            titleStackView.addArrangedSubview($0)
        }
        
        self.addSubview(titleStackView)
        titleStackView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview().inset(8)
            $0.height.equalTo(40)
        }
        
        
        // 설명
        descriptionLabel.text = "Reactive Programming in Swift & tools notsssss found in ther core RxSwift distribution"
        descriptionLabel.font = .systemFont(ofSize: 15, weight: .regular)
        descriptionLabel.numberOfLines = 2
        self.addSubview(descriptionLabel)
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(titleStackView.snp.bottom)
            $0.leading.equalTo(titleLabel)
            $0.trailing.equalToSuperview().inset(8)
        }
        
        // 스타 개수
        starCountLabel.text = "★ 100"
        self.addSubview(starCountLabel)
        starCountLabel.snp.makeConstraints {
            $0.top.equalTo(descriptionLabel.snp.bottom).offset(10)
            $0.leading.equalTo(descriptionLabel)
            $0.trailing.equalToSuperview().inset(8)
        }
        
        
        // topics
        let tag: String = "rxswift swift ios"
        topicLabel.text = tag
        topicLabel.textColor = .link
        topicLabel.font = .systemFont(ofSize: 13, weight: .regular)
        
        let topicBackgroudColor: UIColor = UIColor.systemTeal.withAlphaComponent(0.1)
        let attrStr = setBackgroudColor(entireString: tag, without: " ", color: topicBackgroudColor)
        topicLabel.attributedText = attrStr
        
        
        self.addSubview(topicLabel)
        topicLabel.snp.makeConstraints {
            $0.top.equalTo(starCountLabel.snp.bottom).offset(10)
            $0.leading.equalTo(descriptionLabel)
            $0.trailing.equalToSuperview().inset(8)
        }
        


    }
    
   
    // 특정 부분 빼고 백그라운드 색 넣어주기
    private func setBackgroudColor(entireString: String, without target: String = " ", color: UIColor) -> NSMutableAttributedString {
        
        let attrStr = NSMutableAttributedString(string: entireString)
        
        let entireLength = entireString.count
        
        var range = NSRange(location: 0, length: entireLength)
        
        var rangeArr = [NSRange]()
        
        while (range.location != NSNotFound) {
            let location = range.location
            range = (attrStr.string as NSString).range(of: target, options: .caseInsensitive, range: range)
            
            if range.lowerBound < entireString.count {
                let r = NSRange(location: location, length: (range.lowerBound - location) )
                rangeArr.append(r)
            } else {
                let r = NSRange(location: location, length: (entireString.count - location) )
                rangeArr.append(r)
            }
            
            if (range.location != NSNotFound) {
                range = NSRange(location: range.location + range.length, length: entireString.count - (range.location + range.length))
            }
        }
        rangeArr.forEach { (range) in
            attrStr.addAttribute(.backgroundColor, value: color, range: range)
        }
        
        return attrStr
    }
    
}


