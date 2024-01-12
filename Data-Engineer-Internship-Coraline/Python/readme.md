# Python Assignment
## Requirement
local machine ที่ใช้ run จะต้อง insall package **requests** ซึ่งใช้สำหรับการติดต่อกับ API หากยังไม่ได้ทำการติดตั้งสามารถ run คำสั่งด้านล่างเพื่อติดตั้งได้
```
pip install requests
```

## How to execute program
ใน folder จะมีทั้งไฟล์ที่เป็นแบบ **.py** และ **.ipynb** สามารถ run ได้ทั้งแบบ notebook บน jupyter และแบบที่เป็น script บน ide เช่น vscode

1. หากใช้ไฟล์ **.py** ให้ทำการ run คำสั่งด้านล่างลงใน terminal
    ```
    python random_user_gender_prediction.py
    ```
2. หากใช้ไฟล์ **.ipynb** สามารถเปิด notebook บน jupyter แล้วกด run all cell ได้เลย

## Design pattern & Solid Principle
- เนื่องจาก task ที่ให้มาค่อนข้างตรงไปตรงมาและเป็นขั้นเป็นตอน ดังนั้น pattern จึงเรียบง่าย 
- ใช้ concept จาก OOP นั่นคือออกแบบ method ให้ทำหน้าที่แค่อย่างเดียว เช่น method **get_data()** ก็จะทำหน้าที่แค่ fetch ข้อมูลจาก api แล้ว return กลับไปเพียงอย่างเดียว 
- ตั้งชื่อตัวแปร และฟังก์ชันให้สื่อความหมาย
- design ฟังก์ชันให้เป็นแบบ dynamic สามารถไม่ สามารถเปลี่ยนแปลงค่าได้ง่ายไม่ใส่ค่าเข้าไปในฟังก์ชันตรง ๆ แต่รับเป็น parameter เข้ามาเพื่อเพิ่ม flexibility และทำให้ maintain ต่อได้ง่าย

## Function explanation
### function
1. ***get_data()*** เป็นฟังก์ชันสำหรับ fetch ข้อมูลจาก API แล้ว return กลับไปใน JSON format ซึ่งมี parameter ดังนี้
    
    1.1 **url** คือ String url ของ API ที่ต้องการดึงข้อมูล
    
    1.2 **params** คือ parameter ที่จะถูกส่งเข้าไปให้กับ API
    
    1.3 **headers** คือ header ของ requests ที่จะถูกส่งต่อไปให้กับ API

2. ***generate_random_user*** เป็นฟังก์ชันที่จะ random ข้อมูลของ user ตามจำนวนที่กำหนด และจะ return ค่าออกมาในรูปแบบ list ของ dictionaries  ซึ่งมี parameter ดังนี้

    2.1 **num** คือจำนวนของ user ที่ต้องการ random

3. ***generate_prediction*** เป็นฟังก์ชันที่จะส่ง name ที่รับเข้ามาไปยัง API เพื่อทำนายเพศจากชื่อนั้น แล้ว return ค่ากลับมา 2 ค่านั่นคือ **gender(predict)** (เพศที่ predict) และ **probability** (ความน่าจะเป็นที่จะตรงกับเพศที่ทำนาย) ซึ่งฟังก์ชันจะมี parameter ดังนี้

    3.1 **name** คือชื่อที่ต้องการทำนายเพศ
