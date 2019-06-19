<template>
    <div class="imgAll">
        <div class="list w-100">
            <img :src="img">
            <div class="card-item w-100">
                <div class="itemLeft">
                    <p>{{details}}</p>
                </div>
                <div class="itemRight">
                    <a class="btn mb-0 text-center" :href="href">Learn more</a>
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
        details:"",
        href:""
    }
}
</script>
<style scoped>
.imgAll{
    height: 500px;
}
    img{
        width: 100%;
        height: 500px;
    }
    .list{
        height: 405px;
        border:1px solid #cdd;
    }
    .card-item{
        margin-top: 218px;
        margin-right: 20px;
        background-color:rgba(255,255,255,0.6);
        display: flex;
        justify-content: space-between;
        align-items: right;
        position: relative;
        top: -300px;
        padding: 15px;
    }
    .itemRight{
        border: 0 !important;
        padding: 0 !important;
        text-align: center;
    }
    p{
        font:bold 24px HelveticaNeueW01-BdExt !important;
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
