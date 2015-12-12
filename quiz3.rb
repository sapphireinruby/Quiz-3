1. 請解釋 database.yml, routes.rb, 和 Gemifle 分別是什麼？ 他們分別在一個 Rails 專案裡的什麼位置？ 他們為什麼對一個 Rails 專案如此重要？
    routes.rb 是設定整個專案的路遊的地方 和app的功能息息相關
    database.yml 設定使用哪裡的database 例如db目錄下的cqul3
    Gemifle 在專案的根目錄下面
    是並不包含在rails本身的東西 所以當我們要使用此功能的時候 需要讓rails包含他們
    也可方便管理版本
    是紀錄某專案裡使用的library 

2. MVC 架構裡的 M, V, 和 C 分別代表什麼？
    一種軟體架構模式，把系統分成三個部份: Model、View、Controller
    目的為實作動態程式設計，對於日後程式的修改及擴充更加便利，並讓某部分的程式可以重複利用。 優點在於複雜度簡化，使程式結構更加直覺。
    Model - 資料庫人員進行資料管理及資料庫設計
    描述功能性的演算法以及資料庫與使用者介面之間的資料交換
    View - 美工或UI設計人員進行圖形介面設計及美化
    呈現自Model傳來的資料與使用者互動的網頁
    Controller - 程式設計師編寫程式架構及功能
    1.蒐集使用者於View中所輸入的資料，並決定由哪一支程式進行處理。
    2.接收Model傳回的資料，解析後傳給View呈現
    skinny controller, fat model
    controller應該東西少 盡量單純的去資料庫擷取資料就好
    計算的東西 應該是去呼叫model裡面的定義的方法去作運算
 
3. 請解釋 CRUD 是哪四個字的縮寫？
    create
    read
    update
    delete
    是Active Record 自動為應用程式新增處理資料表所需要的方法。
    
4. 請問在 routes.rb 裡面加入以下程式碼會產生出哪一些 url？ (提示：在 browser 輸入http://localhost:3000/rails/info/routes)

resources :users

    order_path
    newer_order_path
    edit_order_path
    root_path
    user_hello_path
    new_user_path
    edit_user_path

5. 請解釋 model 檔案和 migration 檔案的差別
    model 對應資料庫裡面的資料表
    migration 是用來更改資料庫欄位現有的狀態

6. 若今天發現一個 migration 檔寫錯，請問我應該用什麼指令回復到上一個版本的 migration?
rake db:rollback
會取消上次的 change 操作，或是執行 down 方法，來回滾上一次遷移。

7. 假設今天
        我要在資料庫裡產出一個叫 group 的資料表
        裡面包括的欄位名稱和相對應的資料型別是： name (string), description (text), members (integer)
        請寫出一個能產生出以上需求的 migration 檔

rails g  migration add_group_table

class AddGroupTAble < ActiveRecord::Migration
  def change
    create_table :group do |t|
        t.string :name
        t.text :description
        t.integer :member

      t.timestamps null: false
    end
  end
end

再跑一遍rake db:migrate
否則瀏覽器會顯示為pending migration



8. 請解釋什麼是 ActiveRecord?

    Active Record 是 MVC 的 M（Model），表現商業邏輯與資料的層級。
    Active Record 負責新增與操作需要持久存在資料庫裡的資料。Active Record 本身是物件關聯映射（Object Relational Mapping）系統的描述，以 Active Record 模式實作。
    像是一個翻譯器 負責翻譯ruby and SQL語言
    可以說是rails的ORM