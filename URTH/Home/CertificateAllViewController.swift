//
//  CertificateAllViewController.swift
//  URTH
//
//  Created by 장용범 on 09/07/2019.
//  Copyright © 2019 장용범. All rights reserved.
//

import UIKit

class CertificateAllViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    let reportAlert = UIAlertController(title: nil, message: "정말 신고하시겠습니까?", preferredStyle: .alert)

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.delegate = self
        collectionView.dataSource = self
        initReport()
        
        self.navigationItem.title = "전체 인증 사진"
        self.navigationController?.navigationBar.topItem?.title = ""
        self.navigationController?.navigationItem.backBarButtonItem?.image = #imageLiteral(resourceName: "btnBack")
        self.navigationController?.navigationItem.backBarButtonItem?.tintColor = #colorLiteral(red: 0.3993381858, green: 0.4123505652, blue: 0.4321975112, alpha: 1)
        
    }
    
    func initReport(){
        let report = UIAlertAction(title: "신고", style: .default) { (action) in
            
        }
        reportAlert.addAction(UIAlertAction(title: "취소", style: .default, handler: nil))
        reportAlert.addAction(report)
        
    }
    

}

extension CertificateAllViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CertificateAllCollectionViewCell", for: indexPath) as! CertificateAllCollectionViewCell
        cell.delegate = self
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 182, height: 238)
    }
    
   
    
}

extension CertificateAllViewController: CertificateCellDelegate{
    func click(wasPressedOnCell cell: CertificateAllCollectionViewCell) {
        guard let indexPath = collectionView.indexPath(for: cell) else { return }
        
        print("\(indexPath.row) 번째 셀")

        
        let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let askReport = UIAlertAction(title: "신고하기", style: .default) { (action) in
            self.present(self.reportAlert, animated: true, completion: nil)
        }
        actionSheet.addAction(askReport)
        actionSheet.addAction(UIAlertAction(title: "취소", style: .default, handler: nil))
        
        present(actionSheet, animated: true, completion: nil)
    }
}
