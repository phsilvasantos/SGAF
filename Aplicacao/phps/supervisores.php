<?php

//Verifica se o usuário tem permissáo para acessar este conteúdo
require "login_verifica.php";
if ($permissao_quiosque_versupervisores <> 1) {
    header("Location: permissoes_semacesso.php");
    exit;
}

$quiosque = $_GET['quiosque'];


if (($permissao_quiosque_cadastrar==1)&&($quiosque!=$usuario_quiosque)) $tipopagina = "quiosques2";
else $tipopagina = "quiosques";
include "includes.php";

//Template de Título e Sub-título
$tpl_titulo = new Template("templates/titulos.html");
$tpl_titulo->TITULO = "SUPERVISORES";
$tpl_titulo->SUBTITULO = "LISTA DE SUPERVISORES DO QUIOSQUE";
$tpl_titulo->ICONES_CAMINHO = "$icones";
$tpl_titulo->NOME_ARQUIVO_ICONE = "quiosque_supervisores.png";
$tpl_titulo->show();

$tpl = new Template("templates/listagem_2.html");
$tpl->ICONE_ARQUIVO = $icones;


//Campo Quiosque no Topo
$tpl->CAMPO_TITULO = "Quiosque";
$sql = "SELECT qui_nome FROM quiosques WHERE qui_codigo=$quiosque";
$query = mysql_query($sql);
if (!$query)
    die("Erro1: " . mysql_error());
$dados = mysql_fetch_assoc($query);
$tpl->CAMPO_VALOR = $dados['qui_nome'];
$tpl->CAMPO_TAMANHO = "";
$tpl->block("BLOCK_FILTRO_CAMPO_DESABILITADO");
$tpl->block("BLOCK_FILTRO_CAMPO");
$tpl->block("BLOCK_FILTRO_COLUNA");

IF ($permissao_quiosque_definirsupervisores == 1) {

    $tpl->LINK = "supervisores_cadastrar.php?quiosque=$quiosque&operacao=cadastrar";
    $tpl->BOTAO_NOME = "INCLUIR SUPERVISOR";
    $tpl->block("BLOCK_RODAPE_BOTAO_MODELO");
}

$tpl->block("BLOCK_FILTRO_COLUNA");

$tpl->block("BLOCK_FILTRO");

//LISTAGEM INICIO
//Cabeçalho
$tpl->CABECALHO_COLUNA_TAMANHO = "";
$tpl->CABECALHO_COLUNA_COLSPAN = "";
$tpl->CABECALHO_COLUNA_NOME = "ID";
$tpl->block("BLOCK_LISTA_CABECALHO");

$tpl->CABECALHO_COLUNA_TAMANHO = "";
$tpl->CABECALHO_COLUNA_COLSPAN = "";
$tpl->CABECALHO_COLUNA_NOME = "NOME";
$tpl->block("BLOCK_LISTA_CABECALHO");


$tpl->CABECALHO_COLUNA_TAMANHO = "";
$tpl->CABECALHO_COLUNA_COLSPAN = "";
$tpl->CABECALHO_COLUNA_NOME = "TELEFONE 01";
$tpl->block("BLOCK_LISTA_CABECALHO");

$tpl->CABECALHO_COLUNA_TAMANHO = "";
$tpl->CABECALHO_COLUNA_COLSPAN = "";
$tpl->CABECALHO_COLUNA_NOME = "TELEFONE 02";
$tpl->block("BLOCK_LISTA_CABECALHO");

$tpl->CABECALHO_COLUNA_TAMANHO = "";
$tpl->CABECALHO_COLUNA_COLSPAN = "";
$tpl->CABECALHO_COLUNA_NOME = "E-MAIL";
$tpl->block("BLOCK_LISTA_CABECALHO");

$tpl->CABECALHO_COLUNA_TAMANHO = "";
$tpl->CABECALHO_COLUNA_COLSPAN = "";
$tpl->CABECALHO_COLUNA_NOME = "DATA FUNÇÃO";
$tpl->block("BLOCK_LISTA_CABECALHO");

if ($permissao_quiosque_definirsupervisores == 1) {
    $tpl->CABECALHO_COLUNA_COLSPAN = "2";
    $tpl->CABECALHO_COLUNA_TAMANHO = "";
    $tpl->CABECALHO_COLUNA_NOME = "OPERAÇÕES";
    $tpl->block("BLOCK_LISTA_CABECALHO");
}

//Inicio das tuplas da listagem
$sql = "
 SELECT DISTINCT
    *
FROM
    quiosques_supervisores
    JOIN pessoas on (quisup_supervisor=pes_codigo)
WHERE    
    quisup_quiosque=$quiosque
ORDER BY
    pes_nome";

//Paginação
$query = mysql_query($sql);
if (!$query)
    die("Erro SQL Principal Paginação:" . mysql_error());
$linhas = mysql_num_rows($query);
$por_pagina = $usuario_paginacao;
$paginaatual = $_POST["paginaatual"];
$paginas = ceil($linhas / $por_pagina);
//Se é a primeira vez que acessa a pagina então começar na pagina 1
if (($paginaatual == "") || ($paginas < $paginaatual) || ($paginaatual <= 0)) {
    $paginaatual = 1;
}
$comeco = ($paginaatual - 1) * $por_pagina;
$tpl->PAGINAS = "$paginas";
$tpl->PAGINAATUAL = "$paginaatual";
$tpl->PASTA_ICONES = "$icones";
$tpl->block("BLOCK_PAGINACAO");
$sql = $sql . " LIMIT $comeco,$por_pagina ";


$query = mysql_query($sql);
if (!$query)
    die("Erro: " . mysql_error());
while ($dados = mysql_fetch_assoc($query)) {
    $supervisor = $dados["quisup_supervisor"];

    //Coluna ID
    $tpl->LISTA_COLUNA_VALOR = $dados["pes_id"];
    $tpl->block("BLOCK_LISTA_COLUNA");

    //Coluna Nome
    $tpl->LISTA_COLUNA_VALOR = $dados["pes_nome"];
    $tpl->block("BLOCK_LISTA_COLUNA");

    //Coluna Fone1 
    $tpl->LISTA_COLUNA_VALOR = $dados["pes_fone1"];
    $tpl->block("BLOCK_LISTA_COLUNA");

    //Coluna Fone2 
    $tpl->LISTA_COLUNA_VALOR = $dados["pes_fone2"];
    $tpl->block("BLOCK_LISTA_COLUNA");

    //Coluna E-mail
    $tpl->LISTA_COLUNA_VALOR = $dados["pes_email"];
    $tpl->block("BLOCK_LISTA_COLUNA");

    //Coluna Data de Admissão
    if ($dados['quisup_datafuncao'] == "0000-00-00")
        $tpl->LISTA_COLUNA_VALOR = "";
    else
        $tpl->LISTA_COLUNA_VALOR = converte_data($dados['quisup_datafuncao']);
    $tpl->block("BLOCK_LISTA_COLUNA");

    if ($permissao_quiosque_definirsupervisores == 1) {
        //editar
        $tpl->CODIGO = $supervisor;
        $tpl->LINK = "supervisores_cadastrar.php";
        $tpl->LINK_COMPLEMENTO = "supervisor=$supervisor&quiosque=$quiosque&operacao=editar";

        $tpl->block("BLOCK_LISTA_COLUNA_OPERACAO_EDITAR");

        //excluir
        $tpl->LINK = "supervisores_deletar.php";
        $tpl->LINK_COMPLEMENTO = "supervisor=$supervisor&quiosque=$quiosque&operacao=excluir";
        $tpl->block("BLOCK_LISTA_COLUNA_OPERACAO_EXCLUIR");
    }
    $tpl->block("BLOCK_LISTA");
}

//Se não tem tuplas então mostrar a frase padrão cujo informa que não há registros
if (mysql_num_rows($query) == 0) {
    $tpl->block("BLOCK_LISTA_NADA");
}

//BOTÕES    
$tpl->LINK_VOLTAR = "quiosques.php";
$tpl->block("BLOCK_RODAPE_BOTAO_VOLTAR");
$tpl->block("BLOCK_RODAPE_BOTAO");

$tpl->block("BLOCK_RODAPE_BOTOES");

$tpl->show();
include "rodape.php";
?>
