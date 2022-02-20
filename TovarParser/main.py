import requests
from bs4 import BeautifulSoup
import re


def scrap_page(url : str):
    res = requests.get(url)
    titles = []
    prices = []
    urls = []
    countries = []

    if res.status_code == 200:
        soup = BeautifulSoup(res.text, features="html.parser")
        divs = soup.find_all('div', class_ = 'goods-tile__inner')
        for div in divs:
            if div.text.startswith(' −'):
                try:
                    titles.append(div.text[5: div.text.index('(')].lstrip())
                except:
                    print('Ошибка названия - ' + div.text) 
                    titles.append('')   
            else:
                try:
                    titles.append(div.text[0: div.text.index('(')].lstrip())
                except:
                    print('Ошибка названия - ' + div.text)
            try:
                prices.append(re.findall('(\d*.\d*) ₴', div.text)[0].strip().replace('\xa0', ''))
            except:
                print('Ошибка цены')  
            try:  
                good_id = div.get('data-goods-id')
                img_res = requests.get(f'https://rozetka.com.ua/{good_id}/p{good_id}/')
                item_res = requests.get(f'https://rozetka.com.ua/ua/{good_id}/p{good_id}/characteristics/')
            except:
                print('Ошибка data-goods-id')    
            if img_res.status_code == 200:
                try:
                    urls.append(re.findall('src="https://content\d*.rozetka.com.ua/goods/images/big/\d*...."',img_res.text)[0][5:-1].replace('big', 'big_tile'))
                except:
                    print('Ошибка фото')
                    urls.append('')
            else:
                urls.append('')
            if item_res.status_code == 200:
                try:
                    countries.append(re.findall('<a href="/[^<>!-]*./strana-proizvoditelj-tovara-\d*=\d*/" class="ng-star-inserted">(\w*)</a>',item_res.text)[0])
                except:
                    print('Ошибка страны')
                    countries.append('Китай')    
            else:
                countries.append('')
            try:
                print(div.text[0: div.text.index('(')].lstrip())
            except:
                print('Ошибка вывода')    
    return titles, prices, urls, countries


def make_sql(data: tuple, dep: int, mesur: str):
    departs = {
        1 : 'Лако-фарби',
        2 : 'Меблі',
        3 : 'Дитячі іграшки',
        4 : 'Транспорт',
        5 : 'Посуд',
        6 : 'Битова хімія',
        7 : 'Сувеніри',
        8 : 'Товари для саду',
        9 : 'Дрібна електроніка',
    }
    with open('Товар_' + departs[dep] + '.sql', 'w', encoding='utf-8') as file:
        file.write(f'insert into Tovar(Tov_Name, Tov_Price, Tov_Depart, Tov_Measuring, Tov_Photo, Tov_CountryMade) values\n')
        for i in range(len(data[0])):
            file.write(f"  ('{data[0][i]}', {str(data[1][i]) + '.00'}, {dep}, {mesur}, '{data[2][i]}', '{data[3][i]}'),\n")




#make_sql(scrap_page('https://rozetka.com.ua/ua/lak/c4626489/'), 1, 1)
make_sql(scrap_page('https://rozetka.com.ua/ua/kraska/c4626429/'), 1, 1)

#make_sql(scrap_page('https://rozetka.com.ua/ua/detskie-igrushki/c4265805/'), 3, 1)


        
