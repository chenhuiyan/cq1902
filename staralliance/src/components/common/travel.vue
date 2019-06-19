<template>
    
        <li class="travel-list">
            <div class="travel-item">
               <!-- <img class="w-100" :src="img">  -->
               <span :style="{background: 'url(' + img + ') no-repeat', backgroundSize:'cover' }"></span>
            </div>
            <h5>{{history}}</h5>
        </li>
    
</template>
<script>
export default {
    data(){
        return{
        }
    },
    props:{
        img:"",
        history:"",
        
    },
    methods:{

    },
}
</script>
<style scoped>
    .travel-list{
        width:320px;
        height: 420px;
        background-color:rgb(240, 240, 240);
        padding: 20px 0 60px;
        text-align: center;
    
    }
    @media screen and (max-width: 600px){
        .travel-list{
            width: 100%;
        }
    }
    .travel-item{
        height:235px; 
        width: 83%;
        border-radius: 50%;
        border:15px solid rgba(255, 255, 255,0.5);
        margin:10px 25px 30px;
    }
    .travel-item span{
        border-radius: 50%;
        width: 100%;
        height: 100%;
        display: block;
        transform: scale(1);
        transition: all 1s ease 0s;
    }
    .travel-item span:hover{
        transform: scale(1.1);
    }
    h5{
        text-align: center;
        margin: 50px 0;
    }
   
</style>
