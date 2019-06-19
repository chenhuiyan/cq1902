<template>
    <div class="news">
        <img class="w-100" :src="img" alt="">
        <div class="py-3 px-1" >
            <p>{{about}}</p>
            <p>{{trend}}</p>
            <div class="itemRight">
                <a class="btn mb-0" :href="href">Read On</a>
            </div>
        </div>
    </div>
</template>
<script>
export default {
    data(){
        return{}  
    },
    props:{
        img:"",
        about:"",
        trend:"",
        href:"",
    },
    methods:{

    }

}
</script>
<style scoped>
    .itemRight{
        border: 0 !important;
        padding: 0 !important;
    }
    .itemRight a.btn{
        display: inline-block;
        background-color: #EBCA7A;
        border-color: #EBCA7A;
        color: #000;
        position: relative;
        overflow: hidden;
        font: 700 14px HelveticaNeueW01-BdExt !important;
        max-width: 30rem !important;
        padding: 12px 18px;
        line-height: 1.42857;
        border-radius: 4px;
        vertical-align: middle;
    }
    .itemRight a.btn:focus{
        box-shadow: 0 !important;
    }
    .news{
        width:100%;
    }
</style>
