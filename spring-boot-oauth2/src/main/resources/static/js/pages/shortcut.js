const shortcut = {
    template: "\
    <div class='py-container'> \
        <div class='shortcut'> \
            <ul class='fl'> \
               <li class='f-item'>Welcome</li> \
               <li class='f-item' v-if='user && user.username'>\
             <span style='color: red;'>{{user.username}}</span>\
               </li>\
               <li v-else class='f-item'> \
                   <a href='javascript:void(0)' @click='gotoLogin'>Login In </a>　 \
                   <span><a href='register.html' target='_blank'>Register</a></span> \
               </li> \
           </ul> \
           <ul class='fr'> \
               <li class='f-item'>My Order</li> \
               <li class='f-item space'></li> \
               <li class='f-item'><a href='home.html' target='_blank'>My account</a></li> \
               <li class='f-item space'></li> \
               <li class='f-item'>Account Member</li> \
               <li class='f-item space'></li> \
               <li class='f-item'>Company Buy</li> \
               <li class='f-item space'></li> \
               <li class='f-item'>Join</li> \
               <li class='f-item space'></li> \
               <li class='f-item' id='service'> \
                   <span>Customer Service</span> \
                   <ul class='service'> \
                       <li><a href='cooperation.html' target='_blank'>cooperation</a></li> \
                       <li><a href='shoplogin.html' target='_blank'>Company Backend</a></li> \
                       <li><a href='cooperation.html' target='_blank'>cooperation</a></li> \
                       <li><a href='#'>Company</a></li> \
                   </ul> \
               </li> \
               <li class='f-item space'></li> \
               <li class='f-item'>Internet Navigation</li> \
           </ul> \
       </div> \
    </div>\
    ",
    name: "shortcut",
    data() {
        return {
            user: null
        }
    },
    created() {
        ly.http("/auth/verify")
            .then(resp => {
                this.user = resp.data;
            })
    },
    methods: {
        gotoLogin() {
            window.location = "http://www.leyou.com/login.html?returnUrl=" + window.location;
        }
    }
}
export default shortcut;