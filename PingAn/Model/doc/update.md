[TOC]

# 概览

本次更新主要包含：
1. [ETL](#etl)，然后调用程序接口，参数表格会由程序计算。相比之前所需要的数据复杂度极大降低。
2. [表格结构](#表格结构)：在无需改变表格结构的前提下，废弃了一些列与表格。
3. [计算方法](#计算方法)：主要对人口计算，医疗通胀，费用计算做出更新。

# ETL

## 所需数据

### 参保与筹资信息

|定义|说明|
|-|-|
|年度|用于sum的维度，取得数据的年度|
|性别|用于sum的维度，1=男性，2=女性，3=其他|
|年龄|用于sum的维度，由于国家颁布生命表到105岁，故只统计0-105岁|
|人员类别|用于sum的维度，1=居民，2=少年儿童及大学生，R=退休及相关，W=在职及相关|
|人口数量|根据sum维度加和的人口数量|
|个人账户缴费金额|根据sum维度加和的个人账户缴费金额|
|统筹账户缴费金额|根据sum维度加和的统筹账户缴费金额|

### 理赔信息

|定义|说明|
|-|-|
|年度|用于sum的维度，取得数据的年度|
|性别|用于sum的维度，1=男性，2=女性，3=其他|
|年龄|用于sum的维度，由于国家颁布生命表到105岁，故只统计0-105岁|
|人员类别|用于sum的维度，1=居民，2=少年儿童及大学生，R=退休及相关，W=在职及相关|
|就诊类别|用于sum的维度，1=门诊，2=住院|
|就诊次数|根据sum维度加和的就诊次数|
|医疗费总额|根据sum维度，就诊医疗费的加和|
|个人帐户支出总额|根据sum维度加和的个人账户支出|
|统筹帐户支出总额|根据sum维度加和的统筹账户支出|

### 历史人均收入信息

|定义|说明|
|-|-|
|年度|收入信息对应的年度|
|社会平均工资|相关统计机构统计的在职职工人均工资|
|人均可支配收入|相关统计机构统计的人均可支配收入|

### 死亡率

|定义|说明|
|-|-|
|性别|维度，1=男性，2=女性，3=其他|
|年龄|维度，0-105岁|
|死亡率|该年龄段一年内的死亡概率|

### 注意事项

1. [理赔](#理赔信息)与[参保](#参保与筹资信息)信息表格须采用统计完全的年度，半年或一季度的信息会影响计算结果
2. 参数计算跨度从[参保](#参保与筹资信息)输入的最小年度到最大年度
3. 须保证参数计算跨度的年度内有有效[收入](#历史人均收入信息)信息
4. 必须保证所有性别，年龄均有有效的[死亡率](#死亡率)
5. 所有[理赔](#理赔信息)与[参保](#参保与筹资信息)信息的维度必须有相互对应（如报内存错误，很大可能维度不对应）
6. 由于参数定义以及取数逻辑变更，<span style="color:red">之前计算的参数需要重新计算</span>，方可得出有效模型结果

## 操作流程

1. 确保目标数据库中有以下类似的参数表格及列
    |表格名|列名|
    |-|-|
    |modl_para_pol|gend|
    |modl_para_pol|age|
    |modl_para_pol|psn_type|
    |modl_para_pol|pop|
    |modl_para_fee|gend|
    |modl_para_fee|age|
    |modl_para_fee|psn_type|
    |modl_para_fee|mdtrt_type|
    |modl_para_fee|mdtrt_rate|
    |modl_para_fee|avg_fee|
    |modl_para_fee|covr_prop|
    |modl_para_fee|reim_rat|
    |modl_para_rat|gend|
    |modl_para_rat|age|
    |modl_para_rat|psn_type|
    |modl_para_rat|finl_rate|
    |modl_para_rat|acct_prop|
    |modl_para_rat|fund_prop|
2. 调整“Args_LTM.py”中“Ins_Prem”对象中"sql/csv"字段使其满足[参保与筹资信息](#参保与筹资信息)结构要求
3. 调整“Args_LTM.py”中“Claim”对象中"sql/csv"字段使其满足[理赔信息](#理赔信息)结构要求
4. 调整“Args_LTM.py”中“Income”对象中"sql/csv"字段使其满足[收入信息](#历史人均收入信息)结构要求
5. 调整“Args_LTM.py”中“Mort_rate”对象中"sql/csv"字段使其满足[死亡率](#死亡率)结构要求
6. 调整“Args_LTM.py”中“para_fee”，“para_rat_715”，“para_rat_830”使其有有效输出
7. 运行"trail.py"中的"param_calc()"函数

# 表格结构

## 有效的表格信息

经调整后，模型将读取的有效表格及列如下：

|表名|列名|表名|列名|表名|列名|
|-|-|-|-|-|-|
|modl_b_inpt_fee_d|scen_id|modl_inpt_fort_pop_d|scen_id|modl_para_dierat|scen_id|
|modl_b_inpt_fee_d|fort_year|modl_inpt_fort_pop_d|fort_year|modl_para_dierat|gend|
|modl_b_inpt_fee_d|insu_idet|modl_inpt_fort_pop_d|totl_pop|modl_para_dierat|age|
|modl_b_inpt_fee_d|mdtrt_way|modl_inpt_retr_adjm_d||modl_para_dierat|dierat|
|modl_b_inpt_fee_d|mdtrt_rate_grow|modl_inpt_retr_adjm_d|fort_year|modl_a_inpt_fee_d|scen_id|
|modl_b_inpt_fee_d|avg_fee_grow|modl_inpt_retr_adjm_d|gend|modl_a_inpt_fee_d|fort_year|
|modl_b_inpt_fee_d|covr_prop_grow|modl_inpt_retr_adjm_d|retr_age|modl_a_inpt_fee_d|gdp|
|modl_b_inpt_fee_d|reim_rat_grow|modl_a_inpt_clct_d|scen_id|modl_a_inpt_fee_d|gdp_growrat|
|modl_b_inpt_clct_d|scen_id|modl_a_inpt_clct_d|fort_year|modl_para_fee|scen_id|
|modl_b_inpt_clct_d|fort_year|modl_a_inpt_clct_d|insu_idet|modl_para_fee|gend|
|modl_b_inpt_clct_d|insu_idet|modl_a_inpt_clct_d|soca_avesal|modl_para_fee|age|
|modl_b_inpt_clct_d|psn_clctstd|modl_a_inpt_clct_d|soca_avesal_growrat|modl_para_fee|psn_type|
|modl_b_inpt_clct_d|emp_clctstd|modl_a_inpt_clct_d|perpsn_dspo_inc|modl_para_fee|mdtrt_type|
|modl_b_inpt_clct_d|psn_clctprop|modl_a_inpt_clct_d|perpsn_dspo_inc_growrat|modl_para_fee|mdtrt_rate|
|modl_b_inpt_clct_d|emp_clct_rate|modl_a_para_rat_clct|scen_id|modl_para_fee|avg_fee|
|modl_b_inpt_clct_d|psn_acct_fund_clctprop|modl_a_para_rat_clct|gend|modl_para_fee|covr_prop|
|modl_b_inpt_clct_d|emp_acct_fund_clctprop|modl_a_para_rat_clct|age|modl_para_pop|scen_id|
|modl_b_inpt_clct_d|acct_fund_clctstd|modl_a_para_rat_clct|psn_type|modl_para_pop|gend|
|modl_b_inpt_clct_d|acct_fund_clctprop|modl_a_para_rat_clct|finl_rate|modl_para_pop|age|
|modl_b_inpt_clct_d|soca_avesal|modl_a_para_rat_clct|acctfund_prop|modl_para_pop|psn_type|
|modl_b_inpt_clct_d|soca_avesal_growrat|modl_a_para_rat_clct|fund_prop|modl_para_pop|modl_para_pop|
|modl_b_inpt_clct_d|rsdt_clctprop|||||

## 有效参数

经改编后，模型在运行时读取的有效参数为：

|定义|para_codg|
|-|-|
|生育率|M00001001001|
|新生儿男性比例|M00001001002|
|女性生育年龄|M00098001006/M00099001006|
|死亡率调整系数|M00001001000|
|费用增长率用户输入系数|M00099001008/M00098001008|
|人均GDP增长|M00099001010/M00098001010|
|人均卫生费用增长|M00099001011/M00098001011|
|卫生费用占GDP比例|M00099001012/M00098001012|

# 计算方法

## 人口预测

### 已有人口

根据转换率参数计算下一年度，下一岁的人口数量：

$$E_{(s,a+1,c,y+1)}=\left(\sum_{c\in\{C,W,1,2\}}E_{(s,a,c,y)}\right)\times _cR_{(s,a,c)}\times(1-q_{(s,a)}\times q_{adj})$$

上述公式中：
1. $s,a,c,y$ 分别代表性别，年龄，人员类别以及预测年度
2. $E_{(s,a,c,y)}$ 代表该性别，年龄，人员类别，预测年度下的预测人口
3. $_cR_{(s,a,c)}$ 分别为该性别，年龄，人员类别下的[转化率](#最终转化率)
4. $q_{(s,a)}$ 为该性别，年龄下的死亡率
5. $q_{adj}$ 为死亡率调整参数

### 新生儿

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

## 715医疗通胀

### 基本逻辑描述

长期医疗通胀的假设公式为 $(1+人均实际GDP)(1+通胀率)(1+医疗超出部分)-1$

其中 $(1+人均实际GDP)(1+通胀率)-1$ 即人均GDP，文中认为人均GDP是每个人的产出，在医疗上所有的花费应当以此为基础。

<a id = "exxec">医疗超出部分</a>定义为一般人因为医疗科技进步，方法便捷，自身健康愿意花费超出人均GDP增长的部分的收入于医疗上。

文中还有另一个思路，即医疗通胀不可能永远高于人均GDP增长，理由在于GDP产出医疗消费的来源，若医疗通胀一直高于GDP增长，最终会产生消费大于来源的情况。

所以，长期来看 $\frac{人均医疗花费}{人均GDP}$ 超过一定比例医疗通胀就会放缓，最终趋向一个稳定的比例。

故预测中亦设置一固定比例，超过该比例[医疗超出部分]会受到制约。

根据文中表述，该比例目前为人为决定，故此处根据文中内容为当前比例的 $1.25$ 倍，后期可考虑开放给用户。

### 具体公式

#### 基础年度

获取历年数据，包括：

1. 人均GDP：定义为 $G_t$ 其中 $t$ 为年度
2. 人均卫生总费用：定义为 $M_t$ 其中 $t$ 为年度

一般来说与获取的参数数据保持一致，即过去4年的数据。

计算当年平均增长率：

1. 人均GDP增长率，定义为 $\overline{G}_0=\frac{\sum_{t=Y_s}^{Y_e-1}\left(\frac{G_t}{G_{t-1}}-1\right)}{Y_{e}-Y_{s}-1}$
2. 人均卫生费用增长率，定义为 $\overline{M}_0=\frac{\sum_{t=Y_s}^{Y_e-1}\left(\frac{M_t}{M_{t-1}}-1\right)}{Y_{e}-Y_{s}-1}$
3. 卫生费用占GDP比例，定义为 $S_0=\frac{\sum_{t=Y_s}^{Y_e}\left(\frac{M_t}{G_t}-1\right)}{Y_{e}-Y_{s}}$

上述公式中 $Y_s$ 代表历年数据开始年度，相应的 $Y_e$ 代表历年数据结束年度。

#### 预测年度

定义预测年度为 $t$ ，则根据用户输入的上年度GDP增长率 $G^u_{t-1}$ 以及上一年的人均GDP增长率 $\overline{G}_{t-1}$ 以及本年度、上一年度的在保人口数 $E_t,E_{t-1}$ 预估本年度人均GDP $\overline{G}_t$

$$\overline{G}_t=\frac{\frac{GDP_t}{E_t}}{\frac{GDP_{t-1}}{E_{t-1}}}-1=\frac{\frac{GDP_t}{GDP_{t-1}}}{\frac{E_t}{E_{t-1}}}-1=\frac{1+G^u_{t-1}}{E_t/E_{t-1}}-1$$

根据上一年人均卫生费用增长率 $\overline{M}_{t-1}$ 计算本年度卫生费用占GDP比例

$$S_t=S_{t-1}\frac{1+\overline{M}_{t-1}}{1+\overline{G_{t-1}}}$$

根据修正比例阀值 $R$ 以及医疗超出部分 $X$ 计算本年度医疗超出部分

$$X_t=X*\left(1-\left(\frac{\max(0,S_t-R)}{R}\right)^{0.5}\right)$$

此处根据参考文章中的公式计算，其中惩罚参数的次数（0.5，用于放大）依照文中定义。且文中指出该系数一般不应被修改。

最后计算本年度医疗通胀

$$\overline{M}_t=(1+\overline{G}_t)(1+X_t)$$

## 费用计算

#### 715

作以下定义：

1. $s,a,c,y,t$ 分别代表性别，年龄，人员类别，预测年度以及就诊类别
2. $st$ 代表预测开始年度
3. $E_{(s,a,c,y)}$ 代表该性别，年龄，人员类别，预测年度下预测人口数量
4. $I_{(y)}$ 为[医疗通胀](#715医疗通胀)计算所得的通胀率
5. $C[0]_{(s,a,c)}\sim C[3]_{(s,a,c)}$ 分别代表参数表中：
   |定义|
   |-|
   |人均就诊次数|
   |次均费用|
   |次均医保支付|
   |次均统筹支付|
6. $R_I[i]$ 表示配置参数中数组“R_CLaim_Input”的第 $i$ 位

则有特定性别，年龄，人员类别，预测年度下就诊次数（ $Ocur_{(s,a,c,y)}$ ），总费用（ $Tchr_{(s,a,c,y)}$ ），可报销费用（ $Cchr_{(s,a,c,y)}$ ），实际报销费用（ $Pchr_{(s,a,c,y)}$ ）入下：

$\begin{aligned}
   Ocur_{(s,a,c,y,t)}&=E_{(s,a,c,y)}\times C[0]_{(s,a,c,t)}\\
   Tchr_{(s,a,c,y,t)}&=Ocur_{(s,a,c,y,t)}\times \left(C[1]_{(s,a,c,t)}\times\prod_{i=st}^yI_{(i)}\right)\\
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
   |个帐+统筹支付比例增长率|
   |统筹支付占个帐+统筹支付比例增长率|
4. $C[0]_{(s,a,c)}\sim C[3]_{(s,a,c)}$ 分别代表参数表中：
   |定义|
   |-|
   |人均就诊次数|
   |次均费用|
   |次均个帐+统筹支付比例|
   |次均统筹支付占个帐+统筹支付比例|
5. $R_I[i]$ 表示配置参数中数组“R_CLaim_Input”的第 $i$ 位

则有特定性别，年龄，人员类别，预测年度下就诊次数（ $Ocur_{(s,a,c,y)}$ ），总费用（ $Tchr_{(s,a,c,y)}$ ），可报销费用（ $Cchr_{(s,a,c,y)}$ ），实际报销费用（ $Pchr_{(s,a,c,y)}$ ）入下：

$\begin{aligned}
   Ocur_{(s,a,c,y,t)}&=E_{(s,a,c,y)}\times\left(C[0]_{(s,a,c,t)}\times\prod_{y'=y_0}^y(1+M[0]_{t,y}\times R_I[0])\right)\\
   Tchr_{(s,a,c,y,t)}&=Ocur_{(s,a,c,y,t)}\times \left(C[1]_{(s,a,c,t)}\times\prod_{y'=y_0}^y(1+M[1]_{t,y}\times R_I[1])\right)\\
   Cchr_{(s,a,c,y,t)}&=Tchr_{(s,a,c,y,t)}\times \left(C[2]_{(s,a,c,t)}\times\prod_{y'=y_0}^y(1+M[2]_{t,y}\times R_I[2])\right)\\
   Pchr_{(s,a,c,y,t)}&=Cchr_{(s,a,c,y,t)}\times \left(C[3]_{(s,a,c,t)}\times\prod_{y'=y_0}^y(1+M[3]_{t,y}\times R_I[3])\right)
\end{aligned}$