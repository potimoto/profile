//
//  ViewController.swift
//  profile
//
//  Created by 瀧本恒平 on 2019/02/13.
//  Copyright © 2019 瀧本恒平. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource, UIImagePickerControllerDelegate{
    
    //let Datalist6 = [""] 属性を使うときはこのデータリストを使用
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == year{
           return Datalist1.count
        }
        if pickerView == cls{
            return Datalist2.count
        }
        if pickerView == circle{
            return Datalist3.count
        }
        if pickerView == from{
            return Datalist4.count
        }
        if pickerView == hobby1{
            return Datalist5.count
        }
        if pickerView == hobby2{
            return Datalist5.count
        }
        if pickerView == hobby3{
            return Datalist5.count
        }
        else {
            return 1//属性を扱うならここを属性に変更
        }
    }
    
  //  @IBOutlet weak var yearlabel: UILabel!
    
    @IBOutlet weak var clslabel: UILabel!

    @IBOutlet weak var circlelabel: UILabel!
    
    @IBOutlet weak var fromlabel: UILabel!
    
    @IBOutlet weak var hobby1label: UILabel!
    
    @IBOutlet weak var hobby2label: UILabel!
    
    @IBOutlet weak var hobby3label: UILabel!
    
    @IBOutlet weak var year: UIPickerView!
    
    @IBOutlet weak var cls: UIPickerView!
    
    @IBOutlet weak var circle: UIPickerView!
    
    @IBOutlet weak var from: UIPickerView!
    
    @IBOutlet weak var hobby1: UIPickerView!
    
    @IBOutlet weak var hobby2: UIPickerView!
    
    @IBOutlet weak var hobby3: UIPickerView!
    
    @IBOutlet weak var TextField: UITextField!
    
    @IBOutlet weak var ImageView: UIImageView!
    
    @IBOutlet weak var pickerKeyboardButton: PickerViewKeyboard!
        
    
    
    
    
    //カメラロールから写真を選択する処理
    @IBAction func ImageButton(_ sender: UIButton) {
        // カメラロールが利用可能か？
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            // 写真を選ぶビュー
            let pickerView = UIImagePickerController()
            // 写真の選択元をカメラロールにする
            // 「.camera」にすればカメラを起動できる
            pickerView.sourceType = .photoLibrary
            // デリゲート
            pickerView.delegate = self as? UIImagePickerControllerDelegate & UINavigationControllerDelegate
            // ビューに表示
            self.present(pickerView, animated: true)
        }
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        TextField.delegate = self
        //delegateを自身に設定
        
        TextField.clearButtonMode = .whileEditing
        //入力している文字を全消しするclearボタンを設定(書いている時のみの設定)
        
        TextField.returnKeyType = .done
         //改行ボタンを完了ボタンに変更
        
        TextField.placeholder = "入力してください"
         //文字が何も入力されていない時に表示される文字
        
        self.view.addSubview(TextField)
         //viewにtextfieldをsubviewとして追加
        
        TextField.keyboardType = UIKeyboardType.default
        
        /*year.delegate = self
        
        cls.delegate = self
        
        circle.delegate = self
        
        from.delegate = self
        
        hobby1.delegate = self
        
        hobby2.delegate = self
        
        hobby3.delegate = self
        
        //year.dataSource = self
        
        cls.dataSource = self
        
        circle.dataSource = self
        
        from.dataSource = self
        
        hobby1.dataSource = self
        
        hobby2.dataSource = self
        
        hobby3.dataSource = self*/
        
        //yearlabel.text = "1"
        
         pickerKeyboardButton.delegate = self
        // デフォルトの画像を表示する
        //ImageView.image = UIImage(named: "default.png")
    }
    
    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //完了を押すとkeyboardを閉じる処理
    func textFieldShouldReturn(_ TextField: UITextField) -> Bool {
        
        //Keyboardを閉じる
        TextField.resignFirstResponder()
        
        return true
        
    }
    
    //keyboard以外の画面を押すと、keyboardを閉じる処理
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if (self.TextField.isFirstResponder) {
            self.TextField.resignFirstResponder()
        }
    }
    
    //データを返す処理
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == year{
            return Datalist1[row]
        }
        if pickerView == cls{
            return Datalist2[row]
        }
        if pickerView == circle{
            return Datalist3[row]
        }
        if pickerView == from{
            return Datalist4[row]
        }
        if pickerView == hobby1{
            return Datalist5[row]
        }
        if pickerView == hobby2{
            return Datalist5[row]
        }
        else{
            return Datalist5[row]
        }
    }

    // UIPickerViewのRowが選択された時の挙動
    func pickerView(_ pickerView: UIPickerView,
                    didSelectRow row: Int,
                    inComponent component: Int) {
        
        /*if pickerView == year{
           yearlabel.text = Datalist1[row]
        }*/
        if pickerView == cls{
           clslabel.text = Datalist2[row]
            
        }
        if pickerView == circle{
            circlelabel.text = Datalist3[row]
        }
        if pickerView == from{
            fromlabel.text = Datalist4[row]
        }
        if pickerView == hobby1{
            hobby1label.text = Datalist5[row]
        }
        if pickerView == hobby2{
            hobby2label.text = Datalist5[row]
        }
        else{
           hobby3label.text = Datalist5[row]
        }
    }
    
    // 写真を選んだ後に呼ばれる処理
    private func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        // 選択した写真を取得する
        let image = info[.originalImage] as! UIImage
        // ビューに表示する
        self.ImageView.image = image
        // 写真を選ぶビューを引っ込める
        self.dismiss(animated: true)
    }
    
}

extension ViewController: PickerViewKeyboardDelegate {
    func initSelectedRow(sender: PickerViewKeyboard) -> Int {
        return 0
    }
    
    func titlesOfPickerViewKeyboard(sender: PickerViewKeyboard) -> Array<String> {
        return Datalist1
    }
    func didDone(sender: PickerViewKeyboard, selectedData: String) {
        //yearlabel.text = selectedData
        sender.resignFirstResponder()
    }
    func didCancel(sender: PickerViewKeyboard) {
        print("canceled")
        sender.resignFirstResponder()
    }
}

