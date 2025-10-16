[TOC]

#  介绍

中长期预测模型分为参数计算和预测模型两部分。

预测模型主要功能如下：

1. 根据现有人口结构热、历史人口变动信息以及相关统计信息预测未来年度人口数目及结构；
2. 根据人口预测，预测医保筹资、费用数额、变化等信息；
3. 基于用户需求，提供退休年龄调整以及目标预测人群功能；

参数计算主要为预测模型计算提供相关参数，用户可自行输入准备好的参数，或用模型附带的参数模块计算。

# 基础操作

用户可通过以下步骤运行中长期模型的CSV版本（即输入输出大部分为.csv文件）：

1. 登陆堡垒机（IP：30.16.27.205）；
   
2. 创建空文件夹，例如：D:\test；

3. 进入文件夹，并克隆代码库: ``git clone -b master "C:\Users\SHENZHENGHAO065\Projects\LT_predi_model" .\``；

4. 准备相关数据文件，参考[输入输出](#输入输出)；
   
5. 通过<font color=blue>Control.xlsm</font>配置运行策略，详细设置请参考[后续章节](#运行策略)；
   
6. 运行VBA产出策略和SQL文件；
   
7. 运行<font color=blue>Param_Calc.py</font>文件计算参数，运行<font color=blue>Process.py</font>文件计算模型；
   
8. 运行结果会根据第6步存放于相关路径中。

# 运行策略

通过配置<font color=blue>Control.xlsm</font>中的参数，并生成相关文件可实现选择运行模型、预测年限、输入输出、相关SQL的生成以及补充输入参数的功能。

此处要注意的是，VBA主要通过搜索[Param]表中关键字（表中标<span style="background-color: green;color: black">绿底黑字</span>，下图中圈红）来定位信息，并逐行读取直至空行。故表格位置可随意变化，但<font color=red>关键字不能重复出现</font>。界面如下图所示:

<img src="C:\Users\SHENZHENGHAO065\Projects\LT_predi_model\pic\Control.PNG">

配置完相关参数后，<span style="color:red">用户需要点击[Create Config Files]</span>按键来运行[output_param_config]代码以生成相关运行配置文件。

下面依次介绍各类参数以及SQL生成过程.

## 基本参数

基本参数以<span style="background-color: green;color: black">Model</span>作为搜索关键字，生成后输出至当前目录下的Param_Calc.config文件。

基本参数主要罗列[运行参数](#opparam)、[输入输出参数](#ioparam)以及[配置参数](#separam)：

<a id="opparam"></a>
<b>运行参数</b>：

|参数名|参数释义|示例|
|-|-|-|
|Model|需要运行的模型代号（715或830）|830|
|Base_Year|<a id = "baseyear"></a>基础年度|2016|
|Proj_Period|需要预测的年度为{Base_Year+1}到{Base_Year+Proj_Period+1}|15|
|enable_ret_adj|退休年龄调整：1=enable; 0=disable|0|
|enable_trg_pop|目标人口数量：1=enable; 0=disable|0|

<a id="ioparam"></a>
<b>输入输出参数</b>：

<table>
   <tr>
      <td>分类</td>
      <td>参数名</td>
      <td>参数释义</td>
      <td>示例</td>
   </tr>
   <tr>
      <td rowspan="4">路径</td>
      <td>Param_Filepath</td>
      <td>计算参数时路径，程序从改路径读取数据、输出SQL以及结果</td>
      <td>.\Param830\</td>
   </tr>
   <tr>
      <td>Data_Path</td>
      <td>模型运行时数据读取路径</td>
      <td>.\data_830\</td>
   </tr>
   <tr>
      <td>Input_Path</td>
      <td>模型运行时用户输入读取路径</td>
      <td>.\UserInput_830\</td>
   </tr>
   <tr>
      <td>Res_Path</td>
      <td>模型运行结果路径，所有路径均为相对路径</td>
      <td>.\Res_830\</td>
   </tr>
   <tr>
      <td rowspan="15">表名</td>
      <td>Table_Insurand</td>
      <td>参保人员表（计算参数），替换<a href="#sqlinsurand">相应SQL</a>中<span style="color:#183691">'Table-Insurand'</span>字符</td>
      <td>changzhou_ybcb_revdata_100w</td>
   </tr>
   <tr>
      <td>Table_Claim</td>
      <td>理赔表（计算参数），替换<a href="#sqlclaim">相应SQL</a>中<span style="color:#183691">'Table-Claim'</span></td>
      <td>changzhou_ybclaimdata_100w</td>
   </tr>
   <tr>
      <td>TableMortality</td>
      <td>生命表（计算参数，模型）</td>
      <td>mortality.csv</td>
   </tr>
   <tr>
      <td>Tabler_rate</td>
      <td>退休率表（计算参数，模型）</td>
      <td>r_rate.csv</td>
   </tr>
   <tr>
      <td>Tablep_rate</td>
      <td>劳动参与率表（计算参数，模型）</td>
      <td>p_rate.csv</td>
   </tr>
   <tr>
      <td>Tableu_rate</td>
      <td>失业率表（计算参数，模型）</td>
      <td>u_rate.csv</td>
   </tr>
   <tr>
      <td>Tablec_rate</td>
      <td>变化率（参数计算时除以上述4个表中的率，模型运行时相反）</td>
      <td>c_rate.csv</td>
   </tr>
   <tr>
      <td>Table_Insurand_Base</td>
      <td>基础年度人口</td>
      <td>insurand.csv</td>
   </tr>
   <tr>
      <td>Table_Prem</td>
      <td>筹资率</td>
      <td>premium_rate.csv</td>
   </tr>
   <tr>
      <td>Table_Claim_rt</td>
      <td>报销费用率</td>
      <td>claim_rate.csv</td>
   </tr>
   <tr>
      <td>Table_Claim_ir</td>
      <td>报销费用增长率</td>
      <td>claim_ir_rate.csv</td>
   </tr>
   <tr>
      <td>Input_trg_pop</td>
      <td>目标人口输入</td>
      <td>ecnmcs_model_ppultin_parameter.csv</td>
   </tr>
   <tr>
      <td>Input_ret_adj</td>
      <td>退休年龄调整输入</td>
      <td>env_mead_fund_input_retire_age.csv</td>
   </tr>
   <tr>
      <td>Input_Prem</td>
      <td>筹资政策输入</td>
      <td>Prem_input.csv</td>
   </tr>
   <tr>
      <td>Input_Claim</td>
      <td>报销政策输入</td>
      <td>claim.csv</td>
   </tr>
</table>

<a id="separam"></a>
<b>配置参数</b>：

<table>
   <tr>
      <td>分类</td>
      <td>参数名</td>
      <td>参数释义</td>
      <td>示例</td>
   </tr>
   <tr>
      <td rowspan="4">人员类别</td>
      <td>MSexCode</td>
      <td>标记男性</td>
      <td>1</td>
   </tr>
   <tr>
      <td>FSexCode</td>
      <td>标记女性</td>
      <td>2</td>
   </tr>
   <tr>
      <td>WClassCode</td>
      <td>逗号分隔，标记在职</td>
      <td>W,w,本市在职,退休人员,外来人员</td>
   </tr>
   <tr>
      <td>RClassCode</td>
      <td>逗号分隔，标记退休</td>
      <td>R,r</td>
   </tr>
   <tr>
      <td rowspan="6"><a id="newborn"></a><a href="#nb_calc">新生儿</a></td>
      <td>BirthAgeST</td>
      <td>最小生育年龄</td>
      <td>15</td>
   </tr>
   <tr>  
      <td>BirthAgeED</td>
      <td>最大生育年龄</td>
      <td>49</td>
   </tr>
   <tr>  
      <td>BirthSexCode</td>
      <td>生育性别</td>
      <td>2</td>
   </tr>
   <tr>  
      <td>birth_rate</td>
      <td>生育率</td>
      <td>0.067</td>
   </tr>
   <tr>  
      <td>m_ratio</td>
      <td>新生儿男性比例</td>
      <td>0.48</td>
   </tr>
   <tr>  
      <td>newbornclass</td>
      <td>新生儿人口类型（以逗号分隔，全部分配到第一个匹配到的类型）</td>
      <td>2,未成年人</td>
   </tr>
</table>

## 补充参数

补充前端无法输入的历年社会平均工资以及人均可支配收入，分别以<span style="background-color: green;color: black">AVE_SALARY</span>以及<span style="background-color: green;color: black">AVE_INCOME</span>为关键字，倒入参数计算所需数据。

## SQL生成

参数计算需要从参保信息表（关键字REVDATA）和理赔信息表（关键字CLAIMDATA）中通过SQL提取相关数据，这里做成表格方便修改。

参保信息表主要提取参保人员人口结构及筹资信息。其基础SQL如下：

<a id = "sqlinsurand"></a>
```sql
select /*+parallel (16)*/ AREACODE,YEAR,SEX,AGE,
CLASS,
EXPOSUR,
'PARAMETERs'
from 'Table-Insurand'
group by AREACODE,YEAR,SEX,AGE,
CLASS
order by AREACODE,YEAR,SEX,AGE,
CLASS
```

理赔信息表主要提取理赔相关信息。其基础SQL如下：

<a id = "sqlclaim"></a>
```sql
select /*+parallel (16)*/ AREACODE,YEAR,SEX,AGE,
CLASS,
SVC_TYPE,
'PARAMETERs'
from 'Table-Claim'
group by AREACODE,YEAR,SEX,AGE,
CLASS,
SVC_TYPE
order by AREACODE,YEAR,SEX,AGE,
CLASS,
SVC_TYPE
```

相关参数以<span style="background-color: green;color: black">Insurand Key Param</span>以及<span style="background-color: green;color: black">Claim Key Param</span>作为搜索关键字，搜索到后逐行读取并替换基础SQL中的关键字段来组成最终抓取数据的查询语句。

具体步骤如下：

```flow
st=>start: 读取基础SQL

op1=>operation: 读取一行参数:
Name,
Column,
CASE_STR,
CASE_COL,
model

cond1=>condition: 运行的模型是否
包含在model中

cond2=>condition: Name字串是否包
含在基础SQL中

cond3=>condition: CASE_STR
参数是否有值

op2=>operation: 根据CASE_STR中字段+"_CASE"关键字
搜索参数表组装"CASE字段"

op3=>operation: 替换
被替换："CASE字段"
旧字段：TABLE_SPECIFIED_COL
新字段：CASE_COL中的参数替换

op4=>operation: 替换
被替换：Column参数中的字段
旧字段：CASE_STR中字段
新字段："CASE字段"

op5=>operation: 替换
被替换：Column参数中的字段
旧字段：CASE_STR中字段
新字段："CASE字段"

op6=>operation: 替换
被替换：基础SQL
旧字段：Name参数的字段
新字段：Column参数的字段
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（或经过"CASE字段"替换后）

op7=>operation: 添加至"PARAM字段"

cond4=>condition: 参数读取完毕;
基础SQL与
"PARAM字段"
组装完成

op9=>operation: 替换
被替换：组装完成的基础SQL
旧字段：“'PARAMETERs'”
新字段："PARAM字段"

ed=>end: 输出至Param_Filepath\Data.sql

st->op1->cond1(yes)->cond3(no)->cond2(yes,right)->op6->cond4(no)->op1
cond1(no)->op1
cond3(yes)->op2->op3->op4(right)->cond2(no)->op7->cond4(yes)->op9->ed
```

# 输入输出

## 参数计算

### 输入

1. 参保信息表：<a id = "insruand"></a>关键字"REVDATA"，精算标准表之一，位于数据库中。
2. 理赔信息表：关键字"CLAIMDATA"，同上。
3. 生命表：分性别，年龄的死亡率表，字段如下
   |参数名|参数释义|
   |-|-|
   |SEX|性别：1=男；2=女|
   |AGE|年龄：范围0~119岁|
   |qx|<a id = "mortality"></a>死亡率|
4. 转化率参数表
   <a id = "chgrate"></a>
   |参数名|参数释义|
   |-|-|
   |SEX|性别：1=男；2=女|
   |AGE|年龄：范围0~119岁|
   |CLASS|人员类别|
   |p_rate|<a id = "p_rate"></a>劳动参与率(participation rate)|
   |r_rate|<a id = "r_rate"></a>退休率(retirement rate)|
   |u_rate|<a id = "u_rate"></a>失业率(unemployment rate)|

### 输出

#### 中间结果

为数据与验算需求，输出中间结果表格。

分为参保表和理赔表，每张表的每个参数均为“NAME_YEAR”，其中“NAME”为参数名称，“YEAR”为读取到的年度（根据具体数据）：

##### 参保表

1. 715：
   |参数名|参数释义|
   |-|-|
   |SEX|性别：1=男；2=女|
   |AGE|年龄：范围0~119岁|
   |CLASS|人员类别|
   |EXPOSUR_YEAR|人口数量|
   |ACCT_TOT_YEAR|个账缴费占社平工资/人均可支配收入的比例|
   |FUND_TOT_YEAR|基金缴费占社平工资/人均可支配收入的比例|
   注：职工以社平工资为基础，居民以人均可支配收入为基础
2. 830：
   |参数名|参数释义|
   |-|-|
   |SEX|性别：1=男；2=女|
   |AGE|年龄：范围0~119岁|
   |CLASS|人员类别|
   |EXPOSUR_YEAR|人口数量|
   |IND_PREMBASE_YEAR|个人缴费基数|
   |COMP_PREMBASE_YEAR|公司缴费基数|
   |IND_PREMRATIO_YEAR|个人缴费比例|
   |COMP_PREMRATIO_YEAR|公司缴费比例|
   |IND_ACCT_RATIO_YEAR|个人缴费进个账比例|
   |COMP_ACCT_RATIO_YEAR|公司缴费进个账比例|
   |FUND_ACCT_BASE_YEAR|个账缴费基数|
   |FUND_ACCT_RATIO_YEAR|个账缴费比例|
   |C_PREMRATIO_YEAR|居民缴费比例|

##### 理赔表

|参数名|参数释义|
|-|-|
|SEX|性别：1=男；2=女|
|AGE|年龄：范围0~119岁|
|CLASS|人员类别|
|OCCURRENCE_RATE_YEAR|人均就诊次数|
|CHG_PER_TIME_YEAR|次均就诊费用|
|COVERED_RATIO_YEAR|报销费用比例|
|PAID_RATIO_YEAR|实际报销比例|

#### 参数输出

<a id = "param_output"></a>

##### 转化率及筹资参数表

<a id = "c_rate"></a>
1. 715:
   <a id = "715_prem"></a>
   |参数名|参数释义|
   |-|-|
   |SEX|性别：1=男；2=女|
   |AGE|年龄：范围0~119岁|
   |CLASS|人员类别|
   |p_rate|劳动参与率(participation rate)，不计算，同[输入](#p_rate)|
   |r_rate|退休率(retirement rate)，不计算，同[输入](#r_rate)|
   |u_rate|失业率(unemployment rate)，不计算，同[输入](#u_rate)|
   |c_rate|扣除[死亡率](#mortality)以及[其他转化率](#chgrate)的最终转化率。若无变化，则为 $1$|
   |<a id = "accttot"></a>ACCT_TOT|该性别,年龄,人员类别下人均个账缴费占社平工资/人均可支配收入的比例|
   |<a id = "fundtot"></a>FUND_TOT|该性别,年龄,人员类别下人均基金缴费占社平工资/人均可支配收入的比例|
   注：职工以社平工资为基础，居民以人均可支配收入为基础
2. 830:
   <a id = "830_prem"></a>
   |参数名|参数释义|
   |-|-|
   |SEX|性别：1=男；2=女|
   |AGE|年龄：范围0~119岁|
   |CLASS|人员类别|
   |p_rate|劳动参与率(participation rate)，不计算，同[输入](#p_rate)|
   |r_rate|退休率(retirement rate)，不计算，同[输入](#r_rate)|
   |u_rate|失业率(unemployment rate)，不计算，同[输入](#u_rate)|
   |c_rate|扣除[死亡率](#mortality)以及[其他转化率](#chgrate)的最终转化率。若无变化，则为 $1$|
   |u_rate|失业率(unemployment rate)|
   |IND_PREMBASE|人均个人缴费基数|
   |COMP_PREMBASE|人均公司缴费基数|
   |IND_PREMRATIO|个人缴费比例|
   |COMP_PREMRATIO|公司缴费比例|
   |IND_ACCT_RATIO|个人缴费进个账比例|
   |COMP_ACCT_RATIO|公司缴费进个账比例|
   |FUND_ACCT_BASE|个帐缴费基数|
   |FUND_ACCT_RATIO|个账缴费比例|
   |C_PREM|居民缴费比例|
   |GOV_PROP|1|
   |IND_PROP|1|
   注：以上筹资相关参数，均为“该性别,年龄,人员类别是该性别,人员类别平均数的几倍”，详见

##### 人员结构

|参数名|参数释义|
|-|-|
|SEX|性别：1=男；2=女|
|AGE|年龄：范围0~119岁|
|CLASS|人员类别|
|EXPOSURE|<a id = "c_rate"></a>[基础年度](#baseyear)下该性别,年龄,人员类别的人数|

##### 理赔参数表

<a id = "param_claim"></a>
|参数名|参数释义|
|-|-|
|SEX|性别：1=男；2=女|
|AGE|年龄：范围0~119岁|
|CLASS|人员类别|
|SVC_TYPE|就诊类别|
|OCCURRENCE_RATE|人均就诊率|
|CHG_PER_TIME|次均费用|
|COVERED_RATIO|可报销费用比例|
|PAID_RATIO|实际支付费用占可报销费用比例|
|OCCURRENCE_RATE_IR|人均就诊率增长率|
|CHG_PER_TIME_IR|次均费用增长率|
|COVERED_RATIO_IR|可报销费用比例增张率|
|PAID_RATIO_IR|实际支付费用占可报销费用比例增长率|

注：若无变化，则相关增长率为 $0$ 。

## 预测模型

### 输入

#### 参数表
<a id="md_input"></a>

1. 同[参数计算输出](#param_output)。
2. 生命表
   |参数名|参数释义|
   |-|-|
   |SEX|性别：1=男；2=女|
   |AGE|年龄：范围0~119岁|
   |qx|<a id = "mortality2"></a>死亡率|

#### 用户输入

##### 筹资参数

1. 830
   |参数名|参数释义|
   |-|-|
   |YEAR|预测年度|
   |CLASS|人员类别|
   |ind_prembase|个人缴费基数|
   |comp_prembase|公司缴费基数|
   |ind_premratio|个人缴费比例|
   |comp_premratio|公司缴费比例|
   |ind_acct_ratio|个人缴费进个账比例|
   |comp_acct_ratio|公司缴费进个账比例|
   |fund_acct_base|个账缴费基数|
   |fund_acct_ratio|个账缴费比例|
   |C_PREMRATIO|居民缴费平均值|
   |GOVP_ROP|政府补贴比例|
   |IND_PROP|个人缴费比例|
2. 715
   |参数名|参数释义|
   |-|-|
   |PARAM_YEAR|预测年度|
   |CLASS|人员类别|
   |AVERAGE_SALARY|社平工资|
   |AVERAGE_SALARY_IR|社平工资增长率|
   |AVERAGE_INCOME|人均可支配收入|
   |AVERAGE_INCOME_IR|人均可支配收入增长率|

##### 理赔参数

1. 830
   |参数名|参数释义|
   |-|-|
   |YEAR|预测年度|
   |MPI|医疗费用增长率|
2. 715
   |参数名|参数释义|
   |-|-|
   |PARAM_YEAR|预测年度|
   |GDP|生产总值|
   |GDP_IR|生产总值增长率|

##### 退休年龄调整

|参数名|参数释义|
|-|-|
|YEAR|从此预测年度开始，退休年龄更改|
|SEX|性别：1=男；2=女|
|RETIRE_AGE|设定的退休年龄|

##### 目标人口

|参数名|参数释义|
|-|-|
|PARAM_YEAR|设定的预测年度|
|TARGET_POP|设定的人口总数|

### 输出

目前输出为整张表格，其中理赔相关根据就诊类别，会有多列。即“OCCURRENCE”，“TOT_CHARGE”，“TOT_COVERED”，“TOT_PAID”均会后缀“_TYPE”来表示其代表的就诊类型代码，并对每一种就诊类型都生成一列。

|参数名|参数释义|
|-|-|
|Year|预测年度|
|SEX|性别：1=男；2=女|
|AGE|年龄：范围0~119岁|
|CLASS|人员类别|
|EXPOSURE|<a id = "r_insu"></a>预测年度人数|
|ACCT|预测年度个人缴费|
|FUND|预测年度基金缴费|
|OCCURRENCE_TYPE|该预测年度，性别，年龄，人员类别，就诊类别下的就诊次数|
|TOT_CHARGE_TYPE|该预测年度，性别，年龄，人员类别，就诊类别下的费用总计|
|TOT_COVERED_TYPE|该预测年度，性别，年龄，人员类别，就诊类别下的可报销费用总计|
|TOT_PAID_TYPE|该预测年度，性别，年龄，人员类别，就诊类别下医保支付费用总计|

# 计算逻辑

## 参数计算

### 最终转化率

[转化率参数](#c_rate)”c_rate“的计算，为715及830模型人口预测的输入参数。具体计算步骤如下：

$$\begin{aligned}
   &_cR^0_{(sex,age,class,year)}=\begin{cases}
      \frac{E_{(sex,age,class,year+1)}}{E_{(sex,age,class,year)}}&E_{(sex,age,class,year)}>0\\
      1&E_{(sex,age,class,year)}=E_{(sex,age,class,year+1)}=0\\
      0&E_{(sex,age,class,year+1)}>0\land E_{(sex,age,class,year)}=0
   \end{cases}\\
   &_cR^1_{(sex,age,class)}=\begin{cases}
      \frac{\sum_{year=s}^{e-1} {_cR^0_{(sex,age,class,year)}}}{\sum_{year=s}^{e-1}D\big(E_{(sex,age,class,year)}\big)}
   \end{cases}\\
   &_cR_{(sex,age,class)}=\frac{_cR^1_{(sex,age,class)}}{q_{(sex,age)}*_uR_{(sex,age,class)}*_pR_{(sex,age,class)}*_rR_{(sex,age,class)}}
\end{aligned}$$

上述公式中：

1. $s,e$ 分别表示数据开始年度和结束年度
2. $_cR^0_{(sex,age,class,year)},_cR^1_{(sex,age,class)}$ 为中间变量
3. $_pR_{(dim)}$：特定维度(dim)下的[劳动参与率](#p_rate)
4. $_rR_{(dim)}$：特定维度(dim)下的[退休率](#r_rate)
5. $_uR_{(dim)}$：特定维度(dim)下的[事业率](#u_rate)
6. $q_{(sex,age)}$：该性别(sex),年龄(age)下的[死亡率](#mortality)
7. $E_{(dim)}$：特定维度(dim)下的[人口数量](#r_insu)，[参保表](#insruand)中有相关原始信息
8. $D(x)=\begin{cases}1&x\ne0\\0&x=0\end{cases}$ 为指示函数

最终输出 $_cR_{(sex,age,class)}$

<span style="color:red">此处逻辑基于校对需求，与理赔增长率计算不统一。且计算逻辑粗糙，易造成误差，会在第二版中修补。</span>

### [715筹资参数](#715_prem)

输出参数”ACCT_TOT“以及“FUNC_TOT”的计算，为715预测模型计算筹资的输入参数。具体计算如下：

$$\begin{aligned}
   &P_{(sex,age,class)}=\begin{cases}
      \frac{\sum_{year}P_{(sex,age,class,year)}\times D\big(E_{(sex,age,class,year)}\big)}{\sum_{year}D\big(E_{(sex,age,class,year)}\big)}&\sum_{year}D\big(E_{(sex,age,class,year)}\big)>0\\0&\sum_{year=s}^eD\big(E_{(sex,age,class,year)}\big)=0
   \end{cases}
\end{aligned}$$

上述公式中:

1. $P_{(sex,age,class,year)}$ 为从[参保表](#insruand)中提取
2. $D(x)=\begin{cases}1&x\ne0\\0&x=0\end{cases}$ 为指示函数
3. $s,e$ 分别表示数据开始年度和结束年度

最终输出 $P_{(sex,age,class)}$。

715前段输入仅为基数，故仅需计算参数的平均值即可。

### [830筹资参数](#830_prem)

输出参数“IND_PREMBASE”，“COMP_PREMBASE”，“IND_PREMRATIO”，“COMP_PREMRATIO”，“IND_ACCT_RATIO”，“COMP_ACCT_RATIO”，“FUND_ACCT_BASE”，“FUND_ACCT_RATIO”，“C_PREMRATIO”，“GOV_PROP”，“IND_PROP”的计算，为830预测模型计算筹资的输入参数：

$$\begin{aligned}
   &P^0_{(sex,age,class)}=\begin{cases}
      \frac{\sum_{year=s}^eP_{(sex,age,class,year)}\times D\big(E_{(sex,age,class,year)}\big)}{\sum_{year=s}^eD\big(E_{(sex,age,class,year)}\big)}&\sum_{year=s}^eD\big(E_{(sex,age,class,year)}\big)>0\\0&\sum_{year=s}^eD\big(E_{(sex,age,class,year)}\big)=0
   \end{cases}\\
   &P^1_{(sex,age,class)}=\begin{cases}
      \frac{\sum_{age=0}^{119}P^0_{(sex,age,class)}}{\sum_{age=0}^{119}D\big(P^0_{(sex,age,class)}\big)}&\sum_{age=0}^{119}D\big(P^0_{(sex,age,class)}\big)>0\\0&\sum_{age=0}^{119}D\big(P^0_{(sex,age,class)}\big)=0
   \end{cases}\\
   &P_{(sex,age,class)}=\begin{cases}
      \frac{P^0_{(sex,age,class)}}{P^1_{(sex,age,class)}}&P^1_{(sex,age,class)}>0\\0&P^1_{(sex,age,class)}=0
   \end{cases}
\end{aligned}$$

上述公式中: 

1. $P^0_{(sex,age,class)},P^1_{(sex,age,class)}$ 为中间变量
2. $D(x)=\begin{cases}1&x\ne0\\0&x=0\end{cases}$ 为指示函数
3. $s,e$ 分别表示数据开始年度和结束年度

最终输出 $P_{(sex,age,class)}$ 。

830前段输入为基数和缴费率，即包含平均缴费数。考虑到年龄分布，故参数为“平均数的倍数”。

### [理赔参数](#param_claim)

输出参数“OCCURRENCE_RATE”，“CHG_PER_TIME”，“COVERED_RATIO”，“PAID_RATIO”的计算，预测模型计算费用的输入参数。计算如下：

$$\begin{aligned}
   &C_{(sex,age,class)}=\begin{cases}
      \frac{\sum_{year}C_{(sex,age,class,year)}\times D\big(E_{(sex,age,class,year)}\big)}{\sum_{year}D\big(E_{(sex,age,class,year)}\big)}
   \end{cases}
\end{aligned}$$

上述公式中 $D(x)=\begin{cases}1&x\ne0\\0&x=0\end{cases}$ 为指示函数。

最终输出 $C_{(sex,age,class)}$ 。

### [理赔参数增长率](#param_claim)

输出参数“OCCURRENCE_RATE_IR”，“CHG_PER_TIME_IR”，“COVERED_RATIO_IR”，“PAID_RATIO_IR”的计算，预测模型计算费用的输入参数。

这里由于原来的计算逻辑存在问题，且“Pandas”包对于“pct_change”方法在零除问题上的处理逻辑无法猜测，故用以下计算方法：

定义 $Y(s,a,c,y)=\left\{y'\big|E_{(s,a,c,y')}>0\land y'>y\right\}$ 为集合，其中：
1. $s,a,c,y$ 分别表示性别，年龄，人员类别，及年度
2. $E_{(s,a,c,y)}$ 表示特定性别，年龄，人员类别，年度下的人口数量
   
即函数表示特定性别，年龄，人员类别下， $y$ 年之后所有人口数量不为零的年度的集合。

定义 $\inf(Y(s,a,c,y))$ 是集合 $Y(s,a,c,y)$ 的下确界。

定义函数 $N(s,a,c,y))=\begin{cases}\inf(s,a,c,y)&E_{(s,a,c,y')}>0\land Y(s,a,c,y)\ne\varnothing\\y&E_{(s,a,c,y')}=0\lor Y(s,a,c,y)=\varnothing\end{cases}$

故定义中间变量，其中符号，函数的定义与之前相同:

$\begin{aligned}
   &_cI^0_{(s,a,c,y)}=\begin{cases}
      0&E_{(s,a,c,y)}=0\lor N(y)=y\lor\big(C_{(s,a,c,y)}=0\land C_{(s,a,c,N(y))}>0\big)\\
      1&E_{(s,a,c,y)}>0\land N(y)>y\land\big(C_{(s,a,c,y)}=C_{(s,a,c,N(y))}=0\big)\\
      \left(\left(\frac{C_{(s,a,c,N(y))}}{C_{(s,a,c,y)}}\right)^{\frac{1}{N(y)-y}}-1\right)*(N(y)-y)&E_{(s,a,c,y)}>0\land N(y)>y\land C_{(s,a,c,y)}>0
   \end{cases}
\end{aligned}$

输出结果 $\begin{aligned}
   &_cI_{(sex,age,class)}=\begin{cases}
      \frac{\sum_{year-1}{_cI^0_{(sex,age,class,year)}}}{\sum_{year-1}\big(N(year)-year\big)}&\sum_{year-1}\big(N(year)-year\big)>0\\
      0&\sum_{year-1}\big(N(year)-year\big)=0
   \end{cases}
\end{aligned}$

上述方法明确定义了除数为零的情况，并且在中间无数据的情况下，提供计算

## 预测模型

### 人口预测

#### 基础计算

基础人口预测逐年进行，每年根据参数以及上一年人后预测下一年人口。预测分为两步：

##### 已有人口

首先根据[转换率参数](#c_rate)计算下一年度，下一岁的人口数量：

$$E_{(s,a+1,c,y+1)}=E_{(s,a,c,y)}\times _pR_{(s,a,c)}\times _uR_{(s,a,c)}\times _rR_{(s,a,c)}\times _cR_{(s,a,c)}\times(1-q_{(s,a)})$$

上述公式中：
1. $s,a,c,y$ 分别代表性别，年龄，人员类别以及预测年度
2. $E_{(s,a,c,y)}$ 代表该性别，年龄，人员类别，预测年度下的预测人口
3. $_pR_{(s,a,c,y)}, _uR_{(s,a,c,y)}, _rR_{(s,a,c,y)}, _cR_{(s,a,c,y)}$ 分别为该性别，年龄，人员类别下的劳动参与率，失业率，退休率以及最终转化率，详见[输入-参数表](#md_input)
4. $q_{(s,a)}$ 为该性别，年龄下的[死亡率](#mortality2)

##### 新生儿

该部分公式延续上一步定义。

完成已有人口计算后，根据计算结果进一步计算新生儿数量：

<a id="nb_calc"></a>
$$E_{(s,0,c_{nb},y)}=r(s)\times R_{birth}\left(\sum_{s=Fm\land m\leq a\leq M}E_{(s,a,c,y)}\right)$$

上述公式延续第一步定义的符号，另根据[配置参数](#newborn)有：
1. $Fm$ 为"BirthSexCode"，为生育性别的代码。
2. $r(s)$ 计算男性新生儿时返回“m_ratio”，否则“1-m_ratio”。
3. $m,M$ 分别代表“BirthAgeST”和“BirthAgeED”，即最小/大生育年龄
4. $R_{birth}$ 代表“birth_rate”，即生育率。
5. $c_{nb}$ 代表“newbornclass”，即新生儿将会被分配到的人员类别。
   
#### 退休年龄调整

模型允许调整退休年龄，同样按照每个预测年度逐年计算。逻辑如下

##### 计算相关Ratio

在某个确定的预测年度 $y$ ，根据[基础逻辑](#基础计算)得到的结果，计算以下4个比例：

$\begin{aligned}
&r_1=\frac{\sum_{a<R_{New}\land c\in W}E_{(s,a,c,y)}+\sum_{a<R_{New}\land c\in R}E_{(s,a,c,y)}}{\sum_{a<R_{New}\land c\in W}E_{(s,a,c,y)}\left(1+\frac{\sum_{a<R_{Cur}\land c\in R}E_{(s,a,c,y)}}{\sum_{a<R_{Cur}\land c\in W}E_{(s,a,c,y)}}\right)}\\
&r_2=\frac{\sum_{a<R_{New}\land c\in W}E_{(s,a,c,y)}+\sum_{a<R_{New}\land c\in R}E_{(s,a,c,y)}}{\sum_{a<R_{New}\land c\in R}E_{(s,a,c,y)}\left(1+\frac{\sum_{a<R_{Cur}\land c\in W}E_{(s,a,c,y)}}{\sum_{a<R_{Cur}\land c\in R}E_{(s,a,c,y)}}\right)}\\
&r_1=\frac{\sum_{a\geq R_{New}\land c\in W}E_{(s,a,c,y)}+\sum_{a\geq R_{New}\land c\in R}E_{(s,a,c,y)}}{\sum_{a\geq R_{New}\land c\in W}E_{(s,a,c,y)}\left(1+\frac{\sum_{a\geq R_{Cur}\land c\in R}E_{(s,a,c,y)}}{\sum_{a\geq R_{Cur}\land c\in W}E_{(s,a,c,y)}}\right)}\\
&r_2=\frac{\sum_{a\geq R_{New}\land c\in W}E_{(s,a,c,y)}+\sum_{a\geq R_{New}\land c\in R}E_{(s,a,c,y)}}{\sum_{a\geq R_{New}\land c\in R}E_{(s,a,c,y)}\left(1+\frac{\sum_{a\geq R_{Cur}\land c\in W}E_{(s,a,c,y)}}{\sum_{a\geq R_{Cur}\land c\in R}E_{(s,a,c,y)}}\right)}\\
\end{aligned}$

上述公式中：
1. $s,a,c,y$ 分别代表性别，年龄，人员类别以及预测年度
2. $E_{(s,a,c,y)}$ 代表该性别，年龄，人员类别，预测年度下[基础逻辑](#基础计算)预测的人口数量
3. $W,R$ 分别为[配置参数](#separam)中“WClassCode”和“RClassCode”的集合
4. $R_{New}$ 为[用户输入退休年龄表](#退休年龄调整)中对应年度的新的退休年龄（RETIRE_AGE列）
5. $\sum$ 记号的加和维度为满足下标条件，预测年度 $y$ 的所有年龄，性别，人员类别的加和。

##### 调整人口分布

根据上一步计算出的Ratio，以及[基础逻辑](#基础计算)计算得的人口，对人口分布做如下调整：

$\begin{aligned}
   &E'_{(s,a,c,y)}=\begin{cases}
      E_{(s,a,c,y)}& c\not\in W\land c\not\in R\\
      E_{(s,a,c,y)}\times r_1 &c\in W\land a < R_{New}\\
      E_{(s,a,c,y)}\times r_2 &c\in R\land a < R_{New}\\
      E_{(s,a,c,y)}\times r_3 &c\in W\land a\geq R_{New}\\
      E_{(s,a,c,y)}\times r_4 &c\in R\land a\geq R_{New}\\
   \end{cases}
\end{aligned}$

上述公式中 $E'_{(s,a,c,y)}$ 为退休年龄调整后的人口。

##### 算法基础

采用上述计算方法调整退休年龄的主要逻辑包含：

1. 调整前后，新的退休年龄之前，之后的人口总数不变。证明如下
   
   $\begin{aligned}
   &\sum_{a<R_{New}\land c\in W}E_{(s,a,c,y)}\times R_1\div \sum_{a<R_{New}\land c\in R}E_{(s,a,c,y)}\times R_2\\
   =&\frac{\sum_{a<R_{New}\land c\in W}E_{(s,a,c,y)}+\sum_{a<R_{New}\land c\in R}E_{(s,a,c,y)}}{1+\frac{\sum_{a<R_{Cur}\land c\in R}E_{(s,a,c,y)}}{\sum_{a<R_{Cur}\land c\in W}E_{(s,a,c,y)}}}\div\frac{\sum_{a<R_{New}\land c\in W}E_{(s,a,c,y)}+\sum_{a<R_{New}\land c\in R}E_{(s,a,c,y)}}{1+\frac{\sum_{a<R_{Cur}\land c\in W}E_{(s,a,c,y)}}{\sum_{a<R_{Cur}\land c\in R}E_{(s,a,c,y)}}}\\
   =&\frac{\sum_{a<R_{Cur}\land c\in W}E_{(s,a,c,y)}\frac{\sum_{a<R_{New}\land c\in W}E_{(s,a,c,y)}+\sum_{a<R_{New}\land c\in R}E_{(s,a,c,y)}}{\sum_{a<R_{Cur}\land c\in W}E_{(s,a,c,y)}+\sum_{a<R_{Cur}\land c\in R}E_{(s,a,c,y)}}}{\sum_{a<R_{Cur}\land c\in R}E_{(s,a,c,y)}\frac{\sum_{a<R_{New}\land c\in W}E_{(s,a,c,y)}+\sum_{a<R_{New}\land c\in R}E_{(s,a,c,y)}}{\sum_{a<R_{Cur}\land c\in R}E_{(s,a,c,y)}+\sum_{a<R_{Cur}\land c\in W}E_{(s,a,c,y)}}}\\
   =&\sum_{a<R_{Cur}\land c\in W}E_{(s,a,c,y)}\div\sum_{a<R_{Cur}\land c\in R}E_{(s,a,c,y)}
   \end{aligned}$

2. 调整后新退休年龄之前/后的退休在职比例不变，证明如下：

   $\begin{aligned}
   &\sum_{a<R_{New}\land c\in W}E_{(s,a,c,y)}\times R_1\div \sum_{a<R_{New}\land c\in R}E_{(s,a,c,y)}\times R_2\\
   =&\frac{\sum_{a<R_{New}\land c\in W}E_{(s,a,c,y)}+\sum_{a<R_{New}\land c\in R}E_{(s,a,c,y)}}{1+\frac{\sum_{a<R_{Cur}\land c\in R}E_{(s,a,c,y)}}{\sum_{a<R_{Cur}\land c\in W}E_{(s,a,c,y)}}}+\frac{\sum_{a<R_{New}\land c\in W}E_{(s,a,c,y)}+\sum_{a<R_{New}\land c\in R}E_{(s,a,c,y)}}{1+\frac{\sum_{a<R_{Cur}\land c\in W}E_{(s,a,c,y)}}{\sum_{a<R_{Cur}\land c\in R}E_{(s,a,c,y)}}}\\
   =&\left(\sum_{a<R_{Cur}\land c\in W}E_{(s,a,c,y)}+\sum_{a<R_{Cur}\land c\in R}E_{(s,a,c,y)}\right)\frac{\sum_{a<R_{New}\land c\in W}E_{(s,a,c,y)}+\sum_{a<R_{New}\land c\in R}E_{(s,a,c,y)}}{\sum_{a<R_{Cur}\land c\in W}E_{(s,a,c,y)}+\sum_{a<R_{Cur}\land c\in R}E_{(s,a,c,y)}}\\
   =&\sum_{a<R_{Cur}\land c\in W}E_{(s,a,c,y)}+\sum_{a<R_{Cur}\land c\in R}E_{(s,a,c,y)}
   \end{aligned}$

#### 目标人口

模型允许在当前预测年度至 $n$ 年后根据特定的目标人口计算人口。在 $n+1$ 及以后根据[基础逻辑](#基础计算)计算。

目标人口期间计算人口的的逻辑如下：

##### 基础年度比例

定义人口比例 $P_{s,a,c}=\frac{E_{(s,a,c,y_0)}}{\sum E_{(s,a,c,y_0)}}$ 

其中:

1. $s,a,c,y$ 分别代表性别，年龄，人员类别以及预测年度
2. $E_{(s,a,c,y)}$ 代表该性别，年龄，人员类别，预测年度下[基础逻辑](#基础计算)预测的人口数量
3. $y_0$ 为[运行参数](#opparam)中的“Base_Year”，基础年度

##### 预测年度总人口

目标中人口为[用户输入](#目标人口)，分别为对于预测年度 $y^*$ 的总人口数 $S^*_{y^*}$ 

定义 $y^*$ 组成的集合为 $Y^*$ ，

定义函数 $U(y)=\{y’|y'>y\land y'\in Y^*\},D(y)=\{y’|y'<y\land y'\in Y^*\}$

继而定义 $\min(y)$ 为 $U(y)$ 最小值， $\max(y)$ 为 $D(y)$ 最大值

则有：

$S(y)=\begin{cases}
   S^*_{y}&y\in Y^*\\
   S^*_{\max(y)}+\big(y-\max(y)\big)\times\frac{S^*_{\min(y)}-S^*_{\max(y)}}{\min(y)-\max(y)}& y\not\in Y^*
\end{cases}$
   

### 筹资计算

根据[人口预测](#人口预测)的到特定预测年度，具体性别，年龄，

#### 715

715模型由于前端输入为基数，故仅需乘以相应比例即可：

$\begin{aligned}
ACCT_{(s,a,c,y)}&=\begin{cases}
   E_{(s,a,c,y)}\times Ave_S(c,y)\times ACCT\_TOT_{(s,a,c)}&c\not\in C\\
   E_{(s,a,c,y)}\times Ave_I(c,y)\times ACCT\_TOT_{(s,a,c)}&c\in C\\
\end{cases}\\
FUNT_{(s,a,c,y)}&=\begin{cases}
   E_{(s,a,c,y)}\times Ave_S(c,y)\times FUND\_TOT_{(s,a,c)}&c\not\in C\\
   E_{(s,a,c,y)}\times Ave_I(c,y)\times FUND\_TOT_{(s,a,c)}&c\in C\\
\end{cases}
\end{aligned}$

上述公式中：
1. $s,a,c,y$ 分别代表性别，年龄，人员类别以及预测年度
2. $E_{(s,a,c,y)}$ 代表该性别，年龄，人员类别，预测年度下[基础逻辑](#基础计算)预测的人口数量
3. $ACCT_{(s,a,c,y)},FUNT_{(s,a,c,y)}$ 分别代表该性别，年龄，人员类别，预测年度个账缴费和基金缴费
4. $Ave_S(c,y),Ave_I(c,y)$ 分别代表社平工资和人均可支配收入，详见[筹资参数](#筹资参数)
5. $ACCT\_TOT_{(s,a,c)},FUND\_TOT_{(s,a,c)}$分别代表该性别，年龄，人员类别下个账，基金缴费占社平工资/人均可支配收入的比值，从[参数表](#参数表)中读取

#### 830

830的计算，由于前端输入限制，故相对较复杂。

由于入参及符号较多，故做以下定义：

1. $s,a,c,y$ 分别代表性别，年龄，人员类别以及预测年度
2. $E_{(s,a,c,y)}$ 代表该性别，年龄，人员类别，预测年度下[基础逻辑](#基础计算)预测的人口数量
3. $I[0]_{(c,y)}\sim I[10]_{(c,y)}$ 分别代表用户输入[筹资参数](#筹资参数)的“ind_prembase”至“IND_PROP”行
4. 同理 $P[0]_{(s,a,c)}\sim P[10]_{(s,a,c)}$ 分别代表参数表中[筹资参数](#830_prem)的“IND_PREMBASE”至“IND_PROP”行

定义特定性别，年龄，人员类别，预测年度下个人缴费 $Id_{(s,a,c,y)}$ 和公司缴费 $Cp_{(s,a,c,y)}$ 为：

$\begin{aligned}
Id_{(s,a,c,y)}&=E_{(s,a,c,y)}\times\left(I[0]_{(c,y)}\times P[0]_{(s,a,c)}\times I[2]_{(c,y)}\times P[2]_{(s,a,c)} \right)\\
Cp_{(s,a,c,y)}&=E_{(s,a,c,y)}\times\left(I[1]_{(c,y)}\times P[1]_{(s,a,c)}\times I[3]_{(c,y)}\times P[3]_{(s,a,c)}\right)
\end{aligned}$

进一步有特定性别，年龄，人员类别，预测年度下个账缴费 $ACCT_{(s,a,c,y)}$ 以及基金缴费 $FUNT_{(s,a,c,y)}$ 如下：

$\begin{aligned}
ACCT_{(s,a,c,y)}&=\begin{cases}
   0&c\in C\\
   Id_{(s,a,c,y)}\left(I[4]_{(c,y)}\times P[4]_{(s,a,c)}\right)+Cp_{(s,a,c)}\left(I[5]_{(c,y)}\times P[5]_{(s,a,c)}\right)&c\in W\\
   E_{(s,a,c,y)}\left(I[6]_{(c,y)}\times P[6]_{(s,a,c)}\times I[7]_{(c,y)}\times P[7]_{(s,a,c)}\right)& c\in R
\end{cases}\\
FUNT_{(s,a,c,y)}&=\begin{cases}
   E_{(s,a,c,y)}\times C\_Prem_{(c,y)}\times C\_Prem\_R_{(s,a,c,y)} & c\in C\\
   Id_{(s,a,c,y)}+Cp_{(s,a,c,y)}-ACCT_{(s,a,c,y)}& c\in W\\
   Id_{(s,a,c,y)}+Cp_{(s,a,c,y)}-ACCT_{(s,a,c,y)}& c\in R\\
\end{cases}
\end{aligned}$

<span style="color: red">此处参数计算不合理，应为根据用户输入计算出平均数后，再乘以参数（平均数的倍数），而不是 $I[0]_{(c,y)}\sim I[10]_{(c,y)}$ 每一个都对参数想成。这会造成加和不等于平均缴费数乘以人数。后续版本会更改。</span>

### 费用计算

#### 715

同[筹资](#筹资计算)，由于入参较多，且分[用户输入](#理赔参数)和[参数表输入](#理赔参数表)，故作以下定义：

1. $s,a,c,y$ 分别代表性别，年龄，人员类别以及预测年度
2. $E_{(s,a,c,y)}$ 代表该性别，年龄，人员类别，预测年度下[基础逻辑](#基础计算)预测的人口数量
3. $I[0]_{(y)}, I[1]_{(y)}$ 分别代表715输入中“GDP”和”GDP_IR“
4. $C[0]_{(s,a,c)}\sim C[3]_{(s,a,c)}$ 分别代表参数表中的“OCCURRENCE_RATE”至“PAID_RATIO”行
5. $IC[0]_{(s,a,c)}\sim IC[3]_{(s,a,c)}$ 分别代表参数表中的“OCCURRENCE_RATE_IR”至“PAID_RATIO_IR”行

定义公式：

$\begin{aligned}
G(y)&=\left(\frac{-2.57326968\times 10^{-4}\times I[0]_{(y)}\times 10^{-8}+112.493307}{100}\right)^{y-y_0}\\
L(y)&=\prod_{y'=y_0}^y\left(1+I[0]_{(y')}\right)
\end{aligned}$

则有特定性别，年龄，人员类别，预测年度下就诊次数（ $Ocur_{(s,a,c,y)}$ ），总费用（ $Tchr_{(s,a,c,y)}$ ），可报销费用（ $Cchr_{(s,a,c,y)}$ ），实际报销费用（ $Pchr_{(s,a,c,y)}$ ）入下：

$\begin{aligned}
   Ocur_{(s,a,c,y)}&=E_{(s,a,c,y)}\times C[0]_{(s,a,c)}\times (IC[0]_{(s,a,c)})^{y-y_0}\\
   Tchr_{(s,a,c,y)}&=Ocur_{(s,a,c,y)}\times \left(C[1]_{(s,a,c)}\times \left(\frac{(IC[1]_{(s,a,c)})^{y-y_0}}{G(y)}\right)^{\frac{1}{10}}\right)\times L(y)\\
   Cchr_{(s,a,c,y)}&=Tchr_{(s,a,c,y)}\times \left(C[2]_{(s,a,c)}\times (IC[2]_{(s,a,c)})^{y-y_0}\right)\\
   Pchr_{(s,a,c,y)}&=Cchr_{(s,a,c,y)}\times \left(C[3]_{(s,a,c)}\times (IC[3]_{(s,a,c)})^{y-y_0}\right)
\end{aligned}$

#### 830

同上，根据[用户输入](#理赔参数)和[参数表输入](#理赔参数表)，故作以下定义：

1. $s,a,c,y$ 分别代表性别，年龄，人员类别以及预测年度
2. $E_{(s,a,c,y)}$ 代表该性别，年龄，人员类别，预测年度下[基础逻辑](#基础计算)预测的人口数量
3. $M_y$ 代表830输入中“MPI”
4. $C[0]_{(s,a,c)}\sim C[3]_{(s,a,c)}$ 分别代表参数表中的“OCCURRENCE_RATE”至“PAID_RATIO”行
5. $IC[0]_{(s,a,c)}\sim IC[3]_{(s,a,c)}$ 分别代表参数表中的“OCCURRENCE_RATE_IR”至“PAID_RATIO_IR”行

则有特定性别，年龄，人员类别，预测年度下就诊次数（ $Ocur_{(s,a,c,y)}$ ），总费用（ $Tchr_{(s,a,c,y)}$ ），可报销费用（ $Cchr_{(s,a,c,y)}$ ），实际报销费用（ $Pchr_{(s,a,c,y)}$ ）入下：

$\begin{aligned}
   Ocur_{(s,a,c,y)}&=C[0]_{(s,a,c)}\times (IC[0]_{(s,a,c)})^{y-y_0}\\
   Tchr_{(s,a,c,y)}&=Ocur_{(s,a,c,y)}\times \left(C[1]_{(s,a,c)}\times (IC[1]_{(s,a,c)})^{y-y_0}\right)\times \prod_{y'=y_0}^y(1+M_{y'})\\
   Cchr_{(s,a,c,y)}&=Tchr_{(s,a,c,y)}\times \left(C[2]_{(s,a,c)}\times (IC[2]_{(s,a,c)})^{y-y_0}\right)\\
   Pchr_{(s,a,c,y)}&=Cchr_{(s,a,c,y)}\times \left(C[3]_{(s,a,c)}\times (IC[3]_{(s,a,c)})^{y-y_0}\right)
\end{aligned}$