
# 黨不能沒有柱姐!
# 檔不能沒有註解!
# 在程式碼前面的井號就是註解

123 # 前面是123

# Windows若顯示中文異常請執行以下執令
# abc <- "中文"
# abc
# Sys.setlocale(category = "LC_ALL", locale = "cht")
# Sys.getlocale()


# 加減乘除的練習
# 井號(#)是註解不會執行
# ===================

123+456

123-456

123*456

123/456

# ===================

#丟骰子dice,丟1次
# : 冒號可以快速產生向量
# 例 1:6 意指 1 2 3 4 5 6 
sample(1:6,1)

#丟骰子dice,丟2次
sample(1:6,2)

#丟骰子dice,丟3次
sample(1:6,3)

# ===================

#標準常態機率抽樣 (平均數=0,標準差=1)

# 產生100個隨機抽樣變數
rnorm(100)
# 產生299個隨機抽樣變數
rnorm(299)
# 產生999個隨機抽樣變數
rnorm(999)

# ===================
# 查詢有那些機率分配
?distribution

#如何把資料存起來?
# 觀察一下x的變化
x <- 123+456
x

x <- 123-456
x

x <- 123*456
x

x <- 123/456  
x

# 繪製直方圖
# 直方圖(次數分配圖)
# Histogram

w1 <- rnorm(10)    #產生10個常態機率隨機變數
w1plot <- hist(w1) #繪製直方圖將圖形存到變數中
plot(w1plot)  #顯示圖形

w2 <- rnorm(100)   #產生100個常態機率隨機變數
w2plot <- hist(w2) #繪製直方圖將圖形存到變數中
plot(w2plot)  #顯示圖形

w3 <- rnorm(999)   #產生999個常態機率隨機變數
w3plot <- hist(w3) #繪製直方圖將圖形存到變數中
plot(w3plot)  #顯示圖形


#套件安裝
# 請試著自行安裝套件 cowsay
install.packages("cowsay")

# 以下套件電腦教室已安裝完成
# 學員課後使用自己筆電時，把註解去除即可安裝
# 以下套件因為安裝時需時較久，所以事先請助教協助安裝完成
#install.packages("data.table")  #套件用途 ETL & 快速讀取
#install.packages("dplyr") #套件用途 ETL
#install.packages("readxl")     #套件用途 讀取EXCEL格式
#install.packages("openxlsx")   #套件用途 輸出EXCCL格式
#install.packages("lubridate")  #套件用途 時間格式處理


# 如何查詢套件用途?
?cowsay # 此套件功能較簡單，所以沒有專屬文件檔
?data.table
?dplyr
?readxl # 此套件功能較簡單，所以沒有專屬文件檔
?lubridate
# 或
help(cowsay) # 此套件功能較簡單，所以沒有專屬文件檔
help(data.table)
help(dplyr)
help(readxl)# 此套件功能較簡單，所以沒有專屬文件檔
help(lubridate)

#
library("cowsay")
say("R 超好玩 deR!")

#
# 試試看使用不同的參數
# 你發現了什麼？
say("R 超好玩 deR!","cow")
say("R 超好玩 deR!","smallcat")
say("R 超好玩 deR!","ghost")
# 觀察一下你看到了什麼
# 想一想，為什麼要使用參數呢?
# 想一想，如果沒有參數的話，會怎麼樣?

# 數字
price <- 699 
ice <- "紅豆"

# Atomic Vector

# 假設你是一個冰店的老闆
# 販賣以下三種冰品
ice <-  c("紅豆","巧克力","香草")
# 價格分格為
price <- c(30,35,20)
# 銷售分別為
sale_N <-   c(2,7,6)

# 這種一個變數中存著不只一個數字，就是向量
# 注意，向量中只能存同種型態的資料
# 方法一
30*2+35*7+20*6

# 方法二
# 計算營業額
# 第一步 算出 30*2  35*7 20*6
price*sale_N 
# 計算總營業額，使用sum 加總
sum(price*sale_N)

# 多了一個產品(新增芒果冰品的種類進行銷售)
ice <-  c("紅豆","巧克力","香草","芒果")
price <- c(30,35,20,79)
sale_N <-  c(2,7,6,9)

# 方法一
30*2+35*7+20*6+79*9

# 方法二 
# 計算營業額
price*sales 
# 計算總營業額
sum(price*sale_N)

# 建立你的第一個data.frame
sale_info <- data.frame(
  ice  ,
  price ,  
  sale_N  , stringsAsFactors = FALSE)
# 確認是否建立成功
sale_info
 
# data.frame 基本操作
# 資訊抽取

# 列出第1組向量
sale_info[1]
# 列出第2組向量
sale_info[2]
# 列出第3組向量
sale_info[3]

# 依照 data.frame[ row , col ]型式
# 列出第1個row,第2個col的資料
sale_info[1,2]
# 列出所有row,第2-3個col的資料
sale_info[,2:3]

# 方法一 傳統data.frame方式
#所有的銷售資料
sale_info
#”香草”的所有資料
sale_info[3,] 
sale_info[ sale_info$ice == "香草" ]
#價格大於28元的冰品名稱與價格資訊
sale_info[ sale_info$price >28 , c("price","ice") ]

# 方法二 dplyr 初體驗
# 請先載入dplyr
library(dplyr)
# filter 顧名思義就是"過濾"
filter(sale_info, ice == "紅豆")
filter(sale_info, price > 70)
filter(sale_info,price >= 35 )

# select 欄位選擇
select( sale_info , ice)
select( sale_info , price)
select( sale_info ,ice,sale_N)

# 欄位選擇也可以用數字來表示
# 選取第1-2個col
select(sale_info , 1,2 ) 
# select(sale_info , c(1,2) ) 等於 select(sale_info , 1,2 ) 

# 將欄位依第3個col、第1個col、第2個col顯示
select(sale_info , c(3,1,2) )


# 所有的銷售資料
sale_info
# 香草的所有資料
filter( sale_info , sale_info$ice == "香草")
# 價格大於28元的冰品名稱與價格資訊
more28 <- filter( sale_info , price > 28)
select( more28, ice,price)

# dplyr 進化型
sale_info  %>% filter( price > 28)  %>% select( ice , price)

# 備註，你可以這樣試試看
# step1
sale_info   
# step2
sale_info  %>% filter( price > 28)
# step3
sale_info  %>% filter( price > 28)  %>% select( ice , price)

 
# 小測驗
# 在還沒有執行前，你是否能猜到以下的程式碼會得到什麼結果?
sale_info %>% filter( price >= 70)  %>% select(ice)


# pipeline 介紹
# 試試看，如果不用pipeline寫法?
# case 1
111:999 %>% sqrt
# case 2
1:20 %>% sqrt %>% sum
# case 3
1:20 %>% sqrt %>% round %>% log10 %>% sample(size=5) %>% sum

# 星克巴範例
# 載入所需package
library(data.table)
library(dplyr)
library(ggplot2)
# 設定工作目錄位置
# setwd("/Users/ID/Desktop/R_EDA_by_KA_201609/")
# 可使用講義中介紹的GUI操作方式

# windows預設的中文編碼不是utf8
# windows使用者請執行以下指令
star_01_menu <- fread("01_star/01_big5/star_01_menu.csv",
                      data.table = FALSE)
star_02_store <- fread("01_star/01_big5/star_02_store.csv",
                       data.table = FALSE)

# mac 與 linux 使用者請執行以下指令
star_01_menu <- fread("01_star/02_utf8/star_01_menu.csv",
                      data.table = FALSE)
star_02_store <- fread("01_star/02_utf8/star_02_store.csv",
                       data.table = FALSE)

# 試試看你的中文顯示是否正常呢?
star_01_menu
star_02_store
 


# 價格高於170元的飲料編號
star_01_menu %>% filter(price > 170) %>% select( product_id)

# 實際銷售的飲料口味有幾種(distinct)
star_01_menu %>% select(product) %>% distinct %>% nrow
# 備註 distinct 可移除重覆的資料

# 依咖啡因排序?
star_01_menu %>% arrange(Caffeine)
# 預設是升序排列，所以取前6名會是?
star_01_menu %>% arrange(Caffeine) %>% head
# 預設是升序排列，所以取最後6名會是?
star_01_menu %>% arrange(Caffeine) %>% tail
# 依咖啡因降序排列 desc
star_01_menu %>% arrange(Caffeine %>% desc)

# 將飲品中咖啡因含量區分為高(H)、低(L)
# 繪製咖啡因的直方圖(#補充教材)
# ggplot 預設接收data.frame做為資料來源
star_01_menu %>% select(Caffeine) %>% 
  ggplot(aes(Caffeine)) + geom_histogram()
# 你發現了什麼
#將飲品中咖啡因含量區分為高(H)低(L)

#繪製咖啡因的直方圖(#補充教材)

# 定義 高咖啡因 >=200 , 低咖啡因就是 < 200 
star_01_menu2 <- star_01_menu %>%  
  mutate(Caffeine_Level = if_else(Caffeine >= 200,"H","L"))

#平均價格(mean)、最高價格(max)、數量(n)
star_01_menu2 %>% group_by(Caffeine_Level) %>% 
  summarise(avg_price = mean(price),max_price=max(price), cnt=n())


# 星巴克的總店數
star_02_store %>% nrow

# 那些區域(zip_code),開設分店高於高於10家
star_02_store %>% group_by(zip_code) %>% 
  summarise(my_count = n()) %>% arrange( my_count) %>% 
  filter(my_count > 10)

# 過濾出以下地址
# 電話以"02-"開頭
star_02_store %>%   filter( star_phone %like% "02-")

# 地址中含有”忠孝” ( %like% )
star_02_store  %>% filter( star_address %like% "忠孝") %>% select(star_address)

# 地址中含有"忠孝"或"中正"
star_02_store  %>% filter( star_address %like% "忠孝" |star_address %like% "中正" )%>% select(star_address)

# 地址中含有"忠孝" 和 "中正"
star_02_store  %>% filter( star_address %like% "忠孝" & star_address %like% "中正" )%>% select(star_address)



# 讀入資料
read.csv("05_homework_pokemon/pokemon721.csv")
library(readxl)
read.xlsx("05_homework_pokemon/pokemon721.xlsx")
library(data.table)
fread("05_homework_pokemon/pokemon721.csv")

# 讀進來後，還是要存起來
pokemon <- read.csv("05_homework_pokemon/pokemon721.csv")
pokemon <- read.xlsx("05_homework_pokemon/pokemon721.xlsx")
pokemon <- fread("05_homework_pokemon/pokemon721.csv")

# 資料輸出
# 系統內建
write.csv(pokemon,"test1.csv",row.names = FALSE)

# 輸出excel格式
library(openxlsx)
write.xlsx(pokemon,"test1.xlsx" )


##############################

# Workshop 2
# 請載入以下套件
library(data.table)
library(dplyr)
library(ggplot2)
library(tidyr)
library(lubridate)
library(openxlsx)
library(readxl)
library(readr)

# windows 系統請執行以下程式碼
star_03_order_main <- fread("01_star/01_big5/star_03_order_main.csv",data.table = FALSE)
star_04_order_detail <- fread("01_star/01_big5/star_04_order_detail.csv",data.table = FALSE)

# mac 系統請執行以下程式碼
star_03_order_main <- fread("01_star/02_utf8/star_03_order_main.csv",data.table = FALSE)
star_04_order_detail <- fread("01_star/02_utf8/star_04_order_detail.csv",data.table = FALSE)

# 左連結範例1
star_join_1 <- left_join( star_03_order_main ,star_02_store ,by = "store_id")  
                                                                       
                                                                       # 左連結範例2
star_join_2 <- left_join( star_03_order_main , star_04_order_detail , by = "order_id")  %>% left_join(   star_01_menu , by = "product_id")
                                                                      # 傳統寫法(非pipeline寫法-巢狀函數)
star_join_2_old <- left_join(left_join( star_03_order_main , star_04_order_detail , by = "order_id"),star_01_menu, by = "product_id")

# 左連結，將4個table全部連結
star_join_3 <- 
left_join(star_03_order_main,star_04_order_detail,by="order_id") %>% left_join(star_01_menu,by="product_id") %>% left_join(star_02_store,by ="store_id")  

# 傳統寫法(非pipeline寫法-巢狀函數)
star_join_3_old <- 
left_join(left_join(left_join( star_03_order_main , star_04_order_detail , by = "order_id"),star_01_menu, by = "product_id") , star_02_store , by = "store_id")                                                    


?

# 台北市消費的總營業額
star_join_3 %>% filter(star_address %like% "台北") %>% 
  summarise(sum(price*sale_n))

# 最高的是那家店
star_join_3 %>% filter(star_address %like% "台北") %>% group_by(star_store) %>% summarise( total_sales = sum(price*sale_n)) %>% arrange(total_sales %>% desc) %>% head(1) %>% select(1)

# 各區域(zip_code)的總營業額
star_join_3  %>% group_by(zip_code) %>% summarise( total_sales = sum(price*sale_n))  %>% arrange(total_sales %>% desc)

# 最低的是那個區域?
star_join_3  %>% group_by(zip_code) %>% summarise( total_sales = sum(price*sale_n))  %>% arrange(total_sales %>% desc) %>% tail(1) %>% select(1)


# tidyr

# windows 系統請執行以下程式碼
mrt  <- read.csv("02_MRT/01_big5/mrt_201605.csv")

# mac 系統請執行以下程式碼
mrt  <-  read.csv("02_MRT/02_utf8/mrt_201605.csv")


# windows  
mrt   %>% filter(.$松山機場 > 20000) 

# MAC/ Linux  
mrt %>%   filter( 松山機場 > 20000)

# tidy your data  
tidy_mrt <- gather(mrt,site,people, -DATE ) 

tidy_mrt %>% filter(people > 20000 )  

tidy_mrt %>% filter(people > 20000) %>% group_by(site) %>% summarise(cnt = n(),Total = sum(people)) %>% arrange(desc(Total))  

# 轉換回原本非 tidy data
spread(tidy_mrt , site , people)

# separate
# 拆分字串
tidy_mrt  %>% separate(DATE,c("Year","Month","Day"),sep="/",convert = TRUE)
  
# 車站名稱中有"車"
tidy_mrt %>% filter( site %like% '車')

# 車站名稱中有"貓"
tidy_mrt %>% filter( site %like% '貓')
                                                                      # 週報示範
today()

# 時間的計算
# 今天
today()
                                                                      # 明天
today()+1

# 後天
today()+2
# 昨天
today()-1
# 前天
today()-2

# ymd 快速轉換文字格式為日期格式
"2016-09-04" %>% str
ymd("2016-09-04") %>% str

# wday 求算星期幾 星期日=1 星期1=2 …

ymd("2016-09-04") %>% wday()
ymd("2016-09-05") %>% wday()
ymd("2016-09-06") %>% wday()

# 本週開始
this_week = today() - wday( today()) + 1  -2

# 本週最後一天
this_week_end = this_week +6

# 上一週第一天
last_week = this_week - 7

# 上一週最後一天
last_week_end = last_week + 6 

# 月報
# 找出本月第1天
this_month_start = floor_date( today() , "month") 
this_month_start
# 找出本月最後1天
this_month_end = ceiling_date( today() , "month") - 1
this_month_end
# 找出上個月第1天
this_month_start  %m-%  months(1)
# 找出上個月最後1天
this_month_end %m-%  months(1)
                                                                      
# 一開開始是星期五
today()-wday(today())+ 1 +
  if_else( wday(today())>= 6 , 5 ,  -2 )

# 補充教材
# 如果要輸出好幾個SHEET的狀況
l <- list("more50" = more50, "more60" = more60)
write.xlsx(l, "multi_sheet.xlsx")

# 多筆資料以多張sheet輸出成EXCEL
library(openxlsx)
# windows 有時需要調整ZIP所在目錄
# ubuntu 有時也需要
# MAC不用設定
Sys.setenv(R_ZIPCMD= "C:/Rtools/bin/zip")
 