<?php

require "login_verifica.php";
include "controle/conexao.php";
include "controle/conexao_tipo.php";

$produto=$_POST["produto"];

$sql = "
SELECT DISTINCT
    pro_codigo,pro_nome,pro_referencia, pro_tamanho, pro_cor, pro_descricao
FROM
    produtos
WHERE
    (
        pro_codigo in (SELECT pro_codigo FROM produtos WHERE pro_evendido=1 and pro_cooperativa=$usuario_cooperativa and pro_controlarestoque=0) 
        or pro_codigo in (SELECT pro_codigo FROM produtos JOIN estoque on pro_codigo=etq_produto WHERE pro_evendido=1 and pro_cooperativa=$usuario_cooperativa)
    )
    and pro_evendido=1 
    and pro_cooperativa=$usuario_cooperativa
ORDER BY
    pro_nome , pro_tamanho, pro_cor, pro_descricao
";
$query = mysql_query($sql);
if (!$query)
    die("Erro: " . mysql_error());
echo "<option value=''>Selecione</option>";
while ($dados = mysql_fetch_array($query)) {
    $codigo=$dados["pro_codigo"];
    $nome= $dados['pro_nome'];
    $referencia= $dados['pro_referencia'];
    $tamanho= $dados['pro_tamanho'];
    $cor= $dados['pro_cor'];
    $descricao= $dados['pro_descricao'];
    if ($referencia!="") $ref="($referencia)"; else $ref="";
    $nome2="$nome $ref";
    if ($produto==$codigo) $selecionado=" selected "; else $selecionado="  ";
    echo "<option value='$codigo' $selecionado >$nome2</option>";
}
?>
