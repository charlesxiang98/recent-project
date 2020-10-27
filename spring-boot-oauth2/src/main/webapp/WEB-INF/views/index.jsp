<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<!-- Static content -->
    <title>B2C Ecommerce-cart</title>

    <link rel="stylesheet" type="text/css" href="/resources/css/webbase.css"/>
    <link rel="stylesheet" type="text/css" href="/resources/css/pages-cart.css"/>
</head>

<body>

<div id="cartApp">

    <div class="top">
        <shortcut/>
    </div>

    <div class="cart py-container">


        <div class="allgoods">
            <h4>All products<span></span></h4>
            <div class="cart-main">
                <div class="yui3-g cart-th">
                    <div class="yui3-u-1-4"><input type="checkbox" v-model="selectAll"/> All</div>
                    <div class="yui3-u-1-4">Products</div>
                    <div class="yui3-u-1-8">Unit Price</div>
                    <div class="yui3-u-1-8">Numbers</div>
                    <div class="yui3-u-1-8">Subtotal</div>
                    <div class="yui3-u-1-8">Operating</div>
                </div>
                <div class="cart-item-list">

                    <div class="cart-body">
                        <div class="cart-list">
                            <ul class="goods-list yui3-g" v-for="(c,i) in carts" :key="c.skuId">
                                <li class="yui3-u-1-24">
                                    <input type="checkbox" name="" v-model="selectedCarts" :value="c"/>
                                </li>
                                <li class="yui3-u-11-24">
                                    <div class="good-item">
                                        <div class="item-img"><a :href="'/item/'+c.spuId+'.html'" target="_blank"><img
                                                :src="c.image" width="80px" height="80px"/></a></div>
                                        <div class="item-msg">
												<span>
													<p v-text="c.title.substring(0, 35) + '...'"></p>
                                                    <p style="margin-bottom: 0px" v-for="(v,k) in JSON.parse(c.ownSpec)"
                                                       :key="k">
                                                        <span v-text="k"></span> : <span style="color: #BE0000;"
                                                                                         v-text="v"></span>
                                                    </p>
												</span>
                                        </div>
                                    </div>
                                </li>

                                <li class="yui3-u-1-8">
                                    <span style="line-height:70px " class="price"
                                          v-text="ly.formatPrice(c.newPrice)"></span><br/>
                                    <span v-if="c.newPrice < c.price" style="color: #bf360c;"
                                          v-text="'is cheaper than added before：￥' + ly.formatPrice(c.price - c.newPrice)"></span>
                                    <span v-if="c.newPrice > c.price" style="color: #bf360c;"
                                          v-text="'expensive:￥' + ly.formatPrice(c.newPrice - c.price) + 'expensive if you are waiting！'"></span>
                                </li>
                                <li class="yui3-u-1-8" style="padding-top: 20px">
                                    <a href="javascript:void(0)" class="increment mins" @click="decrement(c)">-</a>
                                    <input autocomplete="off" type="text" v-model="c.num" minnum="1" class="itxt"/>
                                    <a href="javascript:void(0)" class="increment plus" @click="increment(c)">+</a>
                                </li>
                                <li class="yui3-u-1-8"><span style="line-height:70px " class="sum"
                                                             v-text="ly.formatPrice(c.newPrice * c.num)"></span></li>
                                <li class="yui3-u-1-8">
                                    <a href="#" @click.prevent="deleteCart(i)">Delete</a><br/>
                                    <a href="#none">move into my favoriate</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>

            </div>
            <div class="cart-tool">
                <div class="select-all">
                    <input type="checkbox" v-model="selectAll"/>
                    <span>Choose All</span>
                </div>
                <div class="option">
                    <a href="#none">Delete chosen products</a>
                    <a href="#none">add it into my favorite</a>
                    <a href="#none">remove the unavaiable products</a>
                </div>
                <div class="toolbar">
                    <div class="chosed">Chosen<span v-text="selectedCarts.length"></span>products</div>
                    <div class="sumprice">
                        <span><em>Total price(�exclude the freight)</em><i class="summoney" v-text="ly.formatPrice(totalPrice)"></i></span>
                        <span><em>save�</em><i>$20.00</i></span>
                    </div>
                    <div class="sumbtn">
                        <a class="sum-btn" href="#" @click.prevent="toOrderInfo" target="_blank">Pay</a>
                    </div>
                </div>
            </div>
            <div class="clearfix"></div>
            <div class="deled">
                <span>removed products, you can buy it again or add it into your favorite：</span>
                <div class="cart-list del">
                    <ul class="goods-list yui3-g">
                        <li class="yui3-u-1-2">
                            <div class="good-item">
                                <div class="item-msg">Apple Macbook Air 13.3 inch Macbook Pro（Corei5）CPU</div>
                            </div>
                        </li>
                        <li class="yui3-u-1-6"><span class="price">8848.00</span></li>
                        <li class="yui3-u-1-6">
                            <span class="number">1</span>
                        </li>
                        <li class="yui3-u-1-8">
                            <a href="#none">buy it again</a>
                            <a href="#none">add it into favorite</a>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="liked">
                <ul class="sui-nav nav-tabs">
                    <li class="active">
                        <a href="#index" data-toggle="tab">you may like it</a>
                    </li>
                   
                </ul>
                <div class="clearfix"></div>
                <div class="tab-content">
                    <div id="index" class="tab-pane active">
                        <div id="myCarousel" data-ride="carousel" data-interval="4000" class="sui-carousel slide">
                            <div class="carousel-inner">
                                <div class="active item">
                                    <ul>
                                        <li>
                                            <img src="/resources/img/like1.png"/>
                                            <div class="intro">
                                                <i>iPhone 6s (A1699)</i>
                                            </div>
                                            <div class="money">
                                                <span>$29.00</span>
                                            </div>
                                            <div class="incar">
                                                <a href="#" class="sui-btn btn-bordered btn-xlarge btn-default"><i
                                                        class="car"></i><span class="cartxt">add into shopping cart</span></a>
                                            </div>
                                        </li>
                                        <li>
                                            <img src="/resources/img/like2.png"/>
                                            <div class="intro">
                                                <i>iPhone 6s (A1699)</i>
                                            </div>
                                            <div class="money">
                                                <span>$29.00</span>
                                            </div>
                                            <div class="incar">
                                                <a href="#" class="sui-btn btn-bordered btn-xlarge btn-default"><i
                                                        class="car"></i><span class="cartxt">add into shopping cart</span></a>
                                            </div>
                                        </li>
                                        <li>
                                            <img src="/resources/img/like3.png"/>
                                            <div class="intro">
                                                <i>iPhone 6s (A1699)</i>
                                            </div>
                                            <div class="money">
                                                <span>$29.00</span>
                                            </div>
                                            <div class="incar">
                                                <a href="#" class="sui-btn btn-bordered btn-xlarge btn-default"><i
                                                        class="car"></i><span class="cartxt">add into shopping cart</span></a>
                                            </div>
                                        </li>
                                        <li>
                                            <img src="/resources/img/like4.png"/>
                                            <div class="intro">
                                                <i>iPhone 6s (A1699)</i>
                                            </div>
                                            <div class="money">
                                                <span>$29.00</span>
                                            </div>
                                            <div class="incar">
                                                <a href="#" class="sui-btn btn-bordered btn-xlarge btn-default"><i
                                                        class="car"></i><span class="cartxt">add into shopping cart</span></a>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                                <div class="item">
                                    <ul>
                                        <li>
                                            <img src="/resources/img/like1.png"/>
                                            <div class="intro">
                                                <i>iPhone 6s (A1699)</i>
                                            </div>
                                            <div class="money">
                                                <span>$29.00</span>
                                            </div>
                                            <div class="incar">
                                                <a href="#" class="sui-btn btn-bordered btn-xlarge btn-default"><i
                                                        class="car"></i><span class="cartxt">add into shopping cart</span></a>
                                            </div>
                                        </li>
                                        <li>
                                            <img src="/resources/img/like2.png"/>
                                            <div class="intro">
                                                <i>iPhone 6s (A1699)</i>
                                            </div>
                                            <div class="money">
                                                <span>$29.00</span>
                                            </div>
                                            <div class="incar">
                                                <a href="#" class="sui-btn btn-bordered btn-xlarge btn-default"><i
                                                        class="car"></i><span class="cartxt">add into shopping cart</span></a>
                                            </div>
                                        </li>
                                        <li>
                                            <img src="/resources/img/like3.png"/>
                                            <div class="intro">
                                                <i>iPhone 6s (A1699)</i>
                                            </div>
                                            <div class="money">
                                                <span>$29.00</span>
                                            </div>
                                            <div class="incar">
                                                <a href="#" class="sui-btn btn-bordered btn-xlarge btn-default"><i
                                                        class="car"></i><span class="cartxt">add into shopping cart</span></a>
                                            </div>
                                        </li>
                                        <li>
                                            <img src="/resources/img/like4.png"/>
                                            <div class="intro">
                                                <i>iPhone 6s (A1699)</i>
                                            </div>
                                            <div class="money">
                                                <span>$29.00</span>
                                            </div>
                                            <div class="incar">
                                                <a href="#" class="sui-btn btn-bordered btn-xlarge btn-default"><i
                                                        class="car"></i><span class="cartxt">add into shopping cart</span></a>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <a href="#myCarousel" data-slide="prev" class="carousel-control left">‹</a>
                            <a href="#myCarousel" data-slide="next" class="carousel-control right">›</a>
                        </div>
                    </div>
                  
                </div>
            </div>
        </div>
    </div>

</div>
<script src="/resources/js/vue/vue.js"></script>
<script src="/resources/js/axios.min.js"></script>
<script src="/resources/js/common.js"></script>
<script type="text/javascript">
    var cartVm = new Vue({
        el: "#cartApp",
        data: {
            ly,
            carts: [],
            user: null,
            selectedCarts: [],
            selectAll: true
        },
        async created() {
            try {
                const resp = await ly.http.get("/auth/verify");
                this.user = resp.data;
            } catch(error) {
                console.log("not log in or expire");
            }
            this.loadCarts();
        },
        methods: {
            isLogin() {
                return new Promise((resolve, reject) => {
                    ly.http.get("/auth/verify").then(resp => {
                        resolve(resp);
                    }).catch(error => {
                        if (this.user) {
                            // login in again
                            console.log("not log in or expire");
                            window.location.href = "http://www.smilepet.ml/login.html?returnUrl=" + window.location.href;
                        }
                        reject(error);
                    })
                })
                return ly.http.get("/auth/verify");
            },
            loadSku(carts) {
                return new Promise((resolve, reject) => {
                    const ids = carts.map(c => {
                        c.saleable = false;
                        return c.skuId;
                    });
                    ly.http.get("/item/sku/list/ids?ids=" + ids.join(",")).then(({data: skus}) => {
                        carts.forEach(c => {
                            const sku = skus.find(s => s.id === c.skuId);
                            c.newPrice = sku.price;
                            c.stock = sku.stock;
                            c.spuId = sku.spuId;
                        })
                        resolve();
                    }).catch(() => {
                        reject();
                    })
                })
            },
            loadCarts() {
                // look at cart
                this.isLogin().then(() => {
                    
                    this.carts = ly.store.get("carts");
                    if (this.carts) {
                        this.carts.forEach(cart =>  ly.http.post("/cart",cart))
                    }
                    //clean LocalStorage
                    ly.store.del("carts");
                    
                    ly.http.get("/cart/list").then(resp => {
                        this.loadSku(resp.data).then(() => {
                            this.carts = resp.data;
                            this.selectedCarts = this.carts;
                        });
                    }).catch(() => {
                        
                        alert("shopping cart is empty！");
                    })
                }).catch(() => {
                    // 未登录
                    console.log("not login in")
                    const carts = ly.store.get("carts");
                    this.loadSku(carts).then(() => {
                        this.carts = carts;
                        this.selectedCarts = this.carts;
                    });
                })
            },
            increment(c) {
                c.num++;
                this.isLogin().then(() => {
              
                    ly.http.put("/cart", ly.stringify({
                        id: c.skuId,
                        num: c.num
                    })).catch(() => {
                        alert("server busy");
                    })
                }).catch(() => {
                    
                    ly.store.set("carts", this.carts);
                })
            },
            decrement(c) {
                if (c.num <= 1) return;
                c.num--;
                this.isLogin().then(() => {
                  
                    ly.http.put("/cart", ly.stringify({
                        id: c.skuId,
                        num: c.num
                    })).catch(() => {
                        alert("server busy");
                    })
                }).catch(() => {
                   
                    ly.store.set("carts", this.carts);
                })
            },
            deleteCart(i) {
                const id = this.carts[i].skuId;
                this.carts.splice(i, 1);
                this.isLogin().then(() => {
                   
                    ly.http.delete("/cart/" + id).catch(() => {
                        alert("server busy");
                    })
                }).catch(() => {
                  
                    ly.store.set("carts", this.carts);
                })
            },
            toOrderInfo() {
                
                if (!this.selectedCarts || this.selectedCarts.length < 1) {
                    alert("choose at least one product�");
                    return;
                }
                ly.store.set("selectedCarts", this.selectedCarts);
                window.location.href = "/getOrderInfo.html";
            }
        },
        watch: {
            selectAll(val, oldVal) {
                if (val) {
                    this.selectedCarts = this.carts;
                } else if (this.selectedCarts.length === this.carts.length) {
                    this.selectedCarts = [];
                }
            },
            selectedCarts: {
                deep: true,
                handler(val) {
                    if (val.length === this.carts.length && !this.selectAll) this.selectAll = true;
                    if (val.length !== this.carts.length && this.selectAll) this.selectAll = false;
                }
            }
        },
        computed: {
            totalPrice() {
                return this.selectedCarts.map(c => c.num * c.newPrice).reduce((v1, v2) => v1 + v2, 0);
            }
        },
        components: {
            shortcut: () => import("/resources/js/pages/shortcut.js")
        }
    })
</script>

<script type="text/javascript" src="/resources/js/plugins/jquery/jquery.min.js"></script>
<div class="clearfix footer"></div>
<script type="text/javascript">$(".footer").load("/resources/foot.html");</script> 

<script type="text/javascript" src="/resources/js/plugins/jquery.easing/jquery.easing.min.js"></script>
<script type="text/javascript" src="/resources/js/plugins/sui/sui.min.js"></script>
<script type="text/javascript" src="/resources/js/widget/nav.js"></script>

</body>

</html>