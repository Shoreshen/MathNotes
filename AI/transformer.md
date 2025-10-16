# Attention

## Self Attention

### 作用

对于一组向量生成另一组向量

### 计算

#### 前提定义

1. 输入向量为 $A=\left[\begin{matrix}\vec{a}_1\\\vec{a}_2\\...\\\vec{a}_n\end{matrix}\right]$ 满足对于任意 $1\leq i\leq n$ 均有 $\dim(\vec{a_i})=d_a$
2. 定义矩阵 $W_Q=\left[\begin{matrix}\vec{q}_1&\vec{q}_2&...&\vec{q}_{d_k}\end{matrix}\right]=\left[\begin{matrix}q_{1,1}&q_{1,2}&...&q_{1,d_k}\\q_{2,1}&q_{2,2}&...&q_{2,d_k}\\...&...&...&...&\\q_{d_a,1}&q_{d_a,2}&...&q_{d_a,d_k}\end{matrix}\right],W_K=\left[\begin{matrix}\vec{k}_1&\vec{k}_2&...&\vec{k}_{d_k}\end{matrix}\right]=\left[\begin{matrix}k_{1,1}&k_{1,2}&...&k_{1,d_k}\\k_{2,1}&k_{1,2}&...&k_{1,d_k}\\...&...&...&...&\\k_{d_a,1}&k_{d_a,2}&...&k_{d_a,d_k}\end{matrix}\right],W_V=\left[\begin{matrix}\vec{v}_1&\vec{v}_2&...&\vec{v}_{d_k}\end{matrix}\right]=\left[\begin{matrix}v_{1,1}&v_{1,2}&...&v_{1,d_k}\\v_{2,1}&v_{2,2}&...&v_{2,d_k}\\...&...&...&...&\\v_{d_a,1}&v_{d_a,2}&...&v_{d_a,d_k}\end{matrix}\right]$

#### 计算 $\vec{q}',\vec{k}',\vec{v}'$

<a id="calc"></a>

1. $\left[\begin{matrix}\vec{q}'_1\\\vec{q}'_2\\...\\\vec{q}'_n\end{matrix}\right]=\left[\begin{matrix}\vec{a}_1\\\vec{a}_2\\...\\\vec{a}_n\end{matrix}\right]\left[\begin{matrix}\vec{q}_1&\vec{q}_2&...&\vec{q}_{d_k}\end{matrix}\right]=\left[\begin{matrix}\vec{a}_1\cdot\vec{q}_1&\vec{a}_1\cdot\vec{q}_2&...&\vec{a}_1\cdot\vec{q}_{d_k}\\\vec{a}_2\cdot\vec{q}_1&\vec{a}_2\cdot\vec{q}_2&...&\vec{a}_2\cdot\vec{q}_{d_k}\\...&...&...&...\\\vec{a}_n\cdot\vec{q}_1&\vec{a}_n\cdot\vec{q}_2&...&\vec{a}_n\cdot\vec{q}_{d_k}\end{matrix}\right]$
2. $\left[\begin{matrix}\vec{k}'_1\\\vec{k}'_2\\...\\\vec{k}'_n\end{matrix}\right]=\left[\begin{matrix}\vec{a}_1\\\vec{a}_2\\...\\\vec{a}_n\end{matrix}\right]\left[\begin{matrix}\vec{k}_1&\vec{k}_2&...&\vec{k}_{d_k}\end{matrix}\right]=\left[\begin{matrix}\vec{a}_1\cdot\vec{k}_1&\vec{a}_1\cdot\vec{k}_2&...&\vec{a}_1\cdot\vec{k}_{d_k}\\\vec{a}_2\cdot\vec{k}_1&\vec{a}_2\cdot\vec{k}_2&...&\vec{a}_2\cdot\vec{k}_{d_k}\\...&...&...&...\\\vec{a}_n\cdot\vec{k}_1&\vec{a}_n\cdot\vec{k}_2&...&\vec{a}_n\cdot\vec{k}_{d_k}\end{matrix}\right]$
3. $\left[\begin{matrix}\vec{v}'_1\\\vec{v}'_2\\...\\\vec{v}'_n\end{matrix}\right]=\left[\begin{matrix}\vec{a}_1\\\vec{a}_2\\...\\\vec{a}_n\end{matrix}\right]\left[\begin{matrix}\vec{v}_1&\vec{v}_2&...&\vec{v}_{d_k}\end{matrix}\right]=\left[\begin{matrix}\vec{a}_1\cdot\vec{v}_1&\vec{a}_1\cdot\vec{v}_2&...&\vec{a}_1\cdot\vec{v}_{d_k}\\\vec{a}_2\cdot\vec{v}_1&\vec{a}_2\cdot\vec{v}_2&...&\vec{a}_2\cdot\vec{v}_{d_k}\\...&...&...&...\\\vec{a}_n\cdot\vec{v}_1&\vec{a}_n\cdot\vec{v}_2&...&\vec{a}_n\cdot\vec{v}_{d_k}\end{matrix}\right]$

#### 计算相关系数 $\alpha_{i,j}$

$\left[\begin{matrix}\vec{q}'_1\\\vec{q}'_2\\...\\\vec{q}'_n\end{matrix}\right]\left[\begin{matrix}\vec{k}'_1\\\vec{k}'_2\\...\\\vec{k}'_n\end{matrix}\right]^T=\left[\begin{matrix}\vec{q}'_1\cdot\vec{k}'_1&\vec{q}'_1\cdot\vec{k}'_2&...&\vec{q}'_1\cdot\vec{k}'_n\\\vec{q}'_2\cdot\vec{k}'_1&\vec{q}'_2\cdot\vec{k}'_2&...&\vec{q}'_2\cdot\vec{k}'_n\\...&...&...&...\\\vec{q}'_n\cdot\vec{k}'_1&\vec{q}'_n\cdot\vec{k}'_2&...&\vec{q}'_n\cdot\vec{k}'_n\end{matrix}\right]=\left[\begin{matrix}\alpha_{1,1}&\alpha_{1,2}&...&\alpha_{1,n}\\\alpha_{2,1}&\alpha_{2,2}&...&\alpha_{2,n}\\...&...&...&...\\\alpha_{n,1}&\alpha_{n,2}&...&\alpha_{n,n}\end{matrix}\right]$

其中 $\alpha_{i,j}$ 可视为 $\vec{a}_i$ 和 $\vec{a}_j$ 的相关系数

#### Softmax

$\left[\begin{matrix}\alpha'_{1,1}&\alpha'_{1,2}&...&\alpha'_{1,n}\\\alpha'_{2,1}&\alpha'_{2,2}&...&\alpha'_{2,n}\\...&...&...&...\\\alpha'_{n,1}&\alpha'_{n,2}&...&\alpha'_{n,n}\end{matrix}\right]=\left[\begin{matrix}\frac{e^{\alpha_{1,1}}}{\sum_{i=1}^ne^{\alpha_{1,i}}}&\frac{e^{\alpha_{1,2}}}{\sum_{i=1}^ne^{\alpha_{1,i}}}&...&\frac{e^{\alpha_{1,n}}}{\sum_{i=1}^ne^{\alpha_{1,i}}}\\\frac{e^{\alpha_{2,1}}}{\sum_{i=1}^ne^{\alpha_{2,i}}}&\frac{e^{\alpha_{2,2}}}{\sum_{i=1}^ne^{\alpha_{2,i}}}&...&\frac{e^{\alpha_{2,n}}}{\sum_{i=1}^ne^{\alpha_{2,i}}}\\...&...&...&...\\\frac{e^{\alpha_{n,1}}}{\sum_{i=1}^ne^{\alpha_{n,i}}}&\frac{e^{\alpha_{n,2}}}{\sum_{i=1}^ne^{\alpha_{n,i}}}&...&\frac{e^{\alpha_{n,n}}}{\sum_{i=1}^ne^{\alpha_{n,i}}}\end{matrix}\right]$

#### 输出

$O=\left[\begin{matrix}\vec{o}_1\\\vec{o}_2\\...\\\vec{o}_n\end{matrix}\right]=\left[\begin{matrix}\vec{v}'_1\\\vec{v}'_2\\...\\\vec{v}'_n\end{matrix}\right]\left[\begin{matrix}\alpha'_{1,1}&\alpha'_{1,2}&...&\alpha'_{1,n}\\\alpha'_{2,1}&\alpha'_{2,2}&...&\alpha'_{2,n}\\...&...&...&...\\\alpha'_{n,1}&\alpha'_{n,2}&...&\alpha'_{n,n}\end{matrix}\right]
=\left[\begin{matrix}\vec{v}'_1\cdot\alpha'_{1,1}+\vec{v}'_2\cdot\alpha'_{2,1}+...+\vec{v}'_n\cdot\alpha'_{n,1}\\\vec{v}'_1\cdot\alpha'_{1,2}+\vec{v}'_2\cdot\alpha'_{2,2}+...+\vec{v}'_n\cdot\alpha'_{n,2}\\...\\\vec{v}'_1\cdot\alpha'_{1,n}+\vec{v}'_2\cdot\alpha'_{2,n}+...+\vec{v}'_n\cdot\alpha'_{n,n}\end{matrix}\right]
=\left[\begin{matrix}\sum_{i=1}^n\alpha_{i,1}\left(\vec{a}_i\cdot\vec{v}_1\right)&\sum_{i=1}^n\alpha_{i,1}\left(\vec{a}_i\cdot\vec{v}_2\right)&...&\sum_{i=1}^n\alpha_{i,1}\left(\vec{a}_i\cdot\vec{v}_{d_k}\right)\\\sum_{i=1}^n\alpha_{i,2}\left(\vec{a}_i\cdot\vec{v}_1\right)&\sum_{i=1}^n\alpha_{i,2}\left(\vec{a}_i\cdot\vec{v}_2\right)&...&\sum_{i=1}^n\alpha_{i,2}\left(\vec{a}_i\cdot\vec{v}_{d_k}\right)\\...&...&...&...\\\sum_{i=1}^n\alpha_{i,n}\left(\vec{a}_i\cdot\vec{v}_1\right)&\sum_{i=1}^n\alpha_{i,n}\left(\vec{a}_i\cdot\vec{v}_2\right)&...&\sum_{i=1}^n\alpha_{i,n}\left(\vec{a}_i\cdot\vec{v}_{d_k}\right)\end{matrix}\right]$

对于输出结果某个维度，设第 $i$ 个向量的，若与向量 $l$ 的[关系系数](#计算相关系数)较大，则可得 $\alpha_{i,l}$ 较大，从而 $\vec{o}_i$ 更容易被 $\vec{v}_l$ 影响，即 $\vec{o}_i$ 更容易与 $\vec{v}_l$ 相似

输出结果为 $n\times d_k$ 维度矩阵。

## Masked Self Attention

### 作用

对于一组向量生成另一组向量，并且对于向量中的第 $i$ 个向量，只能使用前 $i$ 个向量生成

### 计算

#### 前提定义

1. 输入向量为 $A=\left[\begin{matrix}\vec{a}_1\\\vec{a}_2\\...\\\vec{a}_n\end{matrix}\right]$ 满足对于任意 $1\leq i\leq n$ 均有 $\dim(\vec{a_i})=d_a$
2. 定义矩阵 $W_Q=\left[\begin{matrix}\vec{q}_1&\vec{q}_2&...&\vec{q}_{d_k}\end{matrix}\right]=\left[\begin{matrix}q_{1,1}&q_{1,2}&...&q_{1,d_k}\\q_{2,1}&q_{2,2}&...&q_{2,d_k}\\...&...&...&...&\\q_{d_a,1}&q_{d_a,2}&...&q_{d_a,d_k}\end{matrix}\right],W_K=\left[\begin{matrix}\vec{k}_1&\vec{k}_2&...&\vec{k}_{d_k}\end{matrix}\right]=\left[\begin{matrix}k_{1,1}&k_{1,2}&...&k_{1,d_k}\\k_{2,1}&k_{1,2}&...&k_{1,d_k}\\...&...&...&...&\\k_{d_a,1}&k_{d_a,2}&...&k_{d_a,d_k}\end{matrix}\right],W_V=\left[\begin{matrix}\vec{v}_1&\vec{v}_2&...&\vec{v}_{d_k}\end{matrix}\right]=\left[\begin{matrix}v_{1,1}&v_{1,2}&...&v_{1,d_k}\\v_{2,1}&v_{2,2}&...&v_{2,d_k}\\...&...&...&...&\\v_{d_a,1}&v_{d_a,2}&...&v_{d_a,d_k}\end{matrix}\right]$

#### 计算

同[Self Attention步骤](#calc)。

#### 计算相关系数 $\alpha_{i,j}$

$\left[\begin{matrix}\vec{q}'_1\\\vec{q}'_2\\...\\\vec{q}'_n\end{matrix}\right]\left[\begin{matrix}\vec{k}'_1\\\vec{k}'_2\\...\\\vec{k}'_n\end{matrix}\right]^T=\left[\begin{matrix}\vec{q}'_1\cdot\vec{k}'_1&-1\times10^{999}&...&-1\times10^{999}\\\vec{q}'_2\cdot\vec{k}'_1&\vec{q}'_2\cdot\vec{k}'_2&...&-1\times10^{999}\\...&...&...&...\\\vec{q}'_n\cdot\vec{k}'_1&\vec{q}'_n\cdot\vec{k}'_2&...&\vec{q}'_n\cdot\vec{k}'_n\end{matrix}\right]=\left[\begin{matrix}\alpha_{1,1}&\alpha_{1,2}&...&\alpha_{1,n}\\\alpha_{2,1}&\alpha_{2,2}&...&\alpha_{2,n}\\...&...&...&...\\\alpha_{n,1}&\alpha_{n,2}&...&\alpha_{n,n}\end{matrix}\right]$

这里对于任意 $\alpha_{i,j}$ 满足 $j>i$ 均有 $\alpha_{i,j}=-1\times10^{999}$

#### Softmax

$\left[\begin{matrix}\alpha'_{1,1}&\alpha'_{1,2}&...&\alpha'_{1,n}\\\alpha'_{2,1}&\alpha'_{2,2}&...&\alpha'_{2,n}\\...&...&...&...\\\alpha'_{n,1}&\alpha'_{n,2}&...&\alpha'_{n,n}\end{matrix}\right]=\left[\begin{matrix}\frac{e^{\alpha_{1,1}}}{\sum_{i=1}^ne^{\alpha_{1,i}}}&0&...&0\\\frac{e^{\alpha_{2,1}}}{\sum_{i=1}^ne^{\alpha_{2,i}}}&\frac{e^{\alpha_{2,2}}}{\sum_{i=1}^ne^{\alpha_{2,i}}}&...&0\\...&...&...&...\\\frac{e^{\alpha_{n,1}}}{\sum_{i=1}^ne^{\alpha_{n,i}}}&\frac{e^{\alpha_{n,2}}}{\sum_{i=1}^ne^{\alpha_{n,i}}}&...&\frac{e^{\alpha_{n,n}}}{\sum_{i=1}^ne^{\alpha_{n,i}}}\end{matrix}\right]$

由于上一步中对于任意 $\alpha_{i,j}$ 满足 $j>i$ 均有 $\alpha_{i,j}=-1\times10^{999}$，故 $e^{-1\times10^{999}}$ 十分接近 $0$ ，故 $\alpha'_{i,j}$ 可视为 $0$

#### 输出

同[Self Attention步骤](#输出)。

即 $O=\left[\begin{matrix}\vec{o}_1\\\vec{o}_2\\...\\\vec{o}_n\end{matrix}\right]=\left[\begin{matrix}\vec{v}'_1\\\vec{v}'_2\\...\\\vec{v}'_n\end{matrix}\right]\left[\begin{matrix}\alpha'_{1,1}&0&...&0\\\alpha'_{2,1}&\alpha'_{2,2}&...&0\\...&...&...&...\\\alpha'_{n,1}&\alpha'_{n,2}&...&\alpha'_{n,n}\end{matrix}\right]
=\left[\begin{matrix}\vec{v}'_1\cdot\alpha'_{1,1}\\\vec{v}'_1\cdot\alpha'_{1,2}+\vec{v}'_2\cdot\alpha'_{2,2}\\...\\\vec{v}'_1\cdot\alpha'_{1,n}+\vec{v}'_2\cdot\alpha'_{2,n}+...+\vec{v}'_n\cdot\alpha'_{n,n}\end{matrix}\right]
=\left[\begin{matrix}\sum_{i=1}^1\alpha_{i,1}\left(\vec{a}_i\cdot\vec{v}_1\right)&\sum_{i=1}^1\alpha_{i,1}\left(\vec{a}_i\cdot\vec{v}_2\right)&...&\sum_{i=1}^1\alpha_{i,1}\left(\vec{a}_i\cdot\vec{v}_{d_k}\right)\\\sum_{i=1}^2\alpha_{i,2}\left(\vec{a}_i\cdot\vec{v}_1\right)&\sum_{i=1}^2\alpha_{i,2}\left(\vec{a}_i\cdot\vec{v}_2\right)&...&\sum_{i=1}^2\alpha_{i,2}\left(\vec{a}_i\cdot\vec{v}_{d_k}\right)\\...&...&...&...\\\sum_{i=1}^n\alpha_{i,n}\left(\vec{a}_i\cdot\vec{v}_1\right)&\sum_{i=1}^n\alpha_{i,n}\left(\vec{a}_i\cdot\vec{v}_2\right)&...&\sum_{i=1}^n\alpha_{i,n}\left(\vec{a}_i\cdot\vec{v}_{d_k}\right)\end{matrix}\right]$

## Muli-Head Self Attention

### 作用

对于一组向量生成另一组向量，基于[Self Attention](#self-attention)的改进，认为相关性有很多方面（例如种类，尺寸等）

故需要多个QKV矩阵，最后将结果拼接

### 计算

#### 前提定义

1. 输入向量为 $A=\left[\begin{matrix}\vec{a}_1\\\vec{a}_2\\...\\\vec{a}_n\end{matrix}\right]$ 满足对于任意 $1\leq i\leq n$ 均有 $\dim(\vec{a_i})=d_a$
2. 与[前提定义](#前提定义)相同，定义多组QKV矩阵 $W_{Q_i},W_{K_i},W_{V_i}$ 其中 $1\leq i\leq h$，$h$ 为头数
3. 拼接矩阵 $W_C=\left[\begin{matrix}c_{1,1}&c_{1,2}&...&c_{1,d_c}\\c_{2,1}&c_{2,2}&...&c_{2,d_c}\\...\\c_{d_k\times h,1}&c_{d_k\times h,2}&...&c_{d_k\times h,d_c}\end{matrix}\right]$ 若要输入输出矩阵维度不变，则需满足 $d_c=d_a$

#### 输出结果

1. 根据[Self Attention步骤](#计算)对每一个 $1\leq i\leq h$ 计算得到 $O_i=\left[\begin{matrix}\vec{o}_{i,1}\\\vec{o}_{i,2}\\...\\\vec{o}_{i,n}\end{matrix}\right]=\left[\begin{matrix}o_{i,1,1}&o_{i,1,2}&...&o_{i,1,d_k}\\o_{i,2,1}&o_{i,2,2}&...&o_{i,2,d_k}\\...\\o_{i,n,1}&o_{i,n,2}&...&o_{i,n,d_k}\end{matrix}\right]$
2. 拼接成 $O=\left[\begin{matrix}\vec{o}_{1,1}&\vec{o}_{1,2}&...&\vec{o}_{1,h}\\\vec{o}_{2,1}&\vec{o}_{2,2}&...&\vec{o}_{2,h}\\...\\\vec{o}_{n,1}&\vec{o}_{n,2}&...&\vec{o}_{n,h}\end{matrix}\right]=\left[\begin{matrix}o_{1,1,1}&o_{1,1,2}&...&o_{1,1,d_k}&o_{2,1,1}&...&o_{h,1,d_k}\\o_{1,2,1}&o_{1,2,2}&...&o_{1,2,d_k}&o_{2,2,1}&...&o_{h,2,d_k}\\...\\o_{1,n,1}&o_{1,n,2}&...&o_{1,n,d_k}&o_{2,n,1}&...&o_{h,n,d_k}\end{matrix}\right]=\left[\begin{matrix}o'_{1,1}&o'_{1,2}&...&o'_{1,d_k\times h}\\o'_{2,1}&o'_{2,2}&...&o'_{2,d_k\times h}\\...\\o'_{n,1}&o'_{n,2}&...&o'_{n,d_k\times h}\end{matrix}\right]$
3. 与 $W_C$ 相乘得到 $O'=OW_C=\left[\begin{matrix}\vec{o}_{1}\\\vec{o}_{2}\\...\\\vec{o}_{n}\end{matrix}\right]=\left[\begin{matrix}\sum_{i=1}^{d_k\times h}o'_{1,i}c_{i,1}&\sum_{i=1}^{d_k\times h}o'_{1,i}c_{i,2}&...&\sum_{i=1}^{d_k\times h}o'_{1,i}c_{i,d_c}\\\sum_{i=1}^{d_k\times h}o'_{2,i}c_{i,1}&\sum_{i=1}^{d_k\times h}o'_{2,i}c_{i,2}&...&\sum_{i=1}^{d_k\times h}o'_{2,i}c_{i,d_c}\\...\\\sum_{i=1}^{d_k\times h}o'_{n,i}c_{i,1}&\sum_{i=1}^{d_k\times h}o'_{n,i}c_{i,2}&...&\sum_{i=1}^{d_k\times h}o'_{n,i}c_{i,d_c}\end{matrix}\right]$

输出结果为 $n\times d_c$ 维度矩阵。

## Masked Muli-Head Self Attention

是[Masked Self Attention](#masked-self-attention)的[Muli-Head Self Attention](#muli-head-self-attention)版本

# Transformer

## Positional Encoding

### 作用

对于输入的序列，为每个位置增加一个向量，使得模型能够区分不同位置的向量

### 计算

$PE_i=\begin{cases}\sin()&i\mod 2=0\\\cos&i\mod 2 = 1\end{cases}$