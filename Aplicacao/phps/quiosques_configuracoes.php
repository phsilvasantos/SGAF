<script type="text/javascript">
window.onload = initPage;
function initPage(){
    var usa = $("select[name=usamodulofiscal]").val();
    usa_modulo_fiscal(usa);

    if (usa==1) {
        tipopessoa=$("select[name=tipopessoanfe]").val();
        tipo_pessoa(tipopessoa);

        estado=$("input[name=quiosque_estado]").val(); 
        mascara_ie(estado);
    }
}
</script>

<?php
//Verifica se o usuário tem permissão para acessar este conte�do
$tipopagina="quiosques";
require "login_verifica.php";
include "includes.php";

//Futuramente pegar por POST quando for criado a coluna na listagem de quiosques permitindo um adminsitrador alterar estas configuracoes no quiosque desejado (sem a necessidade de estar logado no quiosque)
$quiosque=$usuario_quiosque;

$sql="SELECT * 
    FROM quiosques_configuracoes 
    JOIN quiosques on (qui_codigo=quicnf_quiosque)
    JOIN cidades on (qui_cidade=cid_codigo)
    JOIN estados on (cid_estado=est_codigo)
    WHERE quicnf_quiosque=$quiosque
";


 if (!$query= mysql_query($sql)) die("Erro: " . mysql_error());
 while ($dados=  mysql_fetch_assoc($query)) {
     $usamodulofiscal=$dados["quicnf_usamodulofiscal"];
     $ultimanfe=$dados["quicnf_ultimanfe"];
     $serienfe=$dados["quicnf_serienfe"];
     $crtnfe=$dados["quicnf_crtnfe"];
     $cstnfe=$dados["quicnf_cstnfe"];
     $csosnnfe=$dados["quicnf_csosnnfe"];
     $tipoimpressaodanfe=$dados["quicnf_tipoimpressaodanfe"];
     $ambientenfe=$dados["quicnf_ambientenfe"];
     $versaonfe=$dados["quicnf_versaonfe"];
     $usacomanda=$dados["quicnf_usacomanda"];
     $tipopessoanfe=$dados["qui_tipopessoa"];
     $cpf=$dados["qui_cpf"];
     $cnpj=$dados["qui_cnpj"];
     $razaosocial=$dados["qui_razaosocial"];
     $ie=$dados["qui_ie"];
     $im=$dados["qui_im"];
     $endereco=$dados["qui_endereco"];
     $endereco_numero=$dados["qui_numero"];
     $bairro=$dados["qui_bairro"];
     $cep=$dados["qui_cep"];
     $quiosque_estado=$dados["est_codigo"];
     $quiosque_estado_sigla=$dados["est_sigla"];
 }

//Template de Título e Sub-título
$tpl_titulo = new Template("templates/titulos.html");
$tpl_titulo->TITULO = "QUIOSQUE";
$tpl_titulo->SUBTITULO = "CONFIGURACOES";
$tpl_titulo->ICONES_CAMINHO = "$icones";
$tpl_titulo->NOME_ARQUIVO_ICONE = "quiosques_configuracoes.png";
$tpl_titulo->show();

//Estrutura dos campos de cadastro
$tpl1 = new Template("templates/cadastro_edicao_detalhes_2.html");
$tpl1->LINK_DESTINO = "quiosques_configuracoes2.php";

$tpl1->JS_CAMINHO = "quiosques_configuracoes.js";
$tpl1->block("BLOCK_JS");

//Usa Módulo Fiscal
$tpl1->TITULO = "Modulo Fiscal";
$tpl1->block("BLOCK_TITULO");
$tpl1->LINHA_ID="linha_usamodulofiscal";
$tpl1->block("BLOCK_LINHA_ID");
$tpl1->SELECT_NOME = "usamodulofiscal";
$tpl1->SELECT_ID = "usamodulofiscal";
$tpl1->SELECT_TAMANHO = "";
$tpl1->SELECT_ONCHANGE = "usa_modulo_fiscal(this.value);";
$tpl1->block("BLOCK_SELECT_ONCHANGE");
$tpl1->block("BLOCK_SELECT_OBRIGATORIO");
if ($usamodulofiscal=="") {
    $usamodulofiscal= -1; 
    echo "<br>ERRO, ao cadastrar um quiosque deve automaticamente gravar a configuracão que o mesmo não usa módulo fiscal! Favor contatar o suporte urgente!<br>";
}
$tpl1->OPTION_VALOR = 1;
$tpl1->OPTION_NOME = "Sim";
if (($usamodulofiscal=='1')||($usamodulofiscal=='3')) $tpl1->block("BLOCK_SELECT_OPTION_SELECIONADO");
$tpl1->block("BLOCK_SELECT_OPTION");
$tpl1->OPTION_VALOR = 0;
$tpl1->OPTION_NOME = "Não";
if ($usamodulofiscal=='0') $tpl1->block("BLOCK_SELECT_OPTION_SELECIONADO");
$tpl1->block("BLOCK_SELECT_OPTION");
$tpl1->block("BLOCK_SELECT");
$tpl1->block("BLOCK_CONTEUDO");
$tpl1->block("BLOCK_ITEM");



//Versão NFE
$tpl1->TITULO = "Versão NFE";
$tpl1->block("BLOCK_TITULO");
$tpl1->LINHA_ID="linha_versaonfe";
$tpl1->block("BLOCK_LINHA_ID");
$tpl1->CAMPO_TIPO="text";
$tpl1->CAMPO_NOME="versaonfe";
$tpl1->CAMPO_ID="versaonfe";
$tpl1->CAMPO_TAMANHO="18";
$tpl1->CAMPO_VALOR="$versaonfe";
$tpl1->CAMPO_QTD_CARACTERES="9";
if ($usamodulofiscal=='1') $tpl1->block("BLOCK_CAMPO_OBRIGATORIO");
//$tpl1->CAMPO_ONKEYUP="";
//$tpl1->CAMPO_ONKEYDOWN="";
//$tpl1->CAMPO_ONKEYPRESS="";
//$tpl1->CAMPO_ONBLUR="";
//$tpl1->CAMPO_ONCLICK="";
$tpl1->CAMPO_DICA="";
//$tpl1->block("BLOCK_CAMPO_AUTOSELECIONAR"); //Clicou seleciona conteudo
//$tpl1->block("BLOCK_CAMPO_HISTORICO_DESATIVADO"); //autocomplete do navegador desligado
//$tpl1->block("BLOCK_CAMPO_FOCO");
$tpl1->block("BLOCK_CAMPO_NORMAL"); //classe padrao
//$tpl1->block("BLOCK_CAMPO_NORMAL_OCULTO"); //Campo text que não aparece na tela
//$tpl1->CAMPO_ESTILO="";
//$tpl1->block("BLOCK_CAMPO_ESTILO");
//$tpl1->block("BLOCK_CAMPO_DESABILITADO");
//$tpl1->block("BLOCK_CAMPO_SOMENTELEITURA");
$tpl1->block("BLOCK_CAMPO");
$tpl1->block("BLOCK_CONTEUDO");
$tpl1->block("BLOCK_ITEM");


//CRT
$tpl1->TITULO = "CRT";
$tpl1->block("BLOCK_TITULO");
$tpl1->LINHA_ID="linha_crtnfe";
$tpl1->block("BLOCK_LINHA_ID");
$tpl1->SELECT_NOME = "crtnfe";
$tpl1->SELECT_ID = "crtnfe";
$tpl1->SELECT_TAMANHO = "";
//$tpl1->SELECT_ONCHANGE = "";
//$tpl1->block("BLOCK_SELECT_ONCHANGE");
if ($usamodulofiscal=='1') $tpl1->block("BLOCK_SELECT_OBRIGATORIO");
$tpl1->block("BLOCK_SELECT_OPTION_PADRAO"); //Selecione
$tpl1->OPTION_VALOR = 1;
$tpl1->OPTION_NOME = "Simples Nacional";
if ($crtnfe=='1') $tpl1->block("BLOCK_SELECT_OPTION_SELECIONADO");
$tpl1->block("BLOCK_SELECT_OPTION");
$tpl1->OPTION_VALOR = 2;
$tpl1->OPTION_NOME = "Simples Nacional (Excesso de sub-limite de receita bruta)";
if ($crtnfe=='2') $tpl1->block("BLOCK_SELECT_OPTION_SELECIONADO");
$tpl1->block("BLOCK_SELECT_OPTION");
$tpl1->OPTION_VALOR = 3;
$tpl1->OPTION_NOME = "Regime Normal";
if ($crtnfe=='3') $tpl1->block("BLOCK_SELECT_OPTION_SELECIONADO");
$tpl1->block("BLOCK_SELECT_OPTION");
$tpl1->block("BLOCK_SELECT_NORMAL");
$tpl1->block("BLOCK_SELECT");
$tpl1->block("BLOCK_CONTEUDO");
$tpl1->block("BLOCK_ITEM");

//Série
$tpl1->TITULO = "Série NFE";
$tpl1->block("BLOCK_TITULO");
$tpl1->LINHA_ID="linha_serienfe";
$tpl1->block("BLOCK_LINHA_ID");
$tpl1->CAMPO_TIPO="text";
$tpl1->CAMPO_NOME="serienfe";
$tpl1->CAMPO_ID="serienfe";
$tpl1->CAMPO_TAMANHO="6";
$tpl1->CAMPO_VALOR="$serienfe";
$tpl1->CAMPO_QTD_CARACTERES="3";
//$tpl1->CAMPO_ONKEYUP="";
//$tpl1->CAMPO_ONKEYDOWN="";
//$tpl1->CAMPO_ONKEYPRESS="";
//$tpl1->CAMPO_ONBLUR="";
//$tpl1->CAMPO_ONCLICK="";
$tpl1->CAMPO_DICA="";
//$tpl1->block("BLOCK_CAMPO_AUTOSELECIONAR"); //Clicou seleciona conteudo
//$tpl1->block("BLOCK_CAMPO_HISTORICO_DESATIVADO"); //autocomplete do navegador desligado
//$tpl1->block("BLOCK_CAMPO_FOCO");
if ($usamodulofiscal=='1') $tpl1->block("BLOCK_CAMPO_OBRIGATORIO");
$tpl1->block("BLOCK_CAMPO_NORMAL"); //classe padrao
//$tpl1->block("BLOCK_CAMPO_NORMAL_OCULTO"); //Campo text que não aparece na tela
//$tpl1->CAMPO_ESTILO="";
//$tpl1->block("BLOCK_CAMPO_ESTILO");
//$tpl1->block("BLOCK_CAMPO_DESABILITADO");
//$tpl1->block("BLOCK_CAMPO_SOMENTELEITURA");
$tpl1->block("BLOCK_CAMPO");
$tpl1->block("BLOCK_CONTEUDO");
$tpl1->block("BLOCK_ITEM");


//Faturamento Anual Atual
$tpl1->TITULO = "Faturamento Anual Atual";
$tpl1->block("BLOCK_TITULO");
$tpl1->LINHA_ID="linha_faturamentoanualatual";
$tpl1->block("BLOCK_LINHA_ID");
$tpl1->CAMPO_TIPO="text";
$tpl1->CAMPO_NOME="faturamentoanualatualnfe";
$tpl1->CAMPO_ID="faturamentoanualatualnfe";
$tpl1->CAMPO_TAMANHO="18";
//Verifica qual é o faturamento dos ultimos 12 meses
if ($usamodulofiscal==1) {
    $sql="SELECT sum(nfefat_valor) as fatanual FROM (SELECT nfefat_valor FROM nfe_faturamento WHERE nfefat_quiosque=$usuario_quiosque ORDER BY nfefat_codigo DESC LIMIT 12) as subt;";
    if (!$query = mysql_query($sql)) die("Erro SQL Faturamento Anual: ".mysql_error());
    $dados=mysql_fetch_assoc($query);
    $fatanual=$dados["fatanual"];
}
//echo "Faturamento Anual: ($fatanual)";
$tpl1->CAMPO_VALOR= "R$ " . number_format($fatanual, 2, ',', '.');
$tpl1->CAMPO_QTD_CARACTERES="9";
$tpl1->CAMPO_DICA="";
$tpl1->block("BLOCK_CAMPO_NORMAL"); //classe padrao
$tpl1->block("BLOCK_CAMPO_DESABILITADO");
$tpl1->block("BLOCK_CAMPO");
$tpl1->block("BLOCK_CONTEUDO");
$tpl1->block("BLOCK_ITEM");

//ICMS Atual
$tpl1->TITULO = "ICMS Atual";
$tpl1->block("BLOCK_TITULO");
$tpl1->LINHA_ID="linha_icmsatual";
$tpl1->block("BLOCK_LINHA_ID");
$tpl1->CAMPO_TIPO="text";
$tpl1->CAMPO_NOME="icmsatualnfe";
$tpl1->CAMPO_ID="icmsatualnfe";
$tpl1->CAMPO_TAMANHO="8";
if ($usamodulofiscal==1) {
    $sql_simplesnacional = "SELECT nfesn_icms FROM nfe_simplesnacional WHERE nfesn_de <= $fatanual AND nfesn_ate >= $fatanual";
    if (!$query_simplesnacional = mysql_query($sql_simplesnacional)) die("Erro SQL Consulta ICMS Simples Nacional: ".mysql_error());
    $dados_simplesnacional=  mysql_fetch_assoc($query_simplesnacional);
    $icms_atual=$dados_simplesnacional["nfesn_icms"];
}
$tpl1->CAMPO_VALOR="$icms_atual";
$tpl1->CAMPO_QTD_CARACTERES="4";
$tpl1->CAMPO_DICA="";
$tpl1->block("BLOCK_CAMPO_NORMAL"); //classe padrao
$tpl1->block("BLOCK_CAMPO_DESABILITADO");
$tpl1->block("BLOCK_CAMPO");
$tpl1->TEXTO_ID="";
$tpl1->TEXTO="%";
$tpl1->block("BLOCK_TEXTO");
$tpl1->block("BLOCK_CONTEUDO");
$tpl1->block("BLOCK_ITEM");

//CST
$tpl1->TITULO = "CST";
$tpl1->block("BLOCK_TITULO");
$tpl1->LINHA_ID="linha_cstnfe";
$tpl1->block("BLOCK_LINHA_ID");
$tpl1->SELECT_NOME = "cstnfe";
$tpl1->SELECT_ID = "cstnfe";
$tpl1->SELECT_TAMANHO = "";
$tpl1->block("BLOCK_SELECT_OPTION_PADRAO");
$sql2="SELECT * FROM nfe_cst ORDER BY cst_id";
if (!$query2= mysql_query($sql2)) die("Erro: " . mysql_error());
if ($usamodulofiscal=='1') $tpl1->block("BLOCK_SELECT_OBRIGATORIO");
while ($dados2=  mysql_fetch_assoc($query2)) {
    $cst_codigo=$dados2["cst_codigo"];
    if ($cstnfe==$cst_codigo) $tpl1->block("BLOCK_SELECT_OPTION_SELECIONADO");
    $cst_nome=$dados2["cst_nome"];
    $cst_id=$dados2["cst_id"];
    $tpl1->OPTION_VALOR = "$cst_codigo";
    $tpl1->OPTION_NOME = "($cst_id) $cst_nome";    
    $tpl1->block("BLOCK_SELECT_OPTION");
 }
$tpl1->block("BLOCK_SELECT_NORMAL");
$tpl1->block("BLOCK_SELECT");
$tpl1->block("BLOCK_CONTEUDO");
$tpl1->block("BLOCK_ITEM");




//CSOSN
$tpl1->TITULO = "CSOSN";
$tpl1->block("BLOCK_TITULO");
$tpl1->LINHA_ID="linha_csosnnfe";
$tpl1->block("BLOCK_LINHA_ID");
$tpl1->SELECT_NOME = "csosnnfe";
$tpl1->SELECT_ID = "csosnnfe";
$tpl1->SELECT_TAMANHO = "";
$tpl1->block("BLOCK_SELECT_OPTION_PADRAO");
$sql2="SELECT * FROM nfe_csosn ORDER BY csosn_id";
if (!$query2= mysql_query($sql2)) die("Erro: " . mysql_error());
if ($usamodulofiscal=='1') $tpl1->block("BLOCK_SELECT_OBRIGATORIO");
while ($dados2=  mysql_fetch_assoc($query2)) {
    $csosn_codigo=$dados2["csosn_codigo"];
    if ($csosnnfe==$csosn_codigo) $tpl1->block("BLOCK_SELECT_OPTION_SELECIONADO");
    $csosn_nome=$dados2["csosn_nome"];
    $csosn_id=$dados2["csosn_id"];
    $tpl1->OPTION_VALOR = "$csosn_codigo";
    $tpl1->OPTION_NOME = "($csosn_id) $csosn_nome";    
    $tpl1->block("BLOCK_SELECT_OPTION");
 }
$tpl1->block("BLOCK_SELECT_NORMAL");
$tpl1->block("BLOCK_SELECT");
$tpl1->block("BLOCK_CONTEUDO");
$tpl1->block("BLOCK_ITEM");


//Tipo de impressão DANFE
$tpl1->TITULO = "DANFE Impressão";
$tpl1->block("BLOCK_TITULO");
$tpl1->LINHA_ID="linha_tipoimpressaodanfe";
$tpl1->block("BLOCK_LINHA_ID");
$tpl1->SELECT_NOME = "tipoimpressaodanfe";
$tpl1->SELECT_ID = "tipoimpressaodanfe";
$tpl1->SELECT_TAMANHO = "";
//$tpl1->SELECT_ONCHANGE = "";
//$tpl1->block("BLOCK_SELECT_ONCHANGE");

$sql2="SELECT * FROM nfe_danfeimpressao ORDER BY danfe_codigo";
if (!$query2= mysql_query($sql2)) die("Erro: " . mysql_error());
if ($usamodulofiscal=='1') $tpl1->block("BLOCK_SELECT_OBRIGATORIO");
while ($dados2=  mysql_fetch_assoc($query2)) {
    $danfe_codigo=$dados2["danfe_codigo"];
    if ($tipoimpressaodanfe==$danfe_codigo) $tpl1->block("BLOCK_SELECT_OPTION_SELECIONADO");
    $danfe_nome=$dados2["danfe_nome"];
    $tpl1->OPTION_VALOR = "$danfe_codigo";
    $tpl1->OPTION_NOME = "$danfe_nome";    
    $tpl1->block("BLOCK_SELECT_OPTION");
 }
$tpl1->block("BLOCK_SELECT_NORMAL");
$tpl1->block("BLOCK_SELECT");
$tpl1->block("BLOCK_CONTEUDO");
$tpl1->block("BLOCK_ITEM");


//Ambiente 
$tpl1->TITULO = "Ambiente";
$tpl1->block("BLOCK_TITULO");
$tpl1->LINHA_ID="linha_ambientenfe";
$tpl1->block("BLOCK_LINHA_ID");
$tpl1->SELECT_NOME = "ambientenfe";
$tpl1->SELECT_ID = "ambientenfe";
$tpl1->SELECT_TAMANHO = "";
//$tpl1->SELECT_ONCHANGE = ";";
//$tpl1->block("BLOCK_SELECT_ONCHANGE");
if ($usamodulofiscal=='1') $tpl1->block("BLOCK_SELECT_OBRIGATORIO");
$tpl1->block("BLOCK_SELECT_OPTION_PADRAO"); //Selecione
$tpl1->OPTION_VALOR = 1;
$tpl1->OPTION_NOME = "Produção";
if ($ambientenfe=='1') $tpl1->block("BLOCK_SELECT_OPTION_SELECIONADO");
$tpl1->block("BLOCK_SELECT_OPTION");
$tpl1->OPTION_VALOR = 2;
$tpl1->OPTION_NOME = "Homologação";
if ($ambientenfe=='2') $tpl1->block("BLOCK_SELECT_OPTION_SELECIONADO");
$tpl1->block("BLOCK_SELECT_OPTION");
$tpl1->block("BLOCK_SELECT_NORMAL");
$tpl1->block("BLOCK_SELECT");
$tpl1->block("BLOCK_CONTEUDO");
$tpl1->block("BLOCK_ITEM");



//Ultima NFE
$tpl1->TITULO = "Última NFE";
$tpl1->block("BLOCK_TITULO");
$tpl1->LINHA_ID="linha_ultimanfe";
$tpl1->block("BLOCK_LINHA_ID");
$tpl1->CAMPO_TIPO="number";
$tpl1->CAMPO_NOME="ultimanfe";
$tpl1->CAMPO_ID="ultimanfe";
$tpl1->CAMPO_TAMANHO="9";
$tpl1->CAMPO_VALOR="$ultimanfe";
$tpl1->CAMPO_QTD_CARACTERES="9";
//$tpl1->CAMPO_ONKEYUP="";
//$tpl1->CAMPO_ONKEYDOWN="";
//$tpl1->CAMPO_ONKEYPRESS="";
//$tpl1->CAMPO_ONBLUR="";
//$tpl1->CAMPO_ONCLICK="";
$tpl1->CAMPO_DICA="";
//$tpl1->block("BLOCK_CAMPO_AUTOSELECIONAR"); //Clicou seleciona conteudo
//$tpl1->block("BLOCK_CAMPO_HISTORICO_DESATIVADO"); //autocomplete do navegador desligado
//$tpl1->block("BLOCK_CAMPO_FOCO");
$tpl1->block("BLOCK_CAMPO_NORMAL"); //classe padrao
//$tpl1->block("BLOCK_CAMPO_NORMAL_OCULTO"); //Campo text que não aparece na tela
//$tpl1->CAMPO_ESTILO="";
//$tpl1->block("BLOCK_CAMPO_ESTILO");
if ($usuario_grupo != 1)  {
    $tpl1->block("BLOCK_CAMPO_DESABILITADO");
    $tpl1->block("BLOCK_CAMPO_SOMENTELEITURA");
}
$tpl1->block("BLOCK_CAMPO");
$tpl1->block("BLOCK_CONTEUDO");
$tpl1->block("BLOCK_ITEM");

//Tipo Pessoa
$tpl1->TITULO = "Tipo Pessoa";
$tpl1->block("BLOCK_TITULO");
$tpl1->LINHA_ID="linha_tipopessoanfe";
$tpl1->block("BLOCK_LINHA_ID");
$tpl1->SELECT_NOME = "tipopessoanfe";
$tpl1->SELECT_ID = "tipopessoanfe";
$tpl1->SELECT_TAMANHO = "";
$tpl1->SELECT_ONCHANGE = "tipo_pessoa(this.value)";
$tpl1->block("BLOCK_SELECT_ONCHANGE");
if ($usamodulofiscal=='1') $tpl1->block("BLOCK_SELECT_OBRIGATORIO");
$tpl1->block("BLOCK_SELECT_OPTION_PADRAO"); //Selecione
$tpl1->OPTION_VALOR = 1;
$tpl1->OPTION_NOME = "Física";
if ($tipopessoanfe=='1') $tpl1->block("BLOCK_SELECT_OPTION_SELECIONADO");
$tpl1->block("BLOCK_SELECT_OPTION");
$tpl1->OPTION_VALOR = 2;
$tpl1->OPTION_NOME = "Jurídica";
if ($tipopessoanfe=='2') $tpl1->block("BLOCK_SELECT_OPTION_SELECIONADO");
$tpl1->block("BLOCK_SELECT_OPTION");
$tpl1->block("BLOCK_SELECT_NORMAL");
$tpl1->block("BLOCK_SELECT");
$tpl1->block("BLOCK_CONTEUDO");
$tpl1->block("BLOCK_ITEM");


//RAZÃO SOCIAL
$tpl1->TITULO = "Razão Social";
$tpl1->block("BLOCK_TITULO");
$tpl1->LINHA_ID="linha_razaosocial";
$tpl1->block("BLOCK_LINHA_ID");
$tpl1->CAMPO_TIPO="text";
$tpl1->CAMPO_NOME="razaosocial";
$tpl1->CAMPO_ID="razaosocial";
$tpl1->CAMPO_TAMANHO="45";
$tpl1->CAMPO_VALOR="$razaosocial";
$tpl1->CAMPO_QTD_CARACTERES="";
if ($usamodulofiscal=='1') $tpl1->block("BLOCK_CAMPO_OBRIGATORIO");
$tpl1->CAMPO_ONBLUR="";
$tpl1->CAMPO_DICA="";
$tpl1->block("BLOCK_CAMPO_NORMAL"); //classe padrao
$tpl1->block("BLOCK_CAMPO");
$tpl1->block("BLOCK_CONTEUDO");
$tpl1->block("BLOCK_ITEM");


//CNPJ
$tpl1->TITULO = "CNPJ";
$tpl1->block("BLOCK_TITULO");
$tpl1->LINHA_ID="linha_cnpj";
$tpl1->block("BLOCK_LINHA_ID");
$tpl1->CAMPO_TIPO="text";
$tpl1->CAMPO_NOME="cnpj";
$tpl1->CAMPO_ID="cnpj";
$tpl1->CAMPO_TAMANHO="25";
$tpl1->CAMPO_VALOR="$cnpj";
$tpl1->CAMPO_QTD_CARACTERES="";
$tpl1->CAMPO_ONBLUR="valida_cnpj(this.value);";
if (($usamodulofiscal=='1')&&($tipopessoanfe==2)) $tpl1->block("BLOCK_CAMPO_OBRIGATORIO");
//$tpl1->CAMPO_ONKEYUP="mascara_cnpj()";
//$tpl1->CAMPO_ONKEYDOWN="";
//$tpl1->CAMPO_ONKEYPRESS="";
$tpl1->CAMPO_ONBLUR="";
//$tpl1->CAMPO_ONCLICK="";
$tpl1->CAMPO_DICA="";
//$tpl1->block("BLOCK_CAMPO_AUTOSELECIONAR"); //Clicou seleciona conteudo
//$tpl1->block("BLOCK_CAMPO_HISTORICO_DESATIVADO"); //autocomplete do navegador desligado
//$tpl1->block("BLOCK_CAMPO_FOCO");
$tpl1->block("BLOCK_CAMPO_NORMAL"); //classe padrao
//$tpl1->block("BLOCK_CAMPO_NORMAL_OCULTO"); //Campo text que não aparece na tela
//$tpl1->CAMPO_ESTILO="";
//$tpl1->block("BLOCK_CAMPO_ESTILO");
//$tpl1->block("BLOCK_CAMPO_DESABILITADO");
//$tpl1->block("BLOCK_CAMPO_SOMENTELEITURA");
$tpl1->block("BLOCK_CAMPO");
$tpl1->block("BLOCK_CONTEUDO");
$tpl1->block("BLOCK_ITEM");


//CPF
$tpl1->TITULO = "CPF";
$tpl1->block("BLOCK_TITULO");
$tpl1->LINHA_ID="linha_cpf";
$tpl1->block("BLOCK_LINHA_ID");
$tpl1->CAMPO_TIPO="text";
$tpl1->CAMPO_NOME="cpf";
$tpl1->CAMPO_ID="cpf";
$tpl1->CAMPO_TAMANHO="20";
$tpl1->CAMPO_VALOR="$cpf";
$tpl1->CAMPO_QTD_CARACTERES="14";
if (($usamodulofiscal=='1')&&($tipopessoanfe==1)) $tpl1->block("BLOCK_CAMPO_OBRIGATORIO");
//$tpl1->CAMPO_ONKEYUP="mascara_cnpj()";
//$tpl1->CAMPO_ONKEYDOWN="";
//$tpl1->CAMPO_ONKEYPRESS="";
$tpl1->CAMPO_ONBLUR="valida_cpf(this.value);";
//$tpl1->CAMPO_ONCLICK="";
$tpl1->CAMPO_DICA="";
//$tpl1->block("BLOCK_CAMPO_AUTOSELECIONAR"); //Clicou seleciona conteudo
//$tpl1->block("BLOCK_CAMPO_HISTORICO_DESATIVADO"); //autocomplete do navegador desligado
//$tpl1->block("BLOCK_CAMPO_FOCO");
$tpl1->block("BLOCK_CAMPO_NORMAL"); //classe padrao
//$tpl1->block("BLOCK_CAMPO_NORMAL_OCULTO"); //Campo text que não aparece na tela
//$tpl1->CAMPO_ESTILO="";
//$tpl1->block("BLOCK_CAMPO_ESTILO");
//$tpl1->block("BLOCK_CAMPO_DESABILITADO");
//$tpl1->block("BLOCK_CAMPO_SOMENTELEITURA");
$tpl1->block("BLOCK_CAMPO");
$tpl1->block("BLOCK_CONTEUDO");
$tpl1->block("BLOCK_ITEM");

//IE
$tpl1->TITULO = "IE";
$tpl1->block("BLOCK_TITULO");
$tpl1->LINHA_ID="linha_ie";
$tpl1->block("BLOCK_LINHA_ID");
$tpl1->CAMPO_TIPO="text";
$tpl1->CAMPO_NOME="ie";
$tpl1->CAMPO_ID="ie";
$tpl1->CAMPO_TAMANHO="18";
$tpl1->CAMPO_VALOR="$ie";
$tpl1->CAMPO_QTD_CARACTERES="18";
if ($usamodulofiscal=='1') $tpl1->block("BLOCK_CAMPO_OBRIGATORIO");
$tpl1->CAMPO_ONBLUR="valida_ie(this.value)";
$tpl1->CAMPO_ONKEYUP="";
$tpl1->CAMPO_DICA="";
//$tpl1->block("BLOCK_CAMPO_AUTOSELECIONAR"); //Clicou seleciona conteudo
//$tpl1->block("BLOCK_CAMPO_HISTORICO_DESATIVADO"); //autocomplete do navegador desligado
//$tpl1->block("BLOCK_CAMPO_FOCO");
$tpl1->block("BLOCK_CAMPO_NORMAL"); //classe padrao
//$tpl1->block("BLOCK_CAMPO_NORMAL_OCULTO"); //Campo text que não aparece na tela
//$tpl1->CAMPO_ESTILO="";
//$tpl1->block("BLOCK_CAMPO_ESTILO");
//$tpl1->block("BLOCK_CAMPO_DESABILITADO");
//$tpl1->block("BLOCK_CAMPO_SOMENTELEITURA");
$tpl1->block("BLOCK_CAMPO");
$tpl1->block("BLOCK_CONTEUDO");
$tpl1->block("BLOCK_ITEM");

//IM
$tpl1->TITULO = "IM";
$tpl1->block("BLOCK_TITULO");
$tpl1->LINHA_ID="linha_im";
$tpl1->block("BLOCK_LINHA_ID");
$tpl1->CAMPO_TIPO="text";
$tpl1->CAMPO_NOME="im";
$tpl1->CAMPO_ID="im";
$tpl1->CAMPO_TAMANHO="25";
$tpl1->CAMPO_VALOR="$im";
$tpl1->CAMPO_QTD_CARACTERES="30";
//$tpl1->CAMPO_ONKEYDOWN="";
//$tpl1->CAMPO_ONKEYPRESS="";
$tpl1->CAMPO_ONBLUR="";
//$tpl1->CAMPO_ONCLICK="";
$tpl1->CAMPO_DICA="";
//$tpl1->block("BLOCK_CAMPO_AUTOSELECIONAR"); //Clicou seleciona conteudo
//$tpl1->block("BLOCK_CAMPO_HISTORICO_DESATIVADO"); //autocomplete do navegador desligado
//$tpl1->block("BLOCK_CAMPO_FOCO");
$tpl1->block("BLOCK_CAMPO_NORMAL"); //classe padrao
//$tpl1->block("BLOCK_CAMPO_NORMAL_OCULTO"); //Campo text que não aparece na tela
//$tpl1->CAMPO_ESTILO="";
//$tpl1->block("BLOCK_CAMPO_ESTILO");
//$tpl1->block("BLOCK_CAMPO_DESABILITADO");
//$tpl1->block("BLOCK_CAMPO_SOMENTELEITURA");
$tpl1->block("BLOCK_CAMPO");
$tpl1->block("BLOCK_CONTEUDO");
$tpl1->block("BLOCK_ITEM");



//Endereço
$tpl1->TITULO = "Endereço";
$tpl1->block("BLOCK_TITULO");
$tpl1->LINHA_ID="linha_endereco";
$tpl1->block("BLOCK_LINHA_ID");
$tpl1->CAMPO_TIPO="text";
$tpl1->CAMPO_NOME="endereco";
$tpl1->CAMPO_ID="endereco";
$tpl1->CAMPO_TAMANHO="45";
$tpl1->CAMPO_VALOR="$endereco";
$tpl1->CAMPO_QTD_CARACTERES="70";
$tpl1->CAMPO_ONBLUR="";
$tpl1->CAMPO_DICA="";
$tpl1->block("BLOCK_CAMPO_NORMAL"); //classe padrao
$tpl1->block("BLOCK_CAMPO");
$tpl1->block("BLOCK_CONTEUDO");
$tpl1->CAMPO_TIPO="number";
$tpl1->CAMPO_NOME="endereco_numero";
$tpl1->CAMPO_ID="endereco_numero";
$tpl1->CAMPO_TAMANHO="5";
$tpl1->CAMPO_VALOR="$endereco_numero";
$tpl1->CAMPO_QTD_CARACTERES="6";
$tpl1->CAMPO_DICA="Nº";
$tpl1->block("BLOCK_CAMPO_NORMAL"); //classe padrao
$tpl1->block("BLOCK_CAMPO");
$tpl1->block("BLOCK_CONTEUDO");
$tpl1->block("BLOCK_ITEM");

//Bairro
$tpl1->TITULO = "Bairro";
$tpl1->block("BLOCK_TITULO");
$tpl1->LINHA_ID="linha_bairro";
$tpl1->block("BLOCK_LINHA_ID");
$tpl1->CAMPO_TIPO="text";
$tpl1->CAMPO_NOME="bairro";
$tpl1->CAMPO_ID="bairro";
$tpl1->CAMPO_TAMANHO="45";
$tpl1->CAMPO_VALOR="$bairro";
$tpl1->CAMPO_QTD_CARACTERES="70";
$tpl1->CAMPO_DICA="";
$tpl1->block("BLOCK_CAMPO_NORMAL"); //classe padrao
$tpl1->block("BLOCK_CAMPO");
$tpl1->block("BLOCK_CONTEUDO");
$tpl1->block("BLOCK_ITEM");

//CEP
$tpl1->TITULO = "CEP";
$tpl1->block("BLOCK_TITULO");
$tpl1->LINHA_ID="linha_cep";
$tpl1->block("BLOCK_LINHA_ID");
$tpl1->CAMPO_TIPO="text";
$tpl1->CAMPO_NOME="cep";
$tpl1->CAMPO_ID="cep";
$tpl1->CAMPO_TAMANHO="12";
$tpl1->CAMPO_VALOR="$cep";
$tpl1->CAMPO_QTD_CARACTERES="9";
$tpl1->CAMPO_DICA="";
$tpl1->block("BLOCK_CAMPO_NORMAL"); //classe padrao
$tpl1->block("BLOCK_CAMPO");
$tpl1->block("BLOCK_CONTEUDO");
$tpl1->block("BLOCK_ITEM");


//Usa Comanda
$tpl1->TITULO = "Usa Comanda / Ident.";
$tpl1->block("BLOCK_TITULO");
$tpl1->LINHA_ID="linha_usacomanda";
$tpl1->block("BLOCK_LINHA_ID");
$tpl1->SELECT_NOME = "usacomanda";
$tpl1->SELECT_ID = "usacomanda";
$tpl1->SELECT_TAMANHO = "";
$tpl1->SELECT_ONCHANGE = "";
$tpl1->block("BLOCK_SELECT_ONCHANGE");
$tpl1->block("BLOCK_SELECT_OBRIGATORIO");
$tpl1->OPTION_VALOR = 1;
$tpl1->OPTION_NOME = "Sim";
if ($usacomanda=='1') $tpl1->block("BLOCK_SELECT_OPTION_SELECIONADO");
$tpl1->block("BLOCK_SELECT_OPTION");
$tpl1->OPTION_VALOR = 0;
$tpl1->OPTION_NOME = "Não";
if ($usacomanda=='0') $tpl1->block("BLOCK_SELECT_OPTION_SELECIONADO");
$tpl1->block("BLOCK_SELECT_OPTION");
$tpl1->block("BLOCK_SELECT_NORMAL");
$tpl1->block("BLOCK_SELECT");
$tpl1->block("BLOCK_CONTEUDO");
$tpl1->block("BLOCK_ITEM");


//-------------

//Quiosque campo oculto
$tpl1->CAMPO_TIPO="hidden";
$tpl1->CAMPO_NOME="quiosque";
$tpl1->CAMPO_ID="quiosque";
$tpl1->CAMPO_VALOR="$quiosque";
$tpl1->block("BLOCK_CAMPO_NORMAL_OCULTO"); //Campo text que não aparece na tela
$tpl1->block("BLOCK_CAMPO");
$tpl1->block("BLOCK_CONTEUDO");
$tpl1->block("BLOCK_ITEM");

//Quiosque Estado Oculto (necessário para fazer a máscara da inscricão estadual)
$tpl1->CAMPO_TIPO="hidden";
$tpl1->CAMPO_NOME="quiosque_estado";
$tpl1->CAMPO_ID="quiosque_estado";
$tpl1->CAMPO_VALOR="$quiosque_estado_sigla";
$tpl1->block("BLOCK_CAMPO_NORMAL_OCULTO"); //Campo text que não aparece na tela
$tpl1->block("BLOCK_CAMPO");
$tpl1->block("BLOCK_CONTEUDO");
$tpl1->block("BLOCK_ITEM");




//BOTOES
//Botão Salvar
$tpl1->block("BLOCK_BOTAO_SALVAR");

//Botão Voltar
$tpl1->block("BLOCK_BOTAO_VOLTAR");
$tpl1->block("BLOCK_BOTOES");
$tpl1->show();

/*
$dataatual = date("Y/m/d");
$date = new DateTime($dataatual, new DateTimeZone(date_default_timezone_get()));
echo $date->format('Y-m-d H:i:sP') . "\n";
*/

include "rodape.php";
?>