<?php
require_once 'conexao.php';
header('Content-Type: application/json; charset=utf-8');

$stmt = $pdo->query("SELECT id, pergunta, resposta, DATE_FORMAT(data_envio, '%d/%m/%Y às %H:%i') AS data_formatada FROM faq ORDER BY id DESC");
$dados = $stmt->fetchAll(PDO::FETCH_ASSOC);

echo json_encode($dados);