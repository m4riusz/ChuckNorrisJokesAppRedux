//
//  JokeDetailsCell.swift
//  ChuckNorrisJokesAppRedux
//
//  Created by Mariusz Sut on 06/07/2019.
//  Copyright © 2019 Mariusz Sut. All rights reserved.
//

import UIKit
import SnapKit
import SDWebImage

class JokeDetailsCell: UITableViewCell {
    
    fileprivate struct Const {
        struct JokeImageView {
            static let size = CGSize(width: 60, height: 60)
        }
    }
    
    fileprivate var containerView: UIView?
    fileprivate var createDateLabel: UILabel?
    fileprivate var jokeImageView: UIImageView?
    fileprivate var jokeLabel: UILabel?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.initialize()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.initialize()
    }
    
    fileprivate func initialize() {
        self.initContainerView()
        self.initCreateDateLabel()
        self.initJokeImageView()
        self.initJokeLabel()
    }
    
    fileprivate func initContainerView() {
        self.containerView = UIView()
        self.contentView.addSubview(self.containerView!)
        
        self.containerView?.snp.makeConstraints({ make in
            make.edges.equalToSuperview()
        })
    }
    
    fileprivate func initCreateDateLabel() {
        self.createDateLabel = UILabel()
        self.createDateLabel?.font = .systemFont(ofSize: 13, weight: .light)
        self.createDateLabel?.textColor = .lightGray
        self.containerView?.addSubview(self.createDateLabel!)
        
        self.createDateLabel?.snp.makeConstraints({ make in
            make.top.equalToSuperview().offset(Spacing.tiny)
            make.right.equalToSuperview().offset(-Spacing.tiny)
        })
    }
    
    fileprivate func initJokeImageView() {
        self.jokeImageView = UIImageView()
        self.containerView?.addSubview(self.jokeImageView!)
        
        self.jokeImageView?.snp.makeConstraints({ make in
            make.top.equalToSuperview().offset(Spacing.normal)
            make.centerX.equalToSuperview()
            make.size.equalTo(Const.JokeImageView.size)
        })
    }
    
    fileprivate func initJokeLabel() {
        self.jokeLabel = UILabel()
        self.jokeLabel?.font = .systemFont(ofSize: 16, weight: .semibold)
        self.jokeLabel?.textColor = .darkGray
        self.jokeLabel?.numberOfLines = 0
        self.jokeLabel?.textAlignment = .center
        self.containerView?.addSubview(self.jokeLabel!)
        
        self.jokeLabel?.snp.makeConstraints({ [unowned self] make in
            make.top.equalTo(self.jokeImageView!.snp.bottom).offset(Spacing.normal)
            make.left.equalToSuperview().offset(Spacing.normal)
            make.right.equalToSuperview().offset(-Spacing.normal)
            make.bottom.equalToSuperview().offset(-Spacing.normal)
        })
    }
    
    func update(item: Joke) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy mm:HH"
        
        self.createDateLabel?.text = dateFormatter.string(from: item.createdDate)
        self.jokeLabel?.text = item.content
        guard let url = URL(string: item.iconUrl) else {
            return
        }
        self.jokeImageView?.sd_setImage(with: url)
    }
}
