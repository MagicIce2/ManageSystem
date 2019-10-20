import pymysql
import xlwt

host = '127.0.0.1'
user = 'root'
password = 'windowmysql123'
database = 'student'

db = pymysql.connect(host,user,password,database,charset='utf8')
cursor = db.cursor()
sql = "select * from stuinfo"
cursor.execute(sql)
results = cursor.fetchall()

filename = 'text.xlsx'
file = xlwt.Workbook()
table = file.add_sheet(u'sheet1')

DataTitle = ['序号','学号','院系','班级','姓名','手机号','性别','QQ','密码','出生日期','是否已缴费','自我介绍']

#results.insert(0,DataTitle)
for k,d in enumerate(DataTitle):
    table.write(0,k,d)

for i in range(1,len(results)):
    for j in range(0,len(results[i])):
        table.write(i,j,results[i][j])

file.save('Data.xls')
