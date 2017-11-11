/*
 * Skygger Studios and Dannke Studios :: javascript datepicker Getdatdate v0.0.1 Alfa
 * http://skyggerstudios.890m.com/ and http://dannkestudios.com/
 *
 * Copyright 2017
 *
 * Date: Quarta Mar 08, 2017
 *
 * Exemplo de Uso é só colar no seu projeto.

 <div id="in-Getdatdate">
   <input type="text" id="input-Getdatdate"  onmouseover="Getdatdate.inicia();"  placeholder="yy/mm/dd"/>
   <input id="btn-Abrir-Getdatdate" onClick="Getdatdate.inicia();" type="button" value=" " />
   <input id="btn-Fechar-Getdatdate" onClick="Getdatdate.fechar();" type="button" value=" " style="display:none;"/>
   <div id="display-Getdatdate"></div>
 </div>

 *
 * Coloque abaixo as cores que deseja altera.
 *
 */



var styleCustomize = {
    ColorFundo: " ",
    ColorFundoListeDias: " ",
    ColorMesAno: " ",
};

var seltAno, seltMes, seltDias=[], Getdatdate = {
  customizeCreater: function(st){
    if(st.ColorFundo=="" || st.ColorFundo==" "){
      st.ColorFundo = "rgba(0,0,0,0.9)";
    };
    if(st.ColorFundoListeDias=="" || st.ColorFundoListeDias==" "){
      st.ColorFundoListeDias = "#ccc";
    };
    if(st.ColorMesAno=="" || st.ColorMesAno==" "){
      st.ColorMesAno = "#fff";
    };
  },

  inicia: function(){
    var dataNow = new Date();
    seltAno=dataNow.getFullYear();
    seltMes=dataNow.getMonth();
    seltDias = Getdatdate.getDiasMes(seltMes, seltAno);
    Getdatdate.customizeCreater(styleCustomize);
    Getdatdate.geraCalendario(seltDias, seltMes, seltAno);
    document.getElementById("btn-Fechar-Getdatdate").style.display = "block";
    document.getElementById("btn-Abrir-Getdatdate").style.display = "none";
    document.getElementById("display-Getdatdate").style.display = "block";
  },

  fechar: function(){
    document.getElementById("btn-Fechar-Getdatdate").style.display = "none";
    document.getElementById("btn-Abrir-Getdatdate").style.display = "block";
    document.getElementById("display-Getdatdate").style.display = "none";
  },

  getOffset: function( el ) {
      var _x = 0;
      var _y = 0;
      while( el && !isNaN( el.offsetLeft ) && !isNaN( el.offsetTop ) ) {
          _x += el.offsetLeft - el.scrollLeft;
          _y += el.offsetTop - el.scrollTop;
          el = el.offsetParent;
      }
      return { top: _y, left: _x };
  },

  posicionar: function(){
    var pInDataContent = Getdatdate.getOffset(document.getElementById("in-Getdatdate"));
    document.getElementById("display-Getdatdate").style = "top: "+ parseInt(pInDataContent.top+25)+"px; left: "+ parseInt(pInDataContent.left+0)+"px; display: block; background: "+styleCustomize.ColorFundo+";";
  },

  utf8_decode: function (a){var b=[],c=0,d=0,e=0;for(a+="";c<a.length;){d=255&a.charCodeAt(c),e=0,d<=191?(d&=127,e=1):d<=223?(d&=31,e=2):d<=239?(d&=15,e=3):(d&=7,e=4);for(var f=1;f<e;++f)d=d<<6|63&a.charCodeAt(f+c);4===e?(d-=65536,b.push(String.fromCharCode(55296|d>>10&1023)),b.push(String.fromCharCode(56320|1023&d))):b.push(String.fromCharCode(d)),c+=e}return b.join("")},

  utf8_encode: function (a){if(null===a||"undefined"==typeof a)return"";var d,e,b=a+"",c="",f=0;d=e=0,f=b.length;for(var g=0;g<f;g++){var h=b.charCodeAt(g),i=null;if(h<128)e++;else if(h>127&&h<2048)i=String.fromCharCode(h>>6|192,63&h|128);else if(55296!==(63488&h))i=String.fromCharCode(h>>12|224,h>>6&63|128,63&h|128);else{if(55296!==(64512&h))throw new RangeError("Unmatched trail surrogate at "+g);var j=b.charCodeAt(++g);if(56320!==(64512&j))throw new RangeError("Unmatched lead surrogate at "+(g-1));h=((1023&h)<<10)+(1023&j)+65536,i=String.fromCharCode(h>>18|240,h>>12&63|128,h>>6&63|128,63&h|128)}null!==i&&(e>d&&(c+=b.slice(d,e)),c+=i,d=e=g+1)}return e>d&&(c+=b.slice(d,f)),c},

  uniEncode: function (str){
    if(str!=null){
      var i = str.length, aRet = [];
      while (i--) {
        var iC = str[i].charCodeAt();
        if (iC < 65 || iC > 127 || (iC>90 && iC<97)) {
          aRet[i] = '&#'+iC+';';
        } else {
          aRet[i] = str[i];
        }
       }
      return aRet.join('');
    }else{
      return null;
    }
  },

  uniDecode: function (str) {
    return str.replace(/&#([0-9]{1,3});/gi, function(match, numStr) {
        var num = parseInt(numStr, 10);
        return String.fromCharCode(num);
    });
  },

  escape: function (s) {
    s = s.toString(s);
    var n = s.length;
    var result = "";
    for(var k = 0; k < n; k++) {
        var c = s[k];
        var S = "";
        var code = c.charCodeAt(0);
        if(("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789@*_+-./").indexOf(c) > -1) {
            S = c;
        }
        else if(code < 256) {
            S = '%' + code.toString(16);
        }
        else {
            S = code.toString(16);
            S = "%u" + ("0000").substring(0, 4 - S.length) + S;
        }
        result = result + S;
    }
    return result;
  },

  unescape: function (s) {
    s = s.toString(s);
    var n = s.length;
    var result = "";
    for(var k = 0; k < n; k++) {
        var c = s[k];
        if(c == '%') {
            if(k <= (n - 6)) {
                if(s[k + 1] == 'u') {
                    if(("0123456789abcdef").indexOf(s[k + 2]) > -1 &&
                       ("0123456789abcdef").indexOf(s[k + 3]) > -1 &&
                       ("0123456789abcdef").indexOf(s[k + 4]) > -1 &&
                       ("0123456789abcdef").indexOf(s[k + 5]) > -1) {
                            c = String.fromCharCode(parseInt(s.substring(k + 2, k + 7), 16));
                            k = k + 5;
                       }
                       else {
                            if(k <= (n - 3) &&
                            ("0123456789abcdef").indexOf(s[k + 1]) > -1 &&
                            ("0123456789abcdef").indexOf(s[k + 2]) > -1)
                            {
                                c = String.fromCharCode(parseInt(("00" + s.substring(k + 1, k + 3)), 16));
                                k = k + 2;
                            }
                       }
                }
                else {
                    if(k <= (n - 3) &&
                      ("0123456789abcdef").indexOf(s[k + 1]) > -1 &&
                      ("0123456789abcdef").indexOf(s[k + 2]) > -1) {
                        c = String.fromCharCode(parseInt(("00" + s.substring(k + 1, k + 3)), 16));
                        k = k + 2;
                    }
                }
            }
            else if(("0123456789abcdef").indexOf(s[k + 1]) > -1 &&
                    ("0123456789abcdef").indexOf(s[k + 2]) > -1) {
                c = String.fromCharCode(parseInt(("00" + s.substring(k + 1, k + 3)), 16));
                k = k + 2;
            }
        }
        result = result + c;
      }
      return result;
  },


  getDiasMes: function (mes, ano) {
     var date = new Date(ano, mes, 1);
     var dias = [];
     while (date.getMonth() === mes) {
        dias.push(new Date(date).getUTCDate()+"-"+new Date(date).getDay());
        date.setDate(date.getDate() + 1);
     }
     var indexDia = dias[0].split("-");
     var vazioDias = parseInt(indexDia[1]);
     for(var i = 0; i < vazioDias; i++){
       dias.splice(0, 0, " ");
    }
     return dias;
   },

   getMesAnterior: function(){
     var intMes = parseInt(seltMes);
     var intAno = parseInt(seltAno);
     if(intMes > 0){
       seltMes = intMes-1;
     }else {
       seltMes=11;
       seltAno = intAno-1;
     }
     seltDias = Getdatdate.getDiasMes(seltMes, seltAno);
     Getdatdate.geraCalendario(seltDias, seltMes, seltAno);
   },

   getMesProximo: function(){
     var intMes = parseInt(seltMes);
     var intAno = parseInt(seltAno);
     if(intMes < 11){
       seltMes = intMes+1;
     }else {
       seltMes=0;
       seltAno = intAno+1;
     }
     seltDias = Getdatdate.getDiasMes(seltMes, seltAno);
     Getdatdate.geraCalendario(seltDias, seltMes, seltAno);
   },

   getAnoAnterior: function(){
     var intAno = parseInt(seltAno);
     seltAno = intAno-1;
     seltDias = Getdatdate.getDiasMes(seltMes, seltAno);
     Getdatdate.geraCalendario(seltDias, seltMes, seltAno);
   },

   getAnoProximo: function(){
     var intAno = parseInt(seltAno);
     seltAno = intAno+1;
     seltDias = Getdatdate.getDiasMes(seltMes, seltAno);
     Getdatdate.geraCalendario(seltDias, seltMes, seltAno);
   },

   getNomeMes: function(numMes){
     var nomeMes = "";
     switch (numMes) {
        case 0:
          nomeMes = "Jan";
        break;
        case 1:
          nomeMes = "Fev";
        break;
        case 2:
          nomeMes = "Mar";
        break;
        case 3:
          nomeMes = "Abr";
        break;
        case 4:
          nomeMes = "Maio";
        break;
        case 5:
          nomeMes = "Jun";
        break;
        case 6:
          nomeMes = "Jul";
        break;
        case 7:
          nomeMes = "Ago";
        break;
        case 8:
          nomeMes = "Set";
        break;
        case 9:
          nomeMes = "Out";
        break;
        case 10:
          nomeMes = "Nov";
        break;
        case 11:
          nomeMes = "Dez";
        break;
        default:
          nomeMes = "NULL";
     }
     return nomeMes;
   },

   clickEnviarData: function(diaClicado){
     var nomeDia = "";
     var nomeMes = "";
     if(diaClicado<10){
       nomeDia = "0"+diaClicado;
     }else{
       nomeDia = diaClicado;
     }
     if(seltMes<9){
       nomeMes = "0"+(parseInt(seltMes)+1);
     }else{
       nomeMes = parseInt(seltMes)+1;
     }
     var dataCompleta = seltAno+"-"+nomeMes+"-"+nomeDia;
     document.getElementById("input-Getdatdate").value = dataCompleta;
     document.getElementById("btn-Fechar-Getdatdate").style.display = "none";
     document.getElementById("btn-Abrir-Getdatdate").style.display = "block";
     document.getElementById("display-Getdatdate").style.display = "none";
     pao.data = dataCompleta;
     getActa();
   },

   geraCalendario: function(dias, mes, ano){
     var displayCalendario = document.getElementById("display-Getdatdate");
     var nNum = "";
     var Style_NoneDiaItem = "float:left; list-style: none; width: 21.3px; height: 18px; font-size: 15px; text-align: center; background: #444; padding: 3px; margin: 2px 2px 2px 2px; color: #fff; "
     var Style_NumDiaItem = " float:left; list-style: none; width: 21.3px; height: 18px; font-size: 15px; text-align: center; padding: 3px; margin: 2px 2px 2px 2px; color: #fff; ";
     var contentHTMLCalendario = "";
     contentHTMLCalendario += '<div id="topMenu-Getdatdate">';
        contentHTMLCalendario += '<div style="width:225px; overflow:hidden; padding: 2px;" id="btns-Getdatdate">';
          contentHTMLCalendario += '<span style="color: '+styleCustomize.ColorMesAno+';">'+Getdatdate.getNomeMes(mes)+'</span>';
           contentHTMLCalendario += '<button id="btn-menos-mes" onClick="Getdatdate.getMesAnterior();"></button>';
           contentHTMLCalendario += '<button id="btn-max-mes" onClick="Getdatdate.getMesProximo();"></button>';
           contentHTMLCalendario += '<span style="color: '+styleCustomize.ColorMesAno+';">'+ano+'</span>';
           contentHTMLCalendario += '<button  id="btn-menos-ano" onClick="Getdatdate.getAnoAnterior();"></button>';
           contentHTMLCalendario += '<button id="btn-max-ano" onClick="Getdatdate.getAnoProximo();"></button>';
         contentHTMLCalendario += '</div>';
         contentHTMLCalendario += '<div style="width: 221px; overflow:hidden; background: #000; padding: 2px;" id="nomesDias-Getdatdate"';
            contentHTMLCalendario += '<ul style="list-style:none; width:100%; overflow:hidden;">';
                contentHTMLCalendario += '<li style="'+Style_NoneDiaItem+'">D</li>';
                contentHTMLCalendario += '<li style="'+Style_NoneDiaItem+'">S</li>';
                contentHTMLCalendario += '<li style="'+Style_NoneDiaItem+'">T</li>';
                contentHTMLCalendario += '<li style="'+Style_NoneDiaItem+'">Q</li>';
                contentHTMLCalendario += '<li style="'+Style_NoneDiaItem+'">Q</li>';
                contentHTMLCalendario += '<li style="'+Style_NoneDiaItem+'">S</li>';
                contentHTMLCalendario += '<li style="'+Style_NoneDiaItem+'">S</li>';
            contentHTMLCalendario += '</ul>';
         contentHTMLCalendario += '</div>';
     contentHTMLCalendario += '</div>';
     contentHTMLCalendario += '<ul style="background:'+styleCustomize.ColorFundoListeDias+';">';
     for(var i = 0; i < dias.length; i++){
       var nomeDia = "";
       if(dias[i]==" "){
         nomeDia=" ";
         contentHTMLCalendario += '<li style="'+Style_NumDiaItem+' background: #222;">'+nomeDia+'</li>';
       }else {
         var d = dias[i].split("-");
         nomeDia=d[0];
         contentHTMLCalendario += '<li onClick="Getdatdate.clickEnviarData('+nomeDia+')" style="'+Style_NumDiaItem+'">'+nomeDia+'</li>';
       }
     }
     contentHTMLCalendario += '</ul>';
     contentHTMLCalendario += '<div style="width: 221px; height: 18px; overflow:hidden; text-align:center; margin-top:2px; background: #000; padding: 2px;"><a class="btn-skygger-studios" target="_blank" href="http://skyggerstudios.890m.com/">Skygger Studios</a><a class="btn-dannke-studios" target="_blank" href="http://www.dannkestudios.com/">Dannke Studios</a></div>';
     displayCalendario.innerHTML = contentHTMLCalendario;
     Getdatdate.posicionar();
   },

};
