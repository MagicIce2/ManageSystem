/*
 * 日期数据联动
 */
function addOption()
            {
                for (var i=0; i<10; i++)
                {
                    document.getElementById("year").options[i] = new Option(1995+i, 1995+i);
                }

                for (var i=1; i<=12; i++)
                {
                    document.getElementById("month").options[i-1] = new Option(i, i);
                    document.getElementById("month").options[0].selected = true;
                }
            }
            function changeOption()
            {
                var yearIndex = document.getElementById("year").selectedIndex;
                var year = document.getElementById("year").options[yearIndex].value;
                var monthIndex = document.getElementById("month").selectedIndex;
                var month = document.getElementById("month").options[monthIndex].value;
                var isLeap = ((year % 4 == 0 && year % 100 != 0) || (year % 100 == 0 && year % 400 == 0));
                if (isLeap && (month == 2))    
                {
                    for (var i=1; i<=29; i++)
                    {
                        document.getElementById("day").options[29] = null;
                        document.getElementById("day").options[30] = null;
                        document.getElementById("day").options[i-1] = new Option(i, i);
                    }
                }
                if (!isLeap && (month == 2))
                {
                    for (var i=1; i<=28; i++)
                    {
                        document.getElementById("day").options[28] = null;
                        document.getElementById("day").options[29] = null;
                        document.getElementById("day").options[30] = null;
                        document.getElementById("day").options[i-1] = new Option(i, i);
                    }
                }
                if (month == 1 || month == 3 || month == 5 || month == 7 || month == 8 || month == 10 || month == 12)
                {
                    for (var i=1; i<=31; i++)
                    {
                        document.getElementById("day").options[i-1] = new Option(i, i);
                    }
                }
                if (month == 4 || month == 6 || month == 9 || month == 11)    //判断是否为非2月
                {
                    for (var i=1; i<=30; i++)
                    {
                        document.getElementById("day").options[30] = null;
                        document.getElementById("day").options[i-1] = new Option(i, i);
                    }
                }
            }
            
 /*
  * 学院和班级数据联动
  * */           
            var arr_da = ["信息工程学院","园艺学院","财经学院","茶学院","工商管理学院","规划与设计学院","林学院","旅游管理学院",
							"牧医工程学院","农学院","生物与制药工程学院","食品学院","水产学院","外国语学院","体育教学部","文学艺术教学部"
			];
            var arr_xiao = [
                        ["网络工程(网络软件开发)2018-1班","网络工程(网络软件开发)2018-2班","网络工程(网络软件开发)2018-3班",
						 "网络工程2018-1班","网络工程2018-2班","网络工程2018-3班","计算机应用技术2018-1班","计算机应用技术2018-2班","计算机应用技术2018-3班",
						 "数字媒体技术2018-1班","数字媒体技术2018-2班","物联网工程2018-1班","物联网工程2018-2班","网络工程(专升本)"],
                        ['园艺技术18-1(普专)','园艺技术18-2(对专)','园艺技术18-3(单专)','园艺技术18-4(单专)','园艺2018(普本)','园艺2018(对本)',
						'园艺(观赏园艺)18(普本)','园艺(观赏园艺)18(对本)','园艺(专升本)2018','园艺(设施园艺)2018(普本)','设施农业科学与工程2018',
						'园艺(设施园艺)2018(对本)'],
                        ['财务管理(普本)2018-1','财务管理(普本)2018-2','财务管理(普本)2018-3','财务管理(普本)2018-4','财务管理(专升本)2018-1',
						'财务管理(专升本)2018-2','会计2018-1','会计2018-2','会计2018-3','会计2018-4','审计学(普本)2018-1','审计学(普本)2018-2'],
                        ['茶学2018-1','茶学2018-2','茶学(茶文化与营销)2018','茶艺与茶叶营销2018','茶学(对本)2018','茶学(专升本)2018',
						'茶艺与茶叶营销(对专)2018'],
                        ['物流管理2018-1','物流管理2018-2','物流管理2018-3','物流管理2018-4','市场营销(专)2018-1','市场营销(专)2018-2',
						'电子商务(专)2018-1','电子商务(专)2018-2','电子商务(本)2018-1','电子商务(本)2018-2','物流管理(专升本)2018','市场营销(本)2018-1',
						'市场营销(本)2018-2'],
                        ['城乡规划18-1','城乡规划18-2','城乡规划(景观设计)18-1','城乡规划(景观设计)18-2','城乡规划(专升本)18','风景园林18-1',
						'风景园林18-2','广告设计与制作18-1','广告设计与制作18-2','广告设计与制作18-3','环境艺术设计18-1','环境艺术设计18-2',
						'环境艺术设计18-3','环境艺术设计18-4','环境设计18-1','环境设计18-2','环境设计18-3','家居艺术设计18-1'],
                        ['林学2018-1(普本)','林学2018-2(对本)','林学(经济林方向)2018','园林2018-1(普本)','园林(园林工程与管理)2018',
						'林学(专升本)2018','园林2018-2(对本)','园林(专升本)2018'],
                        ['旅游管理2018-1(普专)','酒店管理2018-1(普专)','酒店管理2018-2(单专)','酒店管理2018-1(普本)','酒店管理2018-2(普本)',
						'酒店管理2018-3(对本)','酒店管理2018-3(对专)','酒店管理(专升本)2018','旅游管理2018-1(普本)','旅游管理2018-2(普本)',
						'旅游管理(空中乘务)2018','旅游管理(高铁乘务)2018','旅游管理2018-2(对专)'],
						['畜牧兽医2018-1','畜牧兽医2018-2','畜牧兽医2018-3','动物医学2018-1','动物医学2018-2','动物医学(专升本)2018-1','动物医学(专升本)2018-2',
						'动物科学2018-1(普本)','动物科学2018-2(对本)','动物医学(宠物医学)2018-1','动物医学(宠物医学)2018-2','动物医学(宠物医学)2018-3',
						'动物科学(专升本)2018'],
						['种子生产与经营2018','植物保护2018-1','植物保护2018-2(对本)','种子科学与工程2018-1','种子科学与工程2018-2(对本)','种子科学与工程(药用植物)2018-1',
						'中药生产与加工2018-1','中药生产与加工2018-2','农学2018','植物保护(航空植保技术)2018-1','种子科学与工程(药用植物)2018-2(对本)',
						'植物保护(专升本)2018','植物保护(航空植保技术)2018-2(对本)','植物保护与检疫技术(对专)'],
						['中药制药技术2018-1','中药制药技术2018-2','生物制药技术2018-1','生物制药技术2018-2','制药工程2018-1','制药工程2018-2','制药工程2018-3',
						'制药工程(中药制剂工程)2018-1','制药工程(中药制剂工程)2018-2','制药工程(生物药剂工程)2018-1','制药工程(生物药剂工程)2018-2',
						],
						['食品科学与工程2018-1','食品科学与工程2018-2','食品科学与工程(专升本)2018-1','食品营养与检测2018','烹调工艺与营养2018-1',
						'烹调工艺与营养2018-2','食品质量与安全2018-1','食品质量与安全2018-2','食品科学与工程(发酵技术)2018','烹调工艺与营养2018-3(对口)',
						'食品科学与工程(专升本)2018-2'],
						['水产养殖学(普本)2018-1','水产养殖学(普本)2018-2','水产养殖学(对本)2018-3','水族科学与技术(普本)2018-1','水族科学与技术(对本)2018-2'],
						['旅游英语2018-1','旅游英语2018-2','应用英语2018-1','应用英语2018-2','商务英语2018-1','商务英语2018-2','商务英语2018-3',
						'商务英语2018-4','商务英语(专升本)2018','翻译2018-1','翻译2018-2'],
						['休闲体育2018'],
						['文秘2018']
            ];
 
function test() {
    var oForm = document.getElementById('form1');
    var oda_da = document.getElementById('da');
     var oxiao_xiao = document.getElementById('xiao');
/*     
    var oda_da = oForm.children[2];
    var oyyxm_yyxm = oForm.children[3];
*/
 
 
    // 添加点击 onchange 事件
    oda_da.onchange = function() {
        var _this = this.selectedIndex;
        // 默认进来高度清零
        oxiao_xiao.length = 0;
        // 指定下拉的高度
        initxianz(_this);
    };
 
    // 初始化下拉列表
    init();
    // init select
    function init(){
        var index = 0;
        // 指定下拉的高度
        oda_da.length = arr_da.length;
 
        // 循环数组, 把内容写到下拉列表中去
        for( var i = 0; i < arr_da.length; i++ ){
            oda_da.options[i].text = arr_da[i];
            oda_da.options[i].value = arr_da[i];
        }
 
        // 指定默认索引号
        oda_da.selectedIndex = index;
        // 指定下拉的高度
        initxianz(index);
    }
 
    //下拉内容高度
    function initxianz(index){
        // 指定下拉的高度
        oxiao_xiao.length = arr_xiao[index].length;
 
        // 循环数组, 把内容写到下拉列表中去
        for( var i = 0; i < arr_xiao[index].length; i++ ){
            oxiao_xiao.options[i].text = arr_xiao[index][i];
            oxiao_xiao.options[i].value = arr_xiao[index][i];
        }
    }
 
}; 

