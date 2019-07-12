//
//  Create2ViewController.swift
//  URTH
//
//  Created by 장용범 on 05/07/2019.
//  Copyright © 2019 장용범. All rights reserved.
//

import UIKit

class Create2ViewController: UIViewController {

    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    @IBOutlet weak var label5: UILabel!
    
    @IBOutlet weak var selectedCategory: UILabel!
    @IBOutlet weak var selectedContent: UILabel!
    let userdefault = UserDefaults.standard
    var currentIdx = 1
    override func viewDidLoad() {
        super.viewDidLoad()

self.navigationController?.navigationBar.topItem?.title = ""
        addCloseButton()
        
        selectedCategory.text = "일회용품"
        selectedContent.text = """
        육지에는 환경미화원이 있지만, 바닷속에는 청소부가 없습니다.
        우리나라의 플라스틱 사용률이 세계에서 두 번째로 높다는 사실, 알고 계셨나요? 우리는 하루에도 수십 번씩 플라스틱 제품을 사용하고 쉽게 버리곤 합니다. 버려진 플라스틱은 바다로 흘러들어가 바다거북 수명의 네 배가 넘는 시간 동안 썩지 않고 바다 위를 떠다니게 됩니다. 우리의 아름다운 세 바다가 쓰레기로 넘쳐나지 않게, 변화를 위한 실천이 필요한 때입니다.
        """
    }
    
    func addCloseButton(){
        let barbuttonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "btnClose"), style: .plain, target: self, action: #selector(close))
        barbuttonItem.tintColor = #colorLiteral(red: 0.1643726826, green: 0.5449098349, blue: 0.5535590649, alpha: 1)
        self.navigationItem.rightBarButtonItem = barbuttonItem
    }
    
    @objc func close(){
        self.dismiss(animated: true, completion: nil)
    }
 
    @IBAction func next(_ sender: Any) {
        userdefault.setValue(currentIdx, forKey: "create_categoryIdx")
        let vc = storyboard?.instantiateViewController(withIdentifier: "Create3ViewController") as! Create3ViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func toggle(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            currentIdx = sender.tag
            button1.setImage(#imageLiteral(resourceName: "2319"), for: .normal)
            button2.setImage(#imageLiteral(resourceName: "29"), for: .normal)
            button3.setImage(#imageLiteral(resourceName: "32"), for: .normal)
            button4.setImage(#imageLiteral(resourceName: "35"), for: .normal)
            button5.setImage(#imageLiteral(resourceName: "38"), for: .normal)
            setLabelBold(label: label1)
            setLabelLight(label: label2)
            setLabelLight(label: label3)
            setLabelLight(label: label4)
            setLabelLight(label: label5)
            selectedCategory.text = "일회용품"
            selectedContent.text = """
            육지에는 환경미화원이 있지만, 바닷속에는 청소부가 없습니다.
            우리나라의 플라스틱 사용률이 세계에서 두 번째로 높다는 사실, 알고 계셨나요? 우리는 하루에도 수십 번씩 플라스틱 제품을 사용하고 쉽게 버리곤 합니다. 버려진 플라스틱은 바다로 흘러들어가 바다거북 수명의 네 배가 넘는 시간 동안 썩지 않고 바다 위를 떠다니게 됩니다. 우리의 아름다운 세 바다가 쓰레기로 넘쳐나지 않게, 변화를 위한 실천이 필요한 때입니다.
"""
            break
        case 2:
            currentIdx = sender.tag
            button1.setImage(#imageLiteral(resourceName: "28"), for: .normal)
            button2.setImage(#imageLiteral(resourceName: "2320"), for: .normal)
            button3.setImage(#imageLiteral(resourceName: "32"), for: .normal)
            button4.setImage(#imageLiteral(resourceName: "35"), for: .normal)
            button5.setImage(#imageLiteral(resourceName: "38"), for: .normal)
            setLabelLight(label: label1)
            setLabelBold(label: label2)
            setLabelLight(label: label3)
            setLabelLight(label: label4)
            setLabelLight(label: label5)
            selectedCategory.text = "대기"
            selectedContent.text = """
            지구는 더 더워지고, 숨은 갑갑해집니다. 최근 지구 곳곳에서 기온이 50도에 달하는 등 이상 기후가 관찰되고 있습니다. 과학자들은 지금처럼 온실가스를 배출하면 지구는 곧 인간이 살 수 없는 별이 버릴 수도 있다고 말합니다. 우리가 생활하면서 생기는 여러 부산물들은 지구 온도를 높이기도 하지만 공기 중을 떠다니며 대기를 오염시키기도 합니다. 온실가스와 먼지에 뒤덮인 지구를 깨끗이 닦아보아요!
            """
            break
        case 3:
            currentIdx = sender.tag
            button1.setImage(#imageLiteral(resourceName: "28"), for: .normal)
            button2.setImage(#imageLiteral(resourceName: "29"), for: .normal)
            button3.setImage(#imageLiteral(resourceName: "2321"), for: .normal)
            button4.setImage(#imageLiteral(resourceName: "35"), for: .normal)
            button5.setImage(#imageLiteral(resourceName: "38"), for: .normal)
            setLabelLight(label: label1)
            setLabelLight(label: label2)
            setLabelBold(label: label3)
            setLabelLight(label: label4)
            setLabelLight(label: label5)
            selectedCategory.text = "자원"
            selectedContent.text = """
            8천 년 전만 해도 지구 면적의 거의 절반을 차지했던 숲. 현재 그중 무려 4/5가 파괴되어 자취를 감췄습니다. 산림파괴의 원인은 다양하지만, 모두 인간의 행동이라는 공통점이 있습니다. 우리나라 사람들이 하루에 종이 한 장을 덜 쓴다면 총 4,800그루의 나무를 살릴 수 있습니다. 지속 가능한 자원 소비와 생활을 위해 또 어떤 실천을 할 수 있을까요?
            """
            break
        case 4:
            currentIdx = sender.tag
            button1.setImage(#imageLiteral(resourceName: "28"), for: .normal)
            button2.setImage(#imageLiteral(resourceName: "29"), for: .normal)
            button3.setImage(#imageLiteral(resourceName: "32"), for: .normal)
            button4.setImage(#imageLiteral(resourceName: "2322"), for: .normal)
            button5.setImage(#imageLiteral(resourceName: "38"), for: .normal)
            setLabelLight(label: label1)
            setLabelLight(label: label2)
            setLabelLight(label: label3)
            setLabelBold(label: label4)
            setLabelLight(label: label5)
            selectedCategory.text = "수질"
            selectedContent.text = """
            대한민국은 가뭄과 전쟁 중! 우리나라는 전체 수자원 총량의 26%만 이용 가능한 물 스트레스 국가입니다. 몇십 년 전까지만 해도 물을 직접 사 먹어야 한다는 건 상상도 못 할 일이었지만   이제는 현실이 되었습니다. 샤워 시간을 2분만 줄여도 24L의   물을 절약할 수 있습니다. 생활습관의 작은 변화로 물 절약을    시작해보세요.
            """
            break
        case 5:
            currentIdx = sender.tag
            button1.setImage(#imageLiteral(resourceName: "28"), for: .normal)
            button2.setImage(#imageLiteral(resourceName: "29"), for: .normal)
            button3.setImage(#imageLiteral(resourceName: "32"), for: .normal)
            button4.setImage(#imageLiteral(resourceName: "35"), for: .normal)
            button5.setImage(#imageLiteral(resourceName: "2323"), for: .normal)
            setLabelLight(label: label1)
            setLabelLight(label: label2)
            setLabelLight(label: label3)
            setLabelLight(label: label4)
            setLabelBold(label: label5)
            selectedCategory.text = "생태계"
            selectedContent.text = """
            지구는 우리의 것이 아닙니다. 지금 우리가 발을 딛고 있는 이곳, 지구에는 우리와 같은 인간뿐만 아니라 약 1,500만 종의 동식물이 함께 살고 있습니다. 하지만 그중 많은 종이 자연의 원리가  아닌 인간의 개입 멸종될 위기에 처해있습니다. 이제 우리는 동물을 착취의 대상이 아닌 공생의 대상으로 여겨야 합니다. 다채로운 만큼 아름다운 지구를 위해 비인간 동물의 권리 지키기에 함께해주세요!
            """
            break
        default:
            break
        }
    }
    
    func setLabelBold(label: UILabel){
        //label.font = UIFont(name: "NanumSquareOTFBold", size: 10)
        label.textColor = #colorLiteral(red: 0.1643726826, green: 0.5449098349, blue: 0.5535590649, alpha: 1)
    }
    func setLabelLight(label: UILabel){
        //label.font = UIFont(name: "NanumSquareOTFRegular", size: 10)
        label.textColor = #colorLiteral(red: 0.6901267767, green: 0.6902446747, blue: 0.6901112795, alpha: 1)
    }
    
    
}


