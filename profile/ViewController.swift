//
//  ViewController.swift
//  profile
//
//  Created by 瀧本恒平 on 2019/02/13.
//  Copyright © 2019 瀧本恒平. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource, UIImagePickerControllerDelegate{
    
    let Datalist1 = ["1","2","3","4"]
    
    let Datalist2 = ["A","B","C","D","E","F","G","H","I","J","K","L"]
    
    let Datalist3 = ["なし","e-Trap","FunAI","Multi-creators","PumpUpはこだて","はこだて祭ネット",
                     "ボードゲーム部","生命・知     能探求者の集い","余ト市","BrassFAN","DARTS.FUN",
                     "Fabガール","FUGU","FUNラジ","GATT","Illustrators","LoL部","SoundCreate",
                     "Studio SUN","オーケストラ同好会","スマブラの会","デザイン・カルテット",
                     "未来大ポケモンだいすきクラブ","奇術サークル","軽音楽部","写真部","池坊華道・表千家茶道部",
                     "天文学部","美術サークル","放送局","麻雀サークル","未来祭実行委員","FUNキャンプ",
                     "クルージング部","サバイバルゲーム部","弓道部","FUN卓球サークル","サッカー部",
                     "ストリートダンスサークル「一気狂う」","ソフトテニス部","バドミントン部","ハンドボール部",
                     "フットサルサークル","空手道部","剣道部","硬式テニス部サークル","硬式野球部","自転車部",
                     "自動車部","女子バスケットボール部","女子バレーボール部","男子バスケットボール部",
                     "男子バレーボール部","軟式野球部","函館学生連合～息吹～"]
    
    let Datalist4 = ["北海道","青森県","岩手県","宮城県","秋田県","山形県","福島県",
                     "茨城県","栃木県","群馬県","埼玉県","千葉県","東京都","神奈川県",
                     "新潟県","富山県","石川県","福井県","山梨県","長野県","岐阜県",
                     "静岡県","愛知県","三重県","滋賀県","京都府","大阪府","兵庫県",
                     "奈良県","和歌山県","鳥取県","島根県","岡山県","広島県","山口県",
                     "徳島県","香川県","愛媛県","高知県","福岡県","佐賀県","長崎県",
                     "熊本県","大分県","宮崎県","鹿児島県","沖縄県"]
    
    let Datalist5 = ["スポーツ","テレビゲーム","読書","睡眠","プログラミング","映画鑑賞",
                     "音楽鑑賞","ダンス","天体観測","カラオケ","登山","温泉巡り","食べ歩き",
                     "芸術","テーブルゲーム","手芸","料理","なし"]
    
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
    
    @IBOutlet weak var yearlabel: UILabel!
    
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
        
        year.delegate = self
        
        cls.delegate = self
        
        circle.delegate = self
        
        from.delegate = self
        
        hobby1.delegate = self
        
        hobby2.delegate = self
        
        hobby3.delegate = self
        
        year.dataSource = self
        
        cls.dataSource = self
        
        circle.dataSource = self
        
        from.dataSource = self
        
        hobby1.dataSource = self
        
        hobby2.dataSource = self
        
        hobby3.dataSource = self
        
        yearlabel.text = "1"
        
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
        
        if pickerView == year{
           yearlabel.text = Datalist1[row]
        }
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

