<?php

//Verifica se o usuário tem permissão para acessar este conteúdo
require "login_verifica.php";
if ($permissao_saidas_cadastrar <> 1) {
    header("Location: permissoes_semacesso.php");
    exit;
}
$tipopagina = "pagamentos";
include "includes.php";


//Template de Título e Sub-título
$tpl_titulo = new Template("templates/titulos.html");
$tpl_titulo->TITULO = "PAGAMENTOS";
$tpl_titulo->SUBTITULO = "CADASTRO DE PAGAMENTOS DE UMA VENDA À RECEBER";
$tpl_titulo->ICONES_CAMINHO = "$icones";
$tpl_titulo->NOME_ARQUIVO_ICONE = "saidas_pagamentos3.png";
$tpl_titulo->show();


$datahoraatual=date("Y-m-d H:i:s");


//Pegar todos os dados digitados
//print_r($_REQUEST);
$saida=$_REQUEST["saida"];
$valor=$_REQUEST["valor"];
$valor=dinheiro_para_numero($valor);
$metpag=$_REQUEST["metpag"];
$obs=$_REQUEST["obs"];


    
//Inserindo 
$sql="
    INSERT INTO saidas_pagamentos (
        saipag_saida,
        saipag_valor,
        saipag_obs,
        saipag_metpagamento
    ) VALUES (
        $saida,
        $valor,
        '$obs',
        $metpag
    )
";

if (!$query = mysql_query($sql)) die("Erro SQL 1:" . mysql_error());
$pag_ultimo=mysql_insert_id();


//Pega o nuemro da ultima operação de caixa do caixa do usuario
$sql="SELECT max(caiopo_numero) FROM caixas_operacoes WHERE caiopo_caixa=$usuario_caixa";
if (!$query=mysql_query($sql)) die("Erro SQL 2: " . mysql_error());
$dados=mysql_fetch_array($query);
$caixaoperacao=$dados[0];


//Gerar saída de caixa
$sql8 = "
INSERT INTO 
    caixas_entradassaidas (
        caientsai_tipo,
        caientsai_valor,
        caientsai_datacadastro,
        caientsai_descricao,
        caientsai_usuarioquecadastrou,
        caientsai_numerooperacao,
        caientsai_saidapagamento
    )
VALUES (
    '1',
    '$valor',
    '$datahoraatual',
    'Gerado automaticamente a partir do PAGAMENTO nº $pag_ultimo da venda nº $saida',  
    '$usuario_codigo',    
    '$caixaoperacao',
    $pag_ultimo    
)";
if (!$query8= mysql_query($sql8)) die("Erro de SQL:" . mysql_error());


$tpl = new Template("templates/notificacao.html");
$tpl->ICONES = $icones;
//$tpl->MOTIVO_COMPLEMENTO = "";
$tpl->block("BLOCK_CONFIRMAR");
$tpl->LINK = "saidas_pagamentos.php?saida=$saida";
$tpl->MOTIVO = "
    <br>Pagamento registrado com sucesso! <br><br>
    Foi <b>gerado uma entrada de caixa</b> no valor pago.<br>
";
$tpl->block("BLOCK_MOTIVO");
//$tpl->PERGUNTA = "bla bla?";
//$tpl->block("BLOCK_PERGUNTA");
//$tpl->NAO_LINK = "destino.php";
//$tpl->block("BLOCK_BOTAO_NAO_LINK");
//$tpl->block("BLOCK_BOTAO_SIMNAO");
$tpl->DESTINO="saidas_pagamentos.php?saida=$saida";
$tpl->block("BLOCK_BOTAO");
$tpl->show();


?>

