<?php
//Verifica se o usuário tem permiss�o para acessar este conte�do
require "login_verifica.php";
if ($permissao_quiosque_excluir <> 1) {
    header("Location: permissoes_semacesso.php");
}

$tipopagina = "quiosques";
include "includes.php";

//Template de Título e Sub-título
$tpl_titulo = new Template("templates/titulos.html");
$tpl_titulo->TITULO = "QUIOSQUES";
$tpl_titulo->SUBTITULO = "DELETAR/APAGAR";
$tpl_titulo->ICONES_CAMINHO = "$icones";
$tpl_titulo->NOME_ARQUIVO_ICONE = "quiosques.png";
$tpl_titulo->show();

//Inicio da exclusão
$codigo = $_GET["codigo"];
$operacao = $_GET["operacao"];
$passo = $_GET["passo"];

$sql5="SELECT qui_cooperativa from quiosques where qui_codigo=$codigo";
$query5 = mysql_query($sql5);
if (!$query5) die("Erro SQL 5: " . mysql_error());
$dados5=  mysql_fetch_assoc($query5);
$cooperativa=$dados5["qui_cooperativa"];




if ($usuario_grupo==2) {
    
    $tpl_notificacao = new Template("templates/notificacao.html");
    $tpl_notificacao->DESTINO = "quiosques.php";
    $tpl_notificacao->ICONES = $icones;
    
    //Verifica se há caixas
    $sql = "SELECT * FROM caixas_operadores JOIN caixas on (cai_codigo=caiope_caixa) WHERE cai_quiosque=$codigo";
    $query = mysql_query($sql);
    if (!$query) {
        die("Erro SQL1: " . mysql_error());
    }
    $linhas = mysql_num_rows($query);
    if ($linhas > 0) {
        $tpl_notificacao->MOTIVO_COMPLEMENTO = "Caixas";
        $tpl_notificacao->block("BLOCK_ERRO");
        $tpl_notificacao->block("BLOCK_NAOAPAGADO");
        $tpl_notificacao->block("BLOCK_MOTIVO_EMUSO");
        $tpl_notificacao->block("BLOCK_BOTAO_VOLTAR");
        $tpl_notificacao->show();
        exit;
    }       

    //Verifica se há supervisores
    $sql = "SELECT * FROM quiosques_supervisores WHERE quisup_quiosque=$codigo";
    $query = mysql_query($sql);
    if (!$query) {
        die("Erro SQL2: " . mysql_error());
    }
    $linhas = mysql_num_rows($query);
    if ($linhas > 0) {
        $tpl_notificacao->MOTIVO_COMPLEMENTO = "supervisores";
        $tpl_notificacao->block("BLOCK_ERRO");
        $tpl_notificacao->block("BLOCK_NAOAPAGADO");
        $tpl_notificacao->block("BLOCK_MOTIVO_EMUSO");
        $tpl_notificacao->block("BLOCK_BOTAO_VOLTAR");
        $tpl_notificacao->show();
        exit;
    }       

    //Verifica se há entradas
    $sql = "SELECT * FROM entradas WHERE ent_quiosque=$codigo";
    $query = mysql_query($sql);
    if (!$query) {
        die("Erro SQL: " . mysql_error());
    }
    $linhas = mysql_num_rows($query);
    if ($linhas > 0) {
        $tpl_notificacao->MOTIVO_COMPLEMENTO = "entradas";
        $tpl_notificacao->block("BLOCK_ERRO");
        $tpl_notificacao->block("BLOCK_NAOAPAGADO");
        $tpl_notificacao->block("BLOCK_MOTIVO_EMUSO");
        $tpl_notificacao->block("BLOCK_BOTAO_VOLTAR");
        $tpl_notificacao->show();
        exit;
    }

    //Verifica se há saidas
    $sql = "SELECT * FROM saidas WHERE sai_quiosque=$codigo";
    $query = mysql_query($sql);
    if (!$query) {
        die("Erro SQL: " . mysql_error());
    }
    $linhas = mysql_num_rows($query);
    if ($linhas > 0) {
        $tpl_notificacao->MOTIVO_COMPLEMENTO = "saidas";
        $tpl_notificacao->block("BLOCK_ERRO");
        $tpl_notificacao->block("BLOCK_NAOAPAGADO");
        $tpl_notificacao->block("BLOCK_MOTIVO_EMUSO");
        $tpl_notificacao->block("BLOCK_BOTAO_VOLTAR");
        $tpl_notificacao->show();
        exit;
    }

    //Verifica se há usuários
    $sql = "SELECT * FROM pessoas WHERE pes_quiosqueusuario=$codigo";
    $query = mysql_query($sql);
    if (!$query) {
        die("Erro SQL: " . mysql_error());
    }
    $linhas = mysql_num_rows($query);
    if ($linhas > 0) {
        $tpl_notificacao->MOTIVO_COMPLEMENTO = "usuarios";
        $tpl_notificacao->block("BLOCK_ERRO");
        $tpl_notificacao->block("BLOCK_NAOAPAGADO");
        $tpl_notificacao->block("BLOCK_MOTIVO_EMUSO");
        $tpl_notificacao->block("BLOCK_BOTAO_VOLTAR");
        $tpl_notificacao->show();
        exit;
    }

    //Verifica se há taxas
    $sql = "SELECT * FROM quiosques_taxas WHERE quitax_quiosque=$codigo";
    $query = mysql_query($sql);
    if (!$query) {
        die("Erro SQL: " . mysql_error());
    }
    $linhas = mysql_num_rows($query);
    if ($linhas > 0) {
        $tpl_notificacao->MOTIVO_COMPLEMENTO = "taxas";
        $tpl_notificacao->block("BLOCK_ERRO");
        $tpl_notificacao->block("BLOCK_NAOAPAGADO");
        $tpl_notificacao->block("BLOCK_MOTIVO_EMUSO");
        $tpl_notificacao->block("BLOCK_BOTAO_VOLTAR");
        $tpl_notificacao->show();
        exit;
    }
} else if ($usuario_grupo==1) {
    if ($passo==1) { //Pergunta se quer deletar mesmo
  
        $tpl6 = new Template("templates/notificacao.html");
        $tpl6->ICONES = $icones;
        $tpl6->block("BLOCK_ATENCAO");
        //$tpl6->block("BLOCK_CADASTRADO");    
        $tpl6->MOTIVO = "Ao apagar o quiosque você apará também todos os registros efetuados por ele como entradas, saidas, fechamentos, acerto etc...";
        $tpl6->LINK = "quiosques_deletar.php?codigo=$codigo&passo=2";
        $tpl6->block("BLOCK_MOTIVO");
        $tpl6->PERGUNTA = "Tem certeza que deseja excluir o quiosque?";
        $tpl6->block("BLOCK_PERGUNTA");
        $tpl6->NAO_LINK = "quiosques.php";
        $tpl6->LINK_TARGET = "";
        $tpl6->block("BLOCK_BOTAO_NAO_LINK");
        $tpl6->block("BLOCK_BOTAO_SIMNAO");
        $tpl6->show();
    } else if ($passo==2) { //Pode deletar o quiosque e suas referencias
        
        //Verifica se há outros quiosques vinculados a esta cooperatvia, se não, entao sugere exclusão da cooperativa
        $sql4="SELECT * from quiosques WHERE qui_cooperativa=$cooperativa";
        if (!$query4=mysql_query($sql4)) die("Erro SQL 4: " . mysql_error());
        $linhas4=  mysql_num_rows($query4);
        
        //Entradas
        $sql3 = "DELETE FROM entradas_subprodutos WHERE entsub_entrada in (SELECT ent_codigo FROM entradas WHERE ent_quiosque=$codigo)";
        $query3 = mysql_query($sql3);
        if (!$query3) {
            die("Erro SQL: " . mysql_error());
        }
        $sql3 = "DELETE FROM entradas_produtos WHERE entpro_entrada in (SELECT ent_codigo FROM entradas WHERE ent_quiosque=$codigo)";
        $query3 = mysql_query($sql3);
        if (!$query3) {
            die("Erro SQL: " . mysql_error());
        }
        $sql3 = "DELETE FROM entradas WHERE ent_quiosque =$codigo";
        $query3 = mysql_query($sql3);
        if (!$query3) {
            die("Erro SQL: " . mysql_error());
        }


        //Itens de devolução
        $sql3 = "DELETE FROM saidas_devolucoes_produtos WHERE saidevpro_saida in (SELECT saidev_saida FROM saidas_devolucoes JOIN saidas on (saidev_saida=sai_codigo) WHERE sai_quiosque=$codigo)";
        if (!$query3 = mysql_query($sql3)) die("Erro SQL 88: " . mysql_error());
        
        //Devoluções
        $sql3 = "DELETE FROM saidas_devolucoes WHERE saidev_saida in (SELECT sai_codigo FROM saidas WHERE sai_quiosque=$codigo)";
        if (!$query3 = mysql_query($sql3)) die("Erro SQL 89: " . mysql_error());
        

        
        // Saídas
        $sql3 = "DELETE FROM saidas_produtos WHERE saipro_saida in (SELECT sai_codigo FROM saidas WHERE sai_quiosque=$codigo)";
        $query3 = mysql_query($sql3);
        if (!$query3) {
            die("Erro SQL: " . mysql_error());
        }
        $sql3 = "DELETE FROM saidas WHERE sai_quiosque =$codigo";
        $query3 = mysql_query($sql3);
        if (!$query3) {
            die("Erro SQL: " . mysql_error());
        }

        // Estoque
        $sql3 = "DELETE FROM estoque WHERE etq_quiosque =$codigo";
        $query3 = mysql_query($sql3);
        if (!$query3) {
            die("Erro SQL: " . mysql_error());
        }
        $sql3 = "DELETE FROM quantidade_ideal WHERE qtdide_quiosque=$codigo";
        $query3 = mysql_query($sql3);
        if (!$query3) {
            die("Erro SQL: " . mysql_error());
        }

        // Acertos
        $sql3 = "DELETE FROM acertos_taxas WHERE acetax_acerto in (SELECT ace_codigo FROM acertos WHERE ace_quiosque=$codigo)";
        $query3 = mysql_query($sql3);
        if (!$query3) {
            die("Erro SQL: " . mysql_error());
        }
        $sql3 = "DELETE  FROM acertos WHERE ace_quiosque=$codigo";
        $query3 = mysql_query($sql3);
        if (!$query3) {
            die("Erro SQL: " . mysql_error());
        }

        // Fechamentos
        $sql3 = "DELETE FROM fechamentos_taxas WHERE fchtax_fechamento in (SELECT fch_codigo FROM fechamentos WHERE  fch_quiosque=$codigo)";
        $query3 = mysql_query($sql3);
        if (!$query3) {
            die("Erro SQL: " . mysql_error());
        }
        $sql3 = "DELETE FROM fechamentos WHERE fch_quiosque=$codigo";
        $query3 = mysql_query($sql3);
        if (!$query3) {
            die("Erro SQL: " . mysql_error());
        }

        // Taxas
        $sql3 = "DELETE FROM taxas WHERE tax_quiosque=$codigo";
        $query3 = mysql_query($sql3);
        if (!$query3) {
            die("Erro SQL: " . mysql_error());
        }

        //caixa_entradassaidas
        $sql3 = "DELETE FROM caixas_entradassaidas WHERE caientsai_numerooperacao in ( SELECT caiopo_numero FROM caixas_operacoes WHERE caiopo_caixa in (SELECT cai_codigo FROM caixas WHERE cai_quiosque=$codigo))";
        $query3 = mysql_query($sql3);
        if (!$query3) {
            die("Erro SQL 33: " . mysql_error());
        }
        //caixa_operadores
        $sql3 = "DELETE FROM caixas_operadores WHERE caiope_caixa in (SELECT cai_codigo FROM caixas WHERE cai_quiosque=$codigo) ";
        $query3 = mysql_query($sql3);
        if (!$query3) {
            die("Erro SQL: " . mysql_error());
        }
        //caixa_operacoes
        $sql3 = "DELETE FROM caixas_operacoes WHERE caiopo_caixa in (SELECT cai_codigo FROM caixas WHERE cai_quiosque=$codigo) ";
        $query3 = mysql_query($sql3);
        if (!$query3) {
            die("Erro SQL 33: " . mysql_error());
        }
        //caixas
        $sql3 = "DELETE FROM caixas WHERE cai_quiosque=$codigo";
        $query3 = mysql_query($sql3);
        if (!$query3) {
            die("Erro SQL: " . mysql_error());
        }
        //quiosuqes_supervisores
        $sql3 = "DELETE FROM quiosques_supervisores WHERE quisup_quiosque=$codigo";
        $query3 = mysql_query($sql3);
        if (!$query3) {
            die("Erro SQL: " . mysql_error());
        }
        //quiosques_taxas
        $sql3 = "DELETE FROM quiosques_taxas WHERE quitax_quiosque=$codigo";
        $query3 = mysql_query($sql3);
        if (!$query3) {
            die("Erro SQL: " . mysql_error());
        }
        //quiosques_tiponegociacao
        $sql3 = "DELETE FROM quiosques_tiponegociacao WHERE quitipneg_quiosque=$codigo";
        $query3 = mysql_query($sql3);
        if (!$query3) {
            die("Erro SQL: " . mysql_error());
        }




        
        //quiosques_configuracoes
        $sql3 = "DELETE FROM quiosques_configuracoes WHERE quicnf_quiosque=$codigo";
        $query3 = mysql_query($sql3);
        if (!$query3) {
            die("Erro SQL Configurações Quiosque: " . mysql_error());
        }        
        
        //quiosques
        $sql3 = "DELETE FROM quiosques WHERE qui_codigo = $codigo"; 
        if (!$query3 = mysql_query($sql3))  die("Erro SQL: " . mysql_error());
        
        
        //Zera grupo de permissoes todos usuários que estao vinculados ao quiosque deletado que não sejam adminsitradores ou gestores
        //DEVE VIR ANTES DO SQL QUE ZERA QUIOSQUE
        $sql3 = "UPDATE pessoas set  pes_grupopermissoes=0 WHERE pes_quiosqueusuario=$codigo and pes_grupopermissoes not in (1,2)"; 
        $query3 = mysql_query($sql3); if (!$query3) die("Erro SQL: " . mysql_error());
        
        
        //Zera quiosque de todos usuários que estao vinculados ao quiosque deletado
        //DEVE VIR DEPOIS DO SQL QUE ZERA GRUPOPERMISSOES
        $sql3 = "UPDATE pessoas set pes_quiosqueusuario=0 WHERE pes_quiosqueusuario=$codigo"; 
        $query3 = mysql_query($sql3); if (!$query3) die("Erro SQL: " . mysql_error());
        
        //Se houver apenas um quiosque na cooperativa então perguntar se quer excluir a cooperativa
        if ($linhas4==1) {
            
            $tpl6 = new Template("templates/notificacao.html");
            $tpl6->ICONES = $icones;
            $tpl6->block("BLOCK_ATENCAO");
            //$tpl6->block("BLOCK_CADASTRADO");    
            $tpl6->MOTIVO = "Este é o único quiosque cadastrado nesta cooperativa. <br>Excluindo apenas o quiosque a cooperativa ficará vazia, porém as pessoas e produtos utilizados pelos quiosques serão mantidos";
            $tpl6->LINK = "cooperativas_deletar.php?codigo=$cooperativa&passo=1&operacao=excluir";
            $tpl6->block("BLOCK_MOTIVO");
            $tpl6->PERGUNTA = "Deseja excluir também cooperativa deste quiosque?";
            $tpl6->block("BLOCK_PERGUNTA");
            $tpl6->NAO_LINK = "quiosques_deletar.php?passo=3&codigo=$codigo";
            $tpl6->LINK_TARGET = "";
            $tpl6->block("BLOCK_BOTAO_NAO_LINK");
            $tpl6->block("BLOCK_BOTAO_SIMNAO");
            $tpl6->show();   
            
        } else {

            $tpl_notificacao = new Template("templates/notificacao.html");
            $tpl_notificacao->DESTINO = "quiosques.php";
            $tpl_notificacao->ICONES = $icones;
            if ($usuario_quiosque==$codigo) {
                $tpl_notificacao->MOTIVO_COMPLEMENTO = "<br>E necessário sair e entrar novamente do sistema, pois você está logado com um quiosuqe que não existe mais!<br>";
                $tpl_notificacao->DESTINO = "login_sair.php"; 
                session_start();
                session_destroy();
            } else {
                $tpl_notificacao->DESTINO = "quiosques.php";
            }
            $tpl_notificacao->block("BLOCK_CONFIRMAR");
            $tpl_notificacao->block("BLOCK_APAGADO");
            $tpl_notificacao->block("BLOCK_BOTAO");
            $tpl_notificacao->show();
        }
    } else if ($passo==3) {
        
        $tpl_notificacao = new Template("templates/notificacao.html");
        $tpl_notificacao->ICONES = $icones;
        $tpl_notificacao->MOTIVO_COMPLEMENTO = "<br>E necessário sair e entrar novamente do sistema, pois você está logado com um quiosuqe que não existe mais!<br>";
        $tpl_notificacao->DESTINO = "login_sair.php"; 
        session_start();
        session_destroy();
        $tpl_notificacao->block("BLOCK_CONFIRMAR");
        $tpl_notificacao->block("BLOCK_APAGADO");
        $tpl_notificacao->block("BLOCK_BOTAO");
        $tpl_notificacao->show();
    }
                 
} 

include "rodape.php";
?>
