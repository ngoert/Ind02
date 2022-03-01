/*
 
 Nicholas Goertemiller
 Dr. MayField CS 4153
 DUE: 02/22/2022
 
 Program that challenges a player
 to slide (frequently flat) pieces along certain routes
 (usually on a board) to establish a certain end-
 configuration.
 
 
 Freitas, V. (n.d.). Person Holding Black Barbell · free stock photo - PEXELS. Retrieved Feburary 22, 2022, from https://www.pexels.com/photo/person-holding-black-barbell-703014/

 */

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var Images =  [#imageLiteral(resourceName: "pexels-victor-freitas-703014-0-0.png"), #imageLiteral(resourceName: "pexels-victor-freitas-703014-0-1.png"), #imageLiteral(resourceName: "pexels-victor-freitas-703014-0-2.png"), #imageLiteral(resourceName: "pexels-victor-freitas-703014-0-3.png"), #imageLiteral(resourceName: "pexels-victor-freitas-703014-0-4.png"), #imageLiteral(resourceName: "pexels-victor-freitas-703014-1-0.png"), #imageLiteral(resourceName: "pexels-victor-freitas-703014-1-1.png"), #imageLiteral(resourceName: "pexels-victor-freitas-703014-1-2.png"), #imageLiteral(resourceName: "pexels-victor-freitas-703014-1-3.png"), #imageLiteral(resourceName: "pexels-victor-freitas-703014-1-4.png"), #imageLiteral(resourceName: "pexels-victor-freitas-703014-2-0.png"), #imageLiteral(resourceName: "pexels-victor-freitas-703014-2-1.png"), #imageLiteral(resourceName: "pexels-victor-freitas-703014-2-2.png"), #imageLiteral(resourceName: "pexels-victor-freitas-703014-2-3.png"), #imageLiteral(resourceName: "pexels-victor-freitas-703014-2-4.png"), #imageLiteral(resourceName: "pexels-victor-freitas-703014-3-0.png"), #imageLiteral(resourceName: "pexels-victor-freitas-703014-3-1.png"), #imageLiteral(resourceName: "pexels-victor-freitas-703014-3-2.png"), #imageLiteral(resourceName: "pexels-victor-freitas-703014-3-3.png"), #imageLiteral(resourceName: "pexels-victor-freitas-703014-3-4.png")]
    var showAnswer = [0, 5, 10, 15, 1, 6, 11, 16, 2, 7, 12, 17, 3, 8, 13, 18, 4, 9, 14, 19]
    var incorrect = Array(0..<20)
    var incorrectImage=[UIImage]()
    
    var firstIndexPath: IndexPath?
    var secondIndexPath: IndexPath?
     
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "slidingBlockPuzzle"
        self.navigationController?.navigationBar.isTranslucent = false
        self.view.backgroundColor = .lightGray
        
        
        
        
        
        
        incorrectImage = Images
        setupViews()
        
        let txtLabel = UILabel(frame: CGRect(x: 85, y: 44, width: 244, height: 27))
        txtLabel.text = "Nicholas Goertemiller"
        txtLabel.font = UIFont.systemFont(ofSize: 23.0)
        txtLabel.font = UIFont.boldSystemFont(ofSize: 23.0)
        txtLabel.font = UIFont.italicSystemFont(ofSize: 23.0)
        txtLabel.font = UIFont(name:"ArialRoundedMTBold", size: 23.0)
        view.addSubview(txtLabel)
    }
   
    
    
    
    
    @objc func swapButton() {
        guard let start = firstIndexPath, let end = secondIndexPath else { return }
        myCollectionView.performBatchUpdates({
            myCollectionView.moveItem(at: start, to: end)
            myCollectionView.moveItem(at: end, to: start)
        }) { (finished) in
            print(self.incorrect)
            self.myCollectionView.deselectItem(at: start, animated: true)
            self.myCollectionView.deselectItem(at: end, animated: true)
            self.firstIndexPath = nil
            self.secondIndexPath = nil
            self.incorrectImage.swapAt(start.item, end.item)
            self.incorrect.swapAt(start.item, end.item)
            if self.incorrect == self.showAnswer {
                let alert=UIAlertController(title: "You Won!", message: "Congratulations!!!", preferredStyle: .alert)
                let restart = UIAlertAction(title: "Restart", style: .default, handler: { (action) in
                    self.restartGame()
                })
                alert.addAction(restart)
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
    
    func restartGame() {
        incorrect = Array(0..<20)
        incorrectImage = Images
        self.myCollectionView.reloadData()
    }

        
    @objc func shuffleBtn() {
        
        incorrect = Array(0..<20)
        incorrectImage = Images
        firstIndexPath = nil
        secondIndexPath = nil
        self.Images.shuffle()
        self.myCollectionView.reloadData()
    }
    
    
    
    @objc func showAnswerBtn() {
        
        
        if self.incorrect != self.showAnswer {
            let alert=UIAlertController(title: "Answer will be shown", message: "Click restart, then shuffle to start again.", preferredStyle: .alert)
            let restart = UIAlertAction(title: "Restart", style: .default, handler: { (action) in
                self.restartGame()
            })
            alert.addAction(restart)
            self.present(alert, animated: true, completion: nil)
            
          //  var showAnswer = [0, 5, 10, 15, 1, 6, 11, 16, 2, 7, 12, 17, 3, 8, 13, 18, 4, 9, 14, 19]
            
            
            self.Images =  [#imageLiteral(resourceName: "pexels-victor-freitas-703014-0-0.png"), #imageLiteral(resourceName: "pexels-victor-freitas-703014-1-0.png"), #imageLiteral(resourceName: "pexels-victor-freitas-703014-2-0.png"), #imageLiteral(resourceName: "pexels-victor-freitas-703014-3-0.png"), #imageLiteral(resourceName: "pexels-victor-freitas-703014-0-1.png"), #imageLiteral(resourceName: "pexels-victor-freitas-703014-1-1.png"), #imageLiteral(resourceName: "pexels-victor-freitas-703014-2-1.png"), #imageLiteral(resourceName: "pexels-victor-freitas-703014-3-1.png"), #imageLiteral(resourceName: "pexels-victor-freitas-703014-0-2.png"), #imageLiteral(resourceName: "pexels-victor-freitas-703014-1-2.png"), #imageLiteral(resourceName: "pexels-victor-freitas-703014-2-2.png"), #imageLiteral(resourceName: "pexels-victor-freitas-703014-3-2.png"), #imageLiteral(resourceName: "pexels-victor-freitas-703014-0-3.png"), #imageLiteral(resourceName: "pexels-victor-freitas-703014-1-3.png"), #imageLiteral(resourceName: "pexels-victor-freitas-703014-2-3.png"), #imageLiteral(resourceName: "pexels-victor-freitas-703014-3-3.png"), #imageLiteral(resourceName: "pexels-victor-freitas-703014-0-4.png"), #imageLiteral(resourceName: "pexels-victor-freitas-703014-1-4.png"), #imageLiteral(resourceName: "pexels-victor-freitas-703014-2-4.png"), #imageLiteral(resourceName: "pexels-victor-freitas-703014-3-4.png")]
            
            
            
            self.myCollectionView.reloadData()
    }
    }
    
    
        
    
    //MARK: CollectionView
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell=collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! ImgViewCell
        cell.ImageView.image=incorrectImage[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        if firstIndexPath == nil {
            firstIndexPath = indexPath
            collectionView.selectItem(at: firstIndexPath, animated: true, scrollPosition: UICollectionView.ScrollPosition(rawValue: 0))
        } else if secondIndexPath == nil {
            secondIndexPath = indexPath
            collectionView.selectItem(at: secondIndexPath, animated: true, scrollPosition: UICollectionView.ScrollPosition(rawValue: 0))
        } else {
            collectionView.deselectItem(at: secondIndexPath!, animated: true)
            secondIndexPath = indexPath
            collectionView.selectItem(at: secondIndexPath, animated: true, scrollPosition: UICollectionView.ScrollPosition(rawValue: 0))
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if indexPath == firstIndexPath {
            firstIndexPath = nil
        } else if indexPath == secondIndexPath {
            secondIndexPath = nil
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width
        return CGSize(width: width/4, height: width/5)
    }
    
    func setupViews() {
        myCollectionView.delegate=self
        myCollectionView.dataSource=self
        myCollectionView.register(ImgViewCell.self, forCellWithReuseIdentifier: "Cell")
        myCollectionView.backgroundColor=UIColor.white
        
        self.view.addSubview(myCollectionView)
        myCollectionView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 30).isActive=true
        myCollectionView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 125).isActive=true
        myCollectionView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -30).isActive=true
        myCollectionView.heightAnchor.constraint(equalTo: myCollectionView.widthAnchor).isActive=true
        
        self.view.addSubview(switchBtn)
        switchBtn.widthAnchor.constraint(equalToConstant: 200).isActive=true
        switchBtn.topAnchor.constraint(equalTo: myCollectionView.bottomAnchor, constant: 20).isActive=true
        switchBtn.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive=true
        switchBtn.heightAnchor.constraint(equalToConstant: 50).isActive=true
        switchBtn.addTarget(self, action: #selector(swapButton), for: .touchUpInside)
        
        
        self.view.addSubview(btnShuffle)
        btnShuffle.widthAnchor.constraint(equalToConstant: 200).isActive=true
        btnShuffle.topAnchor.constraint(equalTo: switchBtn.bottomAnchor, constant: 30).isActive=true
        btnShuffle.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive=true
        btnShuffle.heightAnchor.constraint(equalToConstant: 50).isActive=true
        btnShuffle.addTarget(self, action: #selector(shuffleBtn), for: .touchUpInside)
        
        self.view.addSubview(btnShowAnswer)
        btnShowAnswer.widthAnchor.constraint(equalToConstant: 200).isActive=true
        btnShowAnswer.topAnchor.constraint(equalTo: switchBtn.bottomAnchor, constant: 115).isActive=true
        btnShowAnswer.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive=true
        btnShowAnswer.heightAnchor.constraint(equalToConstant: 50).isActive=true
        btnShowAnswer.addTarget(self, action: #selector(showAnswerBtn), for: .touchUpInside)
    }
    
    let myCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing=0
        layout.minimumLineSpacing=0
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        cv.allowsMultipleSelection = true
        cv.translatesAutoresizingMaskIntoConstraints=false
        return cv
    }()
    
    let switchBtn: UIButton = {
        let btn=UIButton(type: .system)
        btn.setTitle("SWITCH", for: .normal)
        btn.setTitleColor(UIColor.black, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        btn.translatesAutoresizingMaskIntoConstraints=false
        return btn
    }()
    
    let btnShuffle: UIButton = {
        let btn=UIButton(type: .system)
        btn.setTitle("SHUFFLE", for: .normal)
        btn.setTitleColor(UIColor.black, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        btn.translatesAutoresizingMaskIntoConstraints=false
        return btn
    }()
    
    
    let btnShowAnswer: UIButton = {
        let btn=UIButton(type: .system)
        btn.setTitle("SHOW ANSWER", for: .normal)
        btn.setTitleColor(UIColor.red, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        btn.translatesAutoresizingMaskIntoConstraints=false
        return btn
    }()
    
    
}
