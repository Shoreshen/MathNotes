# LaTeX 公式检查报告（需人工修正）

> 拼写错误(\mathcbb 等 30 处)已自动修复。下面是括号/& 类问题，需你对照公式手动改（机器无法判断缺/多的符号该补/删在哪）。
> 每行：来源文件:行号 [统计] 公式全文。


## ① \left/\right 配对 —— 67 处

| 文件:行 | 统计 | 公式 |
|---|---|---|
| 实变函数/SBHS.org:704 | L2/R1 | `x\in g\left(\bigcup_{i=1}^\infty X_i\right)\leftrightarrow\left(\exist i\in\mathbb{N}^+\rightarrow x\in g(X_i))\leftrightarrow x\in\bigcup_{i=1}^\infty g(X_i)` |
| 实变函数/SBHS.org:1423 | L2/R1 | `\Gamma_0=\left\{J\left\|J\in H_0\land J\subset G\right\}` |
| 实变函数/SBHS.org:1423 | L4/R3 | `\Gamma_k=\left\{J\left\|J\in H_k\land\left(J\subset G/\bigcup_{i=0}^{k-1}\left(\bigcup_{J\in\Gamma_i}J\right)\right)\right\}` |
| 实变函数/SBHS.org:3513 | L2/R1 | `I'_1=\left\{K\left\|K\in I_1\land K\subset I'\right\}` |
| 实变函数/SBHS.org:5653 | L4/R3 | `f^{-1}\left(\left(\frac{a}{c},+\infty\right]\right),f^{-1}\left(\left[-\infty,\frac{a}{c}\right)` |
| 实变函数/SBHS.org:6929 | L1/R0 | `D_i(x)=\inf\left\{I_i\}` |
| 实变函数/SBHS.org:6935 | L1/R0 | `D_{i+1}(x)=\inf\left\{I_{i+1}\}` |
| 实变函数/SBHS.org:8884 | L2/R4 | `\int_{\left[a,a+\frac{1}{n}\right]}f_z(x)\right)\geq\int_{\left[a,a+\frac{1}{n}\right]}f_z(a)\right)=\frac{f(a)}{n}` |
| 实变函数/SBHS.org:8884 | L1/R2 | `-\int_{\left[a,a+\frac{1}{n}\right]}f_z(x)\right)\leq-\frac{f(a)}{n}` |
| 抽象代数/cxds.org:1317 | L1/R0 | `\left\{e^{-1}(b_1),e^{-1}(b_2)\}\in M` |
| 抽象代数/cxds.org:3496 | L1/R2 | `f(x_n)=\sum_{z\in K}\left(g_z(\vec{s}')\right)x^z_n\right)` |
| 抽象代数/cxds.org:3498 | L1/R2 | `f'(x_n)=\sum_{z\in K^*}\left(g_z(\vec{s}')\right)x^z_n\right)` |
| 抽象代数/cxds.org:4026 | L1/R0 | `I(f_\times)\left(c,\prod_{i=1}^nI(f_+)(b,-a_i))\ne I(c_0)` |
| 抽象代数/cxds.org:6793 | L3/R2 | `\phi=\left(\forall x_1...\forall x_n\forall y_1...\forall y_n\left(\bigwedge_{l=1}^n(f_l(\vec{x})\hat{=}f_l(\vec{y}))\right)\leftrightarrow\left(\bigwedge_{j=1}` |
| 数学分析/Chap11Note.org:930 | L3/R2 | `\left\{\lim_{x_2\to a_2}\left\{...\lim_{x_n\to a_n}\left\{f(\vec{x})\right\}\right\}=\Phi_2(x_1)` |
| 数学分析/Chap11Note.org:980 | L1/R2 | `\forall \epsilon>0,\exists \tau>0,\forall \|\vec{x}-\vec{x}_0\|<\tau\rightarrow \|f_i(\vec{x})-A_i\right\|\leq\left\|\vec{f}(\vec{x})-\vec{A}\right\|<\epsilon` |
| 数学分析/Chap12Note.org:883 | L0/R1 | `dv=\sum_{i=1}^n\frac{\partial f(\vec{u}_0)}{\parital u_i}du_i\right\}=dz` |
| 数学分析/Chap13Note.org:1456 | L0/R1 | `\sum_{i=1}^n f(m_i)\Delta x_i\leq\underline{\int_a^b}f(x)dx\right` |
| 数学分析/Chap14Note.org:876 | L1/R2 | `\big\|x'_k(t)-x'_k(\xi)\big\|<\epsilon\Rightarrow\left\|x'_k(t)-\frac{x_k(t'')-x_k(t')}{t''-t'}\right\|\right\|<\epsilon` |
| 数学分析/Chap14Note.org:1024 | L2/R3 | `\lim_{\lambda\to0}\sum_{i=1}^m \left(\vec{F}(\vec{x}_i)\cdot\tau(\vec{x}_i)\right)\Delta l_i=\lim_{\lambda\to0}\sum_{i=1}^m \left(\vec{F}(\vec{x}(t_i))\cdot\Del` |
| 数学分析/Chap14Note.org:1194 | L1/R2 | `\iint_\Omega \left(A\vec{F}(\vec{r})+B\vec{G}(\vec{r})\right)\cdot\vec{e}(\vec{r})ds=A\iint_\Omega \vec{F}(\vec{r})\cdot\vec{e}(\vec{r})ds+B\iint_\Omega\vec{G}(` |
| 数学分析/Chap14Note.org:1202 | L2/R3 | `A\iint_\Omega \left[\sum_{i=1}^3f_i(\vec{r})\cos(\alpha_i(\vec{r}))\right]ds+B\iint_\Omega\left[\sum_{i=1}^3g_i(\vec{r})\cos(\beta_i(\vec{r}))\right]ds=A\iint_\` |
| 数学分析/Chap16Note.org:410 | L4/R5 | `\lim_{m\to\infty}\int_{0}^{\delta}\left\{\frac{f(x+u)-f(x^+)}{2\sin\left(\frac{u}{2}\right)}\sin\left(\frac{2m+1}{2}u\right)\right\}du=\lim_{m\to\infty}\int_{0}` |
| 数学分析/Chap16Note.org:412 | L4/R5 | `\lim_{m\to\infty}\int_{0}^{\delta}\left\{\frac{f(x-u)-f(x^-)}{2\sin\left(\frac{u}{2}\right)}\sin\left(\frac{2m+1}{2}u\right)\right\}du=\lim_{m\to\infty}\int_{0}` |
| 数理逻辑/sllj.org:5209 | L0/R1 | `\{(\tau_i\hat{ =}\sigma_i)\big\|1\leq i\leq n\right\}\cup\{\phi_\tau(n)\}\vdash(\phi_\tau(n)\to\phi_\tau(n-1)(\langle x_{m_n}\rangle,\langle \sigma_n\rangle))` |
| 数理逻辑/sllj.org:5211 | L0/R1 | `\{(\tau_i\hat{ =}\sigma_i)\big\|1\leq i\leq n\right\}\cup\{\phi_\tau(n)\}\vdash(\phi_\tau(n-1)(\langle x_{m_n}\rangle,\langle \sigma_n\rangle)\to\phi_\sigma(n))` |
| 数理逻辑/sllj.org:5213 | L0/R1 | `\{(\tau_i\hat{ =}\sigma_i)\big\|1\leq i\leq n\right\}\cup\{\phi_\tau(n)\}\vdash\phi_\sigma(n)` |
| 数理逻辑/sllj.org:5859 | L2/R1 | `\left<[c_{j_1}]_{\sim_\Gamma},...,\left<[c_{j_n}]_{\sim_\Gamma}\right>\in I(p)` |
| 数理逻辑/sllj.org:5861 | L2/R1 | `\left<[c_{j_1}]_{\sim_\Gamma},...,\left<[c_{j_n}]_{\sim_\Gamma}\right>\in I(p)` |
| 数理逻辑/sllj.org:6071 | L2/R3 | `\phi_n(\left<c_1,...,c_v\right>,\left<x_{u+1},...,x_{u+v}\right>)\right>)=\phi_n=(\lnot(x_1\hat{=}x_1))` |
| 数理逻辑/sllj.org:6117 | L5/R4 | `\psi=\left((\exists x_i\phi)\to\phi\left(\left<x_i\rigth>,\left<c^m_{\left<x_i,\phi\right>}\right>\right)\right)\in\Gamma_{m+1}` |
| 数理逻辑/sllj.org:8357 | L1/R0 | `\left<\mathcal{M},v>\vDash\phi` |
| 数理逻辑/sllj.org:8469 | L1/R0 | `\left<<\mathcal{M},v>\vDash\phi` |
| 数理逻辑/sllj.org:14673 | L1/R0 | `\mathcal{M}_X\vDash\left\{\varphi_{2,i}\big\|0\leq i\leq 2m\}` |
| 离散数学/Disc_Math.org:393 | L1/R0 | `\phi_{pair}(x_1,x_2,x_3)=\left(\forall y_1(p_\in(y_1,x_3)\leftrightarrow((y_1\hat{=}x_1)\lor(y_1\hat{=}x_2)))\rigth)` |
| 算数理论/ssll.org:1790 | L4/R5 | `\mu\left(\left(\exists x_{4<y}\left(\exists x_{5<y}\left((y\hat{=}op(x_4,x_5))\land\phi(x_4,x_1,z,x_5)\right)\right)\right),x_1,x_8\right)\right)` |
| 算数理论/ssll.org:1804 | L5/R6 | `\left<\mathcal{M},e\cdot v\right>\vDash\mu\left(\left(\exists x_{4<y}\left(\exists x_{5<y}\left((y\hat{=}op(x_4,x_5))\land\phi(x_4,x_1,z,x_5)\right)\right)\righ` |
| 算数理论/ssll.org:1814 | L5/R6 | `\left<\mathcal{M},e\cdot v\right>\vDash\mu\left(\left(\exists x_{4<y}\left(\exists x_{5<y}\left((y\hat{=}op(x_4,x_5))\land\phi(x_4,x_1,z,x_5)\right)\right)\righ` |
| 算数理论/ssll.org:2735 | L2/R1 | `\chi_<\left(g'(\vec{a},x),c_b(\vec{a},x)\right)+\chi_<\left(c_b(\vec{a},x),g'(\vec{a},x)=0` |
| 算数理论/ssll.org:3501 | L6/R5 | `T_N\vdash\left(\forall y\left(\phi\left(\left<x_1,...,x_n,y\right>,\left<\tau_{v(x_1)},...,\tau_{v(x_n)},\tau_{v(y)}\right>\right)\to\left(y\hat{=}\tau_{v(y)}\r` |
| 算数理论/ssll.org:3511 | L1/R0 | `\phi^*=\left(\forall y(\phi''\to(y\hat{=}\tau_{v(y)}))` |
| 算数理论/ssll.org:3525 | L3/R2 | `T_N\vdash\left(\forall y\left(\phi''\to\left(y\hat{=}\tau_{v(y)}\right)\right)` |
| 算数理论/ssll.org:3531 | L4/R3 | `\phi^* = \left(\forall y\left(\left(\tau_{v(x_1)+1}\hat{ = }y\right)\to\left(y\hat{ =}\tau_{v(x_1)+1}\right)\right)` |
| 算数理论/ssll.org:3533 | L4/R3 | `\left<\mathcal{M},\delta\right>\vDash\left(\left(\tau_{v(x_1)+1}\hat{ = }y\right)\to\left(y\hat{ =}\tau_{v(x_1)+1}\right)` |
| 算数理论/ssll.org:3533 | L5/R4 | `\left<\mathcal{M},\delta\right>\vDash\left(\forall y\left(\left(\tau_{v(x_1)+1}\hat{ = }y\right)\to\left(y\hat{ =}\tau_{v(x_1)+1}\right)\right)` |
| 算数理论/ssll.org:3541 | L4/R3 | `\phi^* = \left(\forall y\left(\left(f_+(\tau_{v(x_1)},\tau_{v(x_2)})\hat{ = }y\right)\to\left(y\hat{ =}\tau_{v(x_1)+v(x_2)}\right)\right)` |
| 算数理论/ssll.org:3557 | L4/R3 | `\phi^* = \left(\forall y\left(\left(f_\times(\tau_{v(x_1)},\tau_{v(x_2)})\hat{ = }y\right)\to\left(y\hat{ =}\tau_{v(x_1)\cdot v(x_2)}\right)\right)` |
| 算数理论/ssll.org:3579 | L3/R2 | `\phi^* = \left(\forall y\left(\phi''\to\left(y\hat{ =}\tau_{v(y)}\right)\right)` |
| 算数理论/ssll.org:3595 | L4/R3 | `\phi^* = \left(\forall y\left(\left(\tau_{v(x_i)}\hat{ = }y\right)\to\left(y\hat{ =}\tau_{v(x_1)+1}\right)\right)` |
| 算数理论/ssll.org:3639 | L1/R0 | `\phi^* =\left(\forall y(\phi''\to(z\hat{ =}\tau_{v(z)}))` |
| 算数理论/ssll.org:3671 | L2/R1 | `\left<\mathcal{M},w\right>\vDash\left(y_i\hat{ =}\tau_{v(y_i)})` |
| 算数理论/ssll.org:3691 | L3/R2 | `T_N\vdash\left(\forall y\left(\psi''\to\left(y\hat{=}\tau_{v(y)}\right)\right)` |
| 算数理论/ssll.org:3703 | L1/R2 | `\left<\mathfrak{N},w\right>\vDash(\forall z(\psi_{zy}\to (\lnot p_<(z,x_n)))))\right)` |
| 算数理论/ssll.org:3715 | L1/R0 | `\phi^*=\left(\forall x_n(\phi''\to(x_n\hat{=}\tau_{v(x_n)}))` |
| 算数理论/ssll.org:3727 | L1/R2 | `\left<\mathcal{M},\eta\right>\vDash(\forall z(\psi_{zy}\to (\lnot p_<(z,x_n)))))\right)` |
| 算数理论/ssll.org:3729 | L1/R2 | `\left<\mathcal{M},\eta\right>\vDash(\forall z(\psi_{zy}\to (\lnot p_<(z,x_n)))))\right)` |
| 算数理论/ssll.org:3745 | L6/R5 | `T_N\vdash\left(\forall y\left(\psi\left(\left<x_1,...,x_n,y\right>,\left<\tau_{v(x_1)},...,\tau_{(x_{n-1})},\tau_k,y}\right>\right)\to\left(y\hat{=}\tau_b}\righ` |
| 算数理论/ssll.org:3747 | L6/R5 | `\mathcal{M}\vDash\left(\forall y\left(\psi\left(\left<x_1,...,x_n,y\right>,\left<\tau_{v(x_1)},...,\tau_{(x_{n-1})},\tau_k,y}\right>\right)\to\left(y\hat{=}\tau` |
| 算数理论/ssll.org:3749 | L6/R5 | `\left<\mathcal{M},\eta\right>\vDash\left(\psi\left(\left<x_1,...,x_n,y\right>,\left<\tau_{v(x_1)},...,\tau_{(x_{n-1})},\tau_k,y}\right>\right)\to\left(y\hat{=}\` |
| 编译原理/byyl.org:1075 | L1/R0 | `\delta=\left\{<<s,\sigma>,S(s,\sigma)>\big\|s\in S\}` |
| 编译原理/byyl.org:1582 | L2/R3 | `s_0=s\right)\land\left(f\in\delta(s_{m-1},\sigma_m)\right)\land\left(s_i\in S,1\leq i\leq m+1\right)` |
| 编译原理/byyl.org:1621 | L2/R3 | `s_0=t\right)\land\left(s\in\delta(s_{m-1},\sigma_m)\right)\land\left(s_i\in S,1\leq i\leq m+1\right)` |
| 高等代数/Algb-5-Liner_Map.org:2600 | L1/R0 | `M=\left[m_{ij}]` |
| 高等代数/Algb-5-Liner_Map.org:2664 | L5/R4 | `\mathcal{V}_{f(\sigma)}=\left<\ker(f(\sigma)),K,\pmb{+},\pmb{\cdot})\right>,\mathcal{V}_{f_1(\sigma)}=\left<\ker(f_1(\sigma)),K,\pmb{+},\pmb{\cdot})\right>,\mat` |
| 高等代数/Algb-5-Liner_Map.org:2987 | L0/R1 | `\sigma_i(a\pmb{+}b)=(\sigma\oplus\lambda\sigma_1)(a\pmb{+}b)=(\sigma\oplus\lambda\sigma_1)(a)\pmb{+}(\sigma\oplus\lambda\sigma_1)(b)\right)=\sigma_i(a)\pmb{+}\s` |
| 高等代数/Algb-5-Liner_Map.org:3125 | L10/R12 | `e(f(\sigma))=e\left(\left(I\left(\sum\right)\right)_{i=1}^mI(f_\times)\left(k_i\sigma_1,\sigma^i\right)\right)=\left(I_G\left(\sum\right)\right)_{i=1}^mI_G(f_\t` |
| 高等代数/Algb-5-Liner_Map.org:3127 | L3/R4 | `\left(I_G\left(\sum\right)\right)_{i=1}^mI_G(f_\times)\left(k_iI_G(c_1),G^i\right)\right)=I_G(c_0)` |

## ② 花括号 {} 不配平 —— 61 处

| 文件:行 | 统计 | 公式 |
|---|---|---|
| 大学物理/Note/DiffEq.org:481 | {4/}5 | `\lim_{t\to t_0}e^{-st}=e^{-st_0},\lim_{t\to t_0}}f(t)=f(t_0)` |
| 实变函数/SBHS.org:1371 | {3/}4 | `a_\lambda\to\alpha_\lambda0,a_\lambda+\frac{b_\lambda-a_\lambda}{3}\to\alpha_\lambda1,b_\lambda-a_\lambda}{3}\to\beta_\lambda0,b_\lambda\to\beta_\lambda1` |
| 实变函数/SBHS.org:3985 | {3/}4 | `\vec{u}\in\mathbb{R}\land d(\vec{u},0})<\delta` |
| 实变函数/SBHS.org:5837 | {3/}4 | `f^{-1}((a,+\infty])=f^{-1}((a,+\infty))\cup f^{-1}(\{\infty\}})` |
| 实变函数/SBHS.org:5839 | {1/}2 | `f^{-1}(\{\infty\}})` |
| 实变函数/SBHS.org:5841 | {1/}2 | `f^{-1}(\{\infty\}})` |
| 实变函数/SBHS.org:5847 | {2/}3 | `f^{-1}((a,+\infty))\cup f^{-1}(\{\infty\}})` |
| 实变函数/SBHS.org:7703 | {5/}6 | `\lim_{n\to\infty}}\int_{E'}g_n(x)dx\leq\overline{\lim_{n\to\infty}}\int_{E'}g_n(x)dx\leq0` |
| 实变函数/SBHS.org:8550 | {0/}1 | `I_1,I_2,...,I_n}` |
| 抽象代数/cxds.org:2296 | {14/}15 | `f(\vec{x})=\sum_{i\in P}\left(a_i\left(\prod_{j\in K_i}x_j^{k_{i,j}}\right)\right)=\sum_{i\in P-\{z_1,z_2\}}}\left(a_i\left(\prod_{j\in K_i}x_j^{k_{i,j}}\right)` |
| 抽象代数/cxds.org:6041 | {9/}11 | `\psi=\left(\bigvee_{i=1}^k\left(\left(\bigwedge_{j=1}^l(\tau_{f_{ij}}(x_0)\hat{=}c_0})\right)\land\left(\bigwedge_{j=1}^m(\lnot(\tau_{g_{ij}}(x_0)\hat{=}c_0}))\` |
| 抽象代数/cxds.org:6057 | {8/}10 | `\left(\left(\bigwedge_{j=1}^l(\tau_{f_{ij}}(x_0)\hat{=}c_0})\right)\land\left(\bigwedge_{j=1}^m(\lnot(\tau_{g_{ij}}(x_0)\hat{=}c_0}))\right)\right)` |
| 抽象代数/cxds.org:6059 | {9/}11 | `\mathcal{M}\vDash\left(\left(\bigwedge_{j=1}^l(\tau_{f_{ij}}(x_0)\hat{=}c_0})\right)\land\left(\bigwedge_{j=1}^m(\lnot(\tau_{g_{ij}}(x_0)\hat{=}c_0}))\right)\ri` |
| 抽象代数/cxds.org:6065 | {10/}12 | `\mathcal{M}^*_{(b)}\vDash\left(\left(\bigwedge_{j=1}^l(\tau_{f_{ij}}(x_0)\hat{=}c_0})\right)\land\left(\bigwedge_{j=1}^m(\lnot(\tau_{g_{ij}}(x_0)\hat{=}c_0}))\r` |
| 抽象代数/cxds.org:6077 | {4/}5 | `\mathcal{N}\vDash(\tau_{f_{ij}}(x_0)\hat{=}c_0})[\beta,e(a_1),...,e(a_n)]` |
| 抽象代数/cxds.org:6085 | {10/}12 | `\mathcal{N}^*_{(\beta)}\vDash\left(\left(\bigwedge_{j=1}^l(\tau_{f_{ij}}(x_0)\hat{=}c_0})\right)\land\left(\bigwedge_{j=1}^m(\lnot(\tau_{g_{ij}}(x_0)\hat{=}c_0}` |
| 抽象代数/cxds.org:6087 | {9/}11 | `\mathcal{N}\vDash\left(\left(\bigwedge_{j=1}^l(\tau_{f_{ij}}(x_0)\hat{=}c_0})\right)\land\left(\bigwedge_{j=1}^m(\lnot(\tau_{g_{ij}}(x_0)\hat{=}c_0}))\right)\ri` |
| 抽象代数/cxds.org:6093 | {5/}6 | `\mathcal{M}\vDash\left(\bigwedge_{j=1}^l(\tau_{f_{ij}}(x_0)\hat{=}c_0})\right)[b,a_1,...,a_n]` |
| 抽象代数/cxds.org:6095 | {4/}5 | `\mathcal{N}\vDash(\lnot(\tau_{g_{ij}}(x_0)\hat{=}c_0})[b,e(a_1),...e(a_n)]` |
| 抽象代数/cxds.org:6097 | {4/}5 | `\mathcal{N}\vDash(\lnot(\tau_{g_{ij}}(x_0)\hat{=}c_0})[b,e(a_1),...e(a_n)]` |
| 抽象代数/cxds.org:6101 | {5/}6 | `\mathcal{N}\vDash\left(\bigwedge_{j=1}^m(\lnot(\tau_{g_{ij}}(x_0)\hat{=}c_0}))\right)[\beta,e(a_1),...,e(a_n)]` |
| 抽象代数/cxds.org:6105 | {5/}6 | `\mathcal{N}\vDash\left(\bigwedge_{j=1}^m(\tau_{f_{ij}}(x_0)\hat{ =}c_0})\right)[\beta,e(a_1),...,e(a_n)]` |
| 抽象代数/cxds.org:6107 | {9/}11 | `\mathcal{N}\vDash\left(\left(\bigwedge_{j=1}^l(\tau_{f_{ij}}(x_0)\hat{=}c_0})\right)\land\left(\bigwedge_{j=1}^m(\lnot(\tau_{g_{ij}}(x_0)\hat{=}c_0}))\right)\ri` |
| 数学分析/Chap10Note.org:593 | {7/}8 | `\overline{\lim_{n\to\infty}} \sqrt[n]{(n+1)\|a_{n+1}\|}}=\overline{\lim_{n\to\infty}} \sqrt[n]{\|a_n\|}` |
| 数学分析/Chap11Note.org:905 | {0/}1 | `\forall \epsilon_2>0,\exists \delta_2},\forall x_2\in O(a_2,\delta_2),x_2\ne a_2\Rightarrow \|\Phi_2(x_1)-\Phi_3(x_1,x_2)\|<\epsilon_2` |
| 数学分析/Chap12Note.org:771 | {11/}10 | `\lim_{\Delta x_i \to 0}\sqrt{\sum_{j=1}^n \left[\frac{y_j(...,x_i+\Delta x_i,...)-y_j(\vec{x}_0)}{\Delta x_i}\right]^2}=\sqrt{\sum_{j=1}^n \frac{\partial y_i(\v` |
| 数学分析/Chap12Note.org:773 | {16/}15 | `\lim_{\Delta x_i \to 0}\left\{\frac{o\left(\sqrt{\sum_{j=1}^n [y_j(...,x_i+\Delta x_i,...)-y_j(\vec{x}_0)]^2}\right)}{\sqrt{\sum_{j=1}^n [y_j(...,x_i+\Delta x_i` |
| 数学分析/Chap12Note.org:2077 | {9/}10 | `\frac{\partial L\left(\vec{x},\vec{y},\vec{\lambda}\right)}{\partial \vec{\lambda}}=\vec{G}(\vec{x}_0,\vec{y}_0)}=0` |
| 数学分析/Chap13Note.org:1050 | {4/}5 | `\vec{t}^2=\vec{T}^2\left(\vec{T}^1(\vec{x})}\right)` |
| 数学分析/Chap13Note.org:1068 | {4/}5 | `\vec{t}^2=\vec{T}^2\left(\vec{T}^1(\vec{x})}\right)` |
| 数学分析/Chap13Note.org:2163 | {2/}3 | `\Gamma=\left\{\vec{x}\big\|\sum_{i=1}^n x_i^2}\leq R^2\right\}` |
| 数学分析/Chap9Note.org:922 | {6/}7 | `0<1 - \frac{\sin^2(\frac{x}{2n+1})}{\sin^2(\frac{k\pi}{2n+1})}} \leq 1 \ k=m+1,m+2,..n` |
| 数理逻辑/sllj.org:2323 | {0/}1 | `\tau_i\in S,1\leq i\leq\pi_F(f_i)}` |
| 数理逻辑/sllj.org:6035 | {5/}6 | `\Gamma_{n+1}=\Gamma_{n}\cup\left\{\left((\exists x\phi)\to\phi\left(\left<x\right>,\left<\beta(\phi,x,n)}\right>\right)\right)\big\|\left<\phi,x\right>\in\mathc` |
| 数理逻辑/sllj.org:9776 | {4/}3 | `\left\{a\big\|a\in X\land \left<\mathcal{M}_a,v_{a,\eta\right>\vDash\phi\right\}=\left\{a\big\|a\in X\land\left<\mathcal{M}_a,v_{a,\eta}\right>\not\vDash\psi_1\` |
| 数理逻辑/sllj.org:10092 | {3/}2 | `\phi\in\mathcal{L}_{\mathcal{A}` |
| 数理逻辑/sllj.org:10114 | {4/}3 | `\phi\in\mathcal{L}_{\mathcal{A}_{C_X}` |
| 数理逻辑/sllj.org:10124 | {4/}3 | `\phi\in\mathcal{L}_{\mathcal{A}_{C_X}` |
| 数理逻辑/sllj.org:12168 | {5/}6 | `D^{n_k}=\left\{\left<c_{i_1,k}},...,c_{i_{n_k},k}\right>\big\|i\in\mathbb{N}\right\}` |
| 数理逻辑/sllj.org:12214 | {4/}5 | `\left<c_{i_1,k}},...,c_{i_{n_k},k}\right>\in D^{n_k}` |
| 数理逻辑/sllj.org:13379 | {0/}2 | `\Gamma^*=\left\{\psi\left(\left<x_1,...,x_n\right>,\left<d_1,...,d_n}\right>\right)\big\|\psi\in\Gamma\right\},\phi^*=\phi\left(\left<x_1,...,x_n\right>,\left<d` |
| 数理逻辑/sllj.org:13423 | {0/}1 | `\phi^*=\phi\left(\left<x_1,...,x_n\right>,\left<d_1,...,d_n}\right>\right)` |
| 数理逻辑/sllj.org:13427 | {0/}1 | `\phi=\phi^*\left(\left<d_1,...,d_n}\right>,\left<x_1,...,x_n\right>\right)` |
| 数理逻辑/sllj.org:13637 | {0/}1 | `\phi^*=\phi\left(\left<x_1,...,x_n\right>,\left<d_1,...,d_n}\right>\right)` |
| 数理逻辑/sllj.org:13812 | {0/}1 | `\phi=\phi^*\left(\left<d_1,...,d_n}\right>,\left<x_1,...,x_n\right>\right)` |
| 算数理论/ssll.org:3625 | {4/}5 | `\phi''_{g_i}=\phi_{g_i}\left(\left<x_1,...,x_n,y_i\right>,\left<\tau_{\eta(x_1)},...,\tau_{\eta(x_n)},y_i}\right>\right)` |
| 算数理论/ssll.org:3691 | {2/}3 | `\psi'' =\left(\left<x_1,...,x_n,y\right>,\left<\tau_{v(x_1)},...,\tau_{v(x_n)},y}\right>\right)` |
| 算数理论/ssll.org:3745 | {4/}6 | `T_N\vdash\left(\forall y\left(\psi\left(\left<x_1,...,x_n,y\right>,\left<\tau_{v(x_1)},...,\tau_{(x_{n-1})},\tau_k,y}\right>\right)\to\left(y\hat{=}\tau_b}\righ` |
| 算数理论/ssll.org:3747 | {5/}7 | `\mathcal{M}\vDash\left(\forall y\left(\psi\left(\left<x_1,...,x_n,y\right>,\left<\tau_{v(x_1)},...,\tau_{(x_{n-1})},\tau_k,y}\right>\right)\to\left(y\hat{=}\tau` |
| 算数理论/ssll.org:3749 | {5/}7 | `\left<\mathcal{M},\eta\right>\vDash\left(\psi\left(\left<x_1,...,x_n,y\right>,\left<\tau_{v(x_1)},...,\tau_{(x_{n-1})},\tau_k,y}\right>\right)\to\left(y\hat{=}\` |
| 算数理论/ssll.org:3751 | {5/}7 | `\left<\mathcal{M},\eta\right>\vDash\left(\psi\left(\left<x_1,...,x_n,y\right>,\left<\tau_{v(x_1)},...,\tau_{(x_{n-1})},x_n,y}\right>\right)\to\left(y\hat{=}\tau` |
| 算数理论/ssll.org:3753 | {4/}5 | `\left<\mathcal{M},\eta\right>\vDash\psi\left(\left<x_1,...,x_n,y\right>,\left<\tau_{v(x_1)},...,\tau_{(x_{n-1})},x_n,y}\right>\right)` |
| 算数理论/ssll.org:3753 | {2/}3 | `\left<\mathcal{M},\eta\right>\vDash\left(y\hat{=}\tau_b}\right)` |
| 算数理论/ssll.org:3779 | {4/}6 | `T_N\vdash\left(\forall y\left(\psi\left(\left<x_1,...,x_n,y\right>,\left<\tau_{v(x_1)},...,\tau_{(x_{n-1})},\tau_k,y}\right>\right)\to\left(y\hat{=}\tau_b}\righ` |
| 算数理论/ssll.org:3781 | {5/}7 | `\left<\mathcal{M},\delta\right>\vDash\left(\psi\left(\left<x_1,...,x_n,y\right>,\left<\tau_{v(x_1)},...,\tau_{(x_{n-1})},\tau_k,y}\right>\right)\to\left(y\hat{=` |
| 算数理论/ssll.org:3783 | {4/}5 | `\left<\mathcal{M},\delta\right>\vDash\psi\left(\left<x_1,...,x_n,y\right>,\left<\tau_{v(x_1)},...,\tau_{(x_{n-1})},\tau_k,y}\right>\right)` |
| 算数理论/ssll.org:3785 | {2/}3 | `\left<\mathcal{M},\delta\right>\vDash\left(y\hat{=}\tau_b}\right)` |
| 编译原理/byyl.org:3004 | {2/}3 | `<\delta(s\to\beta_{(0)},\beta[1]),...,\delta(s\to\beta_{(\|\beta\|-1)},\beta[\|\beta\|]})>` |
| 编译原理/byyl.org:3008 | {2/}3 | `\delta(s\to\beta_{(\|\beta\|-1)},\beta[\|\beta\|]})=\{s\to\beta_{(\|\beta\|)}\}\cap F\ne\varnothing` |
| 高等代数/Algb-3-Matrix.org:1688 | {1/}0 | `\lambda^{n` |
| 高等代数/Algb-5-Liner_Map.org:885 | {10/}11 | `\delta([a]_{V_0}\pmb{+}[b]_{V_0})=\delta([a+b]_{V_0})=[\sigma(a) +\sigma(b)]_{V_0}=[\sigma(a)]_{V_0}\pmb{+}[\sigma(b)]_\{V_0}=\delta([a]_{V_0})\pmb{+}\delta([b]` |

## ③ 圆/方括号 ()[]不配平 —— 333 处

| 文件:行 | 统计 | 公式 |
|---|---|---|
| 大学物理/Note/Note2.org:277 | 开4/合3 | `A'=\left\|2A\cos\left(\frac{v_1-v_2}{2}2\pi t\right)\right\|=\left\|2A\cos\left(\frac{v_1-v_2}{2}2\pi t \pm \pi\right)\right\|=\left\|2A\cos\left(\frac{v_1-v_2}` |
| 大学物理/Note/Note2.org:279 | 开3/合2 | `\left\|2A\cos\left(\frac{v_1-v_2}{2}2\pi t\right)\right\|=\left\|2A\cos\left(\frac{v_1-v_2}{2}2\pi\left(t+\frac{1}{\|v_1-v_2\|}\right\}\right)\right\|` |
| 实变函数/SBHS.org:5074 | 开9/合8 | `h(z_k)=f(z_k)-((f(z_k)-f(z_k^-))+g(z_k^-)=f(z_k^-)-g(z_k^-)` |
| 实变函数/SBHS.org:5653 | 开4/合3 | `f^{-1}\left(\left(\frac{a}{c},+\infty\right]\right),f^{-1}\left(\left[-\infty,\frac{a}{c}\right)` |
| 实变函数/SBHS.org:5785 | 开5/合4 | `\forall i\in\mathbb{N}\rightarrow f_i(x)\in(a,+\infty]\rightarrow\forall i\in \mathbb{N}(x\in f_i^{-1}((a,+\infty])` |
| 实变函数/SBHS.org:6130 | 开4/合3 | `f_k^{-1}((\epsilon,+\infty)=\left\{x\big\|\|f_k(x)-f(x)\|>\epsilon\right\}` |
| 实变函数/SBHS.org:7023 | 开3/合4 | `M_B=\left\{\int_E\phi_2dx)dx\bigg\|\phi_2(x)\in\mahtcal{Z}_B(f(x))\right\}` |
| 实变函数/SBHS.org:7241 | 开3/合2 | `\forall\epsilon>0\rightarrow\varphi(f^{-1}((\epsilon,\infty])=0` |
| 实变函数/SBHS.org:8235 | 开4/合3 | `\varphi([0,f(\vec{x}_0,\vec{y}))=f(\vec{x}_0,\vec{y})` |
| 实变函数/SBHS.org:8255 | 开5/合4 | `G(B,[0,f(\vec{x}_0,\vec{y}))=\left\{<\vec{y},r>\big\|\vec{y}\in B\land r\in[0,f(\vec{x}_0,\vec{y}))\right\}` |
| 实变函数/SBHS.org:8257 | 开5/合4 | `\int_{B}\varphi([0,f(\vec{x}_0,\vec{y}))d\vec{y}=\varphi(Z(\vec{x}_0))` |
| 实变函数/SBHS.org:8257 | 开4/合3 | `G(B,[0,f(\vec{x}_0,\vec{y}))=Z(\vec{x}_0)` |
| 实变函数/SBHS.org:8259 | 开7/合5 | `\int_{A'}\varphi(B\times[0,f(\vec{x},\vec{y}))d\vec{x}=\int_{A'}\left(\int_B\varphi([0,f(\vec{x},\vec{y}))d\vec{y}\right)d\vec{x}` |
| 实变函数/SBHS.org:8261 | 开4/合3 | `\varphi([0,f(\vec{x},\vec{y}))=f(\vec{x},\vec{y})` |
| 实变函数/SBHS.org:8884 | 开5/合7 | `\int_{\left[a,a+\frac{1}{n}\right]}f_z(x)\right)\geq\int_{\left[a,a+\frac{1}{n}\right]}f_z(a)\right)=\frac{f(a)}{n}` |
| 实变函数/SBHS.org:8884 | 开3/合4 | `-\int_{\left[a,a+\frac{1}{n}\right]}f_z(x)\right)\leq-\frac{f(a)}{n}` |
| 抽象代数/cxds.org:39 | 开2/合3 | `\forall x\forall y\forall z\left(\{x,y,z\}\subset S\rightarrow x*(y\#z)=x*y\#x*z)\right)` |
| 抽象代数/cxds.org:1283 | 开8/合7 | `(\forall x_1(\forall x_2((f_\times(x_1,x_2)\hat{=}c_0)\to((x_1\hat{=}c_0)\lor(x_2\hat{=}c_0))))` |
| 抽象代数/cxds.org:1806 | 开3/合2 | `\tau_n=f_+(c_1,f_+(...f_+(c_1,c_1)...)` |
| 抽象代数/cxds.org:2910 | 开21/合19 | `e'(g(\vec{x}^*))(\phi(s^*_1),...,\phi(s^*_{m+n}))=I_2(f_+)(e'(f^*_1(\vec{x}^*))(\phi(s^*_1),...,\phi(s^*_{m+n}),e'(f^*_2(\vec{x}^*))(\phi(s^*_1),...,\phi(s^*_{m` |
| 抽象代数/cxds.org:3496 | 开3/合4 | `f(x_n)=\sum_{z\in K}\left(g_z(\vec{s}')\right)x^z_n\right)` |
| 抽象代数/cxds.org:3498 | 开3/合4 | `f'(x_n)=\sum_{z\in K^*}\left(g_z(\vec{s}')\right)x^z_n\right)` |
| 抽象代数/cxds.org:4857 | 开1/合0 | `\left<\mathcal{N},v\cdot e\right>\vDash(\phi\hat{ =}c_0` |
| 抽象代数/cxds.org:5781 | 开3/合2 | `\left<\mathcal{M},v\right>\vDash((f_+(x_j,x_0)\hat{=}c_0)` |
| 抽象代数/cxds.org:6095 | 开6/合5 | `\mathcal{N}\vDash(\lnot(\tau_{g_{ij}}(x_0)\hat{=}c_0})[b,e(a_1),...e(a_n)]` |
| 抽象代数/cxds.org:6097 | 开6/合5 | `\mathcal{N}\vDash(\lnot(\tau_{g_{ij}}(x_0)\hat{=}c_0})[b,e(a_1),...e(a_n)]` |
| 抽象代数/cxds.org:6793 | 开7/合6 | `\phi=\left(\forall x_1...\forall x_n\forall y_1...\forall y_n\left(\bigwedge_{l=1}^n(f_l(\vec{x})\hat{=}f_l(\vec{y}))\right)\leftrightarrow\left(\bigwedge_{j=1}` |
| 数学分析/Chap14Note.org:1024 | 开6/合7 | `\lim_{\lambda\to0}\sum_{i=1}^m \left(\vec{F}(\vec{x}_i)\cdot\tau(\vec{x}_i)\right)\Delta l_i=\lim_{\lambda\to0}\sum_{i=1}^m \left(\vec{F}(\vec{x}(t_i))\cdot\Del` |
| 数学分析/Chap14Note.org:1184 | 开8/合10 | `\vec{e}(\vec{r})=\left(\cos(\alpha_1(\vec{r}))),\cos(\alpha_2(\vec{r}))),\cos(\alpha_3(\vec{r}))\right)` |
| 数学分析/Chap14Note.org:1194 | 开8/合9 | `\iint_\Omega \left(A\vec{F}(\vec{r})+B\vec{G}(\vec{r})\right)\cdot\vec{e}(\vec{r})ds=A\iint_\Omega \vec{F}(\vec{r})\cdot\vec{e}(\vec{r})ds+B\iint_\Omega\vec{G}(` |
| 数学分析/Chap14Note.org:1202 | 开12/合13 | `A\iint_\Omega \left[\sum_{i=1}^3f_i(\vec{r})\cos(\alpha_i(\vec{r}))\right]ds+B\iint_\Omega\left[\sum_{i=1}^3g_i(\vec{r})\cos(\beta_i(\vec{r}))\right]ds=A\iint_\` |
| 数学分析/Chap14Note.org:1262 | 开16/合15 | `\sum_{i=1}^n \left(f_x(\vec{r}(u_i,v_i)\cos(\alpha_x(\vec{r}(u_i,v_i)))+f_y(\vec{r}(u_i,v_i))\cos(\alpha_y(\vec{r}(u_i,v_i)))+f_z(\vec{r}(u_i,v_i))\cos(\alpha_z` |
| 数学分析/Chap14Note.org:1264 | 开16/合15 | `\phi(u,v)=f_x(\vec{r}(u,v)\cos(\alpha_x(\vec{r}(u,v)))+f_y(\vec{r}(u,v))\cos(\alpha_y(\vec{r}(u,v)))+f_z(\vec{r}(u,v))\cos(\alpha_z(\vec{r}(u,v)))` |
| 数学分析/Chap15Note.org:1122 | 开12/合11 | `\ln(\Gamma(y+s+1))=\ln(\Gamma((1-y)(s+1)+y(s+2))\leq(1-y)\ln(\Gamma(s+1))+y\ln(\Gamma(s+2))` |
| 数学分析/Chap15Note.org:1130 | 开13/合12 | `\ln(\Gamma(s+1))=\ln(\Gamma((y)(s+y)+(1-y)(s+y+1))\leq y\ln(\Gamma(s+y))+(1-y)\ln(\Gamma(s+y+1))` |
| 数学分析/Chap9Note.org:905 | 开10/合11 | `\lim_{\phi\to0} P_n(\sin^2(\phi)) = \lim_{\phi\to\0} \frac{\sin((2n+1)\phi)}{\sin(\phi)} = \lim_{\phi\to\0} (2n+1)\frac{\sin((2n+1)\phi)}{(2n+1)\phi)}\frac{\phi` |
| 数理逻辑/sllj.org:240 | 开2/合1 | `s'[1]=(` |
| 数理逻辑/sllj.org:244 | 开1/合0 | `(` |
| 数理逻辑/sllj.org:266 | 开2/合1 | `s[1]=(` |
| 数理逻辑/sllj.org:288 | 开1/合2 | `s[\|s\|]=)` |
| 数理逻辑/sllj.org:334 | 开2/合1 | `s[1]=(` |
| 数理逻辑/sllj.org:334 | 开1/合2 | `s[\|s\|]=)` |
| 数理逻辑/sllj.org:334 | 开1/合0 | `(` |
| 数理逻辑/sllj.org:334 | 开0/合1 | `)` |
| 数理逻辑/sllj.org:336 | 开1/合0 | `(` |
| 数理逻辑/sllj.org:336 | 开0/合1 | `)` |
| 数理逻辑/sllj.org:338 | 开1/合0 | `(` |
| 数理逻辑/sllj.org:338 | 开0/合1 | `)` |
| 数理逻辑/sllj.org:362 | 开2/合1 | `s[1]=(` |
| 数理逻辑/sllj.org:362 | 开1/合2 | `s[\|s\|]=)` |
| 数理逻辑/sllj.org:362 | 开1/合0 | `(` |
| 数理逻辑/sllj.org:362 | 开0/合1 | `)` |
| 数理逻辑/sllj.org:364 | 开1/合2 | `s[i]=)\land i\ne\|s\|` |
| 数理逻辑/sllj.org:366 | 开1/合0 | `(` |
| 数理逻辑/sllj.org:366 | 开0/合1 | `)` |
| 数理逻辑/sllj.org:368 | 开1/合0 | `(` |
| 数理逻辑/sllj.org:368 | 开0/合1 | `)` |
| 数理逻辑/sllj.org:368 | 开1/合0 | `(` |
| 数理逻辑/sllj.org:368 | 开0/合1 | `)` |
| 数理逻辑/sllj.org:382 | 开2/合1 | `s[i]=(` |
| 数理逻辑/sllj.org:382 | 开1/合2 | `s[j]=),j>i` |
| 数理逻辑/sllj.org:384 | 开1/合2 | `s[i]=)` |
| 数理逻辑/sllj.org:384 | 开2/合1 | `s[j]=(,j<i` |
| 数理逻辑/sllj.org:404 | 开2/合1 | `s[i]=(` |
| 数理逻辑/sllj.org:404 | 开1/合2 | `s[\|s\|]=)` |
| 数理逻辑/sllj.org:406 | 开0/合1 | `)` |
| 数理逻辑/sllj.org:408 | 开0/合1 | `)` |
| 数理逻辑/sllj.org:410 | 开2/合1 | `s[i]=(` |
| 数理逻辑/sllj.org:414 | 开2/合1 | `s[i]=(` |
| 数理逻辑/sllj.org:414 | 开1/合2 | `s[\|s\|]=)` |
| 数理逻辑/sllj.org:416 | 开0/合1 | `)` |
| 数理逻辑/sllj.org:422 | 开1/合2 | `\phi_1[\|\phi_1\|]=)` |
| 数理逻辑/sllj.org:422 | 开2/合1 | `\phi_1[1]=(` |
| 数理逻辑/sllj.org:424 | 开1/合0 | `(` |
| 数理逻辑/sllj.org:428 | 开2/合1 | `\phi_2[1]=(` |
| 数理逻辑/sllj.org:428 | 开1/合2 | `\phi_2[\|\phi_2\|]=)` |
| 数理逻辑/sllj.org:430 | 开1/合2 | `\phi_2[\|\phi_2\|]=)` |
| 数理逻辑/sllj.org:466 | 开2/合1 | `\psi[1]=(` |
| 数理逻辑/sllj.org:466 | 开1/合2 | `\psi[\|\psi\|]=)` |
| 数理逻辑/sllj.org:1215 | 开3/合4 | `\Gamma\cup\{(\phi_1\to\phi_2)\}\vdash(\phi_3\to(\phi_1\to\phi_2)))` |
| 数理逻辑/sllj.org:2361 | 开1/合2 | `\tau[\|\tau\|]=)` |
| 数理逻辑/sllj.org:2363 | 开1/合0 | `(` |
| 数理逻辑/sllj.org:2363 | 开0/合1 | `)` |
| 数理逻辑/sllj.org:2365 | 开1/合0 | `(` |
| 数理逻辑/sllj.org:2365 | 开0/合1 | `)` |
| 数理逻辑/sllj.org:2367 | 开2/合1 | `\tau[2]=(` |
| 数理逻辑/sllj.org:2367 | 开1/合0 | `(` |
| 数理逻辑/sllj.org:2367 | 开0/合1 | `)` |
| 数理逻辑/sllj.org:2377 | 开0/合1 | `)` |
| 数理逻辑/sllj.org:2377 | 开1/合0 | `(` |
| 数理逻辑/sllj.org:2391 | 开2/合1 | `\tau[i]=(,i\ne2` |
| 数理逻辑/sllj.org:2391 | 开1/合0 | `(` |
| 数理逻辑/sllj.org:2391 | 开1/合2 | `\tau[\|\tau\|]=)` |
| 数理逻辑/sllj.org:2393 | 开1/合0 | `(` |
| 数理逻辑/sllj.org:2393 | 开0/合1 | `)` |
| 数理逻辑/sllj.org:2397 | 开1/合0 | `(` |
| 数理逻辑/sllj.org:2397 | 开1/合0 | `(` |
| 数理逻辑/sllj.org:2397 | 开1/合0 | `(` |
| 数理逻辑/sllj.org:2399 | 开0/合1 | `)` |
| 数理逻辑/sllj.org:2399 | 开0/合1 | `)` |
| 数理逻辑/sllj.org:2399 | 开0/合1 | `)` |
| 数理逻辑/sllj.org:2411 | 开1/合0 | `(` |
| 数理逻辑/sllj.org:2411 | 开0/合1 | `)` |
| 数理逻辑/sllj.org:2441 | 开2/合1 | `\tau[i]=(` |
| 数理逻辑/sllj.org:2441 | 开1/合2 | `\tau[j]=)\land j>i` |
| 数理逻辑/sllj.org:2461 | 开2/合1 | `\tau[2]=(` |
| 数理逻辑/sllj.org:2465 | 开2/合1 | `\tau[i]=(` |
| 数理逻辑/sllj.org:2465 | 开1/合2 | `\tau[j]=)\land j>i` |
| 数理逻辑/sllj.org:2471 | 开1/合0 | `(` |
| 数理逻辑/sllj.org:2471 | 开0/合1 | `)` |
| 数理逻辑/sllj.org:2473 | 开2/合1 | `\tau[2]=(` |
| 数理逻辑/sllj.org:2473 | 开1/合2 | `\tau[\|\tau\|]=)` |
| 数理逻辑/sllj.org:2483 | 开1/合2 | `\tau_k[\|\tau_k\|]=)` |
| 数理逻辑/sllj.org:2483 | 开1/合0 | `(` |
| 数理逻辑/sllj.org:2483 | 开1/合0 | `(` |
| 数理逻辑/sllj.org:2483 | 开0/合1 | `)` |
| 数理逻辑/sllj.org:2491 | 开1/合2 | `\tau[j]=)` |
| 数理逻辑/sllj.org:2491 | 开2/合1 | `\tau[i]=(\land j>i` |
| 数理逻辑/sllj.org:2563 | 开1/合0 | `(` |
| 数理逻辑/sllj.org:2563 | 开0/合1 | `)` |
| 数理逻辑/sllj.org:2563 | 开1/合0 | `(` |
| 数理逻辑/sllj.org:2563 | 开0/合1 | `)` |
| 数理逻辑/sllj.org:2569 | 开2/合1 | `\tau[n]=(` |
| 数理逻辑/sllj.org:2583 | 开2/合1 | `\tau[n]\ne(` |
| 数理逻辑/sllj.org:2587 | 开2/合1 | `\tau[n+1]=(` |
| 数理逻辑/sllj.org:2683 | 开1/合2 | `\phi[\|\phi\|]=)` |
| 数理逻辑/sllj.org:2683 | 开2/合1 | `\phi[2]=(` |
| 数理逻辑/sllj.org:2683 | 开2/合1 | `\phi[1]=(` |
| 数理逻辑/sllj.org:2683 | 开2/合1 | `\phi[k]=(` |
| 数理逻辑/sllj.org:2685 | 开1/合0 | `(` |
| 数理逻辑/sllj.org:2685 | 开0/合1 | `)` |
| 数理逻辑/sllj.org:2687 | 开1/合0 | `(` |
| 数理逻辑/sllj.org:2687 | 开0/合1 | `)` |
| 数理逻辑/sllj.org:2689 | 开1/合0 | `(` |
| 数理逻辑/sllj.org:2689 | 开0/合1 | `)` |
| 数理逻辑/sllj.org:2695 | 开1/合2 | `\phi[\|\phi\|]=)` |
| 数理逻辑/sllj.org:2695 | 开2/合1 | `\phi[2]=(` |
| 数理逻辑/sllj.org:2695 | 开2/合1 | `\phi[1]=(` |
| 数理逻辑/sllj.org:2699 | 开1/合0 | `(` |
| 数理逻辑/sllj.org:2699 | 开0/合1 | `)` |
| 数理逻辑/sllj.org:2725 | 开2/合1 | `\phi[2]=(` |
| 数理逻辑/sllj.org:2725 | 开2/合1 | `\phi[1]=(` |
| 数理逻辑/sllj.org:2725 | 开2/合1 | `\phi[z]=(` |
| 数理逻辑/sllj.org:2727 | 开1/合2 | `\phi_k[\|\phi_k\|]\ne)` |
| 数理逻辑/sllj.org:2729 | 开1/合2 | `\phi_k[\|\phi_k\|]=)` |
| 数理逻辑/sllj.org:2729 | 开1/合0 | `(` |
| 数理逻辑/sllj.org:2729 | 开0/合1 | `)` |
| 数理逻辑/sllj.org:2735 | 开2/合1 | `\phi[i]=(` |
| 数理逻辑/sllj.org:2745 | 开2/合1 | `\phi[i]=(` |
| 数理逻辑/sllj.org:2745 | 开1/合2 | `\phi[k_1]=)` |
| 数理逻辑/sllj.org:2745 | 开1/合2 | `\phi[k_2]=)` |
| 数理逻辑/sllj.org:2751 | 开1/合0 | `(` |
| 数理逻辑/sllj.org:2751 | 开0/合1 | `)` |
| 数理逻辑/sllj.org:2767 | 开1/合0 | `(` |
| 数理逻辑/sllj.org:2767 | 开0/合1 | `)` |
| 数理逻辑/sllj.org:2775 | 开2/合1 | `\phi[1]=(` |
| 数理逻辑/sllj.org:2775 | 开2/合1 | `\phi[2]=(` |
| 数理逻辑/sllj.org:2775 | 开1/合2 | `\phi[\|\phi\|]=)` |
| 数理逻辑/sllj.org:2779 | 开0/合1 | `)` |
| 数理逻辑/sllj.org:2787 | 开1/合0 | `(` |
| 数理逻辑/sllj.org:2787 | 开0/合1 | `)` |
| 数理逻辑/sllj.org:2791 | 开2/合1 | `\phi[1]=(` |
| 数理逻辑/sllj.org:2791 | 开1/合2 | `\phi[\|\phi\|]=)` |
| 数理逻辑/sllj.org:2811 | 开1/合0 | `(` |
| 数理逻辑/sllj.org:2811 | 开0/合1 | `)` |
| 数理逻辑/sllj.org:2891 | 开1/合0 | `(` |
| 数理逻辑/sllj.org:2891 | 开0/合1 | `)` |
| 数理逻辑/sllj.org:2917 | 开2/合1 | `\phi[n]=(` |
| 数理逻辑/sllj.org:2917 | 开3/合2 | `\phi[n]=p_i,\phi[n+1]=(` |
| 数理逻辑/sllj.org:2919 | 开3/合2 | `\psi[\|\psi\|]\ne p_i,\psi[\|\psi\|]\ne(` |
| 数理逻辑/sllj.org:2921 | 开2/合1 | `\phi[n+1]=(` |
| 数理逻辑/sllj.org:2923 | 开1/合2 | `\phi[m']=)` |
| 数理逻辑/sllj.org:2941 | 开2/合3 | `\phi[n]\ne\to,\phi[n]\ne)` |
| 数理逻辑/sllj.org:2945 | 开2/合1 | `\phi[n]=(` |
| 数理逻辑/sllj.org:2945 | 开3/合2 | `\phi[n]=p_i,\phi[n+1]=(` |
| 数理逻辑/sllj.org:2947 | 开3/合2 | `\psi_1[\|\psi_1\|]\ne p_i,\psi_1[\|\psi_1\|]\ne(` |
| 数理逻辑/sllj.org:2947 | 开2/合1 | `\phi[n+1]=(` |
| 数理逻辑/sllj.org:2949 | 开1/合2 | `\phi[m']=)` |
| 数理逻辑/sllj.org:2979 | 开1/合2 | `\phi[k]=)\land k> i+1` |
| 数理逻辑/sllj.org:2987 | 开2/合1 | `\phi[p-1]=(` |
| 数理逻辑/sllj.org:2989 | 开1/合2 | `\phi[q]=)\land q> i+1` |
| 数理逻辑/sllj.org:2995 | 开1/合0 | `(` |
| 数理逻辑/sllj.org:2995 | 开0/合1 | `)` |
| 数理逻辑/sllj.org:3005 | 开3/合2 | `\phi[2-1]=\phi[1]=(` |
| 数理逻辑/sllj.org:3015 | 开2/合1 | `\phi[p-1]=(` |
| 数理逻辑/sllj.org:3017 | 开1/合2 | `\phi[q]=)\land q> i+1` |
| 数理逻辑/sllj.org:3031 | 开2/合1 | `\psi[p+2-1]=(` |
| 数理逻辑/sllj.org:3031 | 开3/合2 | `\phi[p-1]=\psi[p+2-1]=(` |
| 数理逻辑/sllj.org:3033 | 开1/合2 | `\psi[q]=)` |
| 数理逻辑/sllj.org:3033 | 开0/合1 | `)` |
| 数理逻辑/sllj.org:3035 | 开1/合2 | `\phi[q-2]=)` |
| 数理逻辑/sllj.org:3553 | 开1/合2 | `\phi[q]=)` |
| 数理逻辑/sllj.org:3619 | 开1/合0 | `(` |
| 数理逻辑/sllj.org:3619 | 开0/合1 | `)` |
| 数理逻辑/sllj.org:3851 | 开1/合0 | `(` |
| 数理逻辑/sllj.org:3851 | 开0/合1 | `)` |
| 数理逻辑/sllj.org:5605 | 开4/合3 | `\Gamma\cup\{((\exists x_i\phi)\to(\phi(\left<x_i\right>,\left<c\right>))\}` |
| 数理逻辑/sllj.org:5611 | 开4/合3 | `\Gamma\cup\{((\exists x_i\phi)\to(\phi(\left<x_i\right>,\left<c\right>))\}` |
| 数理逻辑/sllj.org:5611 | 开5/合4 | `\Gamma\vdash(\lnot((\exists x_i\phi)\to(\phi(\left<x_i\right>,\left<c\right>)))` |
| 数理逻辑/sllj.org:5635 | 开4/合3 | `\Gamma\cup\{((\exists x_i\phi)\to(\phi(\left<x_i\right>,\left<c\right>))\}` |
| 数理逻辑/sllj.org:5805 | 开1/合0 | `(` |
| 数理逻辑/sllj.org:5805 | 开0/合1 | `)` |
| 数理逻辑/sllj.org:5993 | 开1/合2 | `\left<\mathcal{M},v\right>\vDash\phi(\left<x_1,...,x_n\right>,\left<c_{i_1},...,c_{i_n}\right>))` |
| 数理逻辑/sllj.org:5997 | 开2/合3 | `\Gamma\vdash(\phi\left<x_1\right>,\left<c_{i_1}\right>)\leftrightarrow\phi(\left<x_1,x_2\right>,\left<c_{i_1},c_{i_2}\right>))` |
| 数理逻辑/sllj.org:6003 | 开1/合2 | `\left<\mathcal{M},v\right>\vDash\phi(\left<x_1,...,x_n\right>,\left<c_{i_1},...,c_{i_n}\right>))` |
| 数理逻辑/sllj.org:6003 | 开1/合2 | `\phi(\left<x_1,...,x_n\right>,\left<c_{i_1},...,c_{i_n}\right>))\in\Gamma` |
| 数理逻辑/sllj.org:6005 | 开1/合2 | `\phi(\left<x_1,...,x_n\right>,\left<c_{i_1},...,c_{i_n}\right>))\in\Gamma` |
| 数理逻辑/sllj.org:6005 | 开1/合2 | `\Gamma\vdash\phi(\left<x_1,...,x_n\right>,\left<c_{i_1},...,c_{i_n}\right>))` |
| 数理逻辑/sllj.org:6009 | 开1/合2 | `\Gamma\vdash\phi(\left<x_1,...,x_n\right>,\left<c_{i_1},...,c_{i_n}\right>))` |
| 数理逻辑/sllj.org:6071 | 开3/合4 | `\phi_n(\left<c_1,...,c_v\right>,\left<x_{u+1},...,x_{u+v}\right>)\right>)=\phi_n=(\lnot(x_1\hat{=}x_1))` |
| 数理逻辑/sllj.org:6119 | 开1/合2 | `\Gamma^*_\infty\vdash\phi\left(\left<x_i\rigth>,\left<c^m_{\left<x_i,\phi\right>}\right>\right)\right)` |
| 数理逻辑/sllj.org:6121 | 开1/合2 | `\Gamma^*_\infty\cup\left\{\phi\left(\left<x_i\rigth>,\left<c^m_{\left<x_i,\phi\right>}\right>\right)\right)\right\}` |
| 数理逻辑/sllj.org:6123 | 开1/合2 | `\phi\left(\left<x_i\rigth>,\left<c^m_{\left<x_i,\phi\right>}\right>\right)\right)\in\Gamma^*_\infty` |
| 数理逻辑/sllj.org:6283 | 开1/合0 | `(` |
| 数理逻辑/sllj.org:6283 | 开0/合1 | `)` |
| 数理逻辑/sllj.org:7333 | 开1/合0 | `(` |
| 数理逻辑/sllj.org:7333 | 开0/合1 | `)` |
| 数理逻辑/sllj.org:7471 | 开2/合3 | `(x_{n+1}\hat{ =}f(x_1,...,x_n)))` |
| 数理逻辑/sllj.org:7767 | 开1/合0 | `(` |
| 数理逻辑/sllj.org:7767 | 开0/合1 | `)` |
| 数理逻辑/sllj.org:7829 | 开1/合0 | `(` |
| 数理逻辑/sllj.org:7829 | 开0/合1 | `)` |
| 数理逻辑/sllj.org:8075 | 开1/合0 | `(` |
| 数理逻辑/sllj.org:8075 | 开0/合1 | `)` |
| 数理逻辑/sllj.org:8315 | 开1/合0 | `(` |
| 数理逻辑/sllj.org:8315 | 开0/合1 | `)` |
| 数理逻辑/sllj.org:8852 | 开1/合0 | `(` |
| 数理逻辑/sllj.org:8852 | 开0/合1 | `)` |
| 数理逻辑/sllj.org:9734 | 开1/合0 | `(` |
| 数理逻辑/sllj.org:9734 | 开0/合1 | `)` |
| 数理逻辑/sllj.org:10426 | 开1/合2 | `\phi[q]=)` |
| 数理逻辑/sllj.org:11524 | 开3/合4 | `\psi_i=\exists x_1(...(\exists x_n(\phi_{i_1}\land...\land\phi_{i_{m_i}}))))` |
| 数理逻辑/sllj.org:11584 | 开2/合3 | `v(x_i),...,v(x_i))` |
| 数理逻辑/sllj.org:11896 | 开1/合0 | `(` |
| 数理逻辑/sllj.org:11896 | 开0/合1 | `)` |
| 数理逻辑/sllj.org:12114 | 开6/合5 | `T\vdash(\lnot(\exists x_1(...(\exists x_n(\phi\land(\lnot\sigma)))))` |
| 数理逻辑/sllj.org:13199 | 开1/合0 | `(` |
| 数理逻辑/sllj.org:13199 | 开0/合1 | `)` |
| 数理逻辑/sllj.org:14849 | 开1/合0 | `(` |
| 数理逻辑/sllj.org:14849 | 开0/合1 | `)` |
| 离散数学/Disc_Math.org:249 | 开12/合11 | `\text{OneCapElt}(x_1,x_2)=(\exists x_3(p_\in(x_3,x_1)\land p_\in(x_3,x_2)\land(\forall x_4(((p_\in(x_4,x_1)\land p_\in(x_4,x_2)\to(x_3\hat{=}x_4))))))` |
| 离散数学/Disc_Math.org:431 | 开3/合4 | `x=\Phi_{pair}(\mathcal{M},v(x_1),v(x_1)))` |
| 离散数学/Disc_Math.org:433 | 开3/合4 | `x=\Phi_{pair}(\mathcal{M},v(x_1),v(x_2)))` |
| 离散数学/Disc_Math.org:1732 | 开6/合5 | `S=\left\{x\big\|((x\in\bigcup C)\land(\forall c((c\in C)\rightarrow (x\in c)))\right\}` |
| 离散数学/Disc_Math.org:6722 | 开1/合0 | `\mathcal{B}=\left\{<v,w>\big\|(\exists u\in V\rightarrow\{<u,v>,<u,w>\}\subset E\right\}` |
| 算数理论/ssll.org:409 | 开4/合3 | `\mathcal{M}\not\vDash(\forall x_1(\phi\to\phi(\left<x_1\right>,\left<f_s(x_1)\right>))` |
| 算数理论/ssll.org:459 | 开4/合3 | `\mathcal{M}\not\vDash(\forall x_1(\phi\to\phi(\left<x_1\right>,\left<f_s(x_1)\right>))` |
| 算数理论/ssll.org:503 | 开4/合3 | `\mathcal{M}\vDash(\forall x_1(\phi\to\phi(\left<x_1\right>,\left<f_s(x_1)\right>))` |
| 算数理论/ssll.org:1021 | 开3/合4 | `\mathcal{N}^*\vDash(f_+(\tau_n,\tau_m)\hat{ =}f_s^m(\tau_n)))` |
| 算数理论/ssll.org:1029 | 开3/合4 | `\mathcal{N}^*\vDash(f_\times(\tau_n,\tau_m)\hat{ =}f_+^n(\tau_n)))` |
| 算数理论/ssll.org:1271 | 开7/合8 | `\mathcal{M}\vDash\phi(\left<x_1\right>,\left<x_{n+1}\right>)\to (\lnot(p_<(x_{n+1},x_1))))[a,v(x_2),...,v(x_n),b]` |
| 算数理论/ssll.org:1464 | 开5/合4 | `(\exists x_{1}(\phi(x_1)\land (p_<(x_1,\tau)))` |
| 算数理论/ssll.org:1564 | 开3/合2 | `\mu_{x_1}(\mathcal{M},v,(x_2\hat{=}f_\times(x_1,x_3))` |
| 算数理论/ssll.org:1582 | 开7/合6 | `sub(x_1,x_2,x_3)=\mu(((f_+(x_3,x_1)\hat{=}x_2)\lor (\lnot p_<(x_3,x_2)),x_1)` |
| 算数理论/ssll.org:1790 | 开7/合8 | `\mu\left(\left(\exists x_{4<y}\left(\exists x_{5<y}\left((y\hat{=}op(x_4,x_5))\land\phi(x_4,x_1,z,x_5)\right)\right)\right),x_1,x_8\right)\right)` |
| 算数理论/ssll.org:1804 | 开7/合8 | `\left<\mathcal{M},e\cdot v\right>\vDash\mu\left(\left(\exists x_{4<y}\left(\exists x_{5<y}\left((y\hat{=}op(x_4,x_5))\land\phi(x_4,x_1,z,x_5)\right)\right)\righ` |
| 算数理论/ssll.org:1814 | 开7/合8 | `\left<\mathcal{M},e\cdot v\right>\vDash\mu\left(\left(\exists x_{4<y}\left(\exists x_{5<y}\left((y\hat{=}op(x_4,x_5))\land\phi(x_4,x_1,z,x_5)\right)\right)\righ` |
| 算数理论/ssll.org:2623 | 开1/合0 | `(` |
| 算数理论/ssll.org:2623 | 开0/合1 | `)` |
| 算数理论/ssll.org:2653 | 开2/合1 | `SN(()` |
| 算数理论/ssll.org:2655 | 开3/合2 | `SN(p^n_i)\ne SN(()` |
| 算数理论/ssll.org:2735 | 开6/合5 | `\chi_<\left(g'(\vec{a},x),c_b(\vec{a},x)\right)+\chi_<\left(c_b(\vec{a},x),g'(\vec{a},x)=0` |
| 算数理论/ssll.org:2925 | 开6/合7 | `(\lnot(\exists x(\lnot((x<m)\to(\left<\vec{a},x\right>\in U))))))` |
| 算数理论/ssll.org:2927 | 开5/合6 | `(\exists x(\lnot((x<m)\to(\left<\vec{a},x\right>\in U)))))` |
| 算数理论/ssll.org:2929 | 开6/合7 | `(\lnot(\exists x(\lnot((x<m)\to(\left<\vec{a},x\right>\in U))))))` |
| 算数理论/ssll.org:3095 | 开5/合6 | `f(\vec{a},m)=\mu_x\left(\chi_{(x<m\land \left<\vec{a},m\right>\in R)\lor(x=m))}(\vec{a},m,x)=1\right)` |
| 算数理论/ssll.org:3103 | 开5/合6 | `f(\vec{a},m)=\mu_x\left(\chi_{(x<m\land \left<\vec{a},m\right>\in R)\lor(x=m))}(\vec{a},m,x)=1\right)\in\mathscr{R}` |
| 算数理论/ssll.org:3135 | 开6/合7 | `(\lnot(\exists x(\lnot((x<m)\to(\left<\vec{a},x\right>\in U))))))` |
| 算数理论/ssll.org:3137 | 开5/合6 | `(\exists x(\lnot((x<m)\to(\left<\vec{a},x\right>\in U)))))` |
| 算数理论/ssll.org:3139 | 开6/合7 | `(\lnot(\exists x(\lnot((x<m)\to(\left<\vec{a},x\right>\in U))))))` |
| 算数理论/ssll.org:3189 | 开3/合2 | `\mu_x(\chi_{(b=c\times a}(a,b,x)=1)\in\mathscr{R}` |
| 算数理论/ssll.org:3191 | 开3/合2 | `\mu_x(\chi_{(b=c\times a}(a,b,x)=1)` |
| 算数理论/ssll.org:3193 | 开4/合3 | `\mu_x(\chi_{(b=c\times a}(a,b,x)=1)=\text{Div}(\mathfrak{N},a,b)` |
| 算数理论/ssll.org:3303 | 开4/合5 | `\mu_x\left(\chi_{2\cdot x=(a+b)\cdot(a+b+1))+2\cdot a}(x,a,b)=1\right)` |
| 算数理论/ssll.org:3307 | 开2/合3 | `2\cdot x=(a+b)\cdot(a+b+1))+2\cdot a\in\mathscr{R}` |
| 算数理论/ssll.org:3309 | 开5/合6 | `f(a,b)=\mu_x\left(\chi_{2\cdot x=(a+b)\cdot(a+b+1))+2\cdot a}(x,a,b)=1\right)\in\mathscr{R}` |
| 算数理论/ssll.org:3501 | 开8/合7 | `T_N\vdash\left(\forall y\left(\phi\left(\left<x_1,...,x_n,y\right>,\left<\tau_{v(x_1)},...,\tau_{v(x_n)},\tau_{v(y)}\right>\right)\to\left(y\hat{=}\tau_{v(y)}\r` |
| 算数理论/ssll.org:3511 | 开4/合3 | `\phi^*=\left(\forall y(\phi''\to(y\hat{=}\tau_{v(y)}))` |
| 算数理论/ssll.org:3525 | 开4/合3 | `T_N\vdash\left(\forall y\left(\phi''\to\left(y\hat{=}\tau_{v(y)}\right)\right)` |
| 算数理论/ssll.org:3531 | 开6/合5 | `\phi^* = \left(\forall y\left(\left(\tau_{v(x_1)+1}\hat{ = }y\right)\to\left(y\hat{ =}\tau_{v(x_1)+1}\right)\right)` |
| 算数理论/ssll.org:3533 | 开5/合4 | `\left<\mathcal{M},\delta\right>\vDash\left(\left(\tau_{v(x_1)+1}\hat{ = }y\right)\to\left(y\hat{ =}\tau_{v(x_1)+1}\right)` |
| 算数理论/ssll.org:3533 | 开6/合5 | `\left<\mathcal{M},\delta\right>\vDash\left(\forall y\left(\left(\tau_{v(x_1)+1}\hat{ = }y\right)\to\left(y\hat{ =}\tau_{v(x_1)+1}\right)\right)` |
| 算数理论/ssll.org:3541 | 开9/合8 | `\phi^* = \left(\forall y\left(\left(f_+(\tau_{v(x_1)},\tau_{v(x_2)})\hat{ = }y\right)\to\left(y\hat{ =}\tau_{v(x_1)+v(x_2)}\right)\right)` |
| 算数理论/ssll.org:3557 | 开9/合8 | `\phi^* = \left(\forall y\left(\left(f_\times(\tau_{v(x_1)},\tau_{v(x_2)})\hat{ = }y\right)\to\left(y\hat{ =}\tau_{v(x_1)\cdot v(x_2)}\right)\right)` |
| 算数理论/ssll.org:3579 | 开4/合3 | `\phi^* = \left(\forall y\left(\phi''\to\left(y\hat{ =}\tau_{v(y)}\right)\right)` |
| 算数理论/ssll.org:3595 | 开6/合5 | `\phi^* = \left(\forall y\left(\left(\tau_{v(x_i)}\hat{ = }y\right)\to\left(y\hat{ =}\tau_{v(x_1)+1}\right)\right)` |
| 算数理论/ssll.org:3639 | 开4/合3 | `\phi^* =\left(\forall y(\phi''\to(z\hat{ =}\tau_{v(z)}))` |
| 算数理论/ssll.org:3661 | 开3/合2 | `\left<\mathcal{M},u\right>\vDash\left(\phi''\to(x_n\hat{ =}\tau_{v(x_n)}\right)` |
| 算数理论/ssll.org:3679 | 开3/合2 | `\left<\mathcal{M},u\right>\vDash\left(\phi''\to(x_n\hat{ =}\tau_{v(x_n)}\right)` |
| 算数理论/ssll.org:3681 | 开3/合2 | `\left<\mathcal{M},u\right>\vDash\left(\phi''\to(x_n\hat{ =}\tau_{v(x_n)}\right)` |
| 算数理论/ssll.org:3681 | 开4/合3 | `\mathcal{M}\vDash\left(\forall z\left(\phi''\to(z\hat{ =}\tau_{v(x_n)}\right)\right)` |
| 算数理论/ssll.org:3691 | 开4/合3 | `T_N\vdash\left(\forall y\left(\psi''\to\left(y\hat{=}\tau_{v(y)}\right)\right)` |
| 算数理论/ssll.org:3703 | 开4/合6 | `\left<\mathfrak{N},w\right>\vDash(\forall z(\psi_{zy}\to (\lnot p_<(z,x_n)))))\right)` |
| 算数理论/ssll.org:3715 | 开4/合3 | `\phi^*=\left(\forall x_n(\phi''\to(x_n\hat{=}\tau_{v(x_n)}))` |
| 算数理论/ssll.org:3719 | 开3/合2 | `\left<\mathcal{M},u\right>\vDash(\phi''\to(x_n\hat{ =}\tau_{v(x_n)})` |
| 算数理论/ssll.org:3727 | 开4/合6 | `\left<\mathcal{M},\eta\right>\vDash(\forall z(\psi_{zy}\to (\lnot p_<(z,x_n)))))\right)` |
| 算数理论/ssll.org:3729 | 开4/合6 | `\left<\mathcal{M},\eta\right>\vDash(\forall z(\psi_{zy}\to (\lnot p_<(z,x_n)))))\right)` |
| 算数理论/ssll.org:3745 | 开6/合5 | `T_N\vdash\left(\forall y\left(\psi\left(\left<x_1,...,x_n,y\right>,\left<\tau_{v(x_1)},...,\tau_{(x_{n-1})},\tau_k,y}\right>\right)\to\left(y\hat{=}\tau_b}\righ` |
| 算数理论/ssll.org:3747 | 开6/合5 | `\mathcal{M}\vDash\left(\forall y\left(\psi\left(\left<x_1,...,x_n,y\right>,\left<\tau_{v(x_1)},...,\tau_{(x_{n-1})},\tau_k,y}\right>\right)\to\left(y\hat{=}\tau` |
| 算数理论/ssll.org:3749 | 开5/合4 | `\left<\mathcal{M},\eta\right>\vDash\left(\psi\left(\left<x_1,...,x_n,y\right>,\left<\tau_{v(x_1)},...,\tau_{(x_{n-1})},\tau_k,y}\right>\right)\to\left(y\hat{=}\` |
| 算数理论/ssll.org:3759 | 开3/合2 | `\left<\mathcal{M},u\right>\vDash(\phi''\to(x_n\hat{ =}\tau_{v(x_n)})` |
| 算数理论/ssll.org:3759 | 开4/合3 | `\mathcal{M}\vDash\left(\forall x_n\left(\phi''\to(x_n\hat{ =}\tau_{v(x_n)}\right)\right)` |
| 算数理论/ssll.org:3837 | 开13/合14 | `(a)_0=2+2\pi_F(f_i)\land(a)_1=SN(f_i)\land(a)_2=SN(f_i)\land(a)_{2+2\pi_F(f_i)}=SN())\land\left(\bigwedge_{i=2}^{\pi_F(f_i)}(a)_{2i}=SN(,)\right)` |
| 算数理论/ssll.org:3951 | 开6/合5 | `a=\prec SN((),SN(\forall),a_1,SN((),a_2,SN())\succ` |
| 算数理论/ssll.org:3987 | 开6/合5 | `a=\prec SN((),SN(\forall),a_1,SN((),a_2,SN())\succ` |
| 算数理论/ssll.org:4009 | 开6/合5 | `a=\prec SN((),SN(\forall),a_1,SN((),a_2,SN())\succ` |
| 算数理论/ssll.org:4581 | 开7/合8 | `(\forall x(((x<\text{MaxVr}(a))\to(\left<a,\text{MaxVr}(a)\right>\in\lnot\text{Free}\lor x\in\lnot\text{Vrble})))))` |
| 算数理论/ssll.org:4583 | 开5/合6 | `x\in(((x<\text{MaxVr}(a))\to(\left<a,x\right>\in\lnot\text{Free}\lor x\in\lnot\text{Vrble}))))` |
| 算数理论/ssll.org:4587 | 开1/合2 | `(\left<a,x\right>\in\lnot\text{Free}\lor x\in\lnot\text{Vrble}))` |
| 算数理论/ssll.org:4647 | 开3/合4 | `\left<\mathcal{M},\eta\right>\vDash\left\forall x_2\left(\phi_f\left(\left<x_0,x_1\right>,\left<\tau_{\lceil\theta\rceil},\tau_{\lceil\theta\rceil}\right>\right` |
| 编译原理/byyl.org:1582 | 开3/合4 | `s_0=s\right)\land\left(f\in\delta(s_{m-1},\sigma_m)\right)\land\left(s_i\in S,1\leq i\leq m+1\right)` |
| 编译原理/byyl.org:1621 | 开3/合4 | `s_0=t\right)\land\left(s\in\delta(s_{m-1},\sigma_m)\right)\land\left(s_i\in S,1\leq i\leq m+1\right)` |
| 高等代数/Algb-2-Liner_Space.org:1762 | 开1/合0 | `\mathcal{K}^n=<\text{span}(\{\epsilon_1,...,\epsilon_n\},K,+,\cdot>` |
| 高等代数/Algb-3-Matrix.org:77 | 开4/合5 | `(k+l)M=\left[(k+l)a_{ij}\right]_{s\times n}=\left[ka_{ij}+la_{ij})\right]_{s\times n}=kM+lM` |
| 高等代数/Algb-4-Multi-equ.org:1391 | 开7/合6 | `\deg(h(x))\leq\max(\deg(f(x)),\deg(g(x))\leq n` |
| 高等代数/Algb-5-Liner_Map.org:223 | 开9/合8 | `\gamma([a]_{\ker(\sigma)}+[b]_{\ker(\sigma)})=\gamma([a+b]_{\ker(\sigma)}=\sigma(a+b)` |
| 高等代数/Algb-5-Liner_Map.org:461 | 开9/合8 | `((\sigma_3\sigma_2)\sigma_1)(a)=(\sigma_3\sigma_2)(\sigma_1(a))=\sigma_3(\sigma_2(\sigma_1(a))` |
| 高等代数/Algb-5-Liner_Map.org:1069 | 开6/合7 | `f_1(a)=f_1(\sum_{i=1}^nk_ia_i)=\sum_{i=1}^nk_if_1(a_i)=\sum_{i=1}^nk_if_2(a_i)=f_2(\sum_{i=1}^nk_ia_i))=f_2(a)` |
| 高等代数/Algb-5-Liner_Map.org:1828 | 开6/合7 | `\sigma^n(\left(\left[\begin{matrix}a_1&a_2&...&a_n\end{matrix}\right]\right))=\left[\begin{matrix}a_1&a_2&...&a_n\end{matrix}\right]M=\sigma\left(\left[\begin{m` |
| 高等代数/Algb-5-Liner_Map.org:2159 | 开6/合5 | `\sigma(I(f_+)(\delta_1,\delta_2))=I_{G_\delta}(f_+)(\sigma(\delta_1)` |
| 高等代数/Algb-5-Liner_Map.org:2159 | 开7/合8 | `\sigma(\delta_2)),\sigma(I(f_-)(\delta_1))=I_{G_\delta}(f_-)(\sigma(\delta_1))` |
| 高等代数/Algb-5-Liner_Map.org:2223 | 开3/合2 | `z\in\text{span}(\{\sigma(a_1),...,\sigma(a_n)\}` |
| 高等代数/Algb-5-Liner_Map.org:2662 | 开14/合15 | `f_1(x)=I_1[x](f_\times)(h_1(x),g(x)),I_1[x](\prod))_{i=2}^sf_i(x)=I_1[x](f_\times)(h_2(x),g(x))` |
| 高等代数/Algb-5-Liner_Map.org:2664 | 开17/合22 | `\mathcal{V}_{f(\sigma)}=\left<\ker(f(\sigma)),K,\pmb{+},\pmb{\cdot})\right>,\mathcal{V}_{f_1(\sigma)}=\left<\ker(f_1(\sigma)),K,\pmb{+},\pmb{\cdot})\right>,\mat` |
| 高等代数/Algb-5-Liner_Map.org:2666 | 开7/合8 | `\mathcal{V}_{f(\sigma)}=\mathcal{V}_{f_1(\sigma)}\oplus\mathcal{V}_{\left(I_1[x](\prod))_{i=2}^sf_i(x)\right)(\sigma)}` |
| 高等代数/Algb-5-Liner_Map.org:2668 | 开6/合7 | `\mathcal{V}=\mathcal{V}_{f_1(\sigma)}\oplus\mathcal{V}_{\left(I_1[x](\prod))_{i=2}^sf_i(x)\right)(\sigma)}` |
| 高等代数/Algb-5-Liner_Map.org:2987 | 开9/合10 | `\sigma_i(a\pmb{+}b)=(\sigma\oplus\lambda\sigma_1)(a\pmb{+}b)=(\sigma\oplus\lambda\sigma_1)(a)\pmb{+}(\sigma\oplus\lambda\sigma_1)(b)\right)=\sigma_i(a)\pmb{+}\s` |
| 高等代数/Algb-5-Liner_Map.org:3069 | 开5/合6 | `\left((\sigma+\lambda_i\sigma_i)^{l_i}\right)\left(\left(\sigma\oplus k_i\sigma_1)^{m-l_i}\right)(a)\right)\ne\vec{0}` |
| 高等代数/Algb-5-Liner_Map.org:3125 | 开18/合20 | `e(f(\sigma))=e\left(\left(I\left(\sum\right)\right)_{i=1}^mI(f_\times)\left(k_i\sigma_1,\sigma^i\right)\right)=\left(I_G\left(\sum\right)\right)_{i=1}^mI_G(f_\t` |
| 高等代数/Algb-5-Liner_Map.org:3127 | 开6/合7 | `\left(I_G\left(\sum\right)\right)_{i=1}^mI_G(f_\times)\left(k_iI_G(c_1),G^i\right)\right)=I_G(c_0)` |
| 高等代数/Algb-5-Liner_Map.org:3273 | 开3/合4 | `\mathcal{V}_{f_i(\sigma)}=\left<\ker(f_i(\sigma)),K,+,\cdot)\right>` |
| 高等代数/Algb-5-Liner_Map.org:3805 | 开9/合12 | `\mathcal{V}_{f(\sigma)}=\left<\ker(f(\sigma)),K,\pmb{+},\pmb{\cdot})\right>,\mathcal{V}_{f_1(\sigma)}=\left<\ker(f_1(\sigma)),K,\pmb{+},\pmb{\cdot})\right>,\mat` |
| 高等代数/Algb-5-Liner_Map.org:3893 | 开6/合8 | `\mathcal{V}_{f(\sigma)}=\left<\ker(f(\sigma)),K,\pmb{+},\pmb{\cdot})\right>,\mathcal{V}_{f_i(\sigma)}=\left<\ker(f_i(\sigma)),K,\pmb{+},\pmb{\cdot})\right>` |

## ④ 多余 & (无对齐环境) —— 45 处

| 文件:行 | 统计 | 公式 |
|---|---|---|
| 复变函数/Cplx_fc.org:272 | &×1 | `\lim_{z\to z_0}\left(f(z)-f(z_0)\right)&=\lim_{z\to z_0}\left((z-z_0)\frac{f(z)-f(z_0)}{z-z_0}\right)` |
| 复变函数/Cplx_fc.org:962 | &×1 | `\frac{f^{(k)}(\xi)-f^{(k)}(z_0)}{\xi-z_0}=&\frac{k!(k+1)}{2\pi i}\int_L\frac{f(z)}{(z-z_0)^{k+2}}+\frac{k!}{2\pi i(\xi-z_0)}\int_L\frac{f(z)V}{(z-z_0)^{k+1}}dz` |
| 大学物理/Note/DiffEq.org:37 | &×1 | `\forall \epsilon>0,&\exist \delta\geq a,\forall A',A''>\delta,\Rightarrow \left\|\int_{A'}^{A''} e^{-st}f(t)dt\right\|<\epsilon` |
| 大学物理/Note/DiffEq.org:39 | &×1 | `\epsilon=\frac{\epsilon'\eta'}{4}\Rightarrow &\exists \delta'\geq 0,\forall A',A''>\delta',\Rightarrow \left\|\int_{A'}^{A''}f(x)dx\right\|<\frac{\epsilon'\eta'` |
| 大学物理/Note/DiffEq.org:124 | &×1 | `\lim_{x\to\xi^+}f(x)=\lim_{x\to\xi^-}f(x)=f(\xi)\Rightarrow &\forall \epsilon>0,\exists \delta>0\Rightarrow f(x)-f(\xi)<\epsilon,x\in [\xi,\xi+\delta)` |
| 实变函数/SBHS.org:1674 | &×1 | `a>b\land c>d&\rightarrow a+c>b+d` |
| 实变函数/SBHS.org:4603 | &×1 | `\bigcap_{i=1}^\infty \left(i,+\infty\right]&=\{\infty\}` |
| 实变函数/SBHS.org:4635 | &×3 | `\sum_{i=1}^n\left\|F(a_i)-F(b_i)\right\|=&\sum_{i=1}^n\left\|\int_{[a_i,b_i]}f(x)dx\right\|\leq&\sum_{i=1}^n\int_{[a_i,b_i]}\|f(x)\|dx\leq&\int_{\bigcup_{i=1}^n` |
| 抽象代数/cxds.org:4170 | &×1 | `(h(x)+(-h'(x)))q(x)=&r'(x)+(-r(x))` |
| 抽象代数/cxds.org:5365 | &×1 | `e^*(I'(f_\times)([p(x)]_\sim,[q(x)]_\sim))=e^*([I[x](f_\times)(p(x),q(x))]_\sim)=&[e'(I[x](f_\times)(p(x),q(x)))]_\sim\\=[J[x](f_\times)(e'(p(x))),e'(q(x))]_\si` |
| 抽象代数/cxds.org:5367 | &×1 | `e^*(I'(f_+)([p(x)]_\sim,[q(x)]_\sim))=e^*([I[x](f_+)(p(x),q(x))]_\sim)=&[e'(I[x](f_\times)(p(x),q(x)))]_\sim\\=[J[x](f_+)(e'(p(x))),e'(q(x))]_\sim=J'(f_+)([e'(p` |
| 数学分析/Chap12Note.org:378 | &×1 | `\Delta z&=f(\vec{x}_0+\Delta\vec{x})-f(\vec{x}_0)=\sum_{i=1}^n A_i \Delta x_i+o(\|\Delta\vec{x}\|)` |
| 数学分析/Chap12Note.org:394 | &×1 | `\Delta z&=f(\vec{x}_0+\Delta\vec{x})-f(\vec{x}_0)=\sum_{i=1}^n A_i \Delta x_i+o(\|\Delta\vec{x}\|)` |
| 数学分析/Chap12Note.org:396 | &×1 | `\Delta z&=f(...,x_{i-1_0},x_{i_0}+\Delta x,x_{i+1_0},...)-f(\vec{x}_0)=A_i \Delta x+o(\|\Delta\vec{x}\|)` |
| 数学分析/Chap12Note.org:624 | &×1 | `\lim_{y\to y_0}\left\{\frac{\partial^2 f(x_0,\xi)}{\partial y \partial x}\right\},&\xi\in(y,y_0)` |
| 数学分析/Chap12Note.org:624 | &×1 | `h(x)=\frac{\partial^2 f(x_0,\xi)}{\partial y \partial x},&\xi\in(y,y_0)` |
| 数学分析/Chap12Note.org:626 | &×1 | `\lim_{y\to y_0}\left\{\lim_{x\to x_0}\left\{\frac{[f(x,y)-f(x_0,y)]-[f(x,y_0)-f(x_0,y_0)]}{(x-x_0)(y-y_0)}\right\}\right\}=\lim_{y\to y_0}\left\{\frac{\partial^` |
| 数学分析/Chap12Note.org:2016 | &×1 | `\frac{\partial G_j(\vec{x}_0,\vec{g}(\vec{x}_0))}{\partial x_i}&=\frac{\partial G_j(\vec{x}_0,\vec{y}_0)}{\partial x_i}+\sum_{k=1}^m \frac{\partial G_j(\vec{x}_` |
| 数学分析/Chap12Note.org:2066 | &×1 | `\frac{\partial G_j(\vec{x}_0,\vec{g}(\vec{x}_0))}{\partial x_i}&=\frac{\partial G_j(\vec{x}_0,\vec{y}_0)}{\partial x_i}+\sum_{k=1}^m \frac{\partial G_j(\vec{x}_` |
| 数学分析/Chap13Note.org:243 | &×1 | `\sum_{i=1}^n\omega_iv_i-\sum_{i=1}^{n^*}\omega^*_iv^*_i&=\sum_{i^*=1}^k\left\{\omega_{i^*} v_{i^*}-\sum_{j=1}^{n_{i*}}\omega_{i^*j}v_{i^*j}\right\}\leq \sum_{i^` |
| 数学分析/Chap13Note.org:265 | &×1 | `\sum_{i=1}^n\omega'_iv'_i-\sum_{i=1}^{n^*}\omega^*_iv^*_i&=\sum_{i^*=1}^k\left\{\omega'_{i^*} v'_{i^*}-\sum_{j=1}^{n_{i*}}\omega'_{i^*j}v'_{i^*j}\right\}` |
| 数学分析/Chap13Note.org:287 | &×1 | `&\forall \epsilon > 0, \exists P:\ \sum_{i=1}^n \omega_i v_i < \epsilon` |
| 数学分析/Chap14Note.org:2356 | &×1 | `\int_{\partial\Sigma}\vec{a}\cdotd\vec{s}&=\iint_\Sigma\nabla\times\vec{a}\cdot d\vec{s}=\iint_\Sigma\vec{0}\cdot d\vec{s}=0` |
| 数学分析/Chap7Note.org:128 | &×2 | `\Rightarrow \lim_{\lambda \to 0} \overline S(P) = L &,\ & \lim_{\lambda \to 0} \underline S(P) = l,\forall P` |
| 数学分析/Chap8Note.org:36 | &×1 | `&m< \frac{\int_a^b f(x)g(x) dx}{\int_a^b g(x) dx} < M` |
| 数学分析/Chap8Note.org:162 | &×1 | `\forall \epsilon>0,&\exist \delta\geq a,\forall A',A''>\delta,\Rightarrow \left\|\int_{A'}^{A''}f(x)dx\right\|<\epsilon` |
| 数理逻辑/sllj.org:4179 | &×1 | `\left<\mathcal{M},v\right>\vDash(\lnot(\phi_1\lor\phi_2))&\Leftrightarrow\left<\mathcal{M},v\right>\vDash((\lnot(\phi_1))\land(\lnot\phi_2))` |
| 数理逻辑/sllj.org:14211 | &×1 | `T_\text{odl}&\vdash(\forall x_1(\forall x_2((x_1\hat{=}x_2)\lor p_<(x_1,x_2)\lor p_<(x_2,x_1))))` |
| 数理逻辑/sllj.org:14215 | &×1 | `T_\text{odl}&\vdash(\forall x_1(\forall x_2(p_<(x_1,x_2)\leftrightarrow((\lnot (x_1\hat{=}x_2))\land (\lnot p_<(x_2,x_1))))))` |
| 数理逻辑/sllj.org:14223 | &×1 | `T_\text{odl}&\vdash(\forall x_1(\forall x_2(p_<(x_1,x_2)\leftrightarrow((\lnot (x_1\hat{=}x_2))\land (\lnot p_<(x_2,x_1))))))` |
| 离散数学/Disc_Math.org:849 | &×1 | `A=B{\|\!\!\!=\!\!\!\|}&(A\subset B)\land(B\subset A)` |
| 离散数学/Disc_Math.org:1883 | &×1 | `A\cup (B\cap C)&=(A\cup B)\cap (A\cup C)` |
| 离散数学/Disc_Math.org:1898 | &×1 | `A\cup (B\cap C)&=(A\cup B)\cap (A\cup C)` |
| 离散数学/Disc_Math.org:1902 | &×1 | `A\cup\left(\bigcap_{i=1}^\infty B_i\right)&=\bigcap_{i=1}^\infty\left(A\cup B_i\right)` |
| 离散数学/Disc_Math.org:1913 | &×1 | `A\cup\left(\bigcap_{i=1}^\infty B_i\right)&=\bigcap_{i=1}^\infty\left(A\cup B_i\right)` |
| 离散数学/Disc_Math.org:1945 | &×1 | `A-(B\cap C)&=(A- B)\cup (A-C)` |
| 离散数学/Disc_Math.org:1959 | &×1 | `A-(B\cap C)&=(A- B)\cup (A-C)` |
| 离散数学/Disc_Math.org:3342 | &×1 | `R\cdot(S\cap T)&\subset(R\cdot S)\cap(R\cdot T)` |
| 离散数学/Disc_Math.org:3358 | &×1 | `R\cdot(S\cap T)&\subset(R\cdot S)\cap(R\cdot T)` |
| 离散数学/Disc_Math.org:3637 | &×1 | `<x,z>\in R^2{\|\!\!\!=\!\!\!\|}&\exists y(xRy\land yRz)` |
| 高等代数/Algb-1-Liner_sys_func.org:127 | &×1 | `&\textcircled{1}` |
| 高等代数/Algb-1-Liner_sys_func.org:127 | &×1 | `&\textcircled{k}` |
| 高等代数/Algb-2-Liner_Space.org:1134 | &×1 | `\forall 1\leq j\leq m & j\in N\Rightarrow \sum_{i=1}^nx_ik_{i_j} = k_{1_j}x_1+...+k_{n_j}x_n=0` |
| 高等代数/Algb-3-Matrix.org:430 | &×1 | `A_{s\times n}I_n&= A_{s\times n}` |
| 高等代数/Algb-3-Matrix.org:1085 | &×1 | `(AB)^T&=B^TA^T` |