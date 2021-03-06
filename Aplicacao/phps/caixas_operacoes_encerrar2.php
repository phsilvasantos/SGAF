<?php

//Verifica se o usuário tem permissão para acessar este conteúdo
require "login_verifica.php";
if ($permissao_caixas_operacoes_abrir <> 1) {
    header("Location: permissoes_semacesso.php");
    exit;
}

$tipopagina = "caixas";
include "includes.php";

//print_r($_REQUEST);

$totalbruto=$_POST["totalbruto2"];
$totalliquido=$_POST["totalliquido2"];
$totalliquidosemcartao=$_POST["totalliquidosemcartao2"];
$totalliquidocartao=$_POST["totalliquidocartao2"];
$entradastotal=$_POST["entradastotal2"];
$saidastotal=$_POST["saidastotal2"];
$saldo_entradassaidas=$_POST["saldo_entradassaidas2"];
$totaldescontovendas=$_POST["totaldescontovendas2"];

$totalvendido=$_POST["totalvendido2"];
$valorfinal=$_POST["valorfinal"];
$totalsaldotroco=$_POST["totalsaldotroco2"];
$valoresperado=$_POST["valoresperado2"];
$diferenca=$_POST["diferenca2"];
$saldovendas=$totalvendido+$totalsaldotroco;
$valorfinal=  dinheiro_para_numero($valorfinal);
$operacao=$_POST["operacao2"];
$numero=$_POST["numero"];
$supervisor=$_POST["supervisor"];
$senha=$_POST["senha"];
$senha=md5($senha);
$datahoraatual=date("Y-m-d H:i:s");
$sql="SELECT * FROM caixas_operacoes JOIN caixas on cai_codigo=caiopo_caixa WHERE caiopo_numero=$numero";
if (!$query=mysql_query($sql)) die("Erro SQL pega dados do caixa: " . mysql_error());
$dados = mysql_fetch_assoc($query);
$caixa=$dados["cai_codigo"];
$situacao=$dados["cai_situacao"];
$sql="SELECT pes_senha FROM pessoas WHERE pes_codigo=$supervisor";
if (!$query=mysql_query($sql)) die("Erro SQL pega dados do caixa: " . mysql_error());
$dados = mysql_fetch_assoc($query);
$senha_supervisor=$dados["pes_senha"];



//Template de Título e Sub-título
$tpl_titulo = new Template("templates/titulos.html");
$tpl_titulo->TITULO = "CAIXAS OPERACOES";
$tpl_titulo->SUBTITULO = "ENCERRAR CAIXA";
$tpl_titulo->ICONES_CAMINHO = "$icones";
$tpl_titulo->NOME_ARQUIVO_ICONE = "caixas_abrir.png";
$tpl_titulo->show();



if ($usacaixa!=1) {
    $tpl6 = new Template("templates/notificacao.html");
    $tpl6->block("BLOCK_ERRO");
    $tpl6->ICONES = $icones;
    //$tpl6->block("BLOCK_NAOAPAGADO");
    $tpl6->MOTIVO = "Você não tem permissão para acessar esta tela.<br>Se deseja realizar vendas solicite a um administrador para <br><b>HABILITAR MÓDULO CAIXA</b>";
    $tpl6->block("BLOCK_MOTIVO");
    $tpl6->block("BLOCK_BOTAO_VOLTAR");
    $tpl6->show();
    exit;
}


$tpl_notificacao = new Template("templates/notificacao.html");
$tpl_notificacao->ICONES = $icones;
$tpl_notificacao->DESTINO = "caixas.php";



//Verifica se a situação atual é aberta
if ($situacao==2) {
    $tpl_notificacao->block("BLOCK_ERRO");
    //$tpl_notificacao->block("BLOCK_NAOCADASTRADO");
    $tpl_notificacao->MOTIVO_COMPLEMENTO = "Este caixa já está fechado!";
    $tpl_notificacao->block("BLOCK_BOTAO_VOLTAR");
    $tpl_notificacao->show();
    exit;
} 



//Verifica se a senha do supervisor está correta
if ($senha!=$senha_supervisor) {
    $tpl_notificacao->block("BLOCK_ERRO");
    $tpl_notificacao->MOTIVO_COMPLEMENTO = "A senha do supervisor não confere!";
    $tpl_notificacao->block("BLOCK_BOTAO_VOLTAR");
    $tpl_notificacao->show();
    exit;
} 

//Atualizar dados restante (valores, totais)
$sql="UPDATE caixas_operacoes 
SET caiopo_datahoraencerramento='$datahoraatual',
caiopo_totalvendas='$totalvendido',
caiopo_totaltroco='$totalsaldotroco',
caiopo_saldovendas='$saldovendas',
caiopo_valorfinal='$valorfinal',
caiopo_diferenca='$diferenca',
caiopo_totalbruto='$totalbruto',
caiopo_liquido='$totalliquido',
caiopo_liquidosemcartao='$totalliquidosemcartao',
caiopo_liquidocartao='$totalliquidocartao',
caiopo_entradastotal='$entradastotal',
caiopo_saidastotal='$saidastotal',
caiopo_saldoentradassaidas='$saldo_entradassaidas',
caiopo_totaldescontovendas='$totaldescontovendas',
caiopo_valoresperado='$valoresperado',
caiopo_supervisor='$supervisor'
WHERE caiopo_numero=$numero    
";
if (!$query=mysql_query($sql)) die("Erro SQL Atualiza Caixa Operações: " . mysql_error());
$dados = mysql_fetch_assoc($query);

//Trocar situacao do caixa
$sql="UPDATE caixas SET cai_situacao=2 WHERE cai_codigo=$caixa";
if (!$query=mysql_query($sql)) die("Erro SQL troca situacao do caixa: " . mysql_error());
$dados = mysql_fetch_assoc($query);


//Eliminar caixaoperacaonumero das pessoas que estao utilizando o caixa para fazer vendas
$sql="UPDATE pessoas SET pes_caixaoperacaonumero=null WHERE pes_caixaoperacaonumero=$numero";
if (!$query=mysql_query($sql)) die("Erro SQL limpa quiosque padrao dos usuarios: " . mysql_error());
$dados = mysql_fetch_assoc($query);


//OPERAÇÕES
//Estrutura da notificação


$tpl_notificacao->MOTIVO_COMPLEMENTO = "";
$tpl_notificacao->block("BLOCK_CONFIRMAR");
$tpl_notificacao->MOTIVO_COMPLEMENTO = "Caixa encerrado com sucesso!";
$tpl_notificacao->block("BLOCK_BOTAO");
$tpl_notificacao->show();



?>

