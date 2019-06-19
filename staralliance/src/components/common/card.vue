<template>
    <div >
        <div class="list">
            <img :src="img">
            <div class="card-item">
                <div class="itemLeft">
                    <p class="font-weight-bold">{{where}}</p>
                    <p >{{buy}}</p>    
                </div>
                <div class="itemRight">
                    <a class="btn mb-0 text-center" :href="href">Learn More</a>
                </div>
            </div>
            
        </div>
    </div>
</template>
<script>
export default {
    data() {
        return {
            
        }
    },
    props:{
        img:"",
        where:"",
        buy:"",
        href:""
    }
}
</script>
<style scoped>
    img{
        width: 410px;
        height: 368px;
    }
    .list{
        height: 368px;
        width: 410px;
        border:1px solid #cdd;
    }
    .card-item{
        margin-top: 211px;
        background-color:rgba(255,255,255,0.8);
        display: flex;
        justify-content: space-between;
        align-items: center;
        position: relative;
        top: -320px;
        width: 410px;
        padding: 15px;
    }
    .itemRight{
        border: 0 !important;
        padding: 0 !important;
        text-align: center;
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
</style>
