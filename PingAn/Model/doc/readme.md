[TOC]

# 更新概况

## 当前 

本次模型改动准备针对目前逻辑中不合理，冗余的计算做删减以及修正，改动以下3个方面：

1. 人口预测中的转化率
2. 830费用预测中的参数
3. 费用增长率
   
针对这3个方面，基本逻辑为：

1. 采用“本年某类人口/上年整体人口”的逻辑代替“本年某类人口/上年某类人口”，这么做的目的是：
   1. 解决了上一年人口为零的问题
   2. 可以分别解释劳动参与率，退休率，失业率
   3. 一般一个城市某性别，年龄下的总人口不会为零，避免零除导致过度人为估计。
2. 830仅重新分配个人，公司，统筹转个帐以及居民的缴费4个参数，目的为：
   1. 符合客观逻辑和规律
   2. 去掉了之前逻辑产生的无法解释的误差
3. 去掉了费用增长率参数模块，改用用户输入的增长率，目的为：
   1. 避免了参数过细导致增长率评估不稳定，最终结果爆炸的情况
   2. 避免了参数增长率和用户输入增长率相乘的不符合客观逻辑运算

<font color=red>此改动仅在local实现，其他版本牵涉到ETL问题目前尚未修改</font>

## 历史

### B_2

1. 添加[年龄补入](#年龄补入)机制，更灵活。替换16岁职工补入。
2. 830医疗增长率添加维度。

### B_1

1. 添加[死亡率系数](#opparam)
2. 添[加费用增长率系数](#separam)（用于输入与参数）
3. 添加[16岁在职职工补入](#基本参数)
4. 修改错误代码：在职个帐筹资

# 介绍

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

# Local版本-运行策略

通过配置<font color=blue>Control.xlsm</font>中的参数，并生成相关文件可实现选择运行模型、预测年限、输入输出、相关SQL的生成以及补充输入参数的功能。

此处要注意的是，VBA主要通过搜索[Param]表中关键字（表中标<span style="background-color: green;color: black">绿底黑字</span>，下图中圈红）来定位信息，并逐行读取直至空行。故表格位置可随意变化，但<font color=red>关键字不能重复出现</font>。界面如下图所示:

<img src="Y:\Desktop\LT_MDL\LTM\Local\pic\Control.PNG">

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
|Mort_Adj|死亡率调整系数|1|

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
      <td rowspan="5">人员类别</td>
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
      <td>W,w,本市在职</td>
   </tr>
   <tr>
      <td>newAgeClass</td>
      <td>补入人口类型（组间"|"分隔，组内以逗号分隔，全部分配到第一个匹配到的类型）组数需要与“<a href="#opparam">newAgeList</a>”相同</td>
      <td>W,w,本市在职|R,r,退休人员</td>
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
   <tr>
      <td rowspan="2">理赔</td>
      <td>R_CLaim_Input</td>
      <td>用户输入的理赔参数的系数</td>
      <td>1,1,1,1</td>
   <tr>  
      <td>R_Claim_Param</td>
      <td>参数表理赔参数的系数</td>
      <td>1,0,0,0</td>
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
<a id = "param_input"></a>
1. 参保信息表：<a id = "insruand"></a>关键字"REVDATA"，精算标准表之一，位于数据库中。
2. 理赔信息表：关键字"CLAIMDATA"，同上。
3. 生命表：分性别，年龄的死亡率表，字段如下
   |参数名|参数释义|
   |-|-|
   |SEX|性别：1=男；2=女|
   |AGE|年龄：范围0~119岁|
   |qx|<a id = "mortality"></a>死亡率|

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
   |JBYBACCTPREMAMT|个账缴费|
   |JBYBFUNDPREMAMT|基金缴费|

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
   |c_rate|扣除[死亡率](#mortality)的最终转化率。若无变化，则为 $1$|
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
   |c_rate|扣除[死亡率](#mortality)的最终转化率。若无变化，则为 $1$|
   |ACCT_TOT|个账缴费占该人员类别不同年度、年龄平均数的几倍|
   |FUND_TOT|基金缴费占该人员类别不同年度、年龄平均数的几倍|

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
   |FORT_YEAR|预测_年度|
   |PSN_TYPE|人员_类别|
   |PSN_CLCTSTD|个人_缴费基数|
   |CO_CLCTSTD|公司_缴费基数|
   |PSN_CLCTPROP|个人_缴费比例|
   |CO_CLCTPROP|公司_缴费比例|
   |PSN_ACCTFUND_CLCTPROP|个人_个人账户基金_缴费_比例|
   |CO_ACCTFUND_CLCTPROP|公司_个人账户基金_缴费_比例|
   |ACCTFUND_CLCTSTD|个人账户基金_缴费_基数|
   |ACCTFUND_CLCTPROP|个人账户基金_缴费_比例|
   |SOCA_AVESAL|社会_平均工资|
   |SOCA_AVESAL_GROW|社会_平均工资_增长|
   |RSDT_CLCTPROP|居民_缴费比例|
   |FINSUBS|财政补贴|
   |PSN_CLCT|个人_缴费|

2. 715
   |参数名|参数释义|
   |-|-|
   |FORT_YEAR|预测_年度|
   |PSN_TYPE|人员_类别|
   |SOCA_AVESAL|社会_平均工资|
   |SOCA_AVESAL_GROW|社会_平均工资_增长|
   |PERPSN_DSPO_INC|人均_可支配_收入|
   |PERPSN_DSPO_INC_GROW|人均_可支配_收入_增长|


##### 理赔参数

1. 830
   |参数名|参数释义|
   |-|-|
   |FORT_YEAR|预测_年度|
   |PSN_TYPE|人员_类别|
   |MDTRT_TYPE|就诊_类别|
   |MDTRT_RATE_GROW|就诊_率_增长|
   |AVG_FEE_GROW|次均_费用_增长|
   |COVR_PROP_GROW|覆盖_比例_增长|
   |REIM_RAT_GROW|报销_比例_增长|


2. 715
   |参数名|参数释义|
   |-|-|
   |FORT_YEAR|预测_年度|
   |GDP|GDP|
   |GDP_GROW|GDP_增长|

##### 退休年龄调整

|参数名|参数释义|
|-|-|
|FORT_YEAR|预测_年度|
|GEND|性别|
|RETR_AGE|退休_年龄|

##### 目标人口

|参数名|参数释义|
|-|-|
|FORT_YEAR|预测_年度|
|TOTL_POP|总_人口数|

### 输出

目前输出为整张表格，其中理赔相关根据就诊类别，会有多列。即“OCCURRENCE”，“TOT_CHARGE”，“TOT_COVERED”，“TOT_PAID”均会后缀“_TYPE”来表示其代表的就诊类型代码，并对每一种就诊类型都生成一列。

|参数名|参数释义|
|-|-|
|FORT_YEAR|预测_年度|
|GEND|性别|
|AGE|年龄|
|PSN_TYPE|人员_类别|
|POP|人口数|
|ACCTFUND_CLCT|个人账户基金_缴费|
|FUND_CLCT|基金_缴费|
|OTP_1|诊次_1|
|SUMFEE_1|总费用_1|
|INSCP_FEE_1|符合范围_费用_1|
|FUND_PAY_1|基金_支付_1|
|OTP_2|诊次_2|
|SUMFEE_2|总费用_2|
|INSCP_FEE_2|符合范围_费用_2|
|FUND_PAY_2|基金_支付_2|

# 计算逻辑

## 参数计算

### 最终转化率

#### 计算步骤

1. 根据性别，年龄，人员类别，统计年度加总人口数量
2. 计算每两年间的数字：即这一年到下一年的变化率
3. 从统计年度层面，计算年均转化率
4. 抛去死亡率

#### 公式表述

第2，3，4步公式如下：

$\begin{aligned}
   2： &_cR^0_{(s,a,c,y)}=\begin{cases}
      \frac{E_{(s,a+1,c,y+1)}}{\sum_{c^*\in\{R,W,1,2\}}E_{(s,a,c^*,y)}}&\sum_{c^*\in\{C,W,1,2\}}E_{(s,a,c^*,y)}>0\\
      0&\sum_{c\in\{C,W,1,2\}}E_{(s,a,c,y)}=0
   \end{cases}\\
   3： &_cR^1_{(s,a,c)}=
      \frac{\sum_{y=st}^{ed-1} {_cR^0_{(s,a,c,y)}}}{\sum_{y=st}^{ed-1}D\big(E_{(s,a,c,y)}\big)}\\
   4： &_cR_{(s,a,c)}=\frac{_cR^1_{(s,a,c)}}{1-q_{(sex,age)}}
\end{aligned}$

上述公式中：

1. $s,a,c,y$ 分别代表性别，年龄，人员类别以及预测年度
2. $st,ed$ 分别表示统计开始年度和统计结束年度
3. $_cR^0_{(s,a,c,y)},_cR^1_{(s,a,c)}$ 为中间变量
4. $q_{(s,a)}$：该性别(s),年龄(a)下的死亡率
5. $E_{(dim)}$：特定维度(dim)下的人口数量。
6. $D(x)=\begin{cases}1&x\ne0\\0&x=0\end{cases}$ 为指示函数

最终输出 $_cR_{(s,a,c)}$

### [715筹资参数](#715_prem)

输出参数”ACCT_TOT“以及“FUNC_TOT”的计算，为715预测模型计算筹资的输入参数。具体计算如下：

$$\begin{aligned}
   &P_{(sex,age,class)}=\begin{cases}
      \frac{\sum_{year}\frac{Ave\_Pay_{(sex,age,class,year)}}{Ave_{(class,year)}}\times D\big(E_{(sex,age,class,year)}\big)}{\sum_{year}D\big(E_{(sex,age,class,year)}\big)}&\sum_{year}D\big(E_{(sex,age,class,year)}\big)>0\\
      0&\sum_{year=s}^eD\big(E_{(sex,age,class,year)}\big)=0
   \end{cases}
\end{aligned}$$

上述公式中:

1. $P_{(sex,age,class,year)}$ 为从[参保表](#insruand)中提取
2. $D(x)=\begin{cases}1&x\ne0\\0&x=0\end{cases}$ 为指示函数
3. $s,e$ 分别表示数据开始年度和结束年度
4. $Ave_{(year)}=\begin{cases}Ave\_S_y&class\in\{W,R\}\\Ave\_I_y&class\in\{1,2\}\end{cases}$
5. $Ave\_Pay_{dim}$ 是特定维度下的缴费

最终输出 $P_{(sex,age,class)}$。

715前段输入仅为基数，故仅需计算参数的平均值即可。

### [830筹资参数](#830_prem)

#### 计算步骤

1. 从[参数输入](#param_input)AGE，GEND，PSN_TYPE以及统计年度维度下，定义以下字段
   |定义|
   |-|
   |个人账户收入|
   |统筹账户收入|
2. 求上述字段的人均值，即除以人口数
3. 对所有计算参数从统计年度层面计算平均值，得 $P^1_{(sex,age,class)}$
4. 在上一步基础上计算年龄的平均值，得 $P^2_{(sex,class)}$
5. 第3步的值除以第4步的值（即各年龄段参数是年龄平均值的几倍），即 $\frac{P^1_{(sex,age,class)}}{P^2_{(sex,class)}}$

#### 公式表达

第2，3，4步公式如下：

$\begin{aligned}
   2：&P^0_{(sex,age,class,year)}=\begin{cases}\frac{P^{s}_{(sex,age,class,year)}}{E_{(sex,age,class,year)}}&E_{(sex,age,class,year)}>0\\0&E_{(sex,age,class,year)}=0\end{cases}\\
   3：&P^1_{(sex,age,class)}=\begin{cases}
      \frac{\sum_{year=s}^eP^0_{(sex,age,class,year)}\times D\big(E_{(sex,age,class,year)}\big)}{\sum_{year=s}^eD\big(E_{(sex,age,class,year)}\big)}&\sum_{year=s}^eD\big(E_{(sex,age,class,year)}\big)>0\\0&\sum_{year=s}^eD\big(E_{(sex,age,class,year)}\big)=0
   \end{cases}\\
   4：&P^2_{(sex,class)}=\begin{cases}
      \frac{\sum_{age=0}^{119}P^0_{(sex,age,class)}}{\sum_{age=0}^{119}D\big(P^0_{(sex,age,class)}\big)}&\sum_{age=0}^{119}D\big(P^0_{(sex,age,class)}\big)>0\\0&\sum_{age=0}^{119}D\big(P^0_{(sex,age,class)}\big)=0
   \end{cases}\\
   5：&P_{(sex,age,class)}=\begin{cases}
      \frac{P^1_{(sex,age,class)}}{P^2_{(sex,class)}}&P^2_{(sex,age,class)}>0\\0&P^2_{(sex,age,class)}=0
   \end{cases}
\end{aligned}$

上述公式中 $P$ 代表“筹资信息_830”分类下的参数，另

1. $P^{s}_{(sex,age,class,year)}$ 第一步中计算所得
2. $P^0_{(sex,age,class)},P^1_{(sex,age,class)},P^2_{(sex,age,class)}$ 为中间变量
3. $D(x)=\begin{cases}1&x\ne0\\0&x=0\end{cases}$ 为指示函数
4. $s,e$ 分别表示数据开始年度和结束年度

最终输出 $P_{(sex,age,class)}$ 。

### [理赔参数](#param_claim)

输出参数“OCCURRENCE_RATE”，“CHG_PER_TIME”，“COVERED_RATIO”，“PAID_RATIO”的计算，预测模型计算费用的输入参数。计算如下：

$\begin{aligned}
   &C_{(s,a,c,t)}=\begin{cases}
      \frac{\sum_{year}C_{(s,a,c,y,t)}\times D\big(E_{(s,a,c,y)}\big)}{\sum_{y=s}^eD\big(E_{(s,a,c,y)}\big)}
   \end{cases}
\end{aligned}$

上述公式中:

1. $D(x)=\begin{cases}1&x\ne0\\0&x=0\end{cases}$ 为指示函数
2. $s,a,c,y,t$ 分别代表性别，年龄，人员类别，预测年度以及就诊类别
3. $E_{(s,a,c,y)}$ 代表该性别，年龄，人员类别，年度下人口数量

最终输出 $C_{(s,a,c,t)}$ 。

## 预测模型

### 人口预测

#### 基础计算

基础人口预测逐年进行，每年根据参数以及上一年人后预测下一年人口。预测分为两步：

##### 已有人口

根据转换率参数计算下一年度，下一岁的人口数量：

$$E_{(s,a+1,c,y+1)}=\left(\sum_{c\in\{C,W,1,2\}}E_{(s,a,c,y)}\right)\times _cR_{(s,a,c)}\times(1-q_{(s,a)}\times q_{adj})$$

上述公式中：
1. $s,a,c,y$ 分别代表性别，年龄，人员类别以及预测年度
2. $E_{(s,a,c,y)}$ 代表该性别，年龄，人员类别，预测年度下的预测人口
3. $_cR_{(s,a,c)}$ 分别为该性别，年龄，人员类别下的[转化率](#最终转化率)
4. $q_{(s,a)}$ 为该性别，年龄下的死亡率
5. $q_{adj}$ 为死亡率调整参数

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
&r_3=\frac{\sum_{a\geq R_{New}\land c\in W}E_{(s,a,c,y)}+\sum_{a\geq R_{New}\land c\in R}E_{(s,a,c,y)}}{\sum_{a\geq R_{New}\land c\in W}E_{(s,a,c,y)}\left(1+\frac{\sum_{a\geq R_{Cur}\land c\in R}E_{(s,a,c,y)}}{\sum_{a\geq R_{Cur}\land c\in W}E_{(s,a,c,y)}}\right)}\\
&r_4=\frac{\sum_{a\geq R_{New}\land c\in W}E_{(s,a,c,y)}+\sum_{a\geq R_{New}\land c\in R}E_{(s,a,c,y)}}{\sum_{a\geq R_{New}\land c\in R}E_{(s,a,c,y)}\left(1+\frac{\sum_{a\geq R_{Cur}\land c\in W}E_{(s,a,c,y)}}{\sum_{a\geq R_{Cur}\land c\in R}E_{(s,a,c,y)}}\right)}\\
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

1. 调整后新退休年龄之前/后的退休在职比例不变，证明如下：
   
   $\begin{aligned}
   &\sum_{a<R_{New}\land c\in W}E_{(s,a,c,y)}\times R_1\div \sum_{a<R_{New}\land c\in R}E_{(s,a,c,y)}\times R_2\\
   =&\frac{\sum_{a<R_{New}\land c\in W}E_{(s,a,c,y)}+\sum_{a<R_{New}\land c\in R}E_{(s,a,c,y)}}{1+\frac{\sum_{a<R_{Cur}\land c\in R}E_{(s,a,c,y)}}{\sum_{a<R_{Cur}\land c\in W}E_{(s,a,c,y)}}}\div\frac{\sum_{a<R_{New}\land c\in W}E_{(s,a,c,y)}+\sum_{a<R_{New}\land c\in R}E_{(s,a,c,y)}}{1+\frac{\sum_{a<R_{Cur}\land c\in W}E_{(s,a,c,y)}}{\sum_{a<R_{Cur}\land c\in R}E_{(s,a,c,y)}}}\\
   =&\frac{\sum_{a<R_{Cur}\land c\in W}E_{(s,a,c,y)}\frac{\sum_{a<R_{New}\land c\in W}E_{(s,a,c,y)}+\sum_{a<R_{New}\land c\in R}E_{(s,a,c,y)}}{\sum_{a<R_{Cur}\land c\in W}E_{(s,a,c,y)}+\sum_{a<R_{Cur}\land c\in R}E_{(s,a,c,y)}}}{\sum_{a<R_{Cur}\land c\in R}E_{(s,a,c,y)}\frac{\sum_{a<R_{New}\land c\in W}E_{(s,a,c,y)}+\sum_{a<R_{New}\land c\in R}E_{(s,a,c,y)}}{\sum_{a<R_{Cur}\land c\in R}E_{(s,a,c,y)}+\sum_{a<R_{Cur}\land c\in W}E_{(s,a,c,y)}}}\\
   =&\sum_{a<R_{Cur}\land c\in W}E_{(s,a,c,y)}\div\sum_{a<R_{Cur}\land c\in R}E_{(s,a,c,y)}\\\\
   &\sum_{a\geq R_{New}\land c\in W}E_{(s,a,c,y)}\times R_3\div \sum_{a\geq R_{New}\land c\in R}E_{(s,a,c,y)}\times R_4\\
   =&\frac{\sum_{a\geq R_{New}\land c\in W}E_{(s,a,c,y)}+\sum_{a\geq R_{New}\land c\in R}E_{(s,a,c,y)}}{1+\frac{\sum_{a\geq R_{Cur}\land c\in R}E_{(s,a,c,y)}}{\sum_{a\geq R_{Cur}\land c\in W}E_{(s,a,c,y)}}}\div\frac{\sum_{a\geq R_{New}\land c\in W}E_{(s,a,c,y)}+\sum_{a\geq R_{New}\land c\in R}E_{(s,a,c,y)}}{1+\frac{\sum_{a\geq R_{Cur}\land c\in W}E_{(s,a,c,y)}}{\sum_{a\geq R_{Cur}\land c\in R}E_{(s,a,c,y)}}}\\
   =&\sum_{a\geq R_{Cur}\land c\in W}E_{(s,a,c,y)}\div \sum_{a\geq R_{Cur}\land c\in R}E_{(s,a,c,y)}
   \end{aligned}$

2. 调整前后，新的退休年龄之前，之后的人口总数不变。证明如下：

   $\begin{aligned}
   &\sum_{a<R_{New}\land c\in W}E_{(s,a,c,y)}\times R_1+ \sum_{a<R_{New}\land c\in R}E_{(s,a,c,y)}\times R_2\\
   =&\frac{\sum_{a<R_{New}\land c\in W}E_{(s,a,c,y)}+\sum_{a<R_{New}\land c\in R}E_{(s,a,c,y)}}{1+\frac{\sum_{a<R_{Cur}\land c\in R}E_{(s,a,c,y)}}{\sum_{a<R_{Cur}\land c\in W}E_{(s,a,c,y)}}}+\frac{\sum_{a<R_{New}\land c\in W}E_{(s,a,c,y)}+\sum_{a<R_{New}\land c\in R}E_{(s,a,c,y)}}{1+\frac{\sum_{a<R_{Cur}\land c\in W}E_{(s,a,c,y)}}{\sum_{a<R_{Cur}\land c\in R}E_{(s,a,c,y)}}}\\
   =&\left(\sum_{a<R_{Cur}\land c\in W}E_{(s,a,c,y)}+\sum_{a<R_{Cur}\land c\in R}E_{(s,a,c,y)}\right)\frac{\sum_{a<R_{New}\land c\in W}E_{(s,a,c,y)}+\sum_{a<R_{New}\land c\in R}E_{(s,a,c,y)}}{\sum_{a<R_{Cur}\land c\in W}E_{(s,a,c,y)}+\sum_{a<R_{Cur}\land c\in R}E_{(s,a,c,y)}}\\
   =&\sum_{a<R_{New}\land c\in W}E_{(s,a,c,y)}+\sum_{a<R_{New}\land c\in R}E_{(s,a,c,y)}\\\\
   &\sum_{a\geq R_{New}\land c\in W}E_{(s,a,c,y)}\times R_3+ \sum_{a\geq R_{New}\land c\in R}E_{(s,a,c,y)}\times R_4\\
   =&\frac{\sum_{a\geq R_{New}\land c\in W}E_{(s,a,c,y)}+\sum_{a\geq R_{New}\land c\in R}E_{(s,a,c,y)}}{1+\frac{\sum_{a\geq R_{Cur}\land c\in R}E_{(s,a,c,y)}}{\sum_{a\geq R_{Cur}\land c\in W}E_{(s,a,c,y)}}}+\frac{\sum_{a\geq R_{New}\land c\in W}E_{(s,a,c,y)}+\sum_{a\geq R_{New}\land c\in R}E_{(s,a,c,y)}}{1+\frac{\sum_{a\geq R_{Cur}\land c\in W}E_{(s,a,c,y)}}{\sum_{a\geq R_{Cur}\land c\in R}E_{(s,a,c,y)}}}\\
   =&\left(\sum_{a\geq R_{Cur}\land c\in R}E_{(s,a,c,y)}+\sum_{a\geq R_{Cur}\land c\in W}E_{(s,a,c,y)}\right)\frac{\sum_{a\geq R_{New}\land c\in W}E_{(s,a,c,y)}+\sum_{a\geq R_{New}\land c\in R}E_{(s,a,c,y)}}{\sum_{a\geq R_{Cur}\land c\in W}E_{(s,a,c,y)}+\sum_{a\geq R_{Cur}\land c\in R}E_{(s,a,c,y)}}\\
   =&\sum_{a\geq R_{New}\land c\in W}E_{(s,a,c,y)}+\sum_{a\geq R_{New}\land c\in R}E_{(s,a,c,y)}
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
2. $E_{(s,a,c,y)}$ 代表该性别，年龄，人员类别，预测年度下[预测人口数量](#人口预测)
3. $ACCT_{(s,a,c,y)},FUNT_{(s,a,c,y)}$ 分别代表该性别，年龄，人员类别，预测年度个账缴费和基金缴费
4. $Ave_S(c,y),Ave_I(c,y)$ 分别代表社平工资和人均可支配收入，详见[筹资参数](#筹资参数)
5. $ACCT\_TOT_{(s,a,c)},FUND\_TOT_{(s,a,c)}$分别代表该性别，年龄，人员类别下个账，基金缴费占社平工资/人均可支配收入的比值，从[参数表](#参数表)中读取

#### 830

由于入参及符号较多，故做以下定义：

1. $s,a,c,y$ 分别代表性别，年龄，人员类别以及预测年度
2. $E_{(s,a,c,y)}$ 代表该性别，年龄，人员类别，预测年度下预测人口数量
3. $I[0]_{(c,y)}\sim I[8]_{(c,y)}$ 分别代表用户输入的：
   |定义|
   |-|
   |人均个人缴费基数|
   |人均公司缴费基数|
   |个人缴费比例|
   |公司缴费比例|
   |个人缴费进个人账户比例|
   |公司缴费进个人账户比例|
   |人均统筹转个人账户缴费基数|
   |统筹转个人账户缴费比例|
   |居民缴费平均值|

4. 同理 $P[0]_{(s,a,c)}\sim P[1]_{(s,a,c)}$ 分别代表以下参数：
   |定义|
   |-|
   |个人账户收入|
   |统筹账户收入|
定义特定性别，年龄，人员类别，预测年度下人均个人缴费（ $Id_{(s,a,c,y)}$ ）、公司缴费（ $Cp_{(s,a,c,y)}$ ）、统筹转个帐金额（ $Tr_{(s,a,c,y)}$ ）和居民缴费（ $Cz_{(s,a,c,y)}$ ）分别为：

$\begin{aligned}
Id_{(s,a,c,y)}&=I[0]_{(c,y)}\times I[2]_{(c,y)}\\
Cp_{(s,a,c,y)}&=I[1]_{(c,y)}\times I[3]_{(c,y)}\\
Tr_{(s,a,c,y)}&=I[6]_{(c,y)}\times I[7]_{(c,y)}\\
Cz_{(s,a,c,y)}&=I[8]_{(c,y)}
\end{aligned}$

进一步有特定性别，年龄，人员类别，预测年度下个账缴费 $ACCT_{(s,a,c,y)}$ 以及基金缴费 $FUNT_{(s,a,c,y)}$ 如下：

$\begin{aligned}
ACCT_{(s,a,c,y)}&=\begin{cases}
   0&c\in C\\
   P[0]_{(s,a,c)}\times E_{(s,a,c,y)}\times \left(Id_{(s,a,c,y)}\times I[4]_{(c,y)}+Cp_{(s,a,c)}\times I[5]_{(c,y)}\right)&c\in W\\
   P[0]_{(s,a,c)}\times E_{(s,a,c,y)}\times Tr_{(s,a,c,y)}& c\in R
\end{cases}\\
FUNT_{(s,a,c,y)}&=\begin{cases}
   P[1]_{(s,a,c)}\times E_{(s,a,c,y)}\times Cz_{(s,a,c,y)} & c\in C\\
   P[1]_{(s,a,c)}\times E_{(s,a,c,y)}\times \left(Id_{(s,a,c,y)}\times (1-I[4]_{(c,y)})+Cp_{(s,a,c)}\times (1-I[5]_{(c,y)})\right)& c\in W\\
   P[1]_{(s,a,c)}\times E_{(s,a,c,y)}\times \left(Id_{(s,a,c,y)}+Cp_{(s,a,c,y)}-Tr_{(s,a,c,y)}\right)& c\in R\\
\end{cases}
\end{aligned}$

### 费用计算

#### 715

作以下定义：

1. $s,a,c,y,t$ 分别代表性别，年龄，人员类别，预测年度以及就诊类别
2. $E_{(s,a,c,y)}$ 代表该性别，年龄，人员类别，预测年度下预测人口数量
3. $I[0]_{(y)}, I[1]_{(y)}$ 分别代表715输入中“GDP”和”GDP_IR“
4. $C[0]_{(s,a,c)}\sim C[3]_{(s,a,c)}$ 分别代表参数表中：
   |定义|
   |-|
   |人均就诊次数|
   |次均费用|
   |次均医保支付|
   |次均统筹支付|
5. $R_I[i]$ 表示配置参数中数组“R_CLaim_Input”的第 $i$ 位

定义公式：

$\begin{aligned}
G(y)&=\left(\frac{-2.57326968\times 10^{-4}\times I[0]_{(y)}\times R_I[0]\times 10^{-8}+112.493307}{100}\right)^{y-y_0}\\
L(y)&=\prod_{y'=y_0}^y\left(1+I[1]_{(y')}\times R_I[1]\right)
\end{aligned}$

则有特定性别，年龄，人员类别，预测年度下就诊次数（ $Ocur_{(s,a,c,y)}$ ），总费用（ $Tchr_{(s,a,c,y)}$ ），可报销费用（ $Cchr_{(s,a,c,y)}$ ），实际报销费用（ $Pchr_{(s,a,c,y)}$ ）入下：

$\begin{aligned}
   Ocur_{(s,a,c,y,t)}&=E_{(s,a,c,y)}\times C[0]_{(s,a,c,t)}\\
   Tchr_{(s,a,c,y,t)}&=Ocur_{(s,a,c,y,t)}\times \left(C[1]_{(s,a,c,t)}\times \left(\frac{(IC[1]_{(s,a,c,t)}\times R_P[1])^{y-y_0}}{G(y)}\right)^{\frac{1}{10}}\right)\times L(y)\\
   Cchr_{(s,a,c,y,t)}&=Tchr_{(s,a,c,y,t)}\times C[2]_{(s,a,c,t)}\\
   Pchr_{(s,a,c,y,t)}&=Cchr_{(s,a,c,y,t)}\times C[3]_{(s,a,c,t)}
\end{aligned}$

#### 830

作以下定义：

1. $s,a,c,y$ 分别代表性别，年龄，人员类别以及预测年度
2. $E_{(s,a,c,y)}$ 代表该性别，年龄，人员类别，预测年度下预测人口数量
3. $M[0]_{t,y}\sim M[3]_{y}$ 代表830用户输入中的：
   |定义|
   |-|
   |就诊次数增长率|
   |次均费用增长率|
   |医保支付增长率|
   |统筹支付增长率|
4. $C[0]_{(s,a,c)}\sim C[3]_{(s,a,c)}$ 分别代表参数表中：
   |定义|
   |-|
   |人均就诊次数|
   |次均费用|
   |次均医保支付|
   |次均统筹支付|
5. $R_I[i]$ 表示配置参数中数组“R_CLaim_Input”的第 $i$ 位

则有特定性别，年龄，人员类别，预测年度下就诊次数（ $Ocur_{(s,a,c,y)}$ ），总费用（ $Tchr_{(s,a,c,y)}$ ），可报销费用（ $Cchr_{(s,a,c,y)}$ ），实际报销费用（ $Pchr_{(s,a,c,y)}$ ）入下：

$\begin{aligned}
   Ocur_{(s,a,c,y,t)}&=E_{(s,a,c,y)}\times\left(C[0]_{(s,a,c,t)}\times\prod_{y'=y_0}^y(1+M_{t,y}\times R_I[0])\right)\\
   Tchr_{(s,a,c,y,t)}&=Ocur_{(s,a,c,y,t)}\times \left(C[1]_{(s,a,c,t)}\times\prod_{y'=y_0}^y(1+M_{t,y}\times R_I[1])\right)\\
   Cchr_{(s,a,c,y,t)}&=Tchr_{(s,a,c,y,t)}\times \left(C[2]_{(s,a,c,t)}\times\prod_{y'=y_0}^y(1+M_{t,y}\times R_I[2])\right)\\
   Pchr_{(s,a,c,y,t)}&=Cchr_{(s,a,c,y,t)}\times \left(C[3]_{(s,a,c,t)}\times\prod_{y'=y_0}^y(1+M_{t,y}\times R_I[3])\right)
\end{aligned}$