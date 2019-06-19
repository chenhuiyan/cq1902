<template>
  <div class="card">
    <div class="card-header">
      <img :src="img">
    </div> 
    <div class="card-body p-0">
      <h3>{{title}}</h3>
      <p>{{promise}}</p>
    </div>
    <div class="card-footer">
      <a class="btn mb-0 text-center" :href="href">Learn more</a>
    </div>
  </div>
</template>
<script>
export default {
  data(){
    return {
    }
  },
  props:{
    img:"",
    title:"",
    promise:"",
    href:{default:"#"}
  }
}
</script>
<style scoped>
  .card{
    position: relative; 
    border-radius: 5px;
    border: 1px solid #E4E4E4;
    box-shadow: 0 3px 4px 0 rgba(124,124,124,0.5);
    background-color: rgba(255,255,255,0.9);
    padding: 3rem;
    text-align: center;
    height: 483px;
  }
  .card .card-header{
    margin: 0 auto 50px !important;
    position: relative;
    background-color: #fff !important;
    border: 0 !important;
    padding: 0 !important;
    width: 162px;
    height: 162px;
  }
  .card .card-header img{
    display: block;
    position: absolute;
    left: 50%;
    top:50%;
    max-width: 100%;
    text-align: center;
    height: auto;
    transform: translate(-50%,-50%);
  } 
  .card .card-body h3{
    font:bold 20px HelveticaNeueW01-BdExt ;
    margin-bottom: 15px;
  }
  .card .card-footer{
    background-color: #fff !important;
    border: 0 !important;
    padding: 0 !important;
  }
  .card .card-footer a.btn{
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
