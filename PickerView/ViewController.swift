//
//  ViewController.swift
//  PickerView
//
//  Created by Lucia on 2017. 2. 20..
//  Copyright © 2017년 Lucia. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate {
    
    let MAX_ARRAY_NUM = 10
    let PICKER_VIEW_COLUMN = 1
    let PICKER_VIEW_HEIGHT:CGFloat = 80
    var imageArray = [UIImage?]()
    var imageFileName = [ "1.jpg", "2.jpg", "3.jpg", "4.jpg", "5.jpg", "6.jpg",
                          "7.jpg", "8.jpg", "9.jpg", "10.jpg"]
    
    
    @IBOutlet weak var pickerImage: UIPickerView!
    @IBOutlet weak var lblImageFileName: UILabel!
    @IBOutlet weak var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        for i in 0 ..< MAX_ARRAY_NUM {
            let image = UIImage(named: imageFileName[i])
            imageArray.append(image)
        }
        // 뷰가 로드되었을 때 첫번째 파일명 출력
        lblImageFileName.text = imageFileName[0]
        // 뷰가 로드되었을 때 첫번째 이미지 출력
        imageView.image = imageArray[0]
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // 피커 뷰의 컴포넌트 수 설정
    func numberOfComponentsInPickerView(pickerView: UIPickerView!) -> Int {
    
        return PICKER_VIEW_COLUMN
    }
    
    // 피커 뷰의 높이를 전달할 피커 뷰 델리게이트 메서드 
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return PICKER_VIEW_HEIGHT
    }
    
    
    // 피커 뷰의 개수 설정
    func pickerView(_ pickerView: UIPickerView!, numberOfRowsInComponent component: Int) -> Int {
        return imageFileName.count
    }
    
    // titleForRow 인수를 가지는 델리게이트 메서드. 
    // 피커뷰에게 컴포넌트의 각 열의 타이틀을 String 값으로 넘겨준다. 요기서는 imageFileName에 저장되어있는 파일명 넘겨줌
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        return imageFileName[row]
//    }
    
    
    // 피커 뷰의 각 Row의 view 설정
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let imageView = UIImageView(image: imageArray[row])
        imageView.frame = CGRect(x: 0, y: 0, width: 90, height: 140)
        
        return imageView
    }
    
    // 사용자가 피커 뷰의 룰렛에서 선택한 row값을 사용하여 imageFileName 배열에서 row 값에 해당하는 문자열을 가지고 옴.
    // 가져온 문자열을 레이블의 아웃렛 변수인 lblImageFileName.text에 저장.
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        lblImageFileName.text = imageFileName[row]
        imageView.image = imageArray[row]
    }
    
    
    


}

