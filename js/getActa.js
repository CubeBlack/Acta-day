
function getActa(){
  //strHttp = httpGet("publicacao.php?data=2017-03-16");
  strHttp = httpGet("publicacao.php?data=" + pao.data);
  if(strHttp != "null"){
    obj = JSON.parse(strHttp);

    pao.titulo.innerHTML = Getdatdate.uniEncode(obj.titulo);
    pao.versiculo.innerHTML = Getdatdate.uniEncode(obj.versiculo);
    //pao.referencia_versiculo.innerHTML = obj.referencia_versiculo;
    pao.texto.innerHTML = Getdatdate.uniEncode(obj.texto);
    pao.oracao.innerHTML = Getdatdate.uniEncode(obj.oracao);
    //pao.missao_diaria.innerHTML = obj.missao_diaria;
    pao.publicado_por.innerHTML = Getdatdate.uniEncode(obj.publicado_por);

  }
  else {
    pao.titulo.innerHTML = "não encontrado";
    pao.versiculo.innerHTML = "";
    //pao.referencia_versiculo.innerHTML = obj.referencia_versiculo;
    pao.texto.innerHTML = "";
    pao.oracao.innerHTML = "";
    //pao.missao_diaria.innerHTML = obj.missao_diaria;
    pao.publicado_por.innerHTML = "";
  }
  console.log("Load");
}
